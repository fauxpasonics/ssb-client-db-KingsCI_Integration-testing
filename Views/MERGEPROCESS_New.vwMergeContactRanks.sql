SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









CREATE VIEW [MERGEPROCESS_New].[vwMergeContactRanks]
AS






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






/*
Tasks join to opportunities via the WhatId field, the contact view the whoid field, and the account via the accountid field.

select accountid, ownerid, whoid, whatid from kingsci_reporting.prodcopy.task where lastmodifieddate > (getdate() - 30) order by 3,4

select top 100 id from kingsci_reporting.prodcopy.opportunity
*/

WITH task_cte (accountid, ownerID, lastmodifieddate)
AS (
   SELECT * -- accountid, ownerID, MAX(lastmodifieddate) --added 2018/04/09
   FROM
   (
       SELECT t.AccountId,
              t.OwnerId,
              MAX(t.LastModifiedDate) AS Lastmodifieddate
       FROM KingsCI_Reporting.prodcopy.Task t
           INNER JOIN MERGEPROCESS_New.tmp_pcaccount pca
               ON t.AccountId = pca.Id --Review and Add
       GROUP BY t.AccountId,
                t.OwnerId
   ) x
   WHERE Lastmodifieddate > (GETDATE() - 30)
--GROUP BY accountid, ownerID --added 2018/04/09
),
     opportunity_cte (AccountId, Id, season__c, isclosed, iswon, [name], RecordTypeId, Account_Owner__c)
AS (SELECT DISTINCT
           pco.AccountId,
           pco.Id,
           Season__c,
           pco.IsClosed,
           pco.IsWon,
           pco.Name,
           pco.RecordTypeId,
           pco.Account_Owner__c
    FROM KingsCI_Reporting.prodcopy.Opportunity pco WITH (NOLOCK)
        INNER JOIN MERGEPROCESS_New.tmp_pcaccount pca
            ON pco.AccountId = pca.Id --Review and Add
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
              AND pco.IsClosed <> 1
          )),
     rank_cte (ssbid, id, xrank)
AS (SELECT SSBID,
           ID,
           MIN(xRank)
    FROM
    (
        SELECT a.SSBID,
               pc.Id ID,
               --Add in custom ranking here
               ROW_NUMBER() OVER (PARTITION BY SSBID
                                  ORDER BY CASE
                                               WHEN pc.OwnerId = '00550000005Lvm7AAC' THEN
                                                   0
                                               WHEN rt.[Name] IN ( 'Loft New Sales', 'Partnership New Sales',
                                                                   'Suite New Sales'
                                                                 )
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
                                                    AND rt.[Name] IN ( 'Full Season', 'Full Season Renewal',
                                                                       'Partial Season'
                                                                     ) THEN
                                                   89
                                               -- is a current sharepartner based on object currently being built, ETA TBD
                                               WHEN u.Sales_Team__c LIKE '%partnership%'
                                                    AND pco.isclosed <> 1
                                                    AND pco.season__c = '2017-18' THEN
                                                   69
                                               WHEN pco.Account_Owner__c <> 'ETL USer'
                                                    AND pco.isclosed <> 1
                                                    AND pco.season__c = '2017-18' THEN
                                                   59
                                               WHEN T.lastmodifieddate > GETDATE() - 30
                                                    AND T.ownerID = pc.OwnerId THEN
                                                   49
                                               -- WHEN c.lastmodifieddate = tmd.mlmd THEN 39
                                               --WHEN pc.lastmodifieddate = tmd.mlmd THEN 39

                                               ELSE
                                                   1
                                           END DESC,
                                           pc.CreatedDate DESC,
                                           pc.LastModifiedDate DESC
                                 ) xRank
        --add in last created

        --  ,CASE WHEN pc.ownerid = '00550000005Lvm7AAC' THEN 0 
        -- WHEN rt.[name] IN ('Loft New Sales', 'Partnership New Sales', 'Suite New Sales')
        --   AND pco.season__c = '2017-18'		--hard coded for now and will ask client how to proceed with potential cutover date for 2018	 
        --   AND (pco.isclosed = 1 OR pco.iswon = 1) THEN 99
        -- WHEN (pco.isclosed = 1 OR pco.iswon = 1) 
        --   AND pco.[name] LIKE'%17-18 Full Season%'
        --   AND rt.[name] IN ('Full Season', 'Full Season Renewal', 'Partial Season') THEN 89
        ---- is a current sharepartner based on object currently being built, ETA TBD
        --WHEN u.Sales_Team__c LIKE '%partnership%'
        --    AND pco.isclosed <>1 
        --	AND  pco.season__c = '2017-18' THEN 69

        -- WHEN pco.account_owner__c <> 'ETL USer' 
        -- AND pco.isclosed <>1 
        -- AND pco.season__c = '2017-18' THEN 59
        -- WHEN  t.lastmodifieddate > GETDATE() - 30
        -- AND t.ownerID = pc.OwnerId  THEN 49			
        ---- WHEN c.lastmodifieddate = tmd.mlmd THEN 39
        -- --WHEN pc.lastmodifieddate = tmd.mlmd THEN 39


        --  ELSE 1 END RankDesc

        --SELECT *--a.*,pco.*
        FROM MERGEPROCESS_New.DetectedMerges a WITH (NOLOCK)
            JOIN MERGEPROCESS_New.tmp_dimcust dc WITH (NOLOCK)
                ON a.SSBID = dc.SSB_CRMSYSTEM_CONTACT_ID
                   AND a.MergeType = 'Contact' --34196
            JOIN MERGEPROCESS_New.tmp_pccontact pc WITH (NOLOCK)
                ON dc.SSID = pc.Id --26852
            LEFT JOIN opportunity_cte pco WITH (NOLOCK)
                ON pc.AccountId = pco.AccountId
            LEFT JOIN KingsCI_Reporting.prodcopy.RecordType rt WITH (NOLOCK)
                ON rt.Id = pco.RecordTypeId
            LEFT JOIN task_cte T WITH (NOLOCK)
                ON T.accountid = pco.AccountId
            --LEFT JOIN KingsCI_Reporting.prodcopy.Contact C WITH (NOLOCK) leave uncommented
            --	ON c.accountid = pco.accountID leave uncommented
            LEFT JOIN KingsCI_Reporting.prodcopy.[User] u WITH (NOLOCK)
                ON u.Id = pc.OwnerId
        --LEFT JOIN (SELECT accountID, MAX(LastModifiedDate) MLMD FROM KingsCI_Reporting.prodcopy.Contact leave uncommented
        --	GROUP BY accountid) tmd leave uncommented
        --	ON pc.accountid =tmd.accountID leave uncommented


        WHERE MergeComplete = 0
    --AND a.ssbid  = '124263C0-6641-4D91-90FC-5C0A56CC0E91'
    ) x
    GROUP BY SSBID,
             ID)
