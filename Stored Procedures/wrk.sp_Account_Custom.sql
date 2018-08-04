SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [wrk].[sp_Account_Custom]
AS
    TRUNCATE TABLE dbo.Account_Custom;

    MERGE INTO dbo.Account_Custom Target
    USING dbo.[Account] source
    ON source.[SSB_CRMSYSTEM_ACCT_ID] = Target.[SSB_CRMSYSTEM_ACCT_ID]
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ( [SSB_CRMSYSTEM_ACCT_ID]
               )
        VALUES ( source.[SSB_CRMSYSTEM_ACCT_ID]
               )
    WHEN NOT MATCHED BY SOURCE THEN
        DELETE;

    EXEC dbo.sp_CRMProcess_ConcatIDs 'Account'



    UPDATE  a
    SET     SSID_Winner = b.SSID
          , Salutation = b.Prefix
          , Fax = b.PhoneFax--,
          , AccountType = b.AccountType
          , RecordTypeId = rt.Id
	--Need something for record type?
	--TypeOfAccount = CASE WHEN b.IsBusiness = 1 THEN 'Business Account' ELSE 'Person Account' END 
    FROM    [dbo].[Account_Custom] a
            INNER JOIN dbo.[vwCompositeRecord_ModAcctID] b ON ISNULL([b].[SSB_CRMSYSTEM_ACCT_ID],
                                                                     b.[SSB_CRMSYSTEM_CONTACT_ID]) = [a].[SSB_CRMSYSTEM_ACCT_ID]
            INNER JOIN dbo.[vwDimCustomer_ModAcctId] c ON b.[DimCustomerId] = c.[DimCustomerId]
                                                          AND c.[SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG] = 1
            LEFT JOIN KingsCI_Reporting.prodcopy.RecordType rt ON CASE WHEN c.[SSB_CRMSYSTEM_ACCT_ID] <> c.[SSB_CRMSYSTEM_CONTACT_ID] AND ISNULL(b.CompanyName,'') != ''  -- OR b.AccountType IN ('GROUP', 'PARTNER', 'Business', 'Suite Holder','Loft Holder') --if lovely wants all accounts with this accounttype to be business then remove --
                                                                       THEN 'Business Account'
                                                                       ELSE 'Household Account'
                                                                  END = rt.Name;

--LA
    UPDATE  a
    SET     DiscretionaryIncome = x.DiscretionaryIncome
          , LengthOfResidence = x.LengthOfResidence
          , NetWorth = x.NetWorth
          , AdultsInHouseHold = x.AdultsInHouseHold
          , ChildrenFlag = presence_chldn_new_flg
    FROM    [dbo].[Account_Custom] a
            INNER JOIN ( SELECT ISNULL([b].[SSB_CRMSYSTEM_ACCT_ID], b.[SSB_CRMSYSTEM_CONTACT_ID]) [SSB_CRMSYSTEM_ACCT_ID]
                              , disc.Description AS DiscretionaryIncome
                              , res.Description LengthOfResidence
                              , net.Description NetWorth
                              , adult.Description AdultsInHouseHold
                              , presence_chldn_new_flg
                              , ROW_NUMBER() OVER ( PARTITION BY ISNULL([b].[SSB_CRMSYSTEM_ACCT_ID],
                                                                        b.[SSB_CRMSYSTEM_CONTACT_ID]) ORDER BY la.ETL_UpdatedDate DESC ) xrank
                         FROM   dbo.[vwDimCustomer_ModAcctId] b
                                INNER JOIN Kings.ods.LiveAnalytics_Customer la ON b.SSID = la.ult_party_id
                                LEFT JOIN Kings.ods.LA_Reference disc ON la.income_est_hh_cd = disc.Code
                                                                         AND disc.VariableName = 'income_est_hh_cd'
                                LEFT JOIN Kings.ods.LA_Reference res ON la.income_est_hh_cd = res.Code
                                                                        AND res.VariableName = 'len_of_resdnc_cd'
                                LEFT JOIN Kings.ods.LA_Reference net ON la.income_est_hh_cd = net.Code
                                                                        AND net.VariableName = 'net_worth_gold_cd'
                                LEFT JOIN Kings.ods.LA_Reference adult ON la.income_est_hh_cd = adult.Code
                                                                          AND adult.VariableName = 'adult_hh_num'
                       ) x ON [a].[SSB_CRMSYSTEM_ACCT_ID] = x.[SSB_CRMSYSTEM_ACCT_ID]
                              AND xrank = 1


    DECLARE @currentseason INT = ( SELECT   MAX(SeasonYear)
                                   FROM     Kings.dbo.FactTicketSales a
                                            JOIN Kings.dbo.DimSeason s ON a.DimSeasonId = s.DimSeasonId
                                            JOIN Kings.dbo.DimTicketType tt ON a.DimTicketTypeId = tt.DimTicketTypeId
                                   WHERE    tt.[DimTicketTypeId] = 1
                                 )
    DECLARE @previousseason INT = @currentseason - 1 

    UPDATE  a
    SET     Season_Current = @currentseason
          , Season_Previous = @previousseason
    FROM    dbo.[Account_Custom] a

    UPDATE  a
    SET     SeasonTicket_Years = recent.SeasonTicket_Years
          , STH_Account = CASE WHEN LEFT(recent.SeasonTicket_Years, 4) = @currentseason THEN 1
                               ELSE 0
                          END
