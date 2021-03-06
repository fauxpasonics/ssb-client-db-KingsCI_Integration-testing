SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[sp_CRMProcess_CRMID_Assign_Contact]
as
UPDATE a
SET crm_Id = a.SSB_CRMSYSTEM_CONTACT_ID
FROM dbo.contact a
LEFT JOIN prodcopy.contact b
ON a.crm_id = b.id and b.isdeleted = 0
where b.id IS NULL 

UPDATE a
SET a.crm_id = b.id
-- SELECT COUNT(*)
FROM dbo.contact a
INNER JOIN prodcopy.contact b ON a.SSB_CRMSYSTEM_contact_ID = b.SSB_CRMSYSTEM_contact_ID__C
LEFT JOIN (SELECT [crm_id] FROM dbo.contact WHERE crm_id <> [SSB_CRMSYSTEM_CONTACT_ID]) c ON b.id = c.crm_id
WHERE isnull(a.[crm_id], '') != b.id 
AND c.crm_id IS NULL	
AND b.isdeleted = 0
---and b.id = '0033800002JUEoUAAX'

UPDATE a
SET [crm_id] =  b.ssid 
-- SELECT COUNT(*) 
FROM dbo.contact a
INNER JOIN dbo.[vwDimCustomer_ModAcctId] b ON a.SSB_CRMSYSTEM_contact_ID = b.SSB_CRMSYSTEM_contact_ID
LEFT JOIN (SELECT crm_id FROM dbo.contact WHERE crm_id <> [SSB_CRMSYSTEM_CONTACT_ID]) c ON b.ssid = c.[crm_id]
WHERE b.SourceSystem = 'Kings PC_SFDC Contact'
AND b.isdeleted = 0
 --AND a.[crm_id] != b.ssid
 AND c.[crm_id] IS NULL 



GO