SELECT ssbid,
       id,
       xrank
FROM rank_cte;
--where SSBID = '124263C0-6641-4D91-90FC-5C0A56CC0E91'
--)x






--WITH task_cte  (accountid, ownerID, lastmodifieddate)

--AS

--(
--SELECT *-- accountid, ownerID, MAX(lastmodifieddate) --added 2018/04/09
--FROM(
--SELECT t.accountid, t.ownerID, MAX(t.lastmodifieddate) AS Lastmodifieddate 
--FROM KingsCI_Reporting.prodcopy.task t
--INNER JOIN MERGEPROCESS_New.tmp_pcaccount pca ON t.AccountId = pca.id --Review and Add
--GROUP BY t.AccountId,t.OwnerId)x
--WHERE lastmodifieddate > (GETDATE() - 30)
----GROUP BY accountid, ownerID --added 2018/04/09
--),


-- opportunity_cte (AccountId, Id,season__c , isclosed, iswon, [name], RecordTypeId,Account_Owner__c)

--AS
--(
--SELECT DISTINCT pco.AccountId, pco.Id,season__c , pco.isclosed, pco.iswon, pco.name, pco.RecordTypeId,pco.Account_Owner__c
--FROM KingsCI_Reporting.prodcopy.opportunity pco WITH(NOLOCK)
--INNER JOIN MERGEPROCESS_New.tmp_pcaccount pca ON pco.AccountId = pca.Id --Review and Add
--WHERE ((pco.season__c = '2017-18'	OR pco.[name] LIKE'%17-18 Full Season%')
--AND( pco.isclosed = 1 OR pco.iswon = 1))
--OR (pco.Season__c = '2017-18'	AND pco.isclosed <>1)

--)


