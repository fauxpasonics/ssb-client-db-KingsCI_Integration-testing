SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [MERGEPROCESS_New].[vwMergeAccountRanks]

------------------------------------------------------------------------------- 
-- Author name: Scott Sales
-- Created date: 2018-05-31
-- Purpose: switched ranking logic to end with createddate desc, lastmodifieddate desc
-- Copyright © 2018, SSB, All Rights Reserved 
------------------------------------------------------------------------------- 
-- Modification History -- 
-- 01/01/0000: developer full name 
-- Change notes: 
-- Peer reviewed by: Harry Jordheim
-- Peer review notes: Approved the switch in last 2 pieces of ranking logic
-- Peer review date: 2018-05-31
-- Deployed by: 
-- Deployment date: 
-- Deployment notes: 
------------------------------------------------------------------------------- 
------------------------------------------------------------------------------- 


AS
WITH task_cte (accountid, ownerID, lastmodifieddate)
AS (
   SELECT *
   FROM
   (
       SELECT AccountId,
              OwnerId,
              MAX(LastModifiedDate) AS lastmodifieddate
       FROM KingsCI_Reporting.prodcopy.Task
       GROUP BY AccountId,
                OwnerId
   ) x
   WHERE lastmodifieddate > (GETDATE() - 30)),
     opportunity_cte (AccountId, Id, season__c, isclosed, iswon, [name], RecordTypeId, Account_Owner__c, Archtics_ID__c)
AS (SELECT DISTINCT
           pco.AccountId,
           Id,
           Season__c,
           IsClosed,
           IsWon,
           [Name],
           pco.RecordTypeId,
           pco.Account_Owner__c,
           Archtics_ID__c
    FROM KingsCI_Reporting.prodcopy.Opportunity pco WITH (NOLOCK)
    WHERE (
              (
                  pco.Season__c = '2017-18'
                  OR pco.[Name] LIKE '%17-18 Full Season%'
              )
              AND
              (
                  pco.IsClosed = 1
                  OR pco.IsWon = 1
              )
          )
          OR
          (
              pco.Season__c = '2017-18'
              AND IsClosed <> 1
          ))
SELECT a.SSBID,
       pc.Id,
       --Add in custom ranking here
       ROW_NUMBER() OVER (PARTITION BY SSBID
                          ORDER BY CASE
                                       WHEN pc.OwnerId = '00550000005Lvm7AAC' THEN
                                           0
                                       WHEN rt.[Name] IN ( 'Loft New Sales', 'Partnership New Sales', 'Suite New Sales' )
                                            AND pco.season__c = '2017-18' --hard coded for now and will ask client how to proceed with potential cutover date for 2018	 
                                            AND
                                            (
                                                pco.isclosed = 1
                                                OR pco.iswon = 1
                                            ) THEN
                                           99
                                       WHEN (
                                                pco.isclosed = 1
                                                OR pco.iswon = 1
                                            )
                                            AND pco.[name] LIKE '%17-18 Full Season%'
                                            AND rt.[Name] IN ( 'Full Season', 'Full Season Renewal', 'Partial Season' ) THEN
                                           89
                                       -- is a current sharepartner based on object currently being built, ETA TBD
                                       WHEN u.Sales_Team__c LIKE '%partnership%'
                                            AND pco.isclosed <> 1
                                            AND pco.season__c = '2017-18' THEN
                                           69
                                       WHEN pco.Account_Owner__c <> 'ETL User'
                                            AND pco.isclosed <> 1
                                            AND pco.season__c = '2017-18' THEN
                                           59
                                       WHEN T.lastmodifieddate > GETDATE() - 30
                                            AND T.ownerID = pc.OwnerId THEN
                                           49
                                       -- WHEN pc.lastmodifieddate = md.mlmd THEN 39



                                       ELSE
                                           1
                                   END desc,
                                   pc.CreatedDate DESC,
                                   pc.LastModifiedDate DESC
                         ) xRank
FROM MERGEPROCESS_New.DetectedMerges a WITH (NOLOCK)
    JOIN MERGEPROCESS_New.tmp_dimcust dc WITH (NOLOCK)
        ON a.SSBID = dc.SSB_CRMSYSTEM_ACCT_ID
           AND a.MergeType = 'Account'
    JOIN MERGEPROCESS_New.tmp_pcaccount pc WITH (NOLOCK)
        ON dc.SSID = pc.Id
    LEFT JOIN opportunity_cte pco
        ON pc.Id = pco.AccountId
    LEFT JOIN KingsCI_Reporting.prodcopy.RecordType rt
        ON rt.Id = pco.RecordTypeId
    LEFT JOIN task_cte T
        ON T.accountid = pco.AccountId
    --LEFT JOIN KingsCI_Reporting.prodcopy.Account AC
    --	ON AC.Archtics_ID__c  = pco.Archtics_ID__c 
    LEFT JOIN KingsCI_Reporting.prodcopy.[User] u
        ON u.Id = pc.OwnerId
--LEFT JOIN (SELECT Archtics_ID__c, MAX(LastModifiedDate) MLMD FROM KingsCI_Reporting.prodcopy.Account
--	GROUP BY Archtics_ID__c) md
--	ON pC.Archtics_ID__c = md.Archtics_ID__c





WHERE MergeComplete = 0;


GO
