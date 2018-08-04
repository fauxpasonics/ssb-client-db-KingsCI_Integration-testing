SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE view [dbo].[vwCRMLoad_Account_RenoBigHorns_Update]
AS

SELECT distinct c.crm_ID Id, 1 Reno_Bighorns_Account__c
FROM kings.rpt.vw_FactTicketSalesBase a join kings.dbo.vwdimcustomer_modacctid b on a.DimcustomerID = b.dimcustomerID
JOIN dbo.Account c on b.SSB_CRMSYSTEM_ACCT_ID = c.SSB_CRMSYSTEM_ACCT_ID
left join prodcopy.Account d on c.crm_ID = d.ID
WHERE ItemCode = '16RFL'
and c.SSB_CRMSYSTEM_ACCT_ID <> c.crm_ID
AND ISNULL(d.Reno_Bighorns_Account__c,0) <> 1

GO
