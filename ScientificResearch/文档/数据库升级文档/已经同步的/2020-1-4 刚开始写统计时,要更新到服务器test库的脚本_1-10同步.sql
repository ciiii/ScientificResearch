CREATE VIEW [dbo].[v_继教试题_统计] AS

SELECT  a.编号 ,
a.文件夹编号,
        a.类型编号 ,
        b.名称 AS 类型名称 ,
        a.题干 ,
        a.题目解析 ,
        a.难易度 ,
        a.建立时间 ,
        a.备注 ,
        x.* ,
        CASE x.答题次数
          WHEN 0 THEN NULL
          ELSE x.正确答题次数 * 100 / x.答题次数
        END AS 答题正确率 ,
        y.*
FROM    dbo.继教试题 a
        JOIN 继教试题类型 b ON a.类型编号 = b.编号
        OUTER APPLY ( SELECT    COUNT(1) AS 答题次数 ,
                                ISNULL(SUM(CASE WHEN m.是否正确 = 1 THEN 1
                                                ELSE 0
                                           END), 0) AS 正确答题次数
                      FROM      继教理论考试答题情况 m
                      WHERE     m.试题编号 = a.编号
                    ) x
        OUTER APPLY ( SELECT    COUNT(1) AS 被引次数
                      FROM      dbo.继教试卷试题 n
                      WHERE     n.试题编号 = a.编号
                    ) y;



GO

ALTER FUNCTION [dbo].[tfn_继教某活动的通过情况] ( @活动编号 INT )
RETURNS TABLE
RETURN
    SELECT  a.编号 AS 活动内容编号 ,
            b.*
    FROM    继教活动内容 a
            CROSS APPLY tfn_继教某活动内容的通过情况(a.编号) b
    WHERE   a.活动编号 = @活动编号; 

	GO
    
	

CREATE FUNCTION tfn_继教某活动的通过情况统计 ( @活动内容编号 INT )
RETURNS TABLE
RETURN
    WITH    cteA
              AS ( SELECT   COUNT(1) AS 活动内容数量
                   FROM     dbo.继教活动内容
                   WHERE    活动编号 = @活动内容编号
                 ),
            cte
              AS ( SELECT   a.参与人类型 ,
                            a.参与人编号 ,
                            a.参与人称谓 ,
                            a.是否通过 ,
                            SUM(1) OVER ( PARTITION BY a.参与人类型, a.参与人编号 ) AS 参与活动内容次数 ,
                            SUM(CASE WHEN a.是否通过 = 1 THEN 1
                                     ELSE 0
                                END) OVER ( PARTITION BY a.参与人类型, a.参与人编号 ) AS 通过活动内容次数 ,
                            ROW_NUMBER() OVER ( PARTITION BY a.参与人类型, a.参与人编号 ORDER BY a.活动内容编号 ) AS r_n
                   FROM     tfn_继教某活动的通过情况(@活动内容编号) AS a
                 )
    SELECT  cte.参与人类型 ,
            cte.参与人编号 ,
            cte.参与人称谓 ,
            cteA.活动内容数量 ,
            cte.参与活动内容次数 ,
            cte.通过活动内容次数
    FROM    cte ,
            cteA
    WHERE   cte.r_n = 1;

	GO
    
CREATE VIEW v_tfn_继教某活动的通过情况统计
AS
    SELECT  *
    FROM    tfn_继教某活动的通过情况统计(NULL);
	GO
    
