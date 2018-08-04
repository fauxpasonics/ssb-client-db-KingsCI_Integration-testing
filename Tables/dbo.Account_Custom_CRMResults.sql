CREATE TABLE [dbo].[Account_Custom_CRMResults]
(
[SSB_CRMSYSTEM_SSID_Winner__c] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_FullArchitcs_IDs__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_DimCustomerIDs__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_STH_Years__c] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSB_CRMSYSTEM_STH_Flag__c] [int] NULL,
[Update.Id] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Archtics_ID__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Season_Ticket_Spend_Previous_Season__c] [numeric] (16, 2) NULL,
[Season_Ticket_Spend_Current_Season__c] [numeric] (16, 2) NULL,
[Type] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Discretionary_Income__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Net_Worth__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Residence_Length__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Adults_In_Household__c] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Children_Flag__c] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorCode] [int] NULL,
[ErrorColumn] [int] NULL,
[Update SF Dest.Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorDescription] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
