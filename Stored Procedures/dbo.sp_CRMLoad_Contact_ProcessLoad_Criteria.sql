SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[sp_CRMLoad_Contact_ProcessLoad_Criteria]
AS 
-- Assign CRM IDs in dbo.Account
--EXEC dbo.sp_CRMProcess_CRMID_Assign_Account

TRUNCATE TABLE dbo.[CRMLoad_Contact_ProcessLoad_Criteria]

INSERT INTO dbo.[CRMLoad_Contact_ProcessLoad_Criteria]
        ( [SSB_CRMSYSTEM_CONTACT_ID] ,
          LoadType
        )
SELECT b.[SSB_CRMSYSTEM_CONTACT_ID]
, CASE WHEN 1=1 --b.accountid IS NULL 
AND b.[SSB_CRMSYSTEM_CONTACT_ID] = b.[crm_id] THEN 'Upsert' ELSE 'Update' END LoadType
FROM wrk.[customerWorkingList] a 
INNER JOIN dbo.Contact b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[SSB_CRMSYSTEM_ACCT_ID]
--LEFT JOIN ProdCopy.[vw_Account] b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[new_ssbcrmsystemacctid]
--WHERE [a].[IsBusinessAccount] = 1

--Dont load SFDC Acounts as Contact
DELETE 
--SELECT * 
FROM dbo.CRMLoad_Contact_ProcessLoad_Criteria 
WHERE SSB_CRMSYSTEM_Contact_ID IN (
	SELECT SSB_CRMSYSTEM_Contact_ID FROM dbo.vwDimCustomer_ModAcctId a
		WHERE SSB_CRMSYSTEM_Contact_ID IN (SELECT DISTINCT SSB_CRMSYSTEM_Contact_ID FROM dbo.vwDimCustomer_ModAcctId WHERE SourceSystem LIKE '%SFDC_Account%')
	GROUP BY SSB_CRMSYSTEM_Contact_ID
HAVING COUNT(DISTINCT SourceSystem) = 1
) 
AND LoadType = 'Upsert'

--Added 05172017 by TCF
DELETE a
FROM dbo.CRMLoad_Contact_ProcessLoad_Criteria a
JOIN dbo.Contact b ON a.SSB_CRMSYSTEM_Contact_ID = b.SSB_CRMSYSTEM_Contact_ID
WHERE (ISNULL(firstname,'')  + ISNULL(lastname,'')  = ''
	OR  ISNULL(AddressPrimaryStreet,'') +  ISNULL(EmailPrimary,'') = ''
	OR ISNULL(b.LastName,'') = '') --Added 03282018 by TCF - Kings have lastname as a required field that can't be blank/NULL
AND LoadType = 'Upsert' 


--dont load business contacts that are named the same as the business
--DELETE 
----SELECT * 
--FROM dbo.CRMLoad_Contact_ProcessLoad_Criteria 
--WHERE SSB_CRMSYSTEM_Contact_ID IN (
--	SELECT SSB_CRMSYSTEM_Contact_ID FROM dbo.contact a join dbo.account b  on a.ssb_crmsystem_Acct_ID = b.ssb_crmsystem_Acct_ID
--		where a.fullname = b.fullname and a.isbusinessaccount = 1
--		--WHERE SSB_CRMSYSTEM_Contact_ID IN (SELECT DISTINCT SSB_CRMSYSTEM_Contact_ID FROM dbo.vwDimCustomer_ModAcctId WHERE SourceSystem LIKE '%SFDC_Account%')
--	GROUP BY SSB_CRMSYSTEM_Contact_ID
----HAVING COUNT(DISTINCT SourceSystem) = 1
--) 
--AND LoadType = 'Upsert'

