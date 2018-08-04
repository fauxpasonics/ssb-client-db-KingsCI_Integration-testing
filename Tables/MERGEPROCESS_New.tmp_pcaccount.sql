CREATE TABLE [MERGEPROCESS_New].[tmp_pcaccount]
(
[Id] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[MasterRecordId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingLatitude] [float] NULL,
[BillingLongitude] [float] NULL,
[BillingAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Website] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Industry] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumberOfEmployees] [int] NULL,
[Description] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[LastActivityDate] [date] NULL,
[LastViewedDate] [datetime] NULL,
[LastReferencedDate] [datetime] NULL,
[JigsawCompanyId] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Archtics_ID__c] [nvarchar] (2000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group_Category__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualRevenue] [float] NULL,
[AccountSource] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SicDesc] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jigsaw] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CleanStatus] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DunsNumber] [nvarchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tradestyle] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NaicsCode] [nvarchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NaicsDesc] [nvarchar] (120) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[YearStarted] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_Loyalty_Level__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_Premium_Rollup__c] [float] NULL,
[Kings_Season_Ticket_Holder_Since__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SIC_Code__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Premium_Customer__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_Season_Ticket_Seats__c] [float] NULL,
[Customer_Requested_Do_Not_Call__c] [bit] NULL,
[Unqualified_Reason__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_Season_Ticket_Holder__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FICO_2014__c] [float] NULL,
[ImportHelper__c] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Share_Partner__c] [bit] NULL,
[Group_Leader__c] [bit] NULL,
[STH_At_Any_Point_in_Time__c] [bit] NULL,
[Suite_Server__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Secondary_Account_Owner__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[temp_import__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_Feedback__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer_Engagement_Level__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Corporate_Partner_Employee__c] [bit] NULL,
[Arena_Group__c] [bit] NULL,
[Partner_Category__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[School_District_Detail__c] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Household_Income__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Enrollment_Membership__c] [float] NULL,
[FICO_Score_10_2013__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[School_District__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Social_Selling_Source__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Current_Buyer_Type_2014__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone_Notes_Primary__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FICO_Score_02_2014__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number_of_Share_Partners__c] [float] NULL,
[FICO_Score_05_2014__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LID__LinkedIn_Company_Id__c] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FICO_Score_07_2014__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[School_Free_Lunch_Percentage__c] [float] NULL,
[Suite_Mailer_Temp_Field__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[School_Grade_Level__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FICO_Score__c] [float] NULL,
[KOL_Prospect__c] [bit] NULL,
[Cantina__c] [bit] NULL,
[Past_Current_Buyer_Type_2015__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reporting_Count_Accounts__c] [float] NULL,
[Date_of_Cantina_Event__c] [date] NULL,
[Cantina_Level__c] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Activity__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group_Ranking__c] [float] NULL,
[Rollover_Deposit__c] [bit] NULL,
[Primary_Purchase_Reason__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attend__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STM_Notes__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2015_16_Seat_Location__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_Rollup_14_15__c] [float] NULL,
[Kings_Rollup_15_16__c] [float] NULL,
[Decision_Makers_and_Roles__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attendance__c] [float] NULL,
[Parking_Purchased__c] [bit] NULL,
[Additional_Notes_about_Tenure__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Contact__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Temp_Field__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2015_16_Seat_Location_2__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2015_16_Seat_Location_3__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2015_16_Seat_Location_4__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group_Campaign_Source__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonicX_Cluster__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Will_bring_a_group_out_to_a_2nd_game__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rate_group_experience_1_10__c] [float] NULL,
[What_group_would_enjoy_the_most__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2016_17_Seat_Location_1__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2016_17_Seat_Location_2__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2016_17_Seat_Location_3__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2016_17_Seat_Location_4__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Upper_Level_vs_Lower_Level__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Secondary_Market_Purchaser__c] [bit] NULL,
[Past_Current_Buyer_Type_2016__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Change_Owner_Date__c] [date] NULL,
[Group_Temp_Field__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Signed_up_for_15_16_KOL__c] [bit] NULL,
[SFSSDupeCatcher__Override_DupeCatcher__c] [bit] NULL,
[Group_Events_Previous_Season__c] [float] NULL,
[Group_Revenue_Previous_Season__c] [float] NULL,
[dialforce__DS_Date_of_Last_Dispo__c] [date] NULL,
[dialforce__DS_Last_Disposition__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[dialforce__DS_Total_Call_Count__c] [float] NULL,
[Bought_tickets_to_a_game_15_16__c] [bit] NULL,
[Wait_List_16_17__c] [bit] NULL,
[Premium_Seat_Location__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wait_List_16_17_Survey__c] [bit] NULL,
[Group_Game_Attended_1__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group_Game_Attended_1_Seats__c] [float] NULL,
[Group_Game_Attended_2__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group_Game_Attended_2_Seats__c] [float] NULL,
[Group_Seats_Previous_Season__c] [float] NULL,
[FICO_Score_07_2016__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingLatitude] [float] NULL,
[ShippingLongitude] [float] NULL,
[ShippingAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Ticket_Spend_Previous_Season__c] [float] NULL,
[Season_Ticket_Spend_Current_Season__c] [float] NULL,
[Residence_Length__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Net_Worth__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age_of_Account_Days__c] [float] NULL,
[Number_of_Games_Attended__c] [float] NULL,
[Number_of_Games_Desired__c] [float] NULL,
[Number_of_Games_in_Current_STH_Plan__c] [float] NULL,
[Number_of_Group_Seats__c] [float] NULL,
[Number_of_Road_Games_Watched_per_Year__c] [float] NULL,
[Level_of_Satisfaction_with_Service_Rep__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Interest_Inquiry_Filled_Out__c] [bit] NULL,
[Highest_STH_Spend__c] [float] NULL,
[Home_Opener__c] [bit] NULL,
[How_Can_We_Make_You_Feel_More_Valued__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[How_Season_Tickets_Are_Primarily_Use__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Another_Person_Deciding_Seat_Location__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Appointment_Time__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Benefit_Currently_Have_that_Goes_Unused__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Benefit_to_Improve_STH_Experience__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Friends_Family_Ticket_Usage__c] [float] NULL,
[Game_Attendance__c] [float] NULL,
[Game_Attended__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Year_of_Previous_Season__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wait_List_Source__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wait_List_16_17_Games__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suite_Loft_Account__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fico_score_02_2013__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Promises_Made_In_the_Past__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number_of_Declines_in_the_Past_Year__c] [float] NULL,
[Miles_from_School__c] [float] NULL,
[How_the_Account_Holders_Use_Tickets__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personal_Ticket_Usage__c] [float] NULL,
[Qualify_for_wants_seats_in_ADA_seating__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason_s_for_Low_Engagement__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason_for_Not_Renewing__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason_For_Change_In_STH_Spend__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason_Intending_Not_Intending_to_Renew__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spend_in_Addition_to_Season_Tickets__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_1_Most_Excited_About_New_Arena__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_1_Priority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_2_Most_Excited_About_New_Arena__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_2_Priority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_3_Most_Excited_About_New_Arena__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_3_Priority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_4_Priority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_5_Priority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Top_6_Priority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wants_all_seats_to_be_located_together__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Year_of_Highest_STH_Spend__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_ACCT_ID__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_DimCustomerIDs__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_FullArchitcs_IDs__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_SSID_Winner__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_STH_Flag__c] [bit] NULL,
[SSB_CRMSYSTEM_STH_Years__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X2016_17_Arena_Event_Rollup__c] [float] NULL,
[Kings_Roll_up_16_17__c] [float] NULL,
[ToutApp__Tout_Current_Campaign__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ToutApp__Tout_Last_Activity__c] [datetime] NULL,
[ToutApp__Tout_Last_Engagement__c] [datetime] NULL,
[ToutApp__Tout_Last_Replied__c] [datetime] NULL,
[DialSource__Datetime_of_Last_Disposition_DS__c] [datetime] NULL,
[DialSource__Last_Disposition_DS__c] [nvarchar] (140) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DialSource__Next_Call_DS__c] [datetime] NULL,
[DialSource__Total_Call_Count_DS__c] [float] NULL,
[Discretionary_Income__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Adults_In_Household__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Children_Flag__c] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_APIID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[loaddate] [datetime] NULL,
[Reno_Bighorns_Account__c] [bit] NULL,
[Group_Program_FEP_Previous_Season__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Last_Call_List_Name__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zisf__zoom_id__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zisf__zoom_lastupdated__c] [datetime] NULL,
[Num_of_games_bought_Current_Season__c] [float] NULL,
[Num_of_games_attended_Current_Season__c] [float] NULL,
[Attendance_Rate_Current_Season__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Num_of_games_forwarded_Current_Season__c] [float] NULL,
[Not_Interested_in__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Not_Interested_Reason__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Not_Interested_Date__c] [date] NULL,
[Num_of_games_posted_Current_Season__c] [float] NULL,
[Num_of_games_resold_Current_Season__c] [float] NULL,
[Num_seats_resold_Current_Season__c] [float] NULL,
[Num_seats_forwarded_Current_Season__c] [float] NULL,
[Num_seats_posted_Current_Season__c] [float] NULL,
[Num_games_received_via_Fwd_Current__c] [float] NULL,
[Num_arena_events_bought_Current_Season__c] [float] NULL,
[Total_arena_event_Tix_Rev_Current_Season__c] [float] NULL,
[Num_games_bought_resale_TM_Plus_Current__c] [float] NULL,
[Tot_Rev_seats_bought_resale_TM_Plus_CS__c] [float] NULL,
[Total_Kings_Tix_Rev_Previous_Season__c] [float] NULL,
[Num_of_games_bought_Previous_Season__c] [float] NULL,
[Num_of_games_attended_Previous_Season__c] [float] NULL,
[Attendance_Rate_Previous_Season__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Num_games_forwarded_Previous_Season__c] [float] NULL,
[Num_games_posted_Previous_Season__c] [float] NULL,
[Num_games_resold_Previous_Season__c] [float] NULL,
[Num_seats_resold_Previous_Season__c] [float] NULL,
[Num_seats_forwarded_Previous_Season__c] [float] NULL,
[Num_seats_posted_Previous_Season__c] [float] NULL,
[Num_games_received_via_Fwd_Previous__c] [float] NULL,
[Num_arena_events_bought_Previous_Season__c] [float] NULL,
[Total_arena_event_Tix_Rev_Previous__c] [float] NULL,
[Num_games_bought_resale_TM_Plus_Previous__c] [float] NULL,
[Tot_rev_seats_bought_resale_TM_Plus_PS__c] [float] NULL,
[Season_Current_Season__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Previous_Season__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Current_Buyer_Type_2017__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Cantina_Event__c] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X16_17_YTD_Utilization_Rate__c] [float] NULL,
[X16_17_Preseason_STM_Segment__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X16_17_Nov_STM_Campaign_Target_Account__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X16_17_Preseason_STM_Notes__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Total_Kings_Tix_revenue_Current_Season__c] [float] NULL,
[Date_of_Last_Email_Open_Eloqua__c] [datetime] NULL,
[Date_of_Last_G1C_Page_Visit__c] [datetime] NULL,
[Date_of_Last_Kings_com_Visit__c] [datetime] NULL,
[Date_of_Last_Ticketing_Page_Visit__c] [datetime] NULL,
[Bighorns_Temp_Field__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Distance_from_Golden_1_Center_Miles__c] [float] NULL,
[New_Fulls_Lead_Score__c] [float] NULL,
[Non_Renewed_Full_New_Opp__c] [float] NULL,
[Quantity_of_Full_Deposit_Won__c] [float] NULL,
[Previous_Season_Half_Season_Won__c] [float] NULL,
[Adjusted_New_Fulls_Lead_Score__c] [float] NULL,
[Adjusted_New_Fulls_Lead_Score_Formula__c] [float] NULL,
[New_Fulls_Lead_Score_Segment__c] [float] NULL,
[Last_Activity_Date_by_Owner__c] [date] NULL,
[Last_Activity_Type_by_Owner__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Active__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Agency__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Authorized_Signor__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__BillingContact__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Coordinator__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__CustomerPriority__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__External_Account_ID__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__FinanceAccountNumber__c] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__FinanceIsSynced__c] [bit] NULL,
[koreps__FinanceModifiedDate__c] [datetime] NULL,
[koreps__Future_LTV__c] [float] NULL,
[koreps__Industry__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Legal_Name__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Miles_From_Facility__c] [float] NULL,
[koreps__NumberofLocations__c] [float] NULL,
[koreps__Premium_Coordinator__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Premium_Salesperson__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__PrimaryContact__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SLAExpirationDate__c] [date] NULL,
[koreps__SLASerialNumber__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SLA__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Salesperson__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SponsorshipIndustry__c] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__State_Of_Incorporation__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__Stripped_Name__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__SyncPriority__c] [float] NULL,
[koreps__Total_Lifetime_Value__c] [float] NULL,
[koreps__UpsellOpportunity__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[koreps__ltvtodate__c] [float] NULL,
[Previous_Season_Partial_Won__c] [float] NULL,
[Current_Partner_Account__c] [bit] NULL,
[DialSource__DS_Owner_ID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DialSource__Last_Call_Campaign_Name__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Current_Buyer_Type_2018__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Health_Category__c] [float] NULL,
[Health_Category_Reason__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STM_Health_Owner__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Seat_Location_1__c] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Seat_Location_2__c] [nvarchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Number_of_Seats_Location_1__c] [float] NULL,
[Number_of_Seats_Location_2__c] [float] NULL,
[Premium_Term_1__c] [float] NULL,
[Premium_Term_2__c] [float] NULL
)
GO
CREATE NONCLUSTERED INDEX [ix_tmp_pcaccount] ON [MERGEPROCESS_New].[tmp_pcaccount] ([Id])
GO
