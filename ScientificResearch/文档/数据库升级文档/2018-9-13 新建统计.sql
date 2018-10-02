
CREATE PROC [dbo].[sp_论文成果统计] 
AS
DECLARE @收录情况 NVARCHAR(1000);
SET @收录情况 = '未指定,北大省级,中华医学会中华系列期刊库,科技统计源期刊库'
    DECLARE @sql NVARCHAR(2000);
--DECLARE @合计 NVARCHAR(1000) = N'未指定 + 北大省级 + 中华医学会中华系列期刊库 + 科技统计源期刊库';
    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@收录情况, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');

--DECLARE @sqlIn  NVARCHAR(1000)= N'[未指定],[北大省级],[中华医学会中华系列期刊库],[科技统计源期刊库]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@收录情况, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(未指定) ,SUM(北大省级) ,SUM(中华医学会中华系列期刊库) ,SUM(科技统计源期刊库)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@收录情况, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 ,
                        c.收录情况
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果论文 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 1
						JOIN 流程 b1 ON b1.流程模板编号 = 300 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        LEFT JOIN 期刊 c ON b.刊物编号 = c.编号
             ),
        cteSplit
          AS ( SELECT   cte.部门名称 as 部门,
                        ISNULL(Split.分解后的收录情况, ''未指定'') AS 分解后的收录情况
               FROM     cte
                        OUTER APPLY ( SELECT    ID AS 分解后的收录情况
                                      FROM      dbo.SplitStringToTable(cte.收录情况,
                                                              '','')
                                    ) AS Split
             ),
        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cteSplit PIVOT ( COUNT(分解后的收录情况) FOR 分解后的收录情况 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;
GO



CREATE PROC sp_获奖成果统计
AS
    DECLARE @获奖级别 NVARCHAR(1000);

    SELECT  @获奖级别 = STUFF(( SELECT  ',' + 值
                            FROM    字典
                            WHERE   分类 = '获奖级别'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');

    DECLARE @sql NVARCHAR(2000);

    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@获奖级别, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');


    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@获奖级别, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@获奖级别, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 as 部门 ,
                        b.获奖级别
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果获奖 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 4
						JOIN 流程 b1 ON b1.流程模板编号 = 303 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cte PIVOT ( COUNT(获奖级别) FOR 获奖级别 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

GO


CREATE PROC sp_著作成果统计
AS
    DECLARE @著作类型 NVARCHAR(1000);

    SELECT  @著作类型 = STUFF(( SELECT  ',' + 值
                            FROM    字典
                            WHERE   分类 = '著作类型'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');
						  --SELECT @著作类型;
    DECLARE @sql NVARCHAR(2000);

    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@著作类型, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
		
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@著作类型, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@著作类型, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 as 部门,
                        b.著作类型
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果著作 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 2
						JOIN 流程 b1 ON b1.流程模板编号 = 301 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cte PIVOT ( COUNT(著作类型) FOR 著作类型 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

	GO
    
	
CREATE PROC sp_专利成果统计
AS
    DECLARE @专利类型 NVARCHAR(1000);

    SELECT  @专利类型 = STUFF(( SELECT  ',' + 值
                            FROM    字典
                            WHERE   分类 = '专利类型'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');
						  --SELECT @专利类型;
    DECLARE @sql NVARCHAR(2000);

    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@专利类型, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
		
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@专利类型, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@专利类型, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 as 部门,
                        b.专利类型
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果专利 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 3
						JOIN 流程 b1 ON b1.流程模板编号 = 302 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cte PIVOT ( COUNT(专利类型) FOR 专利类型 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

	GO
    

--sp_按部门统计成果 '部门名称','部门'
--sp_按部门统计成果 '职务名称','职务'
--sp_按部门统计成果 '专业技术级别','专业技术级别'
--sp_按部门统计成果 '岗位类型','岗位类型'
--sp_按部门统计成果 '学历','学历'
--sp_按部门统计成果 '学科门类','学科门类'

CREATE PROC [dbo].[sp_按指定字段统计成果] (@字段名 NVARCHAR(100),@字段显示名 NVARCHAR(50))
AS

DECLARE @收录情况 NVARCHAR(1000);
SET @收录情况 = '未指定,北大省级,中华医学会中华系列期刊库,科技统计源期刊库'

--DECLARE @获奖级别 NVARCHAR(1000);

--    SELECT  @获奖级别 = STUFF(( SELECT  ',' + 值
--                            FROM    字典
--                            WHERE   分类 = '获奖级别'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');

-- DECLARE @著作类型 NVARCHAR(1000);

--    SELECT  @著作类型 = STUFF(( SELECT  ',' + 值
--                            FROM    字典
--                            WHERE   分类 = '著作类型'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');
--						  --SELECT @著作类型;

-- DECLARE @专利类型 NVARCHAR(1000);

--    SELECT  @专利类型 = STUFF(( SELECT  ',' + 值
--                            FROM    字典
--                            WHERE   分类 = '专利类型'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');
--						  --SELECT @专利类型;

DECLARE @列 NVARCHAR(2000);
--SET @列 = CONCAT(@收录情况,',',@获奖级别,',',@著作类型,',',@专利类型);
SET @列 = CONCAT('获奖',',','著作',',','专利',',',@收录情况);

    DECLARE @sql NVARCHAR(MAX);
--DECLARE @合计 NVARCHAR(1000) = N'未指定 + 北大省级 + 中华医学会中华系列期刊库 + 科技统计源期刊库';
    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@列, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');

--DECLARE @sqlIn  NVARCHAR(1000)= N'[未指定],[北大省级],[中华医学会中华系列期刊库],[科技统计源期刊库]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@列, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(未指定) ,SUM(北大省级) ,SUM(中华医学会中华系列期刊库) ,SUM(科技统计源期刊库)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@列, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.',@字段名,' ,
                        c.收录情况 
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果论文 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 1
						JOIN 流程 b1 ON b1.流程模板编号 = 300 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        LEFT JOIN 期刊 c ON b.刊物编号 = c.编号
             ),

        cteSplit
          AS ( SELECT   cte.',@字段名,' as ',@字段显示名,',
                        ISNULL(Split.分解后的收录情况, ''未指定'') as 列
               FROM     cte
                        OUTER APPLY ( SELECT    ID AS 分解后的收录情况
                                      FROM      dbo.SplitStringToTable(cte.收录情况,
                                                              '','')
                                    ) AS Split
             ),

		cte获奖
          AS ( SELECT   a1.',@字段名,' as ',@字段显示名,' ,
                        ''获奖''   as 列
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果获奖 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 4
						JOIN 流程 b1 ON b1.流程模板编号 = 303 AND b.编号 = b1.项目编号 AND b1.状态 = 1
             ),

		cte著作
          AS ( SELECT   a1.',@字段名,' as ',@字段显示名,',
                        ''著作''   as 列
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果著作 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 2
						JOIN 流程 b1 ON b1.流程模板编号 = 301 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        
             ),

		cte专利
          AS ( SELECT   a1.',@字段名,' as ',@字段显示名,',
                        ''专利''   as 列
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果专利 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 3
						JOIN 流程 b1 ON b1.流程模板编号 = 302 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        
             ),
		cteAll as(
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cte获奖 union all
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cte著作 union all
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cte专利 union all
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cteSplit
		),
        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cteAll PIVOT ( COUNT(列) FOR 列 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;
GO
