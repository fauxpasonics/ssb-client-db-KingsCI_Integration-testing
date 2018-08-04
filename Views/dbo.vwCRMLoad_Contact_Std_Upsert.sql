SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vwCRMLoad_Contact_Std_Upsert] AS
SELECT a.SSB_CRMSYSTEM_ACCT_ID__c, a.SSB_CRMSYSTEM_CONTACT_ID__c, Prefix, a.FirstName, a.LastName, a.Suffix, MailingStreet, MailingCity, MailingState, MailingPostalCode, MailingCountry, a.Phone, a.AccountId
, [LoadType]
FROM [dbo].[vwCRMLoad_Contact_Std_Prep] a
LEFT JOIN KingsCI_Reporting.prodcopy.Account aa
	ON a.accountid = aa.ID
LEFT JOIN KingsCI_Reporting.prodcopy.[User] uu 
	ON aa.ownerID = uu.ID
WHERE LoadType = 'Upsert'
AND ISNULL(uu.IsActive,1) = 1
AND ISNULL(a.FirstName,'') + ISNULL(a.Lastname,'') <> ''
--AND 1=2



GO