--SELECT a.SSBID
--	, pc.id ID
--	--Add in custom ranking here
--	,ROW_NUMBER() OVER(PARTITION BY SSBID ORDER BY 
--		CASE WHEN pc.ownerid = '00550000005Lvm7AAC' THEN 0 
--			 WHEN rt.[name] IN ('Loft New Sales', 'Partnership New Sales', 'Suite New Sales')
--			   AND pco.season__c = '2017-18'		--hard coded for now and will ask client how to proceed with potential cutover date for 2018	 
--			   AND (pco.isclosed = 1 OR pco.iswon = 1) THEN 99
--			 WHEN (pco.isclosed = 1 OR pco.iswon = 1) 
--			   AND pco.[name] LIKE'%17-18 Full Season%'
--			   AND rt.[name] IN ('Full Season', 'Full Season Renewal', 'Partial Season') THEN 89
--			-- is a current sharepartner based on object currently being built, ETA TBD
--			WHEN u.Sales_Team__c LIKE '%partnership%'
--			    AND pco.isclosed <>1 
--				AND  pco.season__c = '2017-18' THEN 69

--			 WHEN pco.account_owner__c <> 'ETL USer' 
--			 AND pco.isclosed <>1 
--			 AND pco.season__c = '2017-18' THEN 59
--			 WHEN  t.lastmodifieddate > GETDATE() - 30
--			 AND t.ownerID = pc.OwnerId  THEN 49			
--			-- WHEN c.lastmodifieddate = tmd.mlmd THEN 39
--			 --WHEN pc.lastmodifieddate = tmd.mlmd THEN 39


--			  ELSE 1 END DESC, pc.lastmodifieddate DESC,   pc.CreatedDate) xRank


--			--  ,CASE WHEN pc.ownerid = '00550000005Lvm7AAC' THEN 0 
--			-- WHEN rt.[name] IN ('Loft New Sales', 'Partnership New Sales', 'Suite New Sales')
--			--   AND pco.season__c = '2017-18'		--hard coded for now and will ask client how to proceed with potential cutover date for 2018	 
--			--   AND (pco.isclosed = 1 OR pco.iswon = 1) THEN 99
--			-- WHEN (pco.isclosed = 1 OR pco.iswon = 1) 
--			--   AND pco.[name] LIKE'%17-18 Full Season%'
--			--   AND rt.[name] IN ('Full Season', 'Full Season Renewal', 'Partial Season') THEN 89
--			---- is a current sharepartner based on object currently being built, ETA TBD
--			--WHEN u.Sales_Team__c LIKE '%partnership%'
--			--    AND pco.isclosed <>1 
--			--	AND  pco.season__c = '2017-18' THEN 69

--			-- WHEN pco.account_owner__c <> 'ETL USer' 
--			-- AND pco.isclosed <>1 
--			-- AND pco.season__c = '2017-18' THEN 59
--			-- WHEN  t.lastmodifieddate > GETDATE() - 30
--			-- AND t.ownerID = pc.OwnerId  THEN 49			
--			---- WHEN c.lastmodifieddate = tmd.mlmd THEN 39
--			-- --WHEN pc.lastmodifieddate = tmd.mlmd THEN 39


--			--  ELSE 1 END RankDesc


----SELECT *--a.*,pco.*
--FROM MERGEPROCESS_New.DetectedMerges a WITH (NOLOCK)
--JOIN mergeprocess_new.tmp_dimcust dc WITH (NOLOCK) 
--	ON a.SSBID = dc.SSB_CRMSYSTEM_Contact_ID
--	AND a.MergeType = 'Contact'  --34196
--JOIN mergeprocess_new.tmp_pccontact pc WITH (NOLOCK) 
--	ON dc.SSID = pc.id --26852
--LEFT JOIN opportunity_cte pco WITH (NOLOCK)
--	ON pc.AccountID = pco.AccountID
--LEFT JOIN KingsCI_Reporting.prodcopy.RecordType rt  WITH (NOLOCK)
--	ON rt.id = pco.RecordTypeId
--LEFT JOIN task_cte  T WITH (NOLOCK)
--	ON t.AccountID = pco.AccountID
----LEFT JOIN KingsCI_Reporting.prodcopy.Contact C WITH (NOLOCK) leave uncommented
----	ON c.accountid = pco.accountID leave uncommented
--LEFT JOIN KingsCI_Reporting.prodcopy.[USER] u WITH (NOLOCK)
--	ON u.ID = pc.ownerID
----LEFT JOIN (SELECT accountID, MAX(LastModifiedDate) MLMD FROM KingsCI_Reporting.prodcopy.Contact leave uncommented
----	GROUP BY accountid) tmd leave uncommented
----	ON pc.accountid =tmd.accountID leave uncommented


--WHERE MergeComplete = 0
--AND a.ssbid  = '124263C0-6641-4D91-90FC-5C0A56CC0E91'



--)x




GO
