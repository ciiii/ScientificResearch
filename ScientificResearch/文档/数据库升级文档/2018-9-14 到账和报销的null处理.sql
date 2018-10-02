
ALTER VIEW [dbo].[v3_项目经费到账_横向]
AS
    SELECT  a.* ,
            a.合同金额 AS 经费 ,
            IIF(a.合同金额 - b.待审核到账 - b.已审核到账>0,a.合同金额 - b.待审核到账 - b.已审核到账,0) AS 未到经费 ,
            b.待审核到账 AS 待审核到账 ,
            b.已审核到账 AS 已审核到账
    FROM    dbo.v2_横向项目_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 待审核到账 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 已审核到账
                          FROM      项目经费到账 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 510
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 450
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
            b.待审核到账 AS  待审核到账,
            b.已审核到账 AS 已审核到账
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 待审核到账 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 已审核到账
                          FROM      项目经费到账 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 500
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 410
                                    AND b1.项目编号 = a.编号
                        ) b;
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
            b.待审核报销 AS 待审核报销,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 待审核报销 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 已审核报销
                          FROM      dbo.报销 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 600
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 410
                                    AND b1.项目编号 = a.编号
                        ) b;


GO


ALTER VIEW [dbo].[v3_项目经费报销_横向]
AS
    SELECT  a.* ,
            a.合同金额 AS 经费 ,
            IIF(a.合同金额 - b.待审核报销 - b.已审核报销>0,a.合同金额 - b.待审核报销 - b.已审核报销,0) AS 剩余经费 ,
            b.待审核报销 AS 待审核报销 ,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v2_横向项目_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 待审核报销 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 已审核报销
                          FROM      dbo.报销 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 600
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 450
                                    AND b1.项目编号 = a.编号
                        ) b;
GO

CREATE VIEW [dbo].[v4_横向项目经费统计]
AS
SELECT 
       a.项目负责人部门名称 ,
       SUM(a.经费 ) AS 经费,
       SUM(a.未到经费) AS 未到经费 ,
       SUM(a.待审核到账 ) AS 待审核到账,
       SUM(a.已审核到账 ) AS 已审核到账,
       --SUM(b.剩余经费) AS 剩余经费 ,
       SUM(b.待审核报销 ) AS 待审核报销,
       SUM(b.已审核报销) AS 已审核报销 FROM dbo.v3_项目经费到账_横向 a JOIN v3_项目经费报销_横向 b ON a.编号 = b.编号 GROUP BY a.项目负责人部门名称;

GO



CREATE VIEW [dbo].[v4_横向项目汇总]
AS
    SELECT  a1.状态名称,a1.步骤名称, a1.步骤状态说明,
            a.*,
            b.剩余经费 ,
            b.待审核报销 ,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v3_项目经费到账_横向 a LEFT JOIN dbo.v3_流程 a1 ON a1.流程模板编号 = 450 AND a.编号 = a1.项目编号
            JOIN v3_项目经费报销_横向 b ON a.编号 = b.编号;

GO



CREATE VIEW [dbo].[v4_纵向项目经费统计]
AS
SELECT 
       a.负责人部门名称 ,
       SUM(a.经费 ) AS 经费,
       SUM(a.未到经费) AS 未到经费 ,
       SUM(a.待审核到账 ) AS 待审核到账,
       SUM(a.已审核到账 ) AS 已审核到账,
       --SUM(b.剩余经费) AS 剩余经费 ,
       SUM(b.待审核报销 ) AS 待审核报销,
       SUM(b.已审核报销) AS 已审核报销 FROM dbo.v3_项目经费到账_纵向 a JOIN v3_项目经费报销_纵向 b ON a.编号 = b.编号 GROUP BY a.负责人部门名称;

GO


CREATE VIEW [dbo].[v4_纵向项目汇总]
AS
    SELECT  a1.状态名称,a1.步骤名称, a1.步骤状态说明,
            a.*,
            b.剩余经费 ,
            b.待审核报销 ,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v3_项目经费到账_纵向 a LEFT JOIN dbo.v3_流程 a1 ON a1.流程模板编号 = 450 AND a.编号 = a1.项目编号
            JOIN v3_项目经费报销_纵向 b ON a.编号 = b.编号;

GO


