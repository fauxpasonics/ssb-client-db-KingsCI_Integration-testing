SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [dbo].[vwCRMLoad_Account_Custom_Update]
AS
SELECT  z.[crm_id] Id
	,isnull(SSID_Winner,SSB_CRMSYSTEM_SSID_Winner__c) SSB_CRMSYSTEM_SSID_Winner__c																				  --,c.SSB_CRMSYSTEM_SSID_Winner__c
	,isnull(DimCustIDs,SSB_CRMSYSTEM_DimCustomerIDs__c) SSB_CRMSYSTEM_DimCustomerIDs__c																			  --,c.SSB_CRMSYSTEM_DimCustomerIDs__c
	,isnull(NULLIF(TM_IDs,''),SSB_CRMSYSTEM_FullArchitcs_IDs__c) SSB_CRMSYSTEM_FullArchitcs_IDs__c																  --,c.SSB_CRMSYSTEM_FullArchitcs_IDs__c
	,isnull(NULLIF(AccountId,''),Archtics_ID__c) Archtics_ID__c																									  --,c.Archtics_ID__c
	,isnull(SeasonTicket_Years, SSB_CRMSYSTEM_STH_Years__c) SSB_CRMSYSTEM_STH_Years__c																			  --,c.SSB_CRMSYSTEM_STH_Years__c
	,CASE WHEN SeasonTicket_Years IS NOT NULL THEN 1 ELSE 0 END SSB_CRMSYSTEM_STH_Flag__c																		  --,c.SSB_CRMSYSTEM_STH_Flag__c
	--,b.Salutation																																				  --
	,isnull(b.Fax, c.fax) Fax																																	  --,c.Fax
	,isnull(b.DiscretionaryIncome,Discretionary_Income__c)  Discretionary_Income__c																				  --,c.Discretionary_Income__c
	,isnull(b.AccountType,Type) Type																															  --,c.Type
	,isnull(b.NetWorth,Net_Worth__c)   Net_Worth__c																												  --,c.Net_Worth__c
	,isnull(b.LengthofResidence,Residence_Length__c)  Residence_Length__c																						  --,c.Residence_Length__c
	,isnull(b.AdultsinHousehold,Adults_In_Household__c)  Adults_In_Household__c																					  --,c.Adults_In_Household__c
	,isnull(b.ChildrenFlag,Children_Flag__c)  Children_Flag__c																									  --,c.Children_Flag__c
	,isnull(b.RecordTypeId,c.recordtypeid) RecordTypeId																											  --,c.RecordTypeId
	,isnull(b.GamesBought_Current,Num_of_games_bought_Current_Season__c) Num_of_games_bought_Current_Season__c													  --,c.Num_of_games_bought_Current_Season__c
	,isnull(b.GamesAttended_Current,Num_of_games_attended_Current_Season__c) Num_of_games_attended_Current_Season__c											  --,c.Num_of_games_attended_Current_Season__c
	,isnull(b.AttendRate_Current,Attendance_Rate_Current_Season__c) Attendance_Rate_Current_Season__c															  --,c.Attendance_Rate_Current_Season__c
	,isnull(b.TotalTicketSpend_Current,Total_Kings_Tix_revenue_Current_Season__c) Total_Kings_Tix_revenue_Current_Season__c										  --,c.Total_Kings_Tix_revenue_Current_Season__c
	,isnull(b.TotalTicketSpend_Previous,Total_Kings_Tix_Rev_Previous_Season__c) Total_Kings_Tix_Rev_Previous_Season__c											  --,c.Total_Kings_Tix_Rev_Previous_Season__c
	,isnull(b.ArenaBought_Current,Num_arena_events_bought_Current_Season__c) Num_arena_events_bought_Current_Season__c											  --,c.Num_arena_events_bought_Current_Season__c
	,isnull(b.ArenaSpend_Current,Total_arena_event_Tix_Rev_Current_Season__c) Total_arena_event_Tix_Rev_Current_Season__c										  --,c.Total_arena_event_Tix_Rev_Current_Season__c
	,isnull(b.SeasonTicketSpend_Current,Season_Ticket_Spend_Current_Season__c) Season_Ticket_Spend_Current_Season__c											  --,c.Season_Ticket_Spend_Current_Season__c
	,isnull(b.TE_Game_NumForward_Current,Num_of_games_forwarded_Current_Season__c) Num_of_games_forwarded_Current_Season__c										  --,c.Num_of_games_forwarded_Current_Season__c
	,isnull(b.TE_Game_NumPost_Current,Num_of_games_posted_Current_Season__c) Num_of_games_posted_Current_Season__c												  --,c.Num_of_games_posted_Current_Season__c
	,isnull(b.TE_Game_NumSold_Current,Num_of_games_resold_Current_Season__c) Num_of_games_resold_Current_Season__c												  --,c.Num_of_games_resold_Current_Season__c
	,isnull(b.TE_Seat_NumForward_Current,Num_seats_forwarded_Current_Season__c) Num_seats_forwarded_Current_Season__c											  --,c.Num_seats_forwarded_Current_Season__c
	,isnull(b.TE_Seat_NumPost_Current,Num_seats_posted_Current_Season__c) Num_seats_posted_Current_Season__c													  --,c.Num_seats_posted_Current_Season__c
	,isnull(b.TE_Seat_NumSold_Current,Num_seats_resold_Current_Season__c) Num_seats_resold_Current_Season__c													  --,c.Num_seats_resold_Current_Season__c
	,isnull(b.TE_Game_NumForward_Received_Current,Num_games_received_via_Fwd_Current__c) Num_games_received_via_Fwd_Current__c									  --,c.Num_games_received_via_Fwd_Current__c
	,isnull(b.TE_Revenue_Current,Tot_Rev_seats_bought_resale_TM_Plus_CS__c)	Tot_Rev_seats_bought_resale_TM_Plus_CS__c											  --,c.Tot_Rev_seats_bought_resale_TM_Plus_CS__c
	,isnull(b.TE_Revenue_Previous,Tot_rev_seats_bought_resale_TM_Plus_PS__c)  Tot_rev_seats_bought_resale_TM_Plus_PS__c											  --,c.Tot_rev_seats_bought_resale_TM_Plus_PS__c
	,isnull(b.AttendRate_Previous,Attendance_Rate_Previous_Season__c) Attendance_Rate_Previous_Season__c														  --,c.Attendance_Rate_Previous_Season__c
	,isnull(b.GamesAttended_Previous,Num_of_games_attended_Previous_Season__c) Num_of_games_attended_Previous_Season__c											  --,c.Num_of_games_attended_Previous_Season__c
	,isnull(b.GamesBought_Previous,Num_of_games_bought_Previous_Season__c) Num_of_games_bought_Previous_Season__c												  --,c.Num_of_games_bought_Previous_Season__c
	,isnull(b.ArenaBought_Previous,Num_arena_events_bought_Previous_Season__c) Num_arena_events_bought_Previous_Season__c										  --,c.Num_arena_events_bought_Previous_Season__c
	,isnull(b.ArenaSpend_Previous,Total_arena_event_Tix_Rev_Previous__c) Total_arena_event_Tix_Rev_Previous__c													  --,c.Total_arena_event_Tix_Rev_Previous__c
	,isnull(b.SeasonTicketSpend_Previous,Season_Ticket_Spend_Previous_Season__c) Season_Ticket_Spend_Previous_Season__c											  --,c.Season_Ticket_Spend_Previous_Season__c
	,isnull(b.TE_Game_NumForward_Previous,Num_games_forwarded_Previous_Season__c) Num_games_forwarded_Previous_Season__c										  --,c.Num_games_forwarded_Previous_Season__c
	,isnull(b.TE_Game_NumPost_Previous,Num_games_posted_Previous_Season__c) Num_games_posted_Previous_Season__c													  --,c.Num_games_posted_Previous_Season__c
	,isnull(b.TE_Game_NumSold_Previous,Num_games_resold_Previous_Season__c) Num_games_resold_Previous_Season__c													  --,c.Num_games_resold_Previous_Season__c
	,isnull(b.TE_Seat_NumForward_Previous,Num_seats_forwarded_Previous_Season__c) Num_seats_forwarded_Previous_Season__c										  --,c.Num_seats_forwarded_Previous_Season__c
	,isnull(b.TE_Seat_NumPost_Previous,Num_seats_posted_Previous_Season__c) Num_seats_posted_Previous_Season__c													  --,c.Num_seats_posted_Previous_Season__c
	,isnull(b.TE_Seat_NumSold_Previous,Num_seats_resold_Previous_Season__c) Num_seats_resold_Previous_Season__c													  --,c.Num_seats_resold_Previous_Season__c
	,isnull(b.TE_Game_NumBought_previous,Num_games_bought_resale_TM_Plus_Previous__c) Num_games_bought_resale_TM_Plus_Previous__c								  --,c.Num_games_bought_resale_TM_Plus_Previous__c
	,isnull(b.TE_Game_NumForward_Received_Previous,Num_games_received_via_Fwd_Previous__c) Num_games_received_via_Fwd_Previous__c								  --,c.Num_games_received_via_Fwd_Previous__c
	,isnull(b.TE_Game_NumBought_Current,Num_games_bought_resale_TM_Plus_Current__c) Num_games_bought_resale_TM_Plus_Current__c 									  --,c.Num_games_bought_resale_TM_Plus_Current__c
	,isnull(b.Season_Current,Season_Current_Season__c) Season_Current_Season__c																				 	  --,c.Season_Current_Season__c
	,isnull(b.Season_Previous,Season_Previous_Season__c) Season_Previous_Season__c																				  --,c.Season_Previous_Season__c
	,isnull(b.[Date_of_Last_Email_Open_Eloqua__c], C.[Date_of_Last_Email_Open_Eloqua__c]) [Date_of_Last_Email_Open_Eloqua__c] 									  --,c.[Date_of_Last_Email_Open_Eloqua__c]
	,isnull(b.[Date_of_Last_G1C_Page_Visit__c],C.[Date_of_Last_G1C_Page_Visit__c]) [Date_of_Last_G1C_Page_Visit__c]												  --,c.[Date_of_Last_G1C_Page_Visit__c]
	,isnull(b.[Date_of_Last_Kings_com_Visit__c], c.[Date_of_Last_Kings_com_Visit__c]) [Date_of_Last_Kings_com_Visit__c]											  --,c.[Date_of_Last_Kings_com_Visit__c]
	,isnull(b.[Date_of_Last_Ticketing_Page_Visit__c], c.[Date_of_Last_Ticketing_Page_Visit__c]) [Date_of_Last_Ticketing_Page_Visit__c]							  --,c.[Date_of_Last_Ticketing_Page_Visit__c]

	
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SSID_Winner AS VARCHAR(MAX)))),SSB_CRMSYSTEM_SSID_Winner__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_SSID_Winner__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as ssidwin
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.DimCustIDs AS VARCHAR(MAX)))),SSB_CRMSYSTEM_DimCustomerIDs__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_DimCustomerIDs__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as dimcust
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( NULLIF(b.TM_IDs,'') AS VARCHAR(MAX)))),SSB_CRMSYSTEM_FullArchitcs_IDs__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_FullArchitcs_IDs__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as fulltm
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( NULLIF(b.AccountId,'') AS VARCHAR(MAX)))),Archtics_ID__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Archtics_ID__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as tm
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicket_Years AS VARCHAR(MAX)))),SSB_CRMSYSTEM_STH_Years__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_STH_Years__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as sthyear
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Fax AS VARCHAR(MAX)))),c.Fax) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Fax AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as fax
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.DiscretionaryIncome AS VARCHAR(MAX)))),Discretionary_Income__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Discretionary_Income__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as income
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AccountType AS VARCHAR(MAX)))),Type) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Type AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as typefield
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.NetWorth AS VARCHAR(MAX)))),Net_Worth__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Net_Worth__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as networth
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.LengthofResidence AS VARCHAR(MAX)))),Residence_Length__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Residence_Length__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as lengthofres
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AdultsinHousehold AS VARCHAR(MAX)))),Adults_In_Household__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Adults_In_Household__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as adultsin
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.RecordTypeId AS VARCHAR(MAX)))),c.RecordTypeId) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.RecordTypeId AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as recordtype
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Current AS VARCHAR(MAX)))),Num_of_games_bought_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as gamesboughtc
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Current AS VARCHAR(MAX)))),Num_of_games_attended_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as gamesboughtl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Current AS VARCHAR(MAX)))),Attendance_Rate_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as attendrate
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TotalTicketSpend_Current AS DECIMAL(18,2)))),Total_Kings_Tix_revenue_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_Kings_Tix_revenue_Current_Season__c AS DECIMAL(18,2)))),'')) 																																																				  then 1 else 0 end as revc
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TotalTicketSpend_Previous AS DECIMAL(18,2)))),Total_Kings_Tix_Rev_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_Kings_Tix_Rev_Previous_Season__c AS DECIMAL(18,2)))),'')) 																																																				  then 1 else 0 end as revl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Current AS VARCHAR(MAX)))),Num_arena_events_bought_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as arenaeve
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Current AS DECIMAL(18,2)))),Total_arena_event_Tix_Rev_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Current_Season__c AS DECIMAL(18,2)))),'')) 																																																				  then 1 else 0 end as totalarenatix
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Current AS DECIMAL(18,2)))),Season_Ticket_Spend_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Current_Season__c AS DECIMAL(18,2)))),'')) 																																																				  then 1 else 0 end as stspendc
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Current AS VARCHAR(MAX)))),Num_of_games_forwarded_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numforward
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Current AS VARCHAR(MAX)))),Num_of_games_posted_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numpost
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Current AS VARCHAR(MAX)))),Num_of_games_resold_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numresold
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Current AS VARCHAR(MAX)))),Num_seats_forwarded_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as seatsfor
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Current AS VARCHAR(MAX)))),Num_seats_posted_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as seatspost
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Current AS VARCHAR(MAX)))),Num_seats_resold_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as seatsresld
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Current AS VARCHAR(MAX)))),Num_games_received_via_Fwd_Current__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Current__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numgamesrec
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Current AS  DECIMAL(18,2)))),Tot_Rev_seats_bought_resale_TM_Plus_CS__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_Rev_seats_bought_resale_TM_Plus_CS__c AS DECIMAL(18,2)))),'')) 																																																					  then 1 else 0 end as revresale
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Previous AS  DECIMAL(18,2)))),Tot_rev_seats_bought_resale_TM_Plus_PS__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_rev_seats_bought_resale_TM_Plus_PS__c AS DECIMAL(18,2)))),'')) 																																																					  then 1 else 0 end as reresalel
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Previous AS VARCHAR(MAX)))),Attendance_Rate_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as attendl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Previous AS VARCHAR(MAX)))),Num_of_games_attended_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numgamesl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Previous AS VARCHAR(MAX)))),Num_of_games_bought_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numgamesboughtl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Previous AS VARCHAR(MAX)))),Num_arena_events_bought_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numarenal
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Previous AS DECIMAL(18,2)))),Total_arena_event_Tix_Rev_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Previous__c AS DECIMAL(18,2)))),'')) 																																																					  then 1 else 0 end as arenatixrevl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Previous AS DECIMAL(18,2)))),Season_Ticket_Spend_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Previous_Season__c AS DECIMAL(18,2)))),'')) 																																																				  then 1 else 0 end as stspendl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Previous AS VARCHAR(MAX)))),Num_games_forwarded_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_forwarded_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numgamesforl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Previous AS VARCHAR(MAX)))),Num_games_posted_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_posted_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numgamespostl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Previous AS VARCHAR(MAX)))),Num_games_resold_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_resold_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numgamesresoldl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Previous AS VARCHAR(MAX)))),Num_seats_forwarded_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numseatsfor
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Previous AS VARCHAR(MAX)))),Num_seats_posted_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numseatspostl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Previous AS VARCHAR(MAX)))),Num_seats_resold_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numseatsresl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumBought_previous AS VARCHAR(MAX)))),Num_games_bought_resale_TM_Plus_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_bought_resale_TM_Plus_Previous__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numgamesboughtresalesl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Previous AS VARCHAR(MAX)))),Num_games_received_via_Fwd_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Previous__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as numrecfor
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumBought_Current AS VARCHAR(MAX)))),Num_games_bought_resale_TM_Plus_Current__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_bought_resale_TM_Plus_Current__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as numboughtersales
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Season_Current AS VARCHAR(MAX)))),Season_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Current_Season__c AS VARCHAR(MAX)))),'')) 																																																			  then 1 else 0 end as seasonc
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Season_Previous AS VARCHAR(MAX)))),Season_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Previous_Season__c AS VARCHAR(MAX)))),'')) 																																																				  then 1 else 0 end as seasonl
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_Email_Open_Eloqua__c AS DATE))),c.Date_of_Last_Email_Open_Eloqua__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_Email_Open_Eloqua__c AS DATE))),'')) 																																																			  then 1 else 0 end as lastopen
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_G1C_Page_Visit__c AS DATE))),c.Date_of_Last_G1C_Page_Visit__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_G1C_Page_Visit__c AS DATE))),'')) 																																																				  then 1 else 0 end as lastgic
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_Kings_com_Visit__c AS DATE))),c.Date_of_Last_Kings_com_Visit__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_Kings_com_Visit__c AS DATE))),'')) 																																																			  then 1 else 0 end as lastkings
	--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_Ticketing_Page_Visit__c AS DATE))),c.Date_of_Last_Ticketing_Page_Visit__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_Ticketing_Page_Visit__c AS DATE))),'')) 																																																				  then 1 else 0 end as lastticketing



	--SELECT COUNT(*)
