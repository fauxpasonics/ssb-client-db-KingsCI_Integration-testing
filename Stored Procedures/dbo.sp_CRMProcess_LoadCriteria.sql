SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[sp_CRMProcess_LoadCriteria]
@ObjectType VARCHAR(50), @Object VARCHAR(50), @ViewOnly BIT = 0
AS 

-- dbo.sp_CRMProcess_LoadCriteria 'Custom','Contact', 1
--DECLARE @ObjectType VARCHAR(50), @Object VARCHAR(50), @ViewOnly bit
--SET @Object = 'Contact'
--SET @ObjectType = 'Std'
--SET @ViewOnly = 1

IF @ViewOnly = 0
BEGIN
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LoadCriteria_TblA')
DROP TABLE dbo.LoadCriteria_TblA

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LoadCriteria_DW')
DROP TABLE dbo.LoadCriteria_DW

IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'LoadCriteria_CRM')
DROP TABLE dbo.LoadCriteria_CRM
END

DECLARE @JoinCol VARCHAR(50)
, @DWTableName VARCHAR(50)
, @CRMIdCol VARCHAR(50), @CRMGUIDCol VARCHAR(50)

SET @DWTableName = CASE WHEN @ObjectType = 'Custom' THEN @Object + '_Custom' ELSE @Object END
SET @ObjectType = @Object + '_' + @ObjectType
SET @JoinCol = CASE WHEN @Object = 'Account' THEN 'SSB_CRMSYSTEM_ACCT_ID' 
					WHEN @Object = 'Contact' THEN 'SSB_CRMSYSTEM_CONTACT_ID'
					ELSE '' END
SET @CRMIdCol = CASE WHEN @Object = 'Account' THEN 'id' 
					WHEN @Object = 'Contact' THEN 'contaidctid'
					ELSE 'contactid' END
SET @CRMGUIDCol = CASE WHEN @Object = 'Account' THEN 'SSB_CRMSYSTEM_ACCT_ID__C'
						WHEN @Object = 'Contact' THEN 'SSB_CRMSYSTEM_CONTACT_ID__C'
						ELSE '' END

DECLARE @MappingTbl TABLE (
UID INT IDENTITY(1,1)
, MappingID INT
, DW_Table VARCHAR(50)
, CRM_Table VARCHAR(50)
)

INSERT INTO @MappingTbl
        ( [MappingID] ,
          [DW_Table] ,
          [CRM_Table]
        )
SELECT [MappingID], [DW_Table], [CRM_Table] FROM [dbo].[CRMProcess_Mappings]
WHERE [ObjectType] = @ObjectType
AND enabled = 1

