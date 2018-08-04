SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [wrk].[MergeDimCustomertoContact_Conversion_ONLY]
AS

TRUNCATE TABLE stg.[Contact]

INSERT INTO stg.[Contact]
        ( [SSB_CRMSYSTEM_ACCT_ID] ,
          [SSB_CRMSYSTEM_CONTACT_ID] ,
          [IsBusinessAccount] ,
          [FullName] ,
		  Prefix ,
          [FirstName] ,
          [LastName] ,
          [Suffix] ,
          [AddressPrimaryStreet] ,
          [AddressPrimaryCity] ,
          [AddressPrimaryState] ,
          [AddressPrimaryZip] ,
          [AddressPrimaryCountry] ,
          [Phone] ,
          [EmailPrimary] ,
          [MDM_UpdatedDate] ,
		  CRMProcess_UpdatedDate
        )
SELECT
dc.SSB_CRMSYSTEM_ACCT_ID
, dc.SSB_CRMSYSTEM_CONTACT_ID
, ISNULL(dc.isbusiness,0) as IsBusinessAccount
, COALESCE(FullName, ISNULL(FirstName,'') + ' ' + ISNULL(LastName,'')
	+ CASE WHEN Suffix <> '' THEN ' ' + Suffix Else '' END) FullName
, [dc].[Prefix]
, FirstName
, LastName
, [dc].[Suffix]
, CASE WHEN AddressPrimaryStreet = CAST(AccountID as varchar) THEN '' ELSE AddressPrimaryStreet + ' ' + AddressPrimarySuite END AS MailingStreet
, CASE WHEN AddressPrimaryCity = CAST(AccountID as varchar) THEN '' ELSE  AddressPrimaryCity END as MailingCity
, CASE WHEN AddressPrimaryState = CAST(AccountID as varchar) THEN '' ELSE  AddressPrimaryState END as MailingState
, CASE WHEN AddressPrimaryZip = CAST(AccountID as varchar) THEN '' ELSE  AddressPrimaryZip END as MailingPostalCode
, CASE WHEN AddressPrimaryCountry = CAST(AccountID as varchar) THEN '' ELSE  AddressPrimaryCountry END as MailingCountry
, dc.PhonePrimary AS Phone
, dc.EmailPrimary AS Email
, UpdatedDate as MDM_UpdatedDate
, GETDATE() AS CRMProcess_UpdatedDate
-- SELECT COUNT(*)
FROM dbo.[vwCompositeRecord_ModAcctID] dc 
WHERE [SSB_CRMSYSTEM_ACCT_ID] IN (SELECT [SSB_CRMSYSTEM_ACCT_ID] FROM wrk.[customerWorkingList])
--AND dc.SourceSystem NOT LIKE '%SFDC%' AND dc.SourceSystem NOT LIKE '%CRM%'

--peform merge ..update all contact ids that are eligible and cross them
-- TRUNCATE TABLE dbo.Account
MERGE INTO dbo.Contact AS target
USING  stg.Contact AS SOURCE 
ON target.[SSB_CRMSYSTEM_CONTACT_ID] = source.[SSB_CRMSYSTEM_CONTACT_ID]
WHEN MATCHED THEN UPDATE SET
TARGET.IsBusinessAccount = SOURCE.IsBusinessAccount
, TARGET.FullName = SOURCE.FullName
, TARGET.[Prefix] = SOURCE.[Prefix]
, TARGET.FirstName = SOURCE.FirstName
, TARGET.LastName = SOURCE.LastName
, TARGET.Suffix = SOURCE.Suffix
, TARGET.[AddressPrimaryStreet] = SOURCE.[AddressPrimaryStreet]
, TARGET.[AddressPrimaryCity] = SOURCE.[AddressPrimaryCity]
, TARGET.[AddressPrimaryState] = SOURCE.[AddressPrimaryState]
, TARGET.[AddressPrimaryZip] = SOURCE.[AddressPrimaryZip]
, TARGET.[AddressPrimaryCountry] = SOURCE.[AddressPrimaryCountry]
, TARGET.Phone = SOURCE.Phone
, TARGET.[EmailPrimary] = SOURCE.[EmailPrimary]
, TARGET.MDM_UpdatedDate = SOURCE.MDM_UpdatedDate
, TARGET.CRMProcess_UpdatedDate = SOURCE.CRMProcess_UpdatedDate
WHEN NOT MATCHED THEN 
INSERT 
(
		  SSB_CRMSYSTEM_ACCT_ID
        , SSB_CRMSYSTEM_CONTACT_ID
		, IsBusinessAccount
        , FullName
		, [Prefix]
        , FirstName
        , LastName
		, Suffix
        , [AddressPrimaryStreet]
		, [AddressPrimaryCity]
		, [AddressPrimaryState]
		, [AddressPrimaryZip]
		, [AddressPrimaryCountry]
		, Phone
        , [EmailPrimary]
        , MDM_UpdatedDate
        , CRMProcess_UpdatedDate
		, crm_id
)
VALUES
(
		  SOURCE.SSB_CRMSYSTEM_ACCT_ID
		, SOURCE.SSB_CRMSYSTEM_CONTACT_ID
		, SOURCE.IsBusinessAccount
		, SOURCE.FullName
		, SOURCE.[Prefix]
		, SOURCE.FirstName
		, SOURCE.LastName
		, SOURCE.Suffix
		, SOURCE.[AddressPrimaryStreet]
		, SOURCE.[AddressPrimaryCity]
		, SOURCE.[AddressPrimaryState]
		, SOURCE.[AddressPrimaryZip]
		, SOURCE.[AddressPrimaryCountry]
		, SOURCE.Phone
		, SOURCE.EmailPrimary
		, SOURCE.MDM_UpdatedDate
		, SOURCE.CRMProcess_UpdatedDate
		, source.[SSB_CRMSYSTEM_CONTACT_ID]
);

--exec [dbo].[sp_CRMProcess_CRMID_Assign_Contact]


GO
