SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE VIEW [dbo].[vwCRMLoad_Account_Std_Update] AS

SELECT 
  a.SSB_CRMSYSTEM_ACCT_ID__c																		  --,c.SSB_CRMSYSTEM_ACCT_ID__c
, isnull(a.Name, c.name) Name																		  --,c.Name
, isnull(a.BillingStreet, c.BillingStreet) BillingStreet											  --,c.BillingStreet
, isnull(a.BillingCity, c.BillingCity) BillingCity													  --,c.BillingCity
, isnull(a.BillingState, c.BillingState) BillingState												  --,c.BillingState
, isnull(a.BillingPostalCode, c.BillingPostalCode) BillingPostalCode								  --,c.BillingPostalCode
, isnull(a.BillingCountry, c.BillingCountry) BillingCountry											  --,c.BillingCountry
, isnull(a.Phone, c.Phone) Phone																	  --,c.Phone
, a.Id														  
, [LoadType]												  

--select count(*)
FROM [dbo].[vwCRMLoad_Account_Std_Prep] a WITH (NOLOCK)
left join prodcopy.vw_RenoBighornsAccounts b WITH (NOLOCK) ON a.ID = b.ID
left join prodcopy.Account c WITH (NOLOCK) on a.Id = c.ID
WHERE LoadType = 'Update'
and b.ID is null
AND  (1=2 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.Name as varchar(max)))),c.Name) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.Name as varchar(max)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.BillingStreet as varchar(max)))),c.BillingStreet) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.BillingStreet as varchar(max)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.BillingCity as varchar(max)))),c.BillingCity) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.BillingCity as varchar(max)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.BillingState as varchar(max)))),c.BillingState) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.BillingState as varchar(max)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.BillingPostalCode as varchar(max)))),c.BillingPostalCode) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.BillingPostalCode as varchar(max)))),'')) 
	or HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.BillingCountry as varchar(max)))),c.BillingCountry) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.BillingCountry as varchar(max)))),'')) 
	Or HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.Phone as varchar(max)))),c.Phone) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.Phone as varchar(max)))),'')) 
	----Or HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( a.emailaddress1 as varchar(max)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.emailaddress1 as varchar(max)))),'')) 
	)



GO
