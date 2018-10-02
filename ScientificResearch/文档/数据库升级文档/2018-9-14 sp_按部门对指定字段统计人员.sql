
--sp_按部门对指定字段统计人员 '学历'
CREATE PROC [dbo].[sp_按部门对指定字段统计人员]
    (
      @字段名 NVARCHAR(100) 
    )
AS
    
    DECLARE @列 NVARCHAR(2000);

    SELECT  @列 = STUFF(( SELECT ',' + 值
                         FROM   字典
                         WHERE  分类 = @字段名
                       FOR
                         XML PATH('')
                       ), 1, 0, '未指定');

    --SELECT  @列;
    DECLARE @sql NVARCHAR(MAX);

	--DECLARE @合计 NVARCHAR(1000) = N'未指定 + 北大省级 + 中华医学会中华系列期刊库 + 科技统计源期刊库';
    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+[' + ID+']'
                          FROM      dbo.SplitStringToTable(@列, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
    --SELECT  @合计;

	--DECLARE @sqlIn  NVARCHAR(1000)= N'[未指定],[北大省级],[中华医学会中华系列期刊库],[科技统计源期刊库]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@列, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');
    --SELECT  @sqlIn;

	--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(未指定) ,SUM(北大省级) ,SUM(中华医学会中华系列期刊库) ,SUM(科技统计源期刊库)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum([' + ID + '])'
                                 FROM   dbo.SplitStringToTable(@列, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');
    --SELECT  @sqlSelect;

    SET @sql = CONCAT(N'
	WITH cte AS (SELECT a.部门名称,iif(', @字段名, ' IS NULL OR ', @字段名, '='''',''未指定'',', @字段名, ')AS 列 FROM dbo.v1_人员_带部门名 a),
         ctePivot AS ( SELECT   * ,', @合计, ' AS 合计
			FROM cte PIVOT ( COUNT(列) FOR 列 IN ( ', @sqlIn, ' ) )  AS t)
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

    --SELECT  @sql;

    EXEC sys.sp_executesql @sql;
GO
