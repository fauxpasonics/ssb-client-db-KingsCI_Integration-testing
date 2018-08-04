CREATE TABLE [MERGEPROCESS_New].[RecieveResults]
(
[ResultID] [int] NOT NULL IDENTITY(1, 1),
[PK_MergeID] [int] NULL,
[ErrorCode] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErrorDescription] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Winning_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Losing_ID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateInserted] [datetime] NULL CONSTRAINT [DF__RecieveRe__DateI__503BEA1C] DEFAULT (getdate())
)
GO
ALTER TABLE [MERGEPROCESS_New].[RecieveResults] ADD CONSTRAINT [PK__RecieveR__976902288A385276] PRIMARY KEY CLUSTERED  ([ResultID])
GO