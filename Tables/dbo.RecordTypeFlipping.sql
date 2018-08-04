CREATE TABLE [dbo].[RecordTypeFlipping]
(
[timestamp] [datetime] NULL CONSTRAINT [DF__RecordTyp__times__6AEFE058] DEFAULT (getdate()),
[Id] [nvarchar] (18) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[name] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[companyname] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[recordtype] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Step] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressPrimaryStreet] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressClean] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[copyloaddate] [datetime] NULL,
[LastModifiedBy] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [datetime] NULL,
[ssbcrmsystemacctid] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[acctprimaryflag] [bit] NULL
)
GO
