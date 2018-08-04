SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [dbo].[vwCRMLoad_Contact_Custom_Update]
AS
SELECT  z.[crm_id] Id
	,isnull(b.SSID_Winner,SSB_CRMSYSTEM_SSID_Winner__c) SSB_CRMSYSTEM_SSID_Winner__c													   --,c.SSB_CRMSYSTEM_SSID_Winner__c
	,isnull(b.TM_Ids,SSB_CRMSYSTEM_FullArchitcs_IDs__c) SSB_CRMSYSTEM_FullArchitcs_IDs__c												   --,c.SSB_CRMSYSTEM_FullArchitcs_IDs__c
	,isnull(b.DimCustIDs,SSB_CRMSYSTEM_DimCustomerIDs__c) SSB_CRMSYSTEM_DimCustomerIDs__c												   --,c.SSB_CRMSYSTEM_DimCustomerIDs__c
	,isnull(b.AccountID,Archtics_ID__c) Archtics_ID__c																					   --,c.Archtics_ID__c
	,isnull(b.MobilePhone, c.mobilephone) MobilePhone																					   --,c.MobilePhone
	,isnull(z.[EmailPrimary], Email) Email																								   --,c.Email
	--,b.OtherPhone																														   --
	,isnull(b.HomePhone, b.OtherPhone) AS OtherPhone																					   --,c.OtherPhone
	--,b.BirthDate																														   --
	,isnull(b.Age,Age__c) Age__c																										   --,c.Age__c
	,isnull(b.Birthday,Birthday__c) Birthday__c																							   --,c.Birthday__c
	,ISNULL(b.EmailActivityLast15Days,Email_Activity_Last_15_Days__c) Email_Activity_Last_15_Days__c									   --,c.Email_Activity_Last_15_Days__c
	--,b.Eloqua7DayActivity																	   --
	,isnull(b.Gender,Gender__c)  Gender__c																						 		   --,c.Gender__c
	,ISNULL(b.KingscomWebViewLast15Days,Kings_com_Web_View_Last_15_Days__c) Kings_com_Web_View_Last_15_Days__c							   --,c.Kings_com_Web_View_Last_15_Days__c
	,isnull(b.MaritalStatus,Marital_Status__c)  Marital_Status__c														   --,c.Marital_Status__c
	,isnull(b.Occupation,Occupation__c) Occupation__c																   --,c.Occupation__c
	,isnull(b.PersonicXCluster,PersonicX_Cluster__c)  PersonicX_Cluster__c												   --,c.PersonicX_Cluster__c
	,isnull(b.Fax,c.Fax) Fax																											   --,c.Fax
	,isnull(b.STH_Account,STH_Account__c)  STH_Account__c															   --,c.STH_Account__c
	,isnull(b.GamesBought_Current,Num_of_games_bought_Current_Season__c) Num_of_games_bought_Current_Season__c							   --,c.Num_of_games_bought_Current_Season__c
	,isnull(b.GamesAttended_Current,Num_of_games_attended_Current_Season__c) Num_of_games_attended_Current_Season__c						   --,c.Num_of_games_attended_Current_Season__c
	,isnull(b.AttendRate_Current,Attendance_Rate_Current_Season__c) Attendance_Rate_Current_Season__c									   --,c.Attendance_Rate_Current_Season__c
	,isnull(b.TotalTicketSpend_Current,Total_Kings_Tix_revenue_Current_Season__c) Total_Kings_Tix_revenue_Current_Season__c					   --,c.Total_Kings_Tix_revenue_Current_Season__c
	,isnull(b.TotalTicketSpend_Previous,Total_Kings_Tix_Rev_Previous_Season__c) Total_Kings_Tix_Rev_Previous_Season__c						   --,c.Total_Kings_Tix_Rev_Previous_Season__c
	,isnull(b.ArenaBought_Current,Num_arena_events_bought_Current_Season__c) Num_arena_events_bought_Current_Season__c						   --,c.Num_arena_events_bought_Current_Season__c
	,isnull(b.ArenaSpend_Current,Total_arena_event_Tix_Rev_Current_Season__c) Total_arena_event_Tix_Rev_Current_Season__c						   --,c.Total_arena_event_Tix_Rev_Current_Season__c
	,isnull(b.SeasonTicketSpend_Current,Season_Ticket_Spend_Current_Season__c) Season_Ticket_Spend_Current_Season__c						   --,c.Season_Ticket_Spend_Current_Season__c
	,isnull(b.TE_Game_NumForward_Current,Num_of_games_forwarded_Current_Season__c) Num_of_games_forwarded_Current_Season__c					   --,c.Num_of_games_forwarded_Current_Season__c
	,isnull(b.TE_Game_NumPost_Current,Num_of_games_posted_Current_Season__c) Num_of_games_posted_Current_Season__c						   --,c.Num_of_games_posted_Current_Season__c
	,isnull(b.TE_Game_NumSold_Current,Num_of_games_resold_Current_Season__c) Num_of_games_resold_Current_Season__c						   --,c.Num_of_games_resold_Current_Season__c
	,isnull(b.TE_Seat_NumForward_Current,Num_seats_forwarded_Current_Season__c) Num_seats_forwarded_Current_Season__c						   --,c.Num_seats_forwarded_Current_Season__c
	,isnull(b.TE_Seat_NumPost_Current,Num_seats_posted_Current_Season__c) Num_seats_posted_Current_Season__c							   --,c.Num_seats_posted_Current_Season__c
	,isnull(b.TE_Seat_NumSold_Current,Num_seats_resold_Current_Season__c) Num_seats_resold_Current_Season__c							   --,c.Num_seats_resold_Current_Season__c
	,isnull(b.TE_Game_NumForward_Received_Current,Num_games_received_via_Fwd_Current__c) Num_games_received_via_Fwd_Current__c			   --,c.Num_games_received_via_Fwd_Current__c
	,isnull(b.TE_Revenue_Current,Tot_Rev_seats_bought_resale_TM_Plus_CS__c) Tot_Rev_seats_bought_resale_TM_Plus_CS__c							   --,c.Tot_Rev_seats_bought_resale_TM_Plus_CS__c
	,isnull(b.TE_Revenue_Previous,Tot_rev_seats_bought_resale_TM_Plus_PS__c) Tot_rev_seats_bought_resale_TM_Plus_PS__c						   --,c.Tot_rev_seats_bought_resale_TM_Plus_PS__c
	,isnull(b.AttendRate_Previous,Attendance_Rate_Previous_Season__c) Attendance_Rate_Previous_Season__c								   --,c.Attendance_Rate_Previous_Season__c
	,isnull(b.GamesAttended_Previous,Num_of_games_attended_Previous_Season__c) Num_of_games_attended_Previous_Season__c						   --,c.Num_of_games_attended_Previous_Season__c
	,isnull(b.GamesBought_Previous,Num_of_games_bought_Previous_Season__c) Num_of_games_bought_Previous_Season__c							   --,c.Num_of_games_bought_Previous_Season__c
	,isnull(b.ArenaBought_Previous,Num_arena_events_bought_Previous_Season__c) Num_arena_events_bought_Previous_Season__c						   --,c.Num_arena_events_bought_Previous_Season__c
	,isnull(b.ArenaSpend_Previous,Total_arena_event_Tix_Rev_Previous__c) Total_arena_event_Tix_Rev_Previous__c							   --,c.Total_arena_event_Tix_Rev_Previous__c
	,isnull(b.SeasonTicketSpend_Previous,Season_Ticket_Spend_Previous_Season__c) Season_Ticket_Spend_Previous_Season__c					   --,c.Season_Ticket_Spend_Previous_Season__c
	,isnull(b.TE_Game_NumForward_Previous,Num_games_forwarded_Previous_Season__c) Num_games_forwarded_Previous_Season__c					   --,c.Num_games_forwarded_Previous_Season__c
	,isnull(b.TE_Game_NumPost_Previous,Num_games_posted_Previous_Season__c) Num_games_posted_Previous_Season__c							   --,c.Num_games_posted_Previous_Season__c
	,isnull(b.TE_Game_NumSold_Previous,Num_games_resold_Previous_Season__c) Num_games_resold_Previous_Season__c							   --,c.Num_games_resold_Previous_Season__c
	,isnull(b.TE_Seat_NumForward_Previous,Num_seats_forwarded_Previous_Season__c) Num_seats_forwarded_Previous_Season__c					   --,c.Num_seats_forwarded_Previous_Season__c
	,isnull(b.TE_Seat_NumPost_Previous,Num_seats_posted_Previous_Season__c) Num_seats_posted_Previous_Season__c							   --,c.Num_seats_posted_Previous_Season__c
	,isnull(b.TE_Seat_NumSold_Previous,Num_seats_resold_Previous_Season__c) Num_seats_resold_Previous_Season__c							   --,c.Num_seats_resold_Previous_Season__c
	,isnull(b.TE_Game_NumBought_previous,Num_games_bought_resale_TM_Plus_Previous__c) Num_games_bought_resale_TM_Plus_Previous__c				   --,c.Num_games_bought_resale_TM_Plus_Previous__c
	,isnull(b.TE_Game_NumForward_Received_Previous,Num_games_received_via_Fwd_Previous__c) Num_games_received_via_Fwd_Previous__c			   --,c.Num_games_received_via_Fwd_Previous__c
	,isnull(b.TE_Game_NumBought_Current,Num_games_bought_resale_TM_Plus_Current__c) Num_games_bought_resale_TM_Plus_Current__c 				   --,c.Num_games_bought_resale_TM_Plus_Current__c
	,isnull(b.Season_Current,Season_Current_Season__c) Season_Current_Season__c												   --,c.Season_Current_Season__c
	,isnull(b.Season_Previous,Season_Previous_Season__c) Season_Previous_Season__c											   --,c.Season_Previous_Season__c
	,isnull(b.Kings_App_Profile_Picture_URL,Kings_App_Profile_Picture_URL__c) Kings_App_Profile_Picture_URL__c 						   --,c.Kings_App_Profile_Picture_URL__c


