CREATE TABLE [dbo].[Contact_Custom]
(
[SSB_CRMSYSTEM_ACCT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSB_CRMSYSTEM_CONTACT_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SSID_Winner] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TM_Ids] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eloqua_IDs] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LA_Ids] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DimCustIDs] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountID] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeasonTicket_Years] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STH_Account] [bit] NULL,
[MobilePhone] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherPhone] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomePhone] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BirthDate] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthday] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailActivityLast15Days] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eloqua7DayActivity] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KingscomWebViewLast15Days] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaritalStatus] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Occupation] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PersonicXCluster] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SeasonTicketSpend_Previous] [decimal] (16, 2) NULL,
[SeasonTicketSpend_Current] [decimal] (16, 2) NULL,
[GamesBought_Previous] [int] NULL,
[GamesBought_Current] [int] NULL,
[GamesAttended_Current] [int] NULL,
[GamesAttended_Previous] [int] NULL,
[AttendRate_Current] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AttendRate_Previous] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalTicketSpend_Current] [decimal] (16, 2) NULL,
[TotalTicketSpend_Previous] [decimal] (16, 2) NULL,
[ArenaSpend_Current] [decimal] (16, 2) NULL,
[ArenaSpend_Previous] [decimal] (16, 2) NULL,
[ArenaBought_Current] [int] NULL,
[ArenaBought_Previous] [int] NULL,
[TE_Game_NumForward_Current] [int] NULL,
[TE_Game_NumForward_Previous] [int] NULL,
[TE_Game_NumPost_Current] [int] NULL,
[TE_Game_NumPost_Previous] [int] NULL,
[TE_Game_NumSold_Current] [int] NULL,
[TE_Game_NumSold_Previous] [int] NULL,
[TE_Seat_NumForward_Current] [int] NULL,
[TE_Seat_NumForward_Previous] [int] NULL,
[TE_Seat_NumPost_Current] [int] NULL,
[TE_Seat_NumPost_Previous] [int] NULL,
[TE_Seat_NumSold_Current] [int] NULL,
[TE_Seat_NumSold_Previous] [int] NULL,
[TE_Game_NumForward_Received_Current] [int] NULL,
[TE_Game_NumForward_Received_Previous] [int] NULL,
[TE_Game_NumBought_Current] [int] NULL,
[TE_Game_NumBought_previous] [int] NULL,
[TE_Revenue_Current] [decimal] (16, 2) NULL,
[TE_Revenue_Previous] [decimal] (16, 2) NULL,
[Season_Current] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Previous] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MDMProcess_UpdatedDate] [datetime] NULL CONSTRAINT [DF_Contact_Custom_MDMProcess_UpdatedDate] DEFAULT (getdate()),
[Kings_App_Profile_Picture_URL] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
ALTER TABLE [dbo].[Contact_Custom] ADD CONSTRAINT [PK_Contact_Custom] PRIMARY KEY CLUSTERED  ([SSB_CRMSYSTEM_CONTACT_ID])
GO