--SELECT *
    FROM    dbo.[Account_Custom] a
            INNER JOIN dbo.CRMProcess_DistinctContacts recent ON [recent].SSB_CRMSYSTEM_ACCT_ID = [a].SSB_CRMSYSTEM_ACCT_ID



--Ticketing

    UPDATE  a
    SET     SeasonTicketSpend_Previous = x.SeasonTicketSpend_Previous
          , SeasonTicketSpend_Current = x.SeasonTicketSpend_Current
          , GamesBought_Previous = x.GamesBought_Previous
          , GamesBought_Current = x.GamesBought_Current
          , GamesAttended_Current = x.GamesAttended_Current
          , GamesAttended_Previous = x.GamesAttended_Previous
          , AttendRate_Current = CASE WHEN ISNULL(x.GamesBought_Current, 0) > 0
                                      THEN CAST(CAST(x.GamesAttended_Current * 100.00 / x.GamesBought_Current AS DECIMAL(8,
                                                                                                        2)) AS VARCHAR)
                                           + '%'
                                 END
          , AttendRate_Previous = CASE WHEN ISNULL(x.GamesBought_Previous, 0) > 0
                                       THEN CAST(CAST(x.GamesAttended_Previous * 100.00 / x.GamesBought_Previous AS DECIMAL(8,
                                                                                                        2)) AS VARCHAR)
                                            + '%'
                                  END
          , TotalTicketSpend_Current = x.TotalTicketSpend_Current
          , TotalTicketSpend_Previous = x.TotalTicketSpend_Previous
          , ArenaSpend_Current = x.ArenaSpend_Current
          , ArenaSpend_Previous = x.ArenaSpend_Previous
          , ArenaBought_Current = x.ArenaBought_Current
          , ArenaBought_Previous = x.ArenaBought_Previous
    FROM    [dbo].Account_Custom a
            INNER JOIN ( SELECT ISNULL(SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID) SSB_CRMSYSTEM_ACCT_ID
                              , COUNT(DISTINCT CASE WHEN ds.SeasonYear = @currentseason
                                                         AND de.EventCode LIKE 'ESKB%' THEN a.DimEventId
                                               END) GamesBought_Current
                              , COUNT(DISTINCT CASE WHEN ds.SeasonYear = @previousseason
                                                         AND de.EventCode LIKE 'ESKB%' THEN a.DimEventId
                                               END) GamesBought_Previous
                              , SUM(CASE WHEN tt.[DimTicketTypeId] = 1
                                              AND ds.SeasonYear = @currentseason THEN TotalRevenue
                                         ELSE 0
                                    END) SeasonTicketSpend_Current
                              , SUM(CASE WHEN tt.[DimTicketTypeId] = 1
                                              AND ds.SeasonYear = @previousseason THEN TotalRevenue
                                         ELSE 0
                                    END) SeasonTicketSpend_Previous
                              , COUNT(DISTINCT CASE WHEN ds.SeasonYear = @currentseason
                                                         AND ISNULL(fi.Attended, 0) > 0
                                                         AND de.EventCode LIKE 'ESKB%' THEN a.DimEventId
                                               END) GamesAttended_Current
                              , COUNT(DISTINCT CASE WHEN ds.SeasonYear = @previousseason
                                                         AND ISNULL(fi.Attended, 0) > 0
                                                         AND de.EventCode LIKE 'ESKB%' THEN a.DimEventId
                                               END) GamesAttended_Previous
                              , SUM(CASE WHEN ds.SeasonYear = @currentseason
                                              AND de.EventCode LIKE 'ESKB%' THEN TotalRevenue
                                         ELSE 0
                                    END) TotalTicketSpend_Current
                              , SUM(CASE WHEN ds.SeasonYear = @previousseason
                                              AND de.EventCode LIKE 'ESKB%' THEN TotalRevenue
                                         ELSE 0
                                    END) TotalTicketSpend_Previous
                              , SUM(CASE WHEN ds.SeasonYear = @currentseason
                                              AND de.EventCode NOT LIKE 'ESKB%'
                                              AND ds.SeasonName NOT LIKE '%Parking%'
                                              AND ds.SeasonName NOT LIKE '%SUITES%' THEN TotalRevenue
                                         ELSE 0
                                    END) ArenaSpend_Current
                              , SUM(CASE WHEN ds.SeasonYear = @previousseason
                                              AND de.EventCode NOT LIKE 'ESKB%'
                                              AND ds.SeasonName NOT LIKE '%Parking%'
                                              AND ds.SeasonName NOT LIKE '%SUITES%' THEN TotalRevenue
                                         ELSE 0
                                    END) ArenaSpend_Previous
                              , COUNT(DISTINCT CASE WHEN ds.SeasonYear = @currentseason
                                                         AND de.EventCode NOT LIKE 'ESKB%'
                                                         AND ds.SeasonName NOT LIKE '%Parking%'
                                                         AND ds.SeasonName NOT LIKE '%SUITES%' THEN a.DimEventId
                                               END) ArenaBought_Current
                              , COUNT(DISTINCT CASE WHEN ds.SeasonYear = @currentseason
                                                         AND de.EventCode NOT LIKE 'ESKB%'
                                                         AND ds.SeasonName NOT LIKE '%Parking%'
                                                         AND ds.SeasonName NOT LIKE '%SUITES%' THEN a.DimEventId
                                               END) ArenaBought_Previous
                         FROM   Kings.dbo.FactTicketSales a
                                JOIN Kings.dbo.DimCustomerSSBID b ON a.DimCustomerId = b.DimCustomerId
                                JOIN Kings.dbo.DimSeason s ON a.DimSeasonId = s.DimSeasonId
                                JOIN Kings.dbo.DimTicketType tt ON a.DimTicketTypeId = tt.DimTicketTypeId
                                JOIN Kings.dbo.DimSeason ds ON ds.DimSeasonId = a.DimSeasonId
                                JOIN Kings.dbo.DimEvent de ON de.DimEventId = a.DimEventId
                                JOIN Kings.dbo.DimEventHeader deh ON deh.DimEventHeaderId = de.DimEventHeaderId
                                JOIN Kings.dbo.DimSeasonHeader dsh ON dsh.DimSeasonHeaderId = deh.DimSeasonHeaderId
                                LEFT JOIN ( SELECT  FactTicketSalesId
                                                  , SUM(CAST(IsAttended AS INT)) Attended
                                            FROM    Kings.dbo.FactInventory
                                            GROUP BY FactTicketSalesId
                                          ) fi ON fi.FactTicketSalesId = a.FactTicketSalesId
                         GROUP BY ISNULL(SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID)
                       ) x ON [a].SSB_CRMSYSTEM_ACCT_ID = x.SSB_CRMSYSTEM_ACCT_ID
	


    UPDATE  a
    SET     TE_Game_NumForward_Current = x.Game_NumForward_Current
          , TE_Game_NumForward_Previous = x.Game_NumForward_Previous
          , TE_Game_NumPost_Current = x.Game_NumPost_Current
          , TE_Game_NumPost_Previous = x.Game_NumPost_Previous
          , TE_Game_NumSold_Current = x.Game_NumSold_Current
          , TE_Game_NumSold_Previous = x.Game_NumSold_Previous
          , TE_Seat_NumForward_Current = x.Seat_NumForward_Current
          , TE_Seat_NumForward_Previous = x.Seat_NumForward_Previous
          , TE_Seat_NumPost_Current = NULL --x.Seat_NumPost_Current Need to review after go-live
          , TE_Seat_NumPost_Previous = NULL --x.Seat_NumPost_Previous  Need to review after go-live
          , TE_Seat_NumSold_Current = x.Seat_NumSold_Current
          , TE_Seat_NumSold_Previous = x.Seat_NumSold_Previous
    FROM    [dbo].Account_Custom a
            INNER JOIN ( SELECT ISNULL(SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID) SSB_CRMSYSTEM_ACCT_ID
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @currentseason
                                                         AND activity = 'F' THEN event_id
                                               END) Game_NumForward_Current
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @previousseason
                                                         AND activity = 'F' THEN event_id
                                               END) Game_NumForward_Previous
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @currentseason
                                                         AND activity = 'EP' THEN event_id
                                               END) Game_NumPost_Current
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @previousseason
                                                         AND activity = 'EP' THEN event_id
                                               END) Game_NumPost_Previous
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @currentseason
                                                         AND activity = 'ES' THEN event_id
                                               END) Game_NumSold_Current
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @previousseason
                                                         AND activity = 'ES' THEN event_id
                                               END) Game_NumSold_Previous
                              , SUM(CASE WHEN Tex.season_year = @currentseason
                                              AND activity = 'F' THEN num_seats
                                         ELSE 0
                                    END) Seat_NumForward_Current
                              , SUM(CASE WHEN Tex.season_year = @previousseason
                                              AND activity = 'F' THEN num_seats
                                         ELSE 0
                                    END) Seat_NumForward_Previous
                              , SUM(CASE WHEN Tex.season_year = @currentseason
                                              AND activity = 'EP' THEN num_seats
                                         ELSE 0
                                    END) Seat_NumPost_Current
                              , SUM(CASE WHEN Tex.season_year = @previousseason
                                              AND activity = 'EP' THEN num_seats
                                         ELSE 0
                                    END) Seat_NumPost_Previous
                              , SUM(CASE WHEN Tex.season_year = @currentseason
                                              AND activity = 'ES' THEN num_seats
                                         ELSE 0
                                    END) Seat_NumSold_Current
                              , SUM(CASE WHEN Tex.season_year = @previousseason
                                              AND activity = 'ES' THEN num_seats
                                         ELSE 0
                                    END) Seat_NumSold_Previous
                         FROM   Kings.ods.TM_Tex Tex
                                INNER JOIN dbo.DimCustomer DimCustomer ON DimCustomer.AccountId = Tex.owner_acct_id
                                                                          AND DimCustomer.CustomerType = 'Primary'
                                                                          AND DimCustomer.SourceSystem = 'TM'
                                INNER JOIN dbo.DimCustomerSSBID ssbid ON ssbid.DimCustomerId = DimCustomer.DimCustomerId
                         WHERE  Tex.season_year IN ( @currentseason, @previousseason )
                                AND event_name LIKE 'ESKB%'
                         GROUP BY ISNULL(SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID)
                       ) x ON [a].SSB_CRMSYSTEM_ACCT_ID = x.SSB_CRMSYSTEM_ACCT_ID

    UPDATE  a
    SET     TE_Game_NumForward_Received_Current = x.Game_NumForward_Received_Current
          , TE_Game_NumForward_Received_Previous = x.Game_NumForward_Received_Previous
          , TE_Game_NumBought_Current = x.Game_NumBought_Current
          , TE_Game_NumBought_previous = x.Game_NumBought_Previous
          , TE_Revenue_Current = x.Revenue_Current
          , TE_Revenue_Previous = x.Revenue_Previous
    FROM    [dbo].Account_Custom a
            INNER JOIN ( SELECT ISNULL(SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID) SSB_CRMSYSTEM_ACCT_ID
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @currentseason
                                                         AND activity = 'F' THEN event_id
                                               END) Game_NumForward_Received_Current
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @previousseason
                                                         AND activity = 'F' THEN event_id
                                               END) Game_NumForward_Received_Previous
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @currentseason
                                                         AND activity = 'ES' THEN event_id
                                               END) Game_NumBought_Current
                              , COUNT(DISTINCT CASE WHEN Tex.season_year = @previousseason
                                                         AND activity = 'ES' THEN event_id
                                               END) Game_NumBought_Previous
                              , SUM(CASE WHEN Tex.season_year = @currentseason
                                              AND activity = 'ES' THEN inet_transaction_amount
                                    END) Revenue_Current
                              , SUM(CASE WHEN Tex.season_year = @previousseason
                                              AND activity = 'ES' THEN inet_transaction_amount
                                    END) Revenue_Previous
                         FROM   Kings.ods.TM_Tex Tex
                                INNER JOIN dbo.DimCustomer DimCustomer ON DimCustomer.AccountId = Tex.assoc_acct_id
                                                                          AND DimCustomer.CustomerType = 'Primary'
                                                                          AND DimCustomer.SourceSystem = 'TM'
                                INNER JOIN dbo.DimCustomerSSBID ssbid ON ssbid.DimCustomerId = DimCustomer.DimCustomerId
                         WHERE  Tex.season_year IN ( @currentseason, @previousseason )
                                AND event_name LIKE 'ESKB%'
                         GROUP BY ISNULL(SSB_CRMSYSTEM_ACCT_ID, SSB_CRMSYSTEM_CONTACT_ID)
                       ) x ON [a].SSB_CRMSYSTEM_ACCT_ID = x.SSB_CRMSYSTEM_ACCT_ID



    UPDATE  a
    SET     Date_of_Last_Kings_com_Visit__c = Max_Date
