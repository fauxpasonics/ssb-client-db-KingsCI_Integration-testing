SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [wrk].[sp_Contact_Custom]
AS 

MERGE INTO dbo.Contact_Custom Target
USING dbo.Contact source
ON source.[SSB_CRMSYSTEM_CONTACT_ID] = target.[SSB_CRMSYSTEM_CONTACT_ID]
WHEN NOT MATCHED BY TARGET THEN
INSERT ([SSB_CRMSYSTEM_ACCT_ID], [SSB_CRMSYSTEM_CONTACT_ID]) VALUES (source.[SSB_CRMSYSTEM_ACCT_ID], Source.[SSB_CRMSYSTEM_CONTACT_ID])
WHEN NOT MATCHED BY SOURCE THEN
DELETE ;

EXEC dbo.sp_CRMProcess_ConcatIDs 'Contact'

UPDATE a
SET SSID_Winner = b.SSID
FROM dbo.[Contact_Custom] a 
INNER JOIN dbo.[vwCompositeRecord_ModAcctID] b ON a.[SSB_CRMSYSTEM_CONTACT_ID] = b.[SSB_CRMSYSTEM_CONTACT_ID]
--LEFT JOIN dbo.[CRMProcess_SourceSystem_Translation] c ON b.[SourceSystem] = c.[MDM_SourceSystem]

--SELECT * FROM dbo.[Contact_Custom] a

UPDATE a
SET SSID_Winner = b.[SSID]	  
      ,MobilePhone = b.[PhoneCell]
	   ,HomePhone = b.[PhoneHome]
      ,OtherPhone = b.[PhoneOther]
      ,[Fax] = b.[PhoneFax]
	  ,Birthday = b.Birthday
	  ,Gender = b.Gender
FROM [dbo].Contact_Custom a
INNER JOIN dbo.[vwCompositeRecord_ModAcctID] b ON b.[SSB_CRMSYSTEM_CONTACT_ID] = [a].[SSB_CRMSYSTEM_CONTACT_ID]



SELECT * FROM kings.[ro].[vw_SkiData_URLs]
--LA
UPDATE a
SET Age = x.age_two_yr_incr_input_indv,
	--Birthday = x.
	MaritalStatus = x.MaritalStatus,
	PersonicXCluster = x.PersonicXCluster,
	Occupation = x.Occupation
FROM [dbo].[Contact_Custom] a  
INNER JOIN
	(SELECT b.[SSB_CRMSYSTEM_CONTACT_ID], age_two_yr_incr_input_indv, gndr_input_indv_cd, ref.description MaritalStatus
		,oc.description Occupation, px.description  PersonicXCluster
			, ROW_NUMBER() OVER (partition by [SSB_CRMSYSTEM_CONTACT_ID]  order by la.ETL_UpdatedDate desc) xrank
		FROM dbo.[vwDimCustomer_ModAcctId] b
		inner join 
		--select * from 
		Kings.ods.LiveAnalytics_Customer la on b.SSID = la.ult_party_id
		left JOIN kings.ods.LA_Reference ref on la.marital_status_hh_cd = ref.Code AND ref.VariableName = 'marital_status_hh_cd'
		left JOIN kings.ods.LA_Reference oc on la.occpn_input_indv_cd = oc.Code AND oc.VariableName = 'occpn_input_indv_cd'
		left JOIN kings.ods.LA_Reference px on la.psx_classic_clus_cd = px.Code AND px.VariableName = 'psx_classic_clus_cd'  ) x
	ON [a].[SSB_CRMSYSTEM_CONTACT_ID] = x.[SSB_CRMSYSTEM_CONTACT_ID]
	AND xrank =1

Declare @currentseason int = (Select  MAX( seasonyear) from Kings.dbo.FactTicketSales a
					JOIN Kings.dbo.DimSeason s on a.DimSeasonID = s.DimSeasonID
					JOIN Kings.dbo.DimTicketType tt ON a.DimTicketTypeId = tt.DimTicketTypeId
					WHERE  tt.[DimTicketTypeId] =  1)
