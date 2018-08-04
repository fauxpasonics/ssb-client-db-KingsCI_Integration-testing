CREATE TABLE [MERGEPROCESS_New].[LogPreMergeContact]
(
[FK_MergeID] [int] NOT NULL,
[ObjectType] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MergeRecordType] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LogDate] [datetime] NULL,
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [bit] NULL,
[MasterRecordId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoUrl] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[CreatedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[LastModifiedById] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [datetime] NULL,
[LastActivityDate] [date] NULL,
[LastViewedDate] [datetime] NULL,
[LastReferencedDate] [datetime] NULL,
[SSB_CRMSYSTEM_ACCT_ID__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_DimCustomerIDs__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_FullArchitcs_IDs__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_SSID_Winner__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_STH_Flag__c] [bit] NULL,
[SSB_CRMSYSTEM_STH_Years__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingState] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingPostalCode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCountry] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingLatitude] [float] NULL,
[MailingLongitude] [float] NULL,
[MailingAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReportsToId] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Department] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastCURequestDate] [datetime] NULL,
[LastCUUpdateDate] [datetime] NULL,
[EmailBouncedReason] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailBouncedDate] [datetime] NULL,
[IsEmailBounced] [bit] NULL,
[JigsawContactId] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_CONTACT_ID__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jigsaw] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_APIID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Archtics_ID__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CleanStatus] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Alternate_Email__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Anniversary_Date__c] [date] NULL,
[Child_1_Age__c] [float] NULL,
[Child_1_Name__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Child_2_Age__c] [float] NULL,
[Child_2_Name__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Child_3_Age__c] [float] NULL,
[Child_3_Name__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact_ID_18_Char__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Converted_Account_Name__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Date_of_Last_Dispo__c] [date] NULL,
[DS_Last_Disposition__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Total_Call_Count__c] [float] NULL,
[Email_Activity_Last_15_Days__c] [bit] NULL,
[Occupation__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Favorite_Current_Kings_Player__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[G1C_Web_View_Last_15_Days__c] [bit] NULL,
[Inactive_Contact__c] [bit] NULL,
[Inactive_Description__c] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Kings_com_Web_View_Last_15_Days__c] [bit] NULL,
[LinkedIn_Company_Id__c] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Linked_Member_Token__c] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spouse__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Name_for_Export__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Owner__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Owner_ID__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Role__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ESC_Web_View_Last_15_Days__c] [bit] NULL,
[Games_Personally_Attended__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Group_Events_Previous_Season__c] [float] NULL,
[Marital_Status__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonicX_Cluster__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Race__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Twitter_Handle__c] [nvarchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Inactive_Reason__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Household_Income__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SFSSDupeCatcher__Override_DupeCatcher__c] [bit] NULL,
[ToutApp__Tout_Current_Campaign__c] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ToutApp__Tout_Last_Activity__c] [datetime] NULL,
[ToutApp__Tout_Last_Engagement__c] [datetime] NULL,
[ToutApp__Tout_Last_Replied__c] [datetime] NULL,
[DialSource__Datetime_of_Last_Disposition_DS__c] [datetime] NULL,
[DialSource__Last_Disposition_DS__c] [nvarchar] (140) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DialSource__Next_Call_DS__c] [datetime] NULL,
[DialSource__Total_Call_Count_DS__c] [float] NULL,
[STH_Account__c] [bit] NULL,
[Num_of_games_bought_Current_Season__c] [float] NULL,
[Num_of_games_attended_Current_Season__c] [float] NULL,
[Attendance_Rate_Current_Season__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Total_Kings_Tix_revenue_Current_Season__c] [float] NULL,
[Num_arena_events_bought_Current_Season__c] [float] NULL,
[Total_arena_event_Tix_Rev_Current_Season__c] [float] NULL,
[Season_Ticket_Spend_Current_Season__c] [float] NULL,
[Num_of_games_forwarded_Current_Season__c] [float] NULL,
[Num_of_games_posted_Current_Season__c] [float] NULL,
[Num_of_games_resold_Current_Season__c] [float] NULL,
[Num_seats_forwarded_Current_Season__c] [float] NULL,
[Num_seats_posted_Current_Season__c] [float] NULL,
[Num_seats_resold_Current_Season__c] [float] NULL,
[Num_games_received_via_Fwd_Current__c] [float] NULL,
[Total_Kings_Tix_Rev_Previous_Season__c] [float] NULL,
[Attendance_Rate_Previous_Season__c] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Num_of_games_attended_Previous_Season__c] [float] NULL,
[Num_of_games_bought_Previous_Season__c] [float] NULL,
[Num_arena_events_bought_Previous_Season__c] [float] NULL,
[Total_arena_event_Tix_Rev_Previous__c] [float] NULL,
[Season_Ticket_Spend_Previous_Season__c] [float] NULL,
[Num_games_forwarded_Previous_Season__c] [float] NULL,
[Num_games_posted_Previous_Season__c] [float] NULL,
[Num_games_resold_Previous_Season__c] [float] NULL,
[Num_seats_forwarded_Previous_Season__c] [float] NULL,
[Num_seats_posted_Previous_Season__c] [float] NULL,
[Num_seats_resold_Previous_Season__c] [float] NULL,
[Num_games_bought_resale_TM_Plus_Previous__c] [float] NULL,
[Num_games_received_via_Fwd_Previous__c] [float] NULL,
[Num_games_bought_resale_TM_Plus_Current__c] [float] NULL,
[Tot_Rev_seats_bought_resale_TM_Plus_CS__c] [float] NULL,
[Tot_rev_seats_bought_resale_TM_Plus_PS__c] [float] NULL,
[Annual_Revenue__c] [float] NULL,
[Phone_Notes_Primary__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Type__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday__c] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LID__LinkedIn_Company_Id__c] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LID__LinkedIn_Member_Token__c] [nvarchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[loaddate] [datetime] NULL,
[Contact_Type__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Last_Call_List_Name__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zisf__zoom_id__c] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[zisf__zoom_lastupdated__c] [datetime] NULL,
[OtherPhone] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FICO_Score__c] [float] NULL,
[Past_Current_Buyer_Type_2016__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Current_Buyer_Type_2015__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Current_Buyer_Type_2014__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Residence_Length__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Net_Worth__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Discretionary_Income__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Adults_In_Household__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Children_Flag__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Not_Interested_in__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Not_Interested_Reason__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Not_Interested_Date__c] [date] NULL,
[Status__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unqualified_Reason__c] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Temp_Field__c] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Previous_Season__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Current_Season__c] [nvarchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DS_Phone__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Log_a_Call_Contact__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Temp_Field__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Record_Type__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reno_Bighorns_Contact__c] [bit] NULL,
[Past_Current_Buyer_Type_2017__c] [nvarchar] (1300) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO