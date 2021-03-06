SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE VIEW [MERGEPROCESS_New].[vw_Queue_Contact]
AS
SELECT q.FK_MergeID AS PK_QueueID, q.ObjectType,
q.Winning_ID AS Master_SFID,
q.Losing_ID AS Slave_SFID 
FROM MERGEProcess_new.Queue q
INNER JOIN KingsCI_Reporting.prodcopy.contact win
ON win.id = q.Winning_ID
INNER JOIN KingsCI_Reporting.prodcopy.contact lose
ON lose.id = q.Losing_ID
WHERE ObjectType = 'Contact'
AND win.AccountId = lose.AccountId
AND lose.IsDeleted = 0
AND 		(q.Winning_ID IN ('0033600000Sf4xhAAB',
'0033600000Sf5jfAAB',
'0033600000Sf5qEAAR',
'0033600000Sf6xZAAR',
'0033600000SfbcHAAR',
'0033600000SfBqVAAV',
'0033600000SfClSAAV',
'0033600000SfcUnAAJ',
'0033600000SfDfKAAV',
'0033600000SfDVLAA3',
'0033600000SfdXSAAZ',
'0033600000SfeK9AAJ',
'0033600000SffgmAAB',
'0033600000SffvCAAR',
'0033600000SfgRNAAZ',
'0033600000SfGugAAF',
'0033600000Sfgy2AAB',
'0033600000SfhHKAAZ',
'0033600000SfhpvAAB',
'0033600000SfIF8AAN',
'0033600000SfIfuAAF',
'0033600000SfjIcAAJ',
'0033600000SfjUfAAJ',
'0033600000SfkaZAAR',
'0033600000SfkfTAAR',
'0033600000SfkKrAAJ',
'0033600000SfkN4AAJ',
'0033600000SfLmfAAF',
'0033600000SflzZAAR',
'0033600000SfMCgAAN',
'0033600000SfmPmAAJ',
'0033600000SfnkqAAB',
'0033600000SfO0WAAV',
'0033600000Sfoc8AAB',
'0033600000SfOr1AAF',
'0033600000SfoudAAB',
'0033600000SfPFjAAN',
'0033600000SfpgzAAB',
'0033600000SfpHOAAZ',
'0033600000SfpLIAAZ',
'0033600000SfR1kAAF',
'0033600000SfrbAAAR',
'0033600000SfrIfAAJ',
'0033600000SfrKxAAJ',
'0033600000SfrMxAAJ',
'0033600000SfrPjAAJ',
'0033600000SfsOZAAZ',
'0033600000SfSyOAAV',
'0033600000SfTQDAA3',
'0033600000SfTR9AAN',
'0033600000SfuMvAAJ',
'0033600000SfuVqAAJ',
'0033600000SfvmcAAB',
'0033600000Sfw1fAAB',
'0033600000SfwGSAAZ',
'0033600000SfwzxAAB',
'0033600000Sfx9AAAR',
'0033600000SfXYKAA3',
'0033600000Sfy3UAAR',
'0033600000SfyHoAAJ',
'0033600000SfyNAAAZ',
'0033600000SfyZOAAZ',
'0033600000SfZbVAAV',
'0033600000SfzJ4AAJ',
'0033600000SfZlxAAF',
'0033600000SfzwDAAR',
'0033600000Sg0GlAAJ',
'0033600000Sg0mNAAR',
'0033600000Sg0u9AAB',
'0033600000Sg12AAAR',
'0033600000Sg2QRAAZ',
'0033600000Sg3qFAAR',
'0033600000Sg47dAAB',
'0033600000Sg4ZgAAJ',
'0033600000Sg7lkAAB',
'0033600000SgABIAA3',
'0033600000SgCvpAAF',
'0033600000SgDNnAAN',
'0033600000SgNwCAAV',
'0033600000SgNyXAAV',
'0033600000SgO9DAAV',
'0033600000SgOuYAAV',
'0033600000SgPtmAAF',
'0033600000SgQjAAAV')
OR q.Losing_ID IN ('0033600000Sf4xhAAB',
'0033600000Sf5jfAAB',
'0033600000Sf5qEAAR',
'0033600000Sf6xZAAR',
'0033600000SfbcHAAR',
'0033600000SfBqVAAV',
'0033600000SfClSAAV',
'0033600000SfcUnAAJ',
'0033600000SfDfKAAV',
'0033600000SfDVLAA3',
'0033600000SfdXSAAZ',
'0033600000SfeK9AAJ',
'0033600000SffgmAAB',
'0033600000SffvCAAR',
'0033600000SfgRNAAZ',
'0033600000SfGugAAF',
'0033600000Sfgy2AAB',
'0033600000SfhHKAAZ',
'0033600000SfhpvAAB',
'0033600000SfIF8AAN',
'0033600000SfIfuAAF',
'0033600000SfjIcAAJ',
'0033600000SfjUfAAJ',
'0033600000SfkaZAAR',
'0033600000SfkfTAAR',
'0033600000SfkKrAAJ',
'0033600000SfkN4AAJ',
'0033600000SfLmfAAF',
'0033600000SflzZAAR',
'0033600000SfMCgAAN',
'0033600000SfmPmAAJ',
'0033600000SfnkqAAB',
'0033600000SfO0WAAV',
'0033600000Sfoc8AAB',
'0033600000SfOr1AAF',
'0033600000SfoudAAB',
'0033600000SfPFjAAN',
'0033600000SfpgzAAB',
'0033600000SfpHOAAZ',
'0033600000SfpLIAAZ',
'0033600000SfR1kAAF',
'0033600000SfrbAAAR',
'0033600000SfrIfAAJ',
'0033600000SfrKxAAJ',
'0033600000SfrMxAAJ',
'0033600000SfrPjAAJ',
'0033600000SfsOZAAZ',
'0033600000SfSyOAAV',
'0033600000SfTQDAA3',
'0033600000SfTR9AAN',
'0033600000SfuMvAAJ',
'0033600000SfuVqAAJ',
'0033600000SfvmcAAB',
'0033600000Sfw1fAAB',
'0033600000SfwGSAAZ',
'0033600000SfwzxAAB',
'0033600000Sfx9AAAR',
'0033600000SfXYKAA3',
'0033600000Sfy3UAAR',
'0033600000SfyHoAAJ',
'0033600000SfyNAAAZ',
'0033600000SfyZOAAZ',
'0033600000SfZbVAAV',
'0033600000SfzJ4AAJ',
'0033600000SfZlxAAF',
'0033600000SfzwDAAR',
'0033600000Sg0GlAAJ',
'0033600000Sg0mNAAR',
'0033600000Sg0u9AAB',
'0033600000Sg12AAAR',
'0033600000Sg2QRAAZ',
'0033600000Sg3qFAAR',
'0033600000Sg47dAAB',
'0033600000Sg4ZgAAJ',
'0033600000Sg7lkAAB',
'0033600000SgABIAA3',
'0033600000SgCvpAAF',
'0033600000SgDNnAAN',
'0033600000SgNwCAAV',
'0033600000SgNyXAAV',
'0033600000SgO9DAAV',
'0033600000SgOuYAAV',
'0033600000SgPtmAAF',
'0033600000SgQjAAAV'))



GO