--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SSID_Winner AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_SSID_Winner__c AS VARCHAR(MAX)))),'')) 										 then 1 else 0 end as diffSSB_CRMSYSTEM_SSID_Winner__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.DimCustIDs AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_DimCustomerIDs__c AS VARCHAR(MAX)))),'')) 										 then 1 else 0 end as diffSSB_CRMSYSTEM_DimCustomerIDs__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TM_IDs AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_FullArchitcs_IDs__c AS VARCHAR(MAX)))),'')) 										 then 1 else 0 end as diffSSB_CRMSYSTEM_FullArchitcs_IDs__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AccountId AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Archtics_ID__c AS VARCHAR(MAX)))),''))														 then 1 else 0 end as diffArchtics_ID__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.MobilePhone AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MobilePhone AS VARCHAR(MAX)))),''))															 then 1 else 0 end as diffMobilePhone
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( z.[EmailPrimary] AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Email AS VARCHAR(MAX)))),''))															 then 1 else 0 end as diffEmail
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.HomePhone AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherPhone AS VARCHAR(MAX)))),''))															 then 1 else 0 end as diffOtherPhone
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Age AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Age__c AS VARCHAR(MAX)))),''))																		 then 1 else 0 end as diffAge__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Birthday AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Birthday__c AS VARCHAR(MAX)))),''))															 then 1 else 0 end as diffBirthday__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( ISNULL(b.EmailActivityLast15Days,0) AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Email_Activity_Last_15_Days__c AS VARCHAR(MAX)))),''))				 then 1 else 0 end as diffEmail_Activity_Last_15_Days__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( ISNULL(b.KingscomWebViewLast15Days,0) AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Kings_com_Web_View_Last_15_Days__c AS VARCHAR(MAX)))),''))			 then 1 else 0 end as diffKings_com_Web_View_Last_15_Days__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.MaritalStatus AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Marital_Status__c AS VARCHAR(MAX)))),''))													 then 1 else 0 end as diffMarital_Status__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Occupation AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Occupation__c AS VARCHAR(MAX)))),''))														 then 1 else 0 end as diffOccupation__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.PersonicXCluster AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.PersonicX_Cluster__c AS VARCHAR(MAX)))),''))											 then 1 else 0 end as diffPersonicX_Cluster__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Fax AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Fax AS VARCHAR(MAX)))),''))																			 then 1 else 0 end as diffFax
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 						 then 1 else 0 end as diffNum_of_games_bought_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Current_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_of_games_attended_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Current_Season__c AS VARCHAR(MAX)))),'')) 							 then 1 else 0 end as diffAttendance_Rate_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TotalTicketSpend_Previous AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_Kings_Tix_Rev_Previous_Season__c AS VARCHAR(MAX)))),'')) 						 then 1 else 0 end as diffTotal_Kings_Tix_Rev_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_arena_events_bought_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Current AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Current_Season__c AS INT))),'')) 									 then 1 else 0 end as diffTotal_arena_event_Tix_Rev_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Current AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Current_Season__c AS VARCHAR(MAX)))),'')) 							 then 1 else 0 end as diffSeason_Ticket_Spend_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 			 then 1 else 0 end as diffNum_of_games_forwarded_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_of_games_posted_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_of_games_resold_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 				 then 1 else 0 end as diffNum_seats_forwarded_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 						 then 1 else 0 end as diffNum_seats_posted_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 						 then 1 else 0 end as diffNum_seats_resold_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Current__c AS VARCHAR(MAX)))),'')) 		 then 1 else 0 end as diffNum_games_received_via_Fwd_Current__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Current AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_Rev_seats_bought_resale_TM_Plus_CS__c AS INT))),'')) 										 then 1 else 0 end as diffTot_Rev_seats_bought_resale_TM_Plus_CS__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Previous AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_rev_seats_bought_resale_TM_Plus_PS__c AS INT))),'')) 									 then 1 else 0 end as diffTot_rev_seats_bought_resale_TM_Plus_PS__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Previous_Season__c AS VARCHAR(MAX)))),'')) 							 then 1 else 0 end as diffAttendance_Rate_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Previous_Season__c AS VARCHAR(MAX)))),'')) 				 then 1 else 0 end as diffNum_of_games_attended_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_of_games_bought_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 				 then 1 else 0 end as diffNum_arena_events_bought_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Previous AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Previous__c AS INT))),'')) 										 then 1 else 0 end as diffTotal_arena_event_Tix_Rev_Previous__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Previous AS INT))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Previous_Season__c AS VARCHAR(MAX)))),'')) 						 then 1 else 0 end as diffSeason_Ticket_Spend_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_forwarded_Previous_Season__c AS VARCHAR(MAX)))),'')) 				 then 1 else 0 end as diffNum_games_forwarded_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_posted_Previous_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_games_posted_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_resold_Previous_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_games_resold_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Previous_Season__c AS VARCHAR(MAX)))),'')) 				 then 1 else 0 end as diffNum_seats_forwarded_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Previous_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_seats_posted_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Previous_Season__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffNum_seats_resold_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumBought_previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_bought_resale_TM_Plus_Previous__c AS VARCHAR(MAX)))),'')) 			 then 1 else 0 end as diffNum_games_bought_resale_TM_Plus_Previous__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Previous__c AS VARCHAR(MAX)))),'')) 	 then 1 else 0 end as diffNum_games_received_via_Fwd_Previous__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumBought_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_bought_resale_TM_Plus_Current__c AS VARCHAR(MAX)))),'')) 			 then 1 else 0 end as diffNum_games_bought_resale_TM_Plus_Current__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Season_Current AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Current_Season__c AS VARCHAR(MAX)))),'')) 										 then 1 else 0 end as diffSeason_Current_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Season_Previous AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Previous_Season__c AS VARCHAR(MAX)))),'')) 										 then 1 else 0 end as diffSeason_Previous_Season__c
--,case when HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Kings_App_Profile_Picture_URL AS VARCHAR(MAX)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Kings_App_Profile_Picture_URL__c AS VARCHAR(MAX)))),'')) 					 then 1 else 0 end as diffKings_App_Profile_Picture_URL__c