--SELECT Eloqua.SSB_CRMSYSTEM_ACCT_ID, Eloqua.Max_Date
    FROM    dbo.Account_Custom a
            INNER JOIN ( SELECT 'Date, Last Kings.com Visit' AS Activity_Type
                              , ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                              , MAX(CreatedAt) Max_Date
                         FROM   Kings.ods.Eloqua_ActivityPageView apv
                                INNER JOIN dbo.vwDimCustomer_ModAcctId ModAcctID ON ModAcctID.SSID = apv.ContactId
                                                                                    AND ModAcctID.SourceSystem = 'Eloqua Kings'
                         WHERE  CreatedAt >= DATEADD(DAY, -365, GETDATE())
                                AND ( [Url] LIKE 'http://www.nba.com/kings%'
                                      OR [Url] LIKE 'https://oss.ticketmaster.com/aps/sackings/%'
                                      OR [Url] LIKE 'http://www.ticketmaster.com/sacramento%'
                                      OR [Url] LIKE 'http://www.kingsteamstore.com/%'
                                    )
                         GROUP BY ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                       ) Eloqua ON a.SSB_CRMSYSTEM_ACCT_ID = Eloqua.SSB_CRMSYSTEM_ACCT_ID


    UPDATE  a
    SET     Date_of_Last_Ticketing_Page_Visit__c = Max_Date