DECLARE @previousseason int = @currentseason -1 

Update a
SET Season_Current = @currentseason,
	Season_Previous = @previousseason
FROM dbo.[Contact_Custom] a


UPDATE a
SET SeasonTicket_Years = recent.SeasonTicket_Years
, STH_Account = CASE WHEN LEFT(recent.SeasonTicket_Years,4) = @currentseason THEN  1 ELSE 0 END
--SELECT *
FROM dbo.[Contact_Custom] a
INNER JOIN dbo.CRMProcess_DistinctContacts recent ON [recent].[SSB_CRMSYSTEM_CONTACT_ID] = [a].[SSB_CRMSYSTEM_CONTACT_ID]

--Ticketing

UPDATE a
SET SeasonTicketSpend_Previous = x.SeasonTicketSpend_Previous
,SeasonTicketSpend_Current = x.SeasonTicketSpend_Current
,GamesBought_Previous = x.GamesBought_Previous
,GamesBought_Current = x.GamesBought_Current
,GamesAttended_Current = x.GamesAttended_Current
,GamesAttended_Previous = x.GamesAttended_Previous
,AttendRate_Current = CASE WHEN ISNULL(x.GamesBought_Current ,0) > 0 THEN CAST(CAST(x.GamesAttended_Current * 100.00 / x.GamesBought_Current as decimal(8,2)) as varchar) + '%'  END
,AttendRate_Previous = CASE WHEN ISNULL(x.GamesBought_Previous,0) > 0 THEN CAST(CAST(x.GamesAttended_Previous * 100.00 / x.GamesBought_Previous as decimal(8,2)) as varchar) + '%'   END
,TotalTicketSpend_Current = x.TotalTicketSpend_Current
,TotalTicketSpend_Previous = x.TotalTicketSpend_Previous
,ArenaSpend_Current = x.ArenaSpend_Current
,ArenaSpend_Previous = x.ArenaSpend_Previous
,ArenaBought_Current = x.ArenaBought_Current
,ArenaBought_Previous = x.ArenaBought_Previous
FROM [dbo].[Contact_Custom] a  
INNER JOIN
	(SELECT  
		SSB_CRMSYSTEM_CONTACT_ID
		,COUNT(DISTINCT CASE WHEN ds.seasonYear = @currentseason AND de.eventcode like 'ESKB%' THEN a.DimEventID END) GamesBought_Current
		,COUNT(DISTINCT CASE WHEN ds.seasonYear = @previousseason AND de.eventcode like 'ESKB%' THEN a.DimEventID END) GamesBought_Previous
		,SUM(CASE WHEN tt.[DimTicketTypeId] =  1 and ds.seasonYear = @currentseason THEN TotalRevenue ELSE 0 END) SeasonTicketSpend_Current
		,SUM(CASE WHEN tt.[DimTicketTypeId] =  1 and ds.seasonYear = @previousseason THEN TotalRevenue ELSE 0 END) SeasonTicketSpend_Previous
		,COUNT(DISTINCT CASE WHEN ds.seasonYear = @currentseason AND ISNULL(fi.Attended,0) > 0 AND de.eventcode like 'ESKB%'  THEN a.DimEventID END) GamesAttended_Current
		,COUNT(DISTINCT CASE WHEN ds.seasonYear = @previousseason AND ISNULL(fi.Attended,0) > 0 AND de.eventcode like 'ESKB%'  THEN a.DimEventID END) GamesAttended_Previous
		,SUM(CASE WHEN ds.seasonYear = @currentseason AND de.eventcode like 'ESKB%' THEN TotalRevenue ELSE 0 END) TotalTicketSpend_Current
		,SUM(CASE WHEN ds.seasonYear = @previousseason AND de.eventcode like 'ESKB%' THEN TotalRevenue ELSE 0 END) TotalTicketSpend_Previous
		,SUM(CASE WHEN ds.seasonYear = @currentseason AND de.eventcode not like 'ESKB%' and ds.seasonname NOT LIKE '%Parking%'and ds.seasonname NOT LIKE '%SUITES%' 
				THEN TotalRevenue ELSE 0 END) ArenaSpend_Current
		,SUM(CASE WHEN ds.seasonYear = @previousseason AND de.eventcode not like 'ESKB%'and ds.seasonname NOT LIKE '%Parking%'and ds.seasonname NOT LIKE '%SUITES%' 
				THEN TotalRevenue ELSE 0 END) ArenaSpend_Previous
		,COUNT( DISTINCT CASE WHEN ds.seasonYear = @currentseason AND de.eventcode not like 'ESKB%' and ds.seasonname NOT LIKE '%Parking%'and ds.seasonname NOT LIKE '%SUITES%' 
				THEN a.DimEventID END) ArenaBought_Current
		,COUNT( DISTINCT CASE WHEN ds.seasonYear = @currentseason AND de.eventcode not like 'ESKB%' and ds.seasonname NOT LIKE '%Parking%'and ds.seasonname NOT LIKE '%SUITES%' 
				THEN a.DimEventID END) ArenaBought_Previous
					FROM Kings.dbo.FactTicketSales a
					JOIN Kings.dbo.DimCustomerSSBID b ON a.DimCustomerID = b.DimCustomerID
					JOIN Kings.dbo.DimSeason s on a.DimSeasonID = s.DimSeasonID
					JOIN Kings.dbo.DimTicketType tt ON a.DimTicketTypeId = tt.DimTicketTypeId
					JOIN Kings.dbo.DimSeason ds ON ds.DimSeasonId = a.DimSeasonId
					JOIN Kings.dbo.DimEvent de ON de.DimEventId = a.DimEventId
					JOIN Kings.dbo.DimEventHeader deh ON deh.DimEventHeaderId = de.DimEventHeaderId
					JOIN Kings.dbo.DimSeasonHeader dsh ON dsh.DimSeasonHeaderId = deh.DimSeasonHeaderId
					LEFT JOIN ( SELECT FactTicketSalesId
                                    , SUM(CAST(IsAttended AS INT)) Attended
                                FROM   Kings.dbo.FactInventory
                                GROUP BY FactTicketSalesId
                            ) fi ON fi.FactTicketSalesId = a.FactTicketSalesId
		GROUP BY SSB_CRMSYSTEM_CONTACT_ID )	x
	ON [a].SSB_CRMSYSTEM_CONTACT_ID = x.SSB_CRMSYSTEM_CONTACT_ID
	


