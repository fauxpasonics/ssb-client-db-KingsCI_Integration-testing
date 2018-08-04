CREATE TABLE [ods].[Account_Merge_Fields]
(
[xtype] [varchar] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Winning_ID] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Losing_ID] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[name] [nvarchar] (121) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [datetime] NULL,
[xRank] [bigint] NULL,
[AccountName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Billingcity] [nvarchar] (40) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Billingpostalcode] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO
