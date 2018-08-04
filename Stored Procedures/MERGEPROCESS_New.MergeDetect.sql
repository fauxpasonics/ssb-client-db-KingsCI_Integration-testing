SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROC [MERGEPROCESS_New].[MergeDetect] -- 'Kings'
--[MERGEPROCESS_New].[MergeDetect]  'Kings'
	@Client VARCHAR(100) 
AS
Declare @Date Date = (select cast(getdate() as date));
DECLARE @Account varchar(100) = (Select CASE WHEN @client = 'Trailblazers' THEN 'CRM_Account' ELSE Concat(@client,' PC_SFDC Account' ) END);
DECLARE @Contact varchar(100) = (Select CASE WHEN @client = 'Trailblazers' THEN 'CRM_Contact' ELSE Concat(@client,' PC_SFDC Contact' ) END );

With MergeAccount as (
select SSB_CRMSYSTEM_ACCT_ID, count(1) CountAccounts, --MAX(CASE WHEN b.SSID is not null then 1 else 0 END) --Add back in with Key Accounts if used
0 Key_Related from 
dbo.vwDimCustomer_ModAcctID a 
--LEFT join dbo.vw_KeyAccounts b on a.dimcustomerid = b.dimcustomerid  --Kings doesn't use, but create synonym if they do in the future.
where SourceSystem = @Account
AND a.SSB_CRMSYSTEM_ACCT_ID IS NOT null
group by SSB_CRMSYSTEM_ACCT_ID
having count(1) > 1), 

 MergeContact as (
select SSB_CRMSYSTEM_CONTACT_ID, count(1) CountContacts, --MAX(CASE WHEN b.SSID is not null then 1 else 0 END) --Add back in with Key Accounts if used
0 Key_Related from 
dbo.vwDimCustomer_ModAcctID a 
--		left join (select cc.ID FROM prodcopy.vwContact cc 
--		JOIN dbo.vw_KeyAccounts bb on cc.AccountID = bb.SSID
--) b		
--		on a.SSID = b.ID
where SourceSystem = @Contact
AND a.SSB_CRMSYSTEM_CONTACT_ID IS NOT null
group by SSB_CRMSYSTEM_CONTACT_ID
having count(1) > 1)




MERGE  MERGEPROCESS_New.DetectedMerges  as tar
using ( Select 'Account' MergeType, SSB_CRMSYSTEM_ACCT_ID SSBID, CASE WHEN CountAccounts = 2 AND Key_Related = 0 THEN 1 ELSE 0 END AutoMerge, @Date DetectedDate, CountAccounts NumRecords FROM MergeAccount
		UNION ALL
		Select 'Contact' MergeType, SSB_CRMSYSTEM_Contact_ID SSBID, CASE WHEN CountContacts = 2 AND Key_Related = 0 THEN 1 ELSE 0 END AutoMerge, @Date DetectedDate, CountContacts NumRecords FROM MergeContact
		) as sour
	ON tar.MergeType = sour.MergeType
	AND tar.SSBID = sour.SSBID
WHEN MATCHED  AND (tar.DetectedDate <> sour.DetectedDate 
				OR sour.NumRecords <> tar.NumRecords
				OR MergeComplete =  1) THEN UPDATE 
	Set DetectedDate = @Date
	,NumRecords = sour.NumRecords
	,MergeComplete = 0 
WHEN Not Matched THEN Insert
	(MergeType
	,SSBID
	,AutoMerge
	,DetectedDate
	,NumRecords)
Values(
	 sour.MergeType
	,sour.SSBID
	,sour.AutoMerge
	,sour.DetectedDate
	,sour.NumRecords)
WHEN NOT MATCHED BY SOURCE AND tar.MergeComment IS NULL THEN UPDATE
	SET MergeComment = CASE WHEN tar.Mergecomplete = 1 then 'Merge Detection - Merge Successfully completed'
							WHEN tar.mergeComplete = 0 THEN 'Merge Detection - Merge not completed, but no longer detected' END
		,MergeComplete = 1
	;




IF OBJECT_ID('mergeprocess_new.tmp_pcaccount', 'U') IS NOT NULL 
DROP TABLE mergeprocess_new.tmp_pcaccount; 

IF OBJECT_ID('mergeprocess_new.tmp_pccontact', 'U') IS NOT NULL 
DROP TABLE mergeprocess_new.tmp_pccontact;

IF OBJECT_ID('mergeprocess_new.tmp_dimcust', 'U') IS NOT NULL 
DROP TABLE mergeprocess_new.tmp_dimcust;

SELECT * INTO mergeprocess_new.tmp_dimcust FROM dbo.vwdimcustomer_modacctid  WHERE ssb_crmsystem_contact_id IN (
SELECT ssb_crmsystem_contact_id FROM dbo.vwdimcustomer_modacctid WHERE sourcesystem = @Contact GROUP BY ssb_crmsystem_contact_id HAVING COUNT(*) > 1 )
AND sourcesystem = @Contact
UNION ALL
SELECT * FROM dbo.vwdimcustomer_modacctid WHERE ssb_crmsystem_acct_id IN (
SELECT ssb_crmsystem_acct_id FROM dbo.vwdimcustomer_modacctid WHERE sourcesystem = @Account GROUP BY ssb_crmsystem_acct_id HAVING COUNT(*) > 1 )
AND sourcesystem = @Account
--1:04

CREATE NONCLUSTERED INDEX ix_tmp_dimcust_acct ON mergeprocess_new.tmp_dimcust (sourcesystem, ssb_crmsystem_acct_id)
CREATE NONCLUSTERED INDEX ix_tmp_dimcust_contact ON mergeprocess_new.tmp_dimcust (sourcesystem, ssb_crmsystem_contact_id)
CREATE NONCLUSTERED INDEX ix_tmp_dimcust_ssid ON mergeprocess_new.tmp_dimcust (sourcesystem, ssid)
--0:05

SELECT pcc.* INTO mergeprocess_new.tmp_pccontact FROM mergeprocess_new.tmp_dimcust dc
INNER JOIN kingsci_reporting.prodcopy.contact pcc ON dc.ssid = pcc.id
WHERE dc.sourcesystem = @Contact
--0:07

SELECT pca.* INTO mergeprocess_new.tmp_pcaccount FROM mergeprocess_new.tmp_dimcust dc
INNER JOIN kingsci_reporting.prodcopy.Account pca ON dc.ssid = pca.id
WHERE dc.sourcesystem = @Account
--0:08

ALTER TABLE mergeprocess_new.tmp_pcaccount
ALTER COLUMN id VARCHAR(200)
--0:03

ALTER TABLE mergeprocess_new.tmp_pccontact
ALTER COLUMN id VARCHAR(200)
--0:02

CREATE NONCLUSTERED INDEX ix_tmp_pcaccount ON mergeprocess_new.tmp_pcaccount (id)
--0:05

CREATE NONCLUSTERED INDEX ix_tmp_pccontact ON mergeprocess_new.tmp_pccontact (id)
--0:01




GO