UPDATE a
SET TE_Game_NumForward_Current = x.Game_NumForward_Current
,TE_Game_NumForward_Previous = x.Game_NumForward_Previous
,TE_Game_NumPost_Current = x.Game_NumPost_Current
,TE_Game_NumPost_Previous = x.Game_NumPost_Previous
,TE_Game_NumSold_Current = x.Game_NumSold_Current
,TE_Game_NumSold_Previous = x.Game_NumSold_Previous
,TE_Seat_NumForward_Current = x.Seat_NumForward_Current
,TE_Seat_NumForward_Previous = x.Seat_NumForward_Previous
,TE_Seat_NumPost_Current = NULL --x.Seat_NumPost_Current Need to review after go-live
,TE_Seat_NumPost_Previous = NULL --x.Seat_NumPost_Previous  Need to review after go-live
,TE_Seat_NumSold_Current = x.Seat_NumSold_Current
,TE_Seat_NumSold_Previous = x.Seat_NumSold_Previous
FROM [dbo].[Contact_Custom] a  
INNER JOIN
		(SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID 
		,COUNT(DISTINCT CASE WHEN tex.season_year = @currentseason AND activity = 'F' THEN event_ID END) Game_NumForward_Current
		,COUNT(DISTINCT CASE WHEN tex.season_year = @previousseason AND activity = 'F' THEN event_ID END) Game_NumForward_Previous
		,COUNT(DISTINCT CASE WHEN tex.season_year = @currentseason AND activity = 'EP' THEN event_ID END) Game_NumPost_Current
		,COUNT(DISTINCT CASE WHEN tex.season_year = @previousseason AND activity = 'EP' THEN event_ID END) Game_NumPost_Previous
		,COUNT(DISTINCT CASE WHEN tex.season_year = @currentseason AND activity = 'ES' THEN event_ID END) Game_NumSold_Current
		,COUNT(DISTINCT CASE WHEN tex.season_year = @previousseason AND activity = 'ES' THEN event_ID END) Game_NumSold_Previous

		,SUM(CASE WHEN tex.season_year = @currentseason AND activity = 'F' THEN num_seats ELSE 0 END) Seat_NumForward_Current
		,SUM(CASE WHEN tex.season_year = @previousseason AND activity = 'F' THEN num_seats ELSE 0 END) Seat_NumForward_Previous
		,SUM(CASE WHEN tex.season_year = @currentseason AND activity = 'EP' THEN num_seats ELSE 0 END) Seat_NumPost_Current
		,SUM(CASE WHEN tex.season_year = @previousseason AND activity = 'EP' THEN num_seats ELSE 0 END) Seat_NumPost_Previous
		,SUM(CASE WHEN tex.season_year = @currentseason AND activity = 'ES' THEN num_seats ELSE 0 END) Seat_NumSold_Current
		,SUM(CASE WHEN tex.season_year = @previousseason AND activity = 'ES' THEN num_seats ELSE 0 END) Seat_NumSold_Previous
			  
		FROM kings.ods.TM_Tex Tex
		INNER JOIN dbo.DimCustomer DimCustomer ON DimCustomer.AccountId = Tex.owner_acct_id AND DimCustomer.CustomerType = 'Primary' AND DimCustomer.SourceSystem = 'TM'
		INNER JOIN dbo.dimcustomerssbid ssbid ON ssbid.DimCustomerId = DimCustomer.DimCustomerId
		WHERE tex.season_year IN (@currentseason, @previousseason) AND event_name LIKE 'ESKB%'
		GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID) x
	ON [a].SSB_CRMSYSTEM_CONTACT_ID = x.SSB_CRMSYSTEM_CONTACT_ID