FROM dbo.[vwCRMLoad_Account_Std_Prep] a
INNER JOIN dbo.[Account_Custom] b ON [a].[SSB_CRMSYSTEM_ACCT_ID__c] = b.[SSB_CRMSYSTEM_ACCT_ID]
INNER JOIN dbo.Account z ON a.[SSB_CRMSYSTEM_ACCT_ID__c] = z.[SSB_CRMSYSTEM_ACCT_ID]
LEFT JOIN prodcopy.vw_RenoBighornsAccounts rb ON z.crm_id = rb.ID
LEFT JOIN prodcopy.Account c ON z.crm_Id = c.ID
WHERE z.[SSB_CRMSYSTEM_ACCT_ID] <> z.[crm_id]
AND rb.ID IS NULL
AND (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SSID_Winner AS VARCHAR(MAX)))),SSB_CRMSYSTEM_SSID_Winner__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_SSID_Winner__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.DimCustIDs AS VARCHAR(MAX)))),SSB_CRMSYSTEM_DimCustomerIDs__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_DimCustomerIDs__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( NULLIF(b.TM_IDs,'') AS VARCHAR(MAX)))),SSB_CRMSYSTEM_FullArchitcs_IDs__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_FullArchitcs_IDs__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( NULLIF(b.AccountId,'') AS VARCHAR(MAX)))),Archtics_ID__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Archtics_ID__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicket_Years AS VARCHAR(MAX)))),SSB_CRMSYSTEM_STH_Years__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_STH_Years__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Fax AS VARCHAR(MAX)))),c.Fax) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Fax AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.DiscretionaryIncome AS VARCHAR(MAX)))),Discretionary_Income__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Discretionary_Income__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AccountType AS VARCHAR(MAX)))),Type) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Type AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.NetWorth AS VARCHAR(MAX)))),Net_Worth__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Net_Worth__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.LengthofResidence AS VARCHAR(MAX)))),Residence_Length__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Residence_Length__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AdultsinHousehold AS VARCHAR(MAX)))),Adults_In_Household__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Adults_In_Household__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.RecordTypeId AS VARCHAR(MAX)))),c.RecordTypeId) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.RecordTypeId AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Current AS VARCHAR(MAX)))),Num_of_games_bought_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Current AS VARCHAR(MAX)))),Num_of_games_attended_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Current AS VARCHAR(MAX)))),Attendance_Rate_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TotalTicketSpend_Current AS DECIMAL(18,2)))),Total_Kings_Tix_revenue_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_Kings_Tix_revenue_Current_Season__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TotalTicketSpend_Previous AS DECIMAL(18,2)))),Total_Kings_Tix_Rev_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_Kings_Tix_Rev_Previous_Season__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Current AS VARCHAR(MAX)))),Num_arena_events_bought_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Current AS DECIMAL(18,2)))),Total_arena_event_Tix_Rev_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Current_Season__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Current AS DECIMAL(18,2)))),Season_Ticket_Spend_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Current_Season__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Current AS VARCHAR(MAX)))),Num_of_games_forwarded_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Current AS VARCHAR(MAX)))),Num_of_games_posted_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Current AS VARCHAR(MAX)))),Num_of_games_resold_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Current AS VARCHAR(MAX)))),Num_seats_forwarded_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Current AS VARCHAR(MAX)))),Num_seats_posted_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Current AS VARCHAR(MAX)))),Num_seats_resold_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Current AS VARCHAR(MAX)))),Num_games_received_via_Fwd_Current__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Current__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Current AS  DECIMAL(18,2)))),Tot_Rev_seats_bought_resale_TM_Plus_CS__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_Rev_seats_bought_resale_TM_Plus_CS__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Previous AS  DECIMAL(18,2)))),Tot_rev_seats_bought_resale_TM_Plus_PS__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_rev_seats_bought_resale_TM_Plus_PS__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Previous AS VARCHAR(MAX)))),Attendance_Rate_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Previous AS VARCHAR(MAX)))),Num_of_games_attended_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Previous AS VARCHAR(MAX)))),Num_of_games_bought_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Previous AS VARCHAR(MAX)))),Num_arena_events_bought_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Previous AS DECIMAL(18,2)))),Total_arena_event_Tix_Rev_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Previous__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Previous AS DECIMAL(18,2)))),Season_Ticket_Spend_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Previous_Season__c AS DECIMAL(18,2)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Previous AS VARCHAR(MAX)))),Num_games_forwarded_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_forwarded_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Previous AS VARCHAR(MAX)))),Num_games_posted_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_posted_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Previous AS VARCHAR(MAX)))),Num_games_resold_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_resold_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Previous AS VARCHAR(MAX)))),Num_seats_forwarded_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Previous AS VARCHAR(MAX)))),Num_seats_posted_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Previous AS VARCHAR(MAX)))),Num_seats_resold_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumBought_previous AS VARCHAR(MAX)))),Num_games_bought_resale_TM_Plus_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_bought_resale_TM_Plus_Previous__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Previous AS VARCHAR(MAX)))),Num_games_received_via_Fwd_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Previous__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumBought_Current AS VARCHAR(MAX)))),Num_games_bought_resale_TM_Plus_Current__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_bought_resale_TM_Plus_Current__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Season_Current AS VARCHAR(MAX)))),Season_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Season_Previous AS VARCHAR(MAX)))),Season_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_Email_Open_Eloqua__c AS DATE))),c.Date_of_Last_Email_Open_Eloqua__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_Email_Open_Eloqua__c AS DATE))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_G1C_Page_Visit__c AS DATE))),c.Date_of_Last_G1C_Page_Visit__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_G1C_Page_Visit__c AS DATE))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_Kings_com_Visit__c AS DATE))),c.Date_of_Last_Kings_com_Visit__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_Kings_com_Visit__c AS DATE))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Date_of_Last_Ticketing_Page_Visit__c AS DATE))),c.Date_of_Last_Ticketing_Page_Visit__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Date_of_Last_Ticketing_Page_Visit__c AS DATE))),'')) 

)










GO