/*

-- Assign CRM IDs in dbo.Account
--EXEC dbo.sp_CRMProcess_CRMID_Assign_Account

SELECT DISTINCT b.[SSB_CRMSYSTEM_CONTACT_ID], [b].[crm_id]
, CASE WHEN 1=1 --b.accountid IS NULL 
AND b.[SSB_CRMSYSTEM_CONTACT_ID] = b.[crm_id] THEN 'Upsert' ELSE 'Update' END LoadType
INTO #tmpA
FROM wrk.[customerWorkingList] a 
INNER JOIN dbo.Contact b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[SSB_CRMSYSTEM_ACCT_ID]
WHERE 1=1 
AND b.[SSB_CRMSYSTEM_CONTACT_ID] <> b.[crm_id] 
--LEFT JOIN ProdCopy.[vw_Account] b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[new_ssbcrmsystemacctid]
--DROP TABLE [#tmpA]

SELECT b.[SSB_CRMSYSTEM_CONTACT_ID], id, 
				HASHBYTES('SHA2_256', (
				  ISNULL(RTRIM([FirstName]				   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM([LastName]	   ),'DBNULL_TEXT') 
				--+ ISNULL(RTRIM(Prefix	   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM(Suffix	   ),'DBNULL_TEXT')   
				+ ISNULL(RTRIM(MailingStreet	   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM(MailingCity	   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM(MailingState	   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM(MailingPostalCode		   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM(MailingCountry	   ),'DBNULL_TEXT')  
				+ ISNULL(RTRIM(Phone					   ),'DBNULL_TEXT')  )) Contact_Hash
INTO #pcContact
FROM ProdCopy.[vw_Contact] a
INNER JOIN #tmpA b ON a.id = b.[crm_id]
-- DROP TABLE #pcContact

SELECT a.[SSB_CRMSYSTEM_CONTACT_ID], a.crm_id, 
HASHBYTES('SHA2_256', (
  ISNULL(RTRIM([FirstName]				   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM([LastName]	   ),'DBNULL_TEXT')  
--+ ISNULL(RTRIM(Prefix	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(Suffix	   ),'DBNULL_TEXT') 
+ ISNULL(RTRIM(AddressPrimaryStreet	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryCity	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryState	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryZip		   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryCountry	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(Phone					   ),'DBNULL_TEXT')  )) Contact_Hash
INTO #dboContact
FROM dbo.Contact a 
INNER JOIN #tmpA b ON [b].[SSB_CRMSYSTEM_CONTACT_ID] = [a].[SSB_CRMSYSTEM_CONTACT_ID]
--DROP TABLE #dboContact

/*
SELECT a.[crm_id]
, z.[FullName], y.Name
, HASHBYTES('SHA2_256',ISNULL(RTRIM(z.[FullName]),'DBNULL_TEXT')) , HASHBYTES('SHA2_256',ISNULL(RTRIM(y.Name),'DBNULL_TEXT'))  
, z.[AddressPrimaryStreet], y.[address1_line1]
, HASHBYTES('SHA2_256',ISNULL(RTRIM(z.[AddressPrimaryStreet]),'DBNULL_TEXT')) , HASHBYTES('SHA2_256',ISNULL(RTRIM(y.[address1_line1]),'DBNULL_TEXT'))  
FROM [#dboAcct] a
INNER JOIN [#pcAcct] b ON a.[crm_id] = b.accountid
INNER JOIN dbo.[Account] z ON a.[crm_id] = z.[crm_id]
INNER JOIN ProdCopy.[vw_Account] y ON b.accountid = y.accountid
WHERE a.[Account_Hash] <> b.[Account_Hash]
*/

TRUNCATE TABLE dbo.[CRMLoad_Contact_ProcessLoad_Criteria]

INSERT INTO dbo.[CRMLoad_Contact_ProcessLoad_Criteria]
        ( [SSB_CRMSYSTEM_CONTACT_ID] ,
          LoadType,
		  [ObjectType]
        )
SELECT DISTINCT a.[SSB_CRMSYSTEM_CONTACT_ID], [z].[LoadType], 'Contact_Std' ObjectType
FROM [#dboContact] a
INNER JOIN [#pcContact] b ON a.[crm_id] = b.id
INNER JOIN [#tmpA] z ON a.[SSB_CRMSYSTEM_CONTACT_ID] = z.[SSB_CRMSYSTEM_CONTACT_ID]
WHERE a.Contact_Hash <> b.Contact_Hash



INSERT INTO dbo.[CRMLoad_Contact_ProcessLoad_Criteria]
        ( [SSB_CRMSYSTEM_CONTACT_ID] ,
          LoadType,
		  [ObjectType]
        )
SELECT a.[SSB_CRMSYSTEM_CONTACT_ID], 'Upsert' LoadType, 'Contact_Std' ObjectType
FROM dbo.Contact a 
WHERE [SSB_CRMSYSTEM_CONTACT_ID] = [crm_id]



*/

GO