UPDATE a
SET TE_Game_NumForward_Received_Current = x.Game_NumForward_Received_Current
,TE_Game_NumForward_Received_Previous = x.Game_NumForward_Received_Previous
,TE_Game_NumBought_Current = x.Game_NumBought_Current
,TE_Game_NumBought_Previous = x.Game_NumBought_Previous
,TE_Revenue_Current = x.Revenue_Current
,TE_Revenue_Previous = x.Revenue_Previous

FROM [dbo].[Contact_Custom] a  
INNER JOIN
		(SELECT ssbid.SSB_CRMSYSTEM_CONTACT_ID 
		,COUNT(DISTINCT CASE WHEN tex.season_year = @currentseason AND activity = 'F' THEN event_ID END) Game_NumForward_Received_Current
		,COUNT(DISTINCT CASE WHEN tex.season_year = @previousseason AND activity = 'F' THEN event_ID END) Game_NumForward_Received_Previous
		,COUNT(DISTINCT CASE WHEN tex.season_year = @currentseason AND activity = 'ES' THEN event_ID END) Game_NumBought_Current
		,COUNT(DISTINCT CASE WHEN tex.season_year = @previousseason AND activity = 'ES' THEN event_ID END) Game_NumBought_Previous
		,SUM(CASE WHEN tex.season_year = @currentseason AND activity = 'ES' THEN inet_transaction_amount END) Revenue_Current
		,SUM(CASE WHEN tex.season_year = @previousseason AND activity = 'ES' THEN inet_transaction_amount END) Revenue_Previous

		FROM kings.ods.TM_Tex Tex 
		INNER JOIN dbo.DimCustomer DimCustomer ON DimCustomer.AccountId = Tex.assoc_acct_ID AND DimCustomer.CustomerType = 'Primary' AND DimCustomer.SourceSystem = 'TM'
		INNER JOIN dbo.dimcustomerssbid ssbid ON ssbid.DimCustomerId = DimCustomer.DimCustomerId
		WHERE tex.season_year IN (@currentseason, @previousseason)AND event_name LIKE 'ESKB%'
		GROUP BY ssbid.SSB_CRMSYSTEM_CONTACT_ID) x
	ON [a].SSB_CRMSYSTEM_CONTACT_ID = x.SSB_CRMSYSTEM_CONTACT_ID

