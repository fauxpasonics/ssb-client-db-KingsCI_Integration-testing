SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [dbo].[sp_CRMLoad_Account_ProcessLoad_Criteria]
AS

-- Assign CRM IDs in dbo.Account
--EXEC dbo.sp_CRMProcess_CRMID_Assign_Account

TRUNCATE TABLE dbo.[CRMLoad_Account_ProcessLoad_Criteria]

INSERT INTO dbo.[CRMLoad_Account_ProcessLoad_Criteria]
        ( [SSB_CRMSYSTEM_ACCT_ID] ,
          LoadType
        )
SELECT DISTINCT a.[SSB_CRMSYSTEM_ACCT_ID]
, CASE WHEN 1=1 --b.accountid IS NULL 
AND a.[SSB_CRMSYSTEM_ACCT_ID] = b.[crm_id] THEN 'Upsert' ELSE 'Update' END LoadType
FROM wrk.[customerWorkingList] a 
INNER JOIN dbo.Account b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[SSB_CRMSYSTEM_ACCT_ID]
--LEFT JOIN ProdCopy.[vw_Account] b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[new_ssbcrmsystemacctid]
--WHERE [a].[IsBusinessAccount] = 1


-- DON'T ALLOW CRM ONLY RECORDS TO BE LOADED AGAIN
DELETE 
--SELECT * 
FROM dbo.CRMLoad_Account_ProcessLoad_Criteria
WHERE SSB_CRMSYSTEM_ACCT_ID IN (
	SELECT SSB_CRMSYSTEM_ACCT_ID FROM dbo.vwDimCustomer_ModAcctId a
		WHERE SSB_CRMSYSTEM_ACCT_ID IN (SELECT DISTINCT SSB_CRMSYSTEM_ACCT_ID FROM dbo.vwDimCustomer_ModAcctId WHERE SourceSystem LIKE '%SFDC_Account%')
	GROUP BY SSB_CRMSYSTEM_ACCT_ID
HAVING COUNT(DISTINCT SourceSystem) = 1
) AND LoadType = 'Upsert'

DELETE 
--SELECT * 
FROM dbo.CRMLoad_Account_ProcessLoad_Criteria 
WHERE SSB_CRMSYSTEM_ACCT_ID IN (
	SELECT SSB_CRMSYSTEM_ACCT_ID FROM dbo.vwDimCustomer_ModAcctId a
		WHERE SSB_CRMSYSTEM_ACCT_ID IN (SELECT DISTINCT SSB_CRMSYSTEM_ACCT_ID FROM dbo.vwDimCustomer_ModAcctId WHERE SourceSystem LIKE '%SFDC_Contact%')
	GROUP BY SSB_CRMSYSTEM_ACCT_ID
HAVING COUNT(DISTINCT SourceSystem) = 1
) 
AND LoadType = 'Upsert'

DELETE b
--SELECT COUNT(*)
FROM dbo.vwDimCustomer_ModAcctId a 
INNER JOIN dbo.CRMLoad_Account_ProcessLoad_Criteria b ON b.SSB_CRMSYSTEM_ACCT_ID = a.SSB_CRMSYSTEM_ACCT_ID
WHERE 1=1
AND SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG = 1
AND (SourceSystem LIKE '%SFDC%' OR SourceSystem LIKE '%CRM%')
AND LoadType = 'Upsert'

DELETE [b]
-- SELECT [a].[crm_id] id
FROM dbo.Account a 
INNER JOIN dbo.[CRMLoad_Account_ProcessLoad_Criteria] b ON a.SSB_CRMSYSTEM_ACCT_ID = b.SSB_CRMSYSTEM_ACCT_ID
WHERE (ISNULL([AddressPrimaryStreet],'') + ISNULL([Phone],'') + ISNULL([EmailPrimary],'') = '' 
OR ISNULL(a.FullName,'') = '') -- Added 3/28/18 by TCF. Accounts can't be loaded that don't have a name (required field)
AND LoadType = 'Upsert'


