SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[sp_RecordTypeLogging]

AS 

INSERT INTO KingsCI_Integration.dbo.RecordFlippingIDs
SELECT pc.id
FROM KingsCI_Reporting.prodcopy.Account pc WITH (NOLOCK)
INNER JOIN KingsCI_Reporting.prodcopystg.account stg WITH (NOLOCK)
ON pc.id = stg.Id
WHERE pc.RecordTypeId != stg.RecordTypeId
GO
