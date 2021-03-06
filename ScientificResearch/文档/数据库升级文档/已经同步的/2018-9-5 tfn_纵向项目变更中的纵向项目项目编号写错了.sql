
/****** Object:  UserDefinedFunction [dbo].[tfn_纵向项目变更]    Script Date: 2018/9/5 10:59:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
            a.登记人编号 AS 立项登记人编号 ,
            a.登记人姓名 AS 立项登记人姓名 ,
            IIF(c.状态 IS NULL, '未发起变更', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--按立项项目分组,是否有未完成的变更,有则不能发起
		--如果状态为null则表示还没有开始变更,如果=1则表示该变更已经结束,都不参与计数,否则+1,最后计算 = 0则可以发起变更
		--同时@人员编号等于流程立项登记人编号,才能发起变更;
            CAST(IIF(COUNT(IIF(c.状态 IS NULL OR c.状态 = 1, NULL, 1)) OVER ( PARTITION BY a.编号 ) = 0
            AND @人员编号 in (a.登记人编号,a.负责人编号), 1, 0) AS BIT) AS '是否可发起变更'
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
