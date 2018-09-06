

ALTER VIEW [dbo].[v2_纵向项目立项_列表]
AS
    SELECT  a.编号 ,
            a.分类 ,
            a.项目编号 AS 纵向项目项目编号 ,
            CASE a.分类
              WHEN 1 THEN '科研项目'
              WHEN 2 THEN '重点学科'
              WHEN 3 THEN '人才培养'
            END AS 分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --b.名称 AS 成果归属部门名称 ,
            a.负责人编号 ,
            c.工号 AS 负责人工号 ,
            c.姓名 AS 负责人姓名 ,
            c.部门编号 AS 负责人部门编号 ,
            c.部门名称 AS 负责人部门名称 ,
            a.登记人编号 ,
            d.姓名 AS 登记人姓名
    FROM    dbo.纵向项目立项 a --LEFT JOIN 部门 b ON a.成果归属部门编号 = b.编号
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.负责人编号 = c.编号
            LEFT JOIN 人员 d ON a.登记人编号 = d.编号;

			GO

ALTER FUNCTION [dbo].[tfn_纵向项目立项] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

			GO

ALTER FUNCTION [dbo].[tfn_纵向项目变更]
    (
      @人员编号 INT ,
      @立项流程模板编号 INT ,
      @变更流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.变更内容简介 ,
            b.变更事由 ,
            b.变更备注 ,
            b.变更时间 ,
            a.编号 AS 纵向项目立项编号 ,
            a.纵向项目项目编号 ,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号 ,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
            a.登记人编号 AS 立项登记人编号 ,
            a.登记人姓名 AS 立项登记人姓名 ,
            IIF(c.状态 IS NULL, '未发起变更', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--按立项项目分组,是否有未完成的变更,有则不能发起
		--如果状态为null则表示还没有开始变更,如果=1则表示该变更已经结束,都不参与计数,否则+1,最后计算 = 0则可以发起变更
		--同时@人员编号等于流程立项登记人编号,才能发起变更;
            CAST(IIF(COUNT(IIF(c.状态 IS NULL
                           OR c.状态 = 1, NULL, 1)) OVER ( PARTITION BY a.编号 ) = 0
            AND @人员编号 IN ( a.登记人编号, a.负责人编号 ), 1, 0) AS BIT) AS '是否可发起变更'
			--iif(EXISTS ( SELECT 1
   --                                              FROM   流程 d
   --                                              WHERE  d.流程模板编号 = @变更流程模板编号
   --                                                     AND d.项目编号 = a.编号
   --                                                     AND d.状态 <> 1 ) or @人员编号 <> a.登记人编号,0,1) AS  '是否可发起变更2'
    FROM    dbo.v2_纵向项目立项_列表 a
            LEFT JOIN 纵向项目变更 b ON a.编号 = b.纵向项目编号
            OUTER APPLY dbo.tfn_流程(@变更流程模板编号, ISNULL(b.编号, 0), @人员编号) c
            --OUTER APPLY ( SELECT    IIF(EXISTS ( SELECT 1
            --                                     FROM   流程 d
            --                                     WHERE  d.流程模板编号 = @变更流程模板编号
            --                                            AND d.项目编号 = a.编号
            --                                            AND d.状态 <> 1 ), 0, 1) AS 已有变更是否都完成
            --            ) e
    WHERE   --立项流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @立项流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在已经任何状态的结题
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.纵向项目结题
                             WHERE  纵向项目编号 = a.编号 ); 

							 GO

							 
ALTER FUNCTION [dbo].[tfn_纵向项目结题]
    (
      @人员编号 INT ,
      @立项流程模板编号 INT ,
      @中检流程模板编号 INT ,
      @变更流程模板编号 INT ,
      @结题流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.纵向项目编号 ,
            b.结题验收编号 ,
            b.结题验收时间 ,
            b.结题验收是否合格 ,
            b.结题验收参与人数 ,
            b.结题资料路径 ,
            b.备注 ,
            b.建立时间 ,
            a.编号 AS 纵向项目立项编号 ,
			a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
			a.登记人编号 AS 立项登记人编号,
			a.登记人姓名 AS 立项登记人姓名,
            IIF(c.状态 IS NULL, '未发起结题', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--如果状态为null则表示还没有开始结题,则可发起结题,否则不能
            CAST(IIF(c.状态 IS NULL, 1, 0)AS BIT) AS '是否可发起结题'
    FROM    dbo.v2_纵向项目立项_列表 a
            LEFT JOIN dbo.纵向项目结题 b ON a.编号 = b.纵向项目编号
            OUTER APPLY dbo.tfn_流程(@结题流程模板编号, ISNULL(b.编号,0), @人员编号) c
    WHERE   --立项流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @立项流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在未完成的中检
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.流程 m JOIN dbo.纵向项目中检 n ON m.流程模板编号=@中检流程模板编号 AND m.项目编号 = n.编号
                             WHERE  a.编号 = n.纵向项目编号 AND m.状态 <> 1)
			--不存在未完成的变更
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.流程 m JOIN dbo.纵向项目变更 n ON m.流程模板编号=@变更流程模板编号 AND m.项目编号 = n.编号
                             WHERE  a.编号 = n.纵向项目编号 and m.状态 <> 1);
							

GO

ALTER FUNCTION [dbo].[tfn_纵向项目中检]
    (
      @人员编号 INT ,
      @立项流程模板编号 INT ,
      @中检流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.纵向项目编号 ,
            b.中检资料路径 ,
            b.备注 ,
            b.建立时间 ,
			a.编号 AS 纵向项目立项编号,
			a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
			a.登记人编号 AS 立项登记人编号,
			a.登记人姓名 AS 立项登记人姓名,
            IIF(c.状态 IS NULL,'未发起中检', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--按立项项目分组,是否有未完成的中检,有则不能发起
		--如果状态为null则表示还没有开始中检,如果=1则表示该中检已经结束,都不参与计数,否则+1,最后计算 = 0则可以发起中检
            CAST(IIF(COUNT(IIF(c.状态 IS NULL
                      OR c.状态 = 1, NULL, 1)) OVER ( PARTITION BY a.编号 ) = 0, 1, 0) AS bit) AS '是否可发起中检'
    FROM    dbo.v2_纵向项目立项_列表 a
            LEFT JOIN 纵向项目中检 b ON a.编号 = b.纵向项目编号
			--下面不能用dbo.tfn_流程(@中检流程模板编号, b.编号, @人员编号),因为b.编号为null的时候,将会取出所有编号流程,那么其中的c.状态都不对了.
			--也就是说,tfn_流程中的"项目编号 = ISNULL(@项目编号, 项目编号)"条件在这里有点画蛇添足;
            OUTER APPLY dbo.tfn_流程(@中检流程模板编号, ISNULL(b.编号,0), @人员编号) c
    WHERE   --立项流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @立项流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在已经任何状态的结题
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.纵向项目结题
                             WHERE  纵向项目编号 = a.编号 ); 

GO



ALTER VIEW [dbo].[v3_项目经费报销_纵向]
AS
    SELECT  a.编号,
	a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号 ,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
            a.登记人编号 ,
            a.登记人姓名 ,
            a.批准经费 + a.配套经费 AS 经费 ,
            IIF(a.批准经费 + a.配套经费 - b.待审核报销 - b.已审核报销>0,a.批准经费 + a.配套经费 - b.待审核报销 - b.已审核报销,0) AS 剩余经费 ,
            ISNULL(b.待审核报销,0) AS 待审核报销,
            ISNULL(b.已审核报销,0) AS 已审核报销
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY ( SELECT    SUM(CASE b2.状态
                                            WHEN 0 THEN b1.报销金额
                                            ELSE 0
                                          END) AS 待审核报销 ,
                                    SUM(CASE b2.状态
                                            WHEN 1 THEN b1.报销金额
                                            ELSE 0
                                          END) AS 已审核报销
                          FROM      dbo.报销 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 600
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 410
                                    AND b1.项目编号 = a.编号
                        ) b;

GO



ALTER VIEW [dbo].[v3_项目经费到账_纵向]
AS
    SELECT  a.编号,
	a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号 ,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
            a.登记人编号 ,
            a.登记人姓名 ,
            a.批准经费 + a.配套经费 AS 经费 ,
            IIF(a.批准经费 + a.配套经费 - b.待审核到账 - b.已审核到账>0,a.批准经费 + a.配套经费 - b.待审核到账 - b.已审核到账,0) AS 未到经费 ,
            ISNULL(b.待审核到账,0) AS  待审核到账,
            ISNULL(b.已审核到账,0) AS 已审核到账
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY ( SELECT    SUM(CASE b2.状态
                                            WHEN 0 THEN b1.到账金额
                                            ELSE 0
                                          END) AS 待审核到账 ,
                                    SUM(CASE b2.状态
                                            WHEN 1 THEN b1.到账金额
                                            ELSE 0
                                          END) AS 已审核到账
                          FROM      项目经费到账 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 500
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 410
                                    AND b1.项目编号 = a.编号
                        ) b;




GO


ALTER VIEW [dbo].[v4_纵向项目总览] AS
SELECT  a.* ,
        b.名称 ,
        b.项目编号 ,
        b.路径 ,
        b.发起人编号 ,
        CONCAT(b.状态名称, '-', b.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.v3_流程 b ON b.流程模板编号 = 410
                            AND a.编号 = b.项目编号
UNION ALL
SELECT  a.* ,
        c.名称 ,
        c.项目编号 ,
        c.路径 ,
        c.发起人编号 ,
        CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.纵向项目中检 b ON a.编号 = b.纵向项目编号
        JOIN dbo.v3_流程 c ON c.流程模板编号 = 420
                            AND b.编号 = c.项目编号
UNION ALL
SELECT  a.* ,
        c.名称 ,
        c.项目编号 ,
        c.路径 ,
        c.发起人编号 ,
        CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.纵向项目变更 b ON a.编号 = b.纵向项目编号
        JOIN dbo.v3_流程 c ON c.流程模板编号 = 430
                            AND b.编号 = c.项目编号
UNION ALL
SELECT  a.* ,
        c.名称 ,
        c.项目编号 ,
        c.路径 ,
        c.发起人编号 ,
        CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.纵向项目结题 b ON a.编号 = b.纵向项目编号
        JOIN dbo.v3_流程 c ON c.流程模板编号 = 440
                            AND b.编号 = c.项目编号;





GO