--SELECT Eloqua.SSB_CRMSYSTEM_ACCT_ID, Eloqua.Max_Date
    FROM    dbo.Account_Custom a
            INNER JOIN ( SELECT 'Date, Last Ticketing Page Visit' AS Activity_Type
                              , ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                              , MAX(CreatedAt) Max_Date
                         FROM   Kings.ods.Eloqua_ActivityPageView apv
                                INNER JOIN dbo.vwDimCustomer_ModAcctId ModAcctID ON ModAcctID.SSID = apv.ContactId
                                                                                    AND ModAcctID.SourceSystem = 'Eloqua Kings'
                         WHERE  CreatedAt >= DATEADD(DAY, -365, GETDATE())
                                AND ( [Url] LIKE '%tickets%'
                                      OR [Url] LIKE '%flex%'
                                      OR [Url] LIKE '%seasontickets%'
                                      OR [Url] LIKE '%suites%'
                                      OR [Url] LIKE '%flashbackfriday%'
                                      OR [Url] LIKE '%seating%'
                                      OR [Url] LIKE '%ticketmaster.com/sacramento%'
                                    )
                         GROUP BY ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                       ) Eloqua ON a.SSB_CRMSYSTEM_ACCT_ID = Eloqua.SSB_CRMSYSTEM_ACCT_ID



    UPDATE  a
    SET     Date_of_Last_Email_Open_Eloqua__c = Max_Date