/* 

-- Assign CRM IDs in dbo.Account
--EXEC dbo.sp_CRMProcess_CRMID_Assign_Account


SELECT DISTINCT a.[SSB_CRMSYSTEM_ACCT_ID], [b].[crm_id]
, CASE WHEN 1=1 --b.accountid IS NULL 
AND b.[SSB_CRMSYSTEM_ACCT_ID] = b.[crm_id] THEN 'Upsert' ELSE 'Update' END LoadType
INTO #tmpA
FROM wrk.[customerWorkingList] a 
INNER JOIN dbo.Account b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[SSB_CRMSYSTEM_ACCT_ID]
--LEFT JOIN ProdCopy.[vw_Account] b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[new_ssbcrmsystemacctid]
WHERE b.[SSB_CRMSYSTEM_ACCT_ID] <> b.[crm_id]
--DROP TABLE [#tmpA]

SELECT b.[SSB_CRMSYSTEM_ACCT_ID], id, 
HASHBYTES('SHA2_256', ISNULL(RTRIM(name),'DBNULL_TEXT') 
							+ ISNULL(RTRIM([BillingStreet]),'DBNULL_TEXT')  
							+ ISNULL(RTRIM([BillingCity]),'DBNULL_TEXT') 
							+ ISNULL(RTRIM([BillingState]),'DBNULL_TEXT') 
							+ ISNULL(RTRIM([BillingPostalCode]),'DBNULL_TEXT') 
							+ ISNULL(RTRIM([BillingCountry]),'DBNULL_TEXT') 
							+ ISNULL(RTRIM([Phone]),'DBNULL_TEXT') ) Account_Hash
INTO #pcAcct
FROM ProdCopy.vw_Account a
INNER JOIN #tmpA b ON a.id = b.[crm_id]
-- DROP TABLE #pcAcct

SELECT a.[SSB_CRMSYSTEM_ACCT_ID], a.crm_id, 
HASHBYTES('SHA2_256', (
  ISNULL(RTRIM([FullName]				   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryStreet	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryCity	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryState	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryZip		   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(AddressPrimaryCountry	   ),'DBNULL_TEXT')  
+ ISNULL(RTRIM(Phone					   ),'DBNULL_TEXT')  )) Account_Hash
INTO #dboAcct
FROM dbo.[Account] a 
INNER JOIN #tmpA b ON [b].[SSB_CRMSYSTEM_ACCT_ID] = [a].[SSB_CRMSYSTEM_ACCT_ID]
--DROP TABLE #dboAcct

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

TRUNCATE TABLE dbo.[CRMLoad_Account_ProcessLoad_Criteria]

INSERT INTO dbo.[CRMLoad_Account_ProcessLoad_Criteria]
        ( [SSB_CRMSYSTEM_ACCT_ID] ,
          LoadType,
		  [ObjectType]
        )
SELECT a.[SSB_CRMSYSTEM_ACCT_ID], [z].[LoadType], 'Account_Std' ObjectType
FROM [#dboAcct] a
INNER JOIN [#pcAcct] b ON a.[crm_id] = b.id
INNER JOIN [#tmpA] z ON a.[SSB_CRMSYSTEM_ACCT_ID] = z.[SSB_CRMSYSTEM_ACCT_ID]
WHERE a.[Account_Hash] <> b.[Account_Hash]

INSERT INTO dbo.[CRMLoad_Account_ProcessLoad_Criteria]
        ( [SSB_CRMSYSTEM_ACCT_ID] ,
          LoadType,
		  [ObjectType]
        )
SELECT a.[SSB_CRMSYSTEM_ACCT_ID], 'Upsert' LoadType, 'Account_Std' ObjectType
FROM dbo.[Account] a 
WHERE [SSB_CRMSYSTEM_ACCT_ID] = [crm_id]

*/

GO
