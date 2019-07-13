
ALTER VIEW [dbo].[v1_成果论文_列表]
AS
    SELECT  a.编号 ,
            a.论文标题 ,
            a.论文Online日期 ,
            a.论文正式出版日期 ,
            ISNULL(b.名称, b.英文刊名) AS 刊物名称 ,
			b.PMID,b.DOI,b.UT,
			b.期刊系列,b.JCR分区,b.影响因子,b.特征因子分值,
			a.认领人编号,
            dbo.fn_成果作者(1, a.编号, '第一作者') AS 第一作者,a.通讯作者,a.文献类型
    FROM    dbo.成果论文 a
            LEFT JOIN dbo.期刊 b ON a.刊物编号 = b.编号;

GO


EXEC dbo.sp_Rebuild;

GO