--SELECT Eloqua.SSB_CRMSYSTEM_ACCT_ID, MAX_Date
    FROM    dbo.Account_Custom a
            INNER JOIN ( SELECT 'Date, Email Open' AS Activity_Type
                              , ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                              , MAX(CreatedAt) Max_Date
                         FROM   Kings.ods.Eloqua_ActivityEmailOpen aeo
                                INNER JOIN dbo.vwDimCustomer_ModAcctId ModAcctID ON ModAcctID.SSID = aeo.ContactId
                                                                                    AND ModAcctID.SourceSystem = 'Eloqua Kings'
                         WHERE  CreatedAt >= DATEADD(DAY, -365, GETDATE())
                         GROUP BY ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                       ) Eloqua ON a.SSB_CRMSYSTEM_ACCT_ID = Eloqua.SSB_CRMSYSTEM_ACCT_ID


    UPDATE  a
    SET     Date_of_Last_G1C_Page_Visit__c = Max_Date
--SELECT Eloqua.SSB_CRMSYSTEM_ACCT_ID, Eloqua.Max_Date
    FROM    dbo.Account_Custom a
            INNER JOIN ( SELECT 'Date, Last G1C Page Visit' AS Activity_Type
                              , ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                              , MAX(CreatedAt) Max_Date
                         FROM   Kings.ods.Eloqua_ActivityPageView apv
                                INNER JOIN dbo.vwDimCustomer_ModAcctId ModAcctID ON ModAcctID.SSID = apv.ContactId
                                                                                    AND ModAcctID.SourceSystem = 'Eloqua Kings'
                         WHERE  CreatedAt >= DATEADD(DAY, -365, GETDATE())
                                AND [Url] LIKE 'http://www.golden1center.com%'
                         GROUP BY ModAcctID.SSB_CRMSYSTEM_ACCT_ID
                       ) Eloqua ON a.SSB_CRMSYSTEM_ACCT_ID = Eloqua.SSB_CRMSYSTEM_ACCT_ID

    EXEC [dbo].[sp_CRMLoad_Account_ProcessLoad_Criteria]

GO