CREATE VIEW [dbo].[v_继教试题_统计_某次考试统计]
AS
    SELECT  a.编号 ,
            a.文件夹编号 ,
            a.类型编号 ,
            b.名称 AS 类型名称 ,
            a.题干 ,
            a.题目解析 ,
            a.难易度 ,
            a.建立时间 ,
            a.备注 ,
            x.* ,
            CASE x.答题次数
              WHEN 0 THEN NULL
              ELSE x.正确答题次数 * 100 / x.答题次数
            END AS 答题正确率 ,
            y.*
    FROM    dbo.继教试题 a
            JOIN 继教试题类型 b ON a.类型编号 = b.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 答题次数 ,
                                    ISNULL(SUM(CASE WHEN m.是否正确 = 1 THEN 1
                                                    ELSE 0
                                               END), 0) AS 正确答题次数
                          FROM      继教理论考试答题情况 m
                          WHERE     m.试题编号 = a.编号
                        ) x
            OUTER APPLY ( SELECT    COUNT(1) AS 被引次数
                          FROM      dbo.继教试卷试题 n
                          WHERE     n.试题编号 = a.编号
                        ) y;


GO


CREATE FUNCTION tfn_继教某次考试试题正确率统计 ( @考试编号 INT )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT   c.试题编号 ,
                            COUNT(1) AS 本次考试答题次数 ,
                            ISNULL(SUM(CASE WHEN c.是否正确 = 1 THEN 1
                                            ELSE 0
                                       END), 0) AS 本次考试正确答题次数
                   FROM     继教考试批次 a
                            JOIN 继教理论考试参与情况 b ON a.编号 = b.考试批次编号
                            JOIN 继教理论考试答题情况 c ON b.编号 = c.理论考试参与情况编号
                   WHERE    a.考试编号 = @考试编号
                   GROUP BY c.试题编号
                 )
    SELECT  x.* ,
            cte.* ,
            CASE cte.本次考试答题次数
              WHEN 0 THEN NULL
              ELSE cte.本次考试正确答题次数 * 100 / cte.本次考试答题次数
            END AS 本次考试答题正确率
    FROM    v_继教试题_统计 x
            JOIN cte ON x.编号 = cte.试题编号;
	GO

CREATE FUNCTION tfn_继教某次考试某试题答题统计 ( @考试编号 INT, @试题编号 INT )
RETURNS TABLE
RETURN
    SELECT  d.答题答案编码 ,
            COUNT(1) AS 选择该答案次数
    FROM    继教考试批次 a
            JOIN 继教理论考试参与情况 b ON a.编号 = b.考试批次编号
            JOIN 继教理论考试答题情况 c ON b.编号 = c.理论考试参与情况编号
            JOIN 继教理论考试答题答案 d ON c.编号 = d.理论考试答题情况编号
    WHERE   a.考试编号 = @考试编号
            AND c.试题编号 = @试题编号
    GROUP BY d.答题答案编码;

	GO

CREATE FUNCTION [dbo].[tfn_继教某次考试评分表正确率统计] ( @考试编号 INT, @评分表编号 INT )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT   e.编号 AS 评分表项目编号 ,
                            e.名称 AS 评分表项目名称 ,
                            d.编号 AS 评分表项目要求编号 ,
                            d.要求 AS 评分表项目要求 ,
                            d.标准分 AS 评分表项目要求标准分 ,
                            COUNT(1) OVER ( PARTITION BY d.编号 ) AS 评分表项目要求打分次数 ,
                            AVG(c.打分) OVER ( PARTITION BY d.编号 ) AS 评分表项目要求平均打分 ,
                            SUM(CASE WHEN c.打分 = d.标准分 THEN 1
                                     ELSE 0
                                END) OVER ( PARTITION BY d.编号 ) AS 评分表项目要求满分次数 ,
                            ROW_NUMBER() OVER ( PARTITION BY d.编号 ORDER BY b.编号 ) AS r_n
                   FROM     继教考试批次 a
                            JOIN 继教操作考试参与情况 b ON a.编号 = b.考试批次编号
                            JOIN 继教操作考试打分情况 c ON b.编号 = c.操作考试参与情况编号
                            JOIN 继教评分表项目要求 d ON c.操作考试评分项目要求编号 = d.编号
                            JOIN 继教评分表项目 e ON d.评分表项目编号 = e.编号
                   WHERE    a.考试编号 = @考试编号
                            AND e.评分表编号 = @评分表编号
                 )
    SELECT  *
    FROM    cte
    WHERE   cte.r_n = 1;
	
	GO
	                    