DECLARE @Loop INT
DECLARE @LoopCounter INT
DECLARE @PreColText VARCHAR(50), @PostColText VARCHAR(50)
SET @PreColText = 'ISNULL(LTRIM(RTRIM('
SET @PostColText = ')),'''')
'
SET @Loop = (Select MAX(UID) FROM @MappingTbl)
SET @LoopCounter = 1

DECLARE @DW_Column VARCHAR(MAX), @CRM_Column VARCHAR(MAX), @DWColView VARCHAR(MAX), @CRMColView VARCHAR(MAX)
, @DWSQL VARCHAR(MAX), @CRMSQL VARCHAR(MAX)
, @DWSQLEnd VARCHAR(4000), @CRMSQLEnd VARCHAR(4000)
, @HashStart VARCHAR(500), @HashEnd VARCHAR(500), @DWHashSQL VARCHAR(MAX), @CRMHashSQL VARCHAR(MAX)
, @SQLCompare VARCHAR(4000)

SET @SQLCompare = '/*Select '
SET @DWHashSQL = ''
SET @CRMHashSQL = ''
SET @HashStart = ', HASHBYTES(''SHA2_256'', '
SET @HashEnd = ') Hash '

SET @DWColView = ''
SET @CRMColView = ''

SET @DWSQL = 'SELECT a.[' + @JoinCol + '], b.crm_id'
SET @DWSQLEnd = 'INTO dbo.LoadCriteria_DW FROM dbo.[' + @DWTableName + '] a INNER JOIN dbo.LoadCriteria_TblA b ON [b].[' + @JoinCol + '] = [a].[' + @JoinCol + ']'
SET @CRMSQL = 'SELECT b.[' + @JoinCol + '], ' + @CRMIdCol 
SET @CRMSQLEnd = 'INTO dbo.LoadCriteria_CRM FROM ProdCopy.vw_' + @Object + ' a INNER JOIN dbo.LoadCriteria_TblA b ON a.' + @CRMIdCol + ' = b.[crm_id]'


WHILE @Loop >= @LoopCounter
BEGIN

	SET @DW_Column = (SELECT CASE WHEN [DW_Table] = @JoinCol THEN 'a.' + [DW_Table] ELSE [DW_Table] END FROM @MappingTbl WHERE UID = @LoopCounter)
	SET @CRM_Column = (SELECT [CRM_Table] FROM @MappingTbl WHERE UID = @LoopCounter)

	SET @SQLCompare = @SQLCompare + CASE WHEN @DW_Column LIKE '%(%' THEN 'DWTest' + LTRIM(RTRIM(STR(@LoopCounter))) ELSE @DW_Column END + ', ' 
								+ CASE WHEN @CRM_Column LIKE '%(%' THEN 'CRMTest' + LTRIM(RTRIM(STR(@LoopCounter))) ELSE @CRM_Column END + ', '

	SET @DWColView = @DWColView + ', ' + (SELECT CASE WHEN [DW_Table] = @JoinCol THEN 'a.' + [DW_Table] + ' JoinCol' 
											ELSE 
												[DW_Table] + ' ' + CASE WHEN [DW_Table] LIKE '%(%' THEN 'DWTest' + LTRIM(RTRIM(STR(@LoopCounter))) ELSE DW_Table END 
											END FROM @MappingTbl WHERE UID = @LoopCounter)
	
	SET @CRMColView = @CRMColView + ', ' + (SELECT CRM_TABLE + ' ' + CASE WHEN [CRM_Table] LIKE '%(%' THEN 'CRMTest' + LTRIM(RTRIM(STR(@LoopCounter))) ELSE CRM_TABLE END 
											FROM @MappingTbl WHERE UID = @LoopCounter)

	SET @DW_Column = CASE WHEN @LoopCounter > 1 THEN ' + ' ELSE '' END + @PreColText + @DW_Column + @PostColText
	SET @CRM_Column = CASE WHEN @LoopCounter > 1 THEN ' + ' ELSE '' END + @PreColText + @CRM_Column + @PostColText

	
	SET @DWHashSQL = @DWHashSQL + @DW_Column
	SET @CRMHashSQL = @CRMHashSQL + @CRM_Column

	SET @LoopCounter = @LoopCounter + 1
	SET @DW_Column = ''
	SET @CRM_Column = ''
		
END

SET @DWSQL = @DWSQL + @DWColView + @HashStart + @DWHashSQL + @HashEnd + @DWSQLEnd
SET @CRMSQL = @CRMSQL + @CRMColView + @HashStart + @CRMHashSQL + @HashEnd + @CRMSQLEnd

DECLARE @TmpTblSQL NVARCHAR(4000)
SET @TmpTblSQL = 'SELECT DISTINCT b.[' + @JoinCol + '], [b].[crm_id]
, CASE WHEN 1=1 AND b.[' + @JoinCol + '] = b.[crm_id] THEN ''Upsert'' ELSE ''UPDATE'' END LoadType
INTO dbo.LoadCriteria_TblA
FROM wrk.[customerWorkingList] a 
INNER JOIN dbo.' + @Object + ' b ON a.[SSB_CRMSYSTEM_ACCT_ID] = b.[SSB_CRMSYSTEM_ACCT_ID]
WHERE 1=1
AND b.[' + @JoinCol + '] <> b.[crm_id]'

PRINT @TmpTblSQL
PRINT @DWSQL
PRINT @CRMSQL

DECLARE @InsertSQL NVARCHAR(4000), @InsertFromSQL NVARCHAR(4000)
SET @InsertSQL = 'INSERT INTO dbo.[CRMLoad_' + @Object + '_ProcessLoad_Criteria]
        ( [' + @JoinCol + '] ,
          LoadType,
		  [ObjectType]
        )
SELECT Distinct a.[' + @JoinCol + '], [z].[LoadType], ''' + @ObjectType + ''' ObjectType'
SET @InsertFromSQL = '
FROM [dbo].[LoadCriteria_DW] a
INNER JOIN [dbo].[LoadCriteria_CRM] b ON a.[crm_id] = b.' + @CRMIdCol + '
INNER JOIN dbo.LoadCriteria_TblA z ON a.[' + @JoinCol + '] = z.[' + @JoinCol + ']
WHERE a.[Hash] <> b.[Hash]
AND a.[' + @JoinCol + '] NOT IN (SELECT pl.[' + @JoinCol + '] FROM dbo.[CRMLoad_' + @Object + '_ProcessLoad_Criteria] pl Where pl.ObjectType = '''+@ObjectType+''')'

SET @SQLCompare = LEFT(RTRIM(@SQLCompare),LEN(RTRIM(@SQLCompare))-1) + @InsertFromSQL + '*/'
PRINT @SQLCompare

IF @ViewOnly = 1
BEGIN
	SELECT @TmpTblSQL
	SELECT @DWSQL
	SELECT @CRMSQL
	SELECT @InsertSQL + ' ' + @InsertFromSQL
	RETURN
END
ELSE
BEGIN

DECLARE @SQL NVARCHAR(4000)
SET @SQL = @TmpTblSQL 
PRINT 'Create Temp TblA'
EXEC sp_executesql @SQL 
SET @SQL = @DWSQL 
PRINT 'Create DW Table'
EXEC sp_executesql @SQL 
SET @SQL = @CRMSQL 
PRINT 'Create CRM Table'
EXEC sp_executesql @SQL 
SET @SQL = @InsertSQL + ' ' + @InsertFromSQL
PRINT 'INSERT INTO PL'
EXEC sp_executesql @SQL 

END
-- dbo.sp_CRMProcess_LoadCriteria 'std','account', 1


GO
