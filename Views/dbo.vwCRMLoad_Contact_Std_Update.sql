SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vwCRMLoad_Contact_Std_Update] AS
SELECT a.SSB_CRMSYSTEM_ACCT_ID__c
, a.SSB_CRMSYSTEM_CONTACT_ID__c
, a.Prefix											  
, isnull(a.FirstName, c.FirstName) FirstName										  -- ,c.FirstName
, isnull(a.LastName, c.LastName) LastName										  -- ,c.LastName
, isnull(a.Suffix, c.Suffix) Suffix											  -- ,c.Suffix
, isnull(a.MailingStreet, c.MailingStreet) MailingStreet									  -- ,c.MailingStreet
, isnull(a.MailingCity, c.MailingCity) MailingCity										  -- ,c.MailingCity
, isnull(a.MailingState, c.MailingState) MailingState									  -- ,c.MailingState
, isnull(a.MailingPostalCode, c.MailingPostalCode) MailingPostalCode								  -- ,c.MailingPostalCode
, isnull(a.MailingCountry, c.MailingCountry) MailingCountry									  -- ,c.MailingCountry
, isnull(a.Phone, c.Phone) Phone											  -- ,c.Phone
, a.Id												  -- 
, a.AccountId										  -- ,c.AccountId
, [LoadType]


--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.FirstName AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.FirstName AS VARCHAR(MAX)))),'')) 				then 1		else 0 end as diffFirstName
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.LastName AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.LastName AS VARCHAR(MAX)))),'')) 					then 1	else 0 end as diffLastName
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Suffix AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Suffix AS VARCHAR(MAX)))),'')) 						then 1	else 0 end as diffSuffix
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingStreet AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingStreet AS VARCHAR(MAX)))),'')) 		then 1		else 0 end as diffMailingStreet
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingCity AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingCity AS VARCHAR(MAX)))),'')) 			then 1		else 0 end as diffMailingCity
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingState AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingState AS VARCHAR(MAX)))),'')) 			then 1	else 0 end as diffMailingState
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingPostalCode AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingPostalCode AS VARCHAR(MAX)))),'')) then 1		else 0 end as diffMailingPostalCode
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingCountry AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingCountry AS VARCHAR(MAX)))),'')) 		then 1	else 0 end as diffMailingCountry
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Phone AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Phone AS VARCHAR(MAX)))),'')) 						then 1		else 0 end as diffPhone


FROM [dbo].[vwCRMLoad_Contact_Std_Prep] a
LEFT JOIN prodcopy.vw_RenoBighornsContacts b ON a.ID = b.ID
LEFT JOIN prodcopy.Contact c ON a.Id = c.ID
WHERE LoadType = 'Update'
AND b.ID IS NULL
AND  ( HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.FirstName AS VARCHAR(MAX)))),c.FirstName) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.FirstName AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.LastName AS VARCHAR(MAX)))),c.LastName) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.LastName AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Suffix AS VARCHAR(MAX)))),c.Suffix) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Suffix AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingStreet AS VARCHAR(MAX)))),c.MailingStreet) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingStreet AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingCity AS VARCHAR(MAX)))),c.MailingCity) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingCity AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingState AS VARCHAR(MAX)))),c.MailingState) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingState AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingPostalCode AS VARCHAR(MAX)))),c.MailingPostalCode) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingPostalCode AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.MailingCountry AS VARCHAR(MAX)))),c.MailingCountry) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MailingCountry AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( a.Phone AS VARCHAR(MAX)))),c.Phone) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Phone AS VARCHAR(MAX)))),'')) 
	--Or HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.emailaddress1 as varchar(max)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.emailaddress1 as varchar(max)))),'')) 
	)



GO