--select count(*)
FROM dbo.[vwCRMLoad_Contact_Std_Prep] a
INNER JOIN dbo.[Contact_Custom] b ON [a].[SSB_CRMSYSTEM_Contact_ID__c] = b.[SSB_CRMSYSTEM_Contact_ID]
INNER JOIN dbo.Contact z ON a.[SSB_CRMSYSTEM_Contact_ID__c] = z.[SSB_CRMSYSTEM_Contact_ID]
LEFT JOIN prodcopy.vw_RenoBighornsContacts rb ON z.crm_id = rb.ID
LEFT JOIN prodcopy.contact c ON a.Id = c.ID
WHERE z.[SSB_CRMSYSTEM_ACCT_ID] <> z.[crm_id]
AND rb.ID IS NULL
AND (1=2
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SSID_Winner AS VARCHAR(MAX)))),SSB_CRMSYSTEM_SSID_Winner__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_SSID_Winner__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.DimCustIDs AS VARCHAR(MAX)))),SSB_CRMSYSTEM_DimCustomerIDs__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_DimCustomerIDs__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TM_IDs AS VARCHAR(MAX)))),SSB_CRMSYSTEM_FullArchitcs_IDs__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.SSB_CRMSYSTEM_FullArchitcs_IDs__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AccountId AS VARCHAR(MAX)))),Archtics_ID__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Archtics_ID__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.MobilePhone AS VARCHAR(MAX)))),c.MobilePhone) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.MobilePhone AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( z.[EmailPrimary] AS VARCHAR(MAX)))),Email) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Email AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.HomePhone AS VARCHAR(MAX)))),c.OtherPhone) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.OtherPhone AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Age AS VARCHAR(MAX)))),Age__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Age__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Birthday AS VARCHAR(MAX)))),Birthday__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Birthday__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( ISNULL(b.EmailActivityLast15Days,0) AS VARCHAR(MAX)))),Email_Activity_Last_15_Days__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Email_Activity_Last_15_Days__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( ISNULL(b.KingscomWebViewLast15Days,0) AS VARCHAR(MAX)))),Kings_com_Web_View_Last_15_Days__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Kings_com_Web_View_Last_15_Days__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.MaritalStatus AS VARCHAR(MAX)))),Marital_Status__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Marital_Status__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Occupation AS VARCHAR(MAX)))),Occupation__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Occupation__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.PersonicXCluster AS VARCHAR(MAX)))),PersonicX_Cluster__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.PersonicX_Cluster__c AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Fax AS VARCHAR(MAX)))),c.Fax) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Fax AS VARCHAR(MAX)))),''))
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Current AS VARCHAR(MAX)))),Num_of_games_bought_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Current AS VARCHAR(MAX)))),Num_of_games_attended_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Current AS VARCHAR(MAX)))),Attendance_Rate_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Current_Season__c AS VARCHAR(MAX)))),'')) 
	--or HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( b.TotalTicketSpend_Current as varchar(max)))),'') )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(Cast( c.Total_Kings_Tix_revenue_Current_Season__c as varchar(max)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TotalTicketSpend_Previous AS INT))),Total_Kings_Tix_Rev_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_Kings_Tix_Rev_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Current AS VARCHAR(MAX)))),Num_arena_events_bought_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Current AS INT))),Total_arena_event_Tix_Rev_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Current_Season__c AS INT))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Current AS INT))),Season_Ticket_Spend_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Current AS VARCHAR(MAX)))),Num_of_games_forwarded_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumPost_Current AS VARCHAR(MAX)))),Num_of_games_posted_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumSold_Current AS VARCHAR(MAX)))),Num_of_games_resold_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumForward_Current AS VARCHAR(MAX)))),Num_seats_forwarded_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_forwarded_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumPost_Current AS VARCHAR(MAX)))),Num_seats_posted_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_posted_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Seat_NumSold_Current AS VARCHAR(MAX)))),Num_seats_resold_Current_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_seats_resold_Current_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Game_NumForward_Received_Current AS VARCHAR(MAX)))),Num_games_received_via_Fwd_Current__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_games_received_via_Fwd_Current__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Current AS INT))),Tot_Rev_seats_bought_resale_TM_Plus_CS__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_Rev_seats_bought_resale_TM_Plus_CS__c AS INT))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.TE_Revenue_Previous AS INT))),Tot_rev_seats_bought_resale_TM_Plus_PS__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Tot_rev_seats_bought_resale_TM_Plus_PS__c AS INT))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.AttendRate_Previous AS VARCHAR(MAX)))),Attendance_Rate_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Attendance_Rate_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesAttended_Previous AS VARCHAR(MAX)))),Num_of_games_attended_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_attended_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.GamesBought_Previous AS VARCHAR(MAX)))),Num_of_games_bought_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_of_games_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaBought_Previous AS VARCHAR(MAX)))),Num_arena_events_bought_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Num_arena_events_bought_Previous_Season__c AS VARCHAR(MAX)))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.ArenaSpend_Previous AS INT))),Total_arena_event_Tix_Rev_Previous__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Total_arena_event_Tix_Rev_Previous__c AS INT))),'')) 
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.SeasonTicketSpend_Previous AS INT))),Season_Ticket_Spend_Previous_Season__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Season_Ticket_Spend_Previous_Season__c AS VARCHAR(MAX)))),'')) 
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
	OR HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( b.Kings_App_Profile_Picture_URL AS VARCHAR(MAX)))),Kings_App_Profile_Picture_URL__c) )  <> HASHBYTES('SHA2_256',ISNULL(LTRIM(RTRIM(CAST( c.Kings_App_Profile_Picture_URL__c AS VARCHAR(MAX)))),'')) 

)




GO