-- Updates Kings SKidata App Profile Picutre URL	
UPDATE a 
SET a.kings_App_Profile_Picture_URL = s.avatarURL 
FROM [dbo].Contact_Custom a
INNER JOIN kings.ro.vw_SkiData_URLs S 
ON s.[ssb_crmsystem_contact_ID__c] = a.[SSB_CRMSYSTEM_CONTACT_ID]


EXEC  [dbo].[sp_CRMLoad_Contact_ProcessLoad_Criteria]


--post MDM
--Placed in ContactCustom sproc
--INSERT INTO KingsCI_Integration.dbo.RecordTypeFlipping
--SELECT GETDATE() AS [timestamp]
--, flip.id
--, dc.FullName AS [Name] 
--, dc.CompanyName AS companyname
--, NULL AS RecordTYpe
--, 'Post_MDM' AS Step
--, dc.AddressPrimaryStreet AS AddressPrimaryStreet
--, dc.AddressPrimaryIsCleanStatus AS AddressClean
--, NULL AS copyloaddate
--, dc.SSUpdatedBy
--, dc.SSUpdatedDate
--, dc.SSB_CRMSYSTEM_ACCT_ID AS ssbcrmsystemacctid
--, dc.SSB_CRMSYSTEM_ACCT_PRIMARY_FLAG AS acctprimaryflag
--FROM KingsCI_Integration.dbo.vw_RecordTypeFlipping flip
--INNER JOIN kings.dbo.vwDimCustomer_ModAcctId dc ON flip.id = dc.SSID  AND dc.SourceSystem = 'Kings PC_SFDC Account'



--Before Push
--Placed in ContactCustom sproc
--INSERT INTO KingsCI_Integration.dbo.RecordTypeFlipping
--SELECT GETDATE() AS [timestamp]
--, flip.id
--, a.FullName AS [Name] 
--, NULL AS companyname
--, CASE WHEN ac.RecordTypeId = '012360000018utDAAQ' THEN 'Household Account' WHEN ac.RecordTypeId = '012360000018utIAAQ' THEN 'Business Account' END AS RecordTYpe
--, 'Pre-SF_Push' AS Step
--, a.AddressPrimaryStreet AS AddressPrimaryStreet
--, NULL AS AddressClean
--, NULL AS copyloaddate
--, NULL AS lastmodifiedbyid
--, NULL AS lastmodifieddate
--, a.SSB_CRMSYSTEM_ACCT_ID AS ssbcrmsystemacctid
--, NULL AS acctprimaryflag
--FROM KingsCI_Integration.dbo.vw_RecordTypeFlipping flip
--INNER JOIN KingsCI_Integration.dbo.account a
--ON flip.id = a.crm_id
--INNER JOIN KingsCI_Integration.dbo.Account_Custom ac
--ON ac.SSB_CRMSYSTEM_ACCT_ID = a.SSB_CRMSYSTEM_ACCT_ID



--012360000018utDAAQ	Household Account
--012360000018utIAAQ	Business Account



GO
