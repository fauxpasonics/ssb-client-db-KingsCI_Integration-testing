SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROC [MERGEPROCESS_New].[QueueMerges] --'Kings'
--Exec  [MERGEPROCESS_New].[QueueMerges] 'Kings'
	@Client VARCHAR(100) 
AS
--Declare @Client VARCHAR(100) ='Kings'
DECLARE @Account VARCHAR(100) = (SELECT CASE WHEN @client = 'TrailBlazers' THEN 'CRM_Account' ELSE CONCAT(@client,' PC_SFDC Account' ) END);
DECLARE @Contact VARCHAR(100) = (SELECT CASE WHEN @client = 'TrailBlazers' THEN 'CRM_Contact' ELSE CONCAT(@client,' PC_SFDC Contact' ) END );

--Make sure that parent accounts match for both contacts
--Done in SSIS

--select * from 

----WITH only2Acct as
TRUNCATE TABLE MERGEPROCESS_New.Queue 
INSERT INTO MERGEPROCESS_New.Queue



SELECT PK_MergeID, b.MergeType,  MAX(CASE WHEN xRank =1 THEN c.ID END) AS Winner, MAX(CASE WHEN xRank =2 THEN c.ID END) AS Loser 
FROM mergeprocess_new.tmp_dimcust  a 
JOIN MERGEPROCESS_New.DetectedMerges b with (nolock) ON a.SSB_CRMSYSTEM_ACCT_ID = b.SSBID AND SourceSystem = @Account
JOIN MERGEPROCESS_New.vwMergeAccountRanks c ON a.SSID = c.ID
WHERE (AutoMerge = 1 OR (AutoMerge = 0 AND Approved = 1))
	--AND NumRecords = 2	
AND b.MergeType = 'Account'
AND MergeComplete = 0 
GROUP BY PK_MergeID,b.MergeType
HAVING MAX(CASE WHEN xRank =1 THEN c.ID END) IS NOT NULL AND  MAX(CASE WHEN xRank =2 THEN c.ID END) IS NOT NULL

UNION ALL

SELECT PK_MergeID, b.MergeType,  MAX(CASE WHEN xRank =1 THEN c.ID END) AS Winner, MAX(CASE WHEN xRank =2 THEN c.ID END) AS Loser  
FROM mergeprocess_new.tmp_dimcust  a 
JOIN MERGEPROCESS_New.DetectedMerges b with (nolock) ON a.SSB_CRMSYSTEM_CONTACT_ID = b.SSBID AND SourceSystem = @Contact
JOIN MERGEPROCESS_New.vwMergeContactRanks c ON a.SSID = c.ID
WHERE (AutoMerge = 1 OR (AutoMerge = 0 AND Approved = 1))
	--AND NumRecords = 2	
	AND b.MergeType = 'Contact'
	AND MergeComplete = 0 
GROUP BY PK_MergeID,b.MergeType
HAVING MAX(CASE WHEN xRank =1 THEN c.ID END) IS NOT NULL AND  MAX(CASE WHEN xRank =2 THEN c.ID END) IS NOT NULL

GO
