SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





CREATE VIEW [MERGEPROCESS_New].[vw_Queue_Account]
AS
 
SELECT q.FK_MergeID, q.ObjectType,
q.Winning_ID AS Master_SFID,
q.Losing_ID AS Slave_SFID 
 FROM MERGEProcess_new.Queue q
WHERE ObjectType = 'Account'
		AND (q.winning_id IN ('0013600000bbavLAAQ',
'0013600000bbgZFAAY',
'0013600000bbh3fAAA',
'0013600000bbjLTAAY',
'0013600000bbkKgAAI',
'0013600000bbkMZAAY',
'0013600000bbkO6AAI',
'0013600000bblxPAAQ',
'0013600000bbmMbAAI',
'0013600000bbmVBAAY',
'0013600000bbp9VAAQ',
'0013600000bbtiRAAQ',
'0013600000bbYT8AAM',
'0013600000bbYusAAE',
'0013600000bbZI7AAM',
'0013600000bbZJQAA2',
'0013600000bbZvLAAU',
'0013600000bc2otAAA',
'0013600000bc2vwAAA',
'0013600000bc436AAA',
'0013600000bc4e4AAA',
'0013600000bc533AAA',
'0013600000bc7nPAAQ',
'0013600000bcaEvAAI',
'0013600000bcaUFAAY',
'0013600000bcb66AAA',
'0013600000bcBccAAE',
'0013600000bcc4xAAA',
'0013600000bcCWsAAM',
'0013600000bcCXGAA2',
'0013600000bcD5xAAE',
'0013600000bcDsOAAU',
'0013600000bceKaAAI',
'0013600000bcFErAAM',
'0013600000bcG4ZAAU',
'0013600000bcgEXAAY',
'0013600000bcGPuAAM',
'0013600000bchIWAAY',
'0013600000bcHOYAA2',
'0013600000bcHQ1AAM',
'0013600000bchwSAAQ',
'0013600000bcI0PAAU',
'0013600000bciCeAAI',
'0013600000bciMDAAY',
'0013600000bciMNAAY',
'0013600000bcIwSAAU',
'0013600000bcj7IAAQ',
'0013600000bcL84AAE',
'0013600000bcLNPAA2',
'0013600000bclWAAAY',
'0013600000bcMR7AAM',
'0013600000bcn9VAAQ',
'0013600000bcnDvAAI',
'0013600000bcofpAAA',
'0013600000bcRk9AAE',
'0013600000bcRTjAAM',
'0013600000bcSczAAE',
'0013600000bcYMmAAM',
'0013600000gT2koAAC',
'0013600000h9D28AAE',
'0013600000q9VD9AAM',
'0013600000ttCK8AAM',
'0013600000zRo1JAAS',
'00136000012ylWeAAI',
'001360000155W3wAAE',
'00136000016NcKjAAK',
'00136000016NdPaAAK',
'00136000018BrhQAAS',
'00136000018FqhhAAC',
'0013600001BpPslAAF',
'0013600001bWNLuAAO',
'0013600001cFRWTAA4',
'0013600001cH6ffAAC',
'0013600001F9kKCAAZ',
'0013600001FAg7RAAT',
'0013600001fln2TAAQ',
'0013600001H5ifOAAR',
'0013600001H5jLqAAJ',
'0013600001HHiE2AAL',
'0013600001Jz5l2AAB',
'0013600001Jz5nlAAB',
'0013600001KTQ3SAAX',
'0013600001Pj4kxAAB',
'0013600001Pm59iAAB',
'0013600001QnN2VAAV',
'0013600001VpmZ7AAJ',
'0013600001YyPL5AAN')
OR q.losing_id IN ('0013600000bbavLAAQ',
'0013600000bbgZFAAY',
'0013600000bbh3fAAA',
'0013600000bbjLTAAY',
'0013600000bbkKgAAI',
'0013600000bbkMZAAY',
'0013600000bbkO6AAI',
'0013600000bblxPAAQ',
'0013600000bbmMbAAI',
'0013600000bbmVBAAY',
'0013600000bbp9VAAQ',
'0013600000bbtiRAAQ',
'0013600000bbYT8AAM',
'0013600000bbYusAAE',
'0013600000bbZI7AAM',
'0013600000bbZJQAA2',
'0013600000bbZvLAAU',
'0013600000bc2otAAA',
'0013600000bc2vwAAA',
'0013600000bc436AAA',
'0013600000bc4e4AAA',
'0013600000bc533AAA',
'0013600000bc7nPAAQ',
'0013600000bcaEvAAI',
'0013600000bcaUFAAY',
'0013600000bcb66AAA',
'0013600000bcBccAAE',
'0013600000bcc4xAAA',
'0013600000bcCWsAAM',
'0013600000bcCXGAA2',
'0013600000bcD5xAAE',
'0013600000bcDsOAAU',
'0013600000bceKaAAI',
'0013600000bcFErAAM',
'0013600000bcG4ZAAU',
'0013600000bcgEXAAY',
'0013600000bcGPuAAM',
'0013600000bchIWAAY',
'0013600000bcHOYAA2',
'0013600000bcHQ1AAM',
'0013600000bchwSAAQ',
'0013600000bcI0PAAU',
'0013600000bciCeAAI',
'0013600000bciMDAAY',
'0013600000bciMNAAY',
'0013600000bcIwSAAU',
'0013600000bcj7IAAQ',
'0013600000bcL84AAE',
'0013600000bcLNPAA2',
'0013600000bclWAAAY',
'0013600000bcMR7AAM',
'0013600000bcn9VAAQ',
'0013600000bcnDvAAI',
'0013600000bcofpAAA',
'0013600000bcRk9AAE',
'0013600000bcRTjAAM',
'0013600000bcSczAAE',
'0013600000bcYMmAAM',
'0013600000gT2koAAC',
'0013600000h9D28AAE',
'0013600000q9VD9AAM',
'0013600000ttCK8AAM',
'0013600000zRo1JAAS',
'00136000012ylWeAAI',
'001360000155W3wAAE',
'00136000016NcKjAAK',
'00136000016NdPaAAK',
'00136000018BrhQAAS',
'00136000018FqhhAAC',
'0013600001BpPslAAF',
'0013600001bWNLuAAO',
'0013600001cFRWTAA4',
'0013600001cH6ffAAC',
'0013600001F9kKCAAZ',
'0013600001FAg7RAAT',
'0013600001fln2TAAQ',
'0013600001H5ifOAAR',
'0013600001H5jLqAAJ',
'0013600001HHiE2AAL',
'0013600001Jz5l2AAB',
'0013600001Jz5nlAAB',
'0013600001KTQ3SAAX',
'0013600001Pj4kxAAB',
'0013600001Pm59iAAB',
'0013600001QnN2VAAV',
'0013600001VpmZ7AAJ',
'0013600001YyPL5AAN'))
GO
