INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'文献类型', -- 分类 - nvarchar(50)
          N'文章', -- 值 - nvarchar(50)
          0, -- 上级编号 - int
          1, -- 级别 - int
          0, -- 排序 - int
          N''  -- 备注 - nvarchar(500)
          ),
        ( N'文献类型', -- 分类 - nvarchar(50)
          N'综述', -- 值 - nvarchar(50)
          0, -- 上级编号 - int
          1, -- 级别 - int
          0, -- 排序 - int
          N''  -- 备注 - nvarchar(500)
          );

GO
          --100143	1001	期刊任职名称维护	基础信息维护/字典.html?name=期刊任职名称&type=1	True	100143	NULL	NULL
INSERT  dbo.权限
        ( 编号 ,
          上级编号 ,
          名称 ,
          路径 ,
          类型 ,
          排序 ,
          图标 ,
          备注
        )
VALUES  ( 100144 , -- 编号 - int
          1001 , -- 上级编号 - int
          N'文献类型维护' , -- 名称 - nvarchar(50)
          N'基础信息维护/字典.html?name=文献类型&type=1' , -- 路径 - nvarchar(500)
          1 , -- 类型 - bit
          100144 , -- 排序 - int
          NULL , -- 图标 - nvarchar(50)
          NULL   -- 备注 - nvarchar(500)
		 );
GO

--??
ALTER FUNCTION [dbo].[tfn_角色的权限] ( @角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            IIF(b.编号 IS NULL, 0, 1) AS 拥有
    FROM    dbo.权限 a
            LEFT JOIN 角色权限 b ON a.编号 = b.权限编号
                                AND b.角色编号 = @角色编号;

GO

ALTER TABLE 期刊 ADD PMID INT , DOI NVARCHAR(100),UT NVARCHAR(100); 

GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'PMID',
    @level0type = N'Schema', @level0name = 'dbo', @level1type = N'Table',
    @level1name = '期刊', @level2type = N'Column', @level2name = 'PMID';  
GO  

EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'DOI',
    @level0type = N'Schema', @level0name = 'dbo', @level1type = N'Table',
    @level1name = '期刊', @level2type = N'Column', @level2name = 'DOI';  
GO  
EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'UT',
    @level0type = N'Schema', @level0name = 'dbo', @level1type = N'Table',
    @level1name = '期刊', @level2type = N'Column', @level2name = 'UT';  
GO  

DROP PROCEDURE [dbo].[sp_期刊_增改];
GO
DROP TYPE [dbo].[tt_期刊];
GO
CREATE TYPE [dbo].[tt_期刊] AS TABLE(
[编号] [INT] NULL,
[代码] [NVARCHAR](50) NULL,
[名称] [NVARCHAR](500) NULL,
[英文刊名] [NVARCHAR](500) NULL,
[主办单位] [NVARCHAR](500) NULL,
[期刊系列] [NVARCHAR](500) NULL,
[收录情况] [NVARCHAR](1000) NULL,
[语种] [NVARCHAR](50) NULL,
[JCR分区] [NVARCHAR](50) NULL,
[编目名称] [NVARCHAR](100) NULL,
[编目类别] [NVARCHAR](100) NULL,
[年度] [INT] NULL,
[创刊日期] [DATE] NULL,
[被引用次数] [INT] NULL,
[影响因子] [NUMERIC](18, 3) NULL,
[特征因子分值] [NUMERIC](18, 3) NULL,
[ISSN号] [NVARCHAR](50) NULL,
[CN号] [NVARCHAR](50) NULL,
[出版周期] [NVARCHAR](50) NULL,
[出版地] [NVARCHAR](50) NULL,
[开本] [NVARCHAR](50) NULL,
[备注] [NVARCHAR](500) NULL,
PMID INT NULL,
DOI NVARCHAR(100) NULL,
UT NVARCHAR(100) NULL 
);
GO

CREATE PROC [dbo].[sp_期刊_增改] ( @tt_期刊 tt_期刊 READONLY )
AS
    MERGE dbo.期刊 t
    USING @tt_期刊 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.代码 = s.代码 ,
               t.名称 = s.名称 ,
               t.英文刊名 = s.英文刊名 ,
               t.主办单位 = s.主办单位 ,
               t.期刊系列 = s.期刊系列 ,
               t.收录情况 = s.收录情况 ,
               t.语种 = s.语种 ,
               t.JCR分区 = s.JCR分区 ,
               t.编目名称 = s.编目名称 ,
               t.编目类别 = s.编目类别 ,
               t.年度 = s.年度 ,
               t.创刊日期 = s.创刊日期 ,
               t.被引用次数 = s.被引用次数 ,
               t.影响因子 = s.影响因子 ,
               t.特征因子分值 = s.特征因子分值 ,
               t.ISSN号 = s.ISSN号 ,
               t.CN号 = s.CN号 ,
               t.出版周期 = s.出版周期 ,
               t.出版地 = s.出版地 ,
               t.开本 = s.开本 ,
               t.备注 = s.备注 ,
               t.PMID = s.PMID ,
               t.DOI = s.DOI ,
               t.UT = s.UT
    WHEN NOT MATCHED THEN
        INSERT ( 代码 ,
                 名称 ,
                 英文刊名 ,
                 主办单位 ,
                 期刊系列 ,
                 收录情况 ,
                 语种 ,
                 JCR分区 ,
                 编目名称 ,
                 编目类别 ,
                 年度 ,
                 创刊日期 ,
                 被引用次数 ,
                 影响因子 ,
                 特征因子分值 ,
                 ISSN号 ,
                 CN号 ,
                 出版周期 ,
                 出版地 ,
                 开本 ,
                 备注 ,
                 PMID ,
                 DOI ,
                 UT
			   )
        VALUES ( s.代码 ,
                 s.名称 ,
                 s.英文刊名 ,
                 s.主办单位 ,
                 s.期刊系列 ,
                 s.收录情况 ,
                 s.语种 ,
                 s.JCR分区 ,
                 s.编目名称 ,
                 s.编目类别 ,
                 s.年度 ,
                 s.创刊日期 ,
                 s.被引用次数 ,
                 s.影响因子 ,
                 s.特征因子分值 ,
                 s.ISSN号 ,
                 s.CN号 ,
                 s.出版周期 ,
                 s.出版地 ,
                 s.开本 ,
                 s.备注 ,
                 s.PMID ,
                 s.DOI ,
                 s.UT
			   );
GO

ALTER VIEW [dbo].[v1_成果论文_列表]
AS
    SELECT  a.编号 ,
            a.论文标题 ,
            a.论文Online日期 ,
            a.论文正式出版日期 ,
            ISNULL(b.名称, b.英文刊名) AS 刊物名称 ,
            b.PMID ,
            b.DOI ,
            b.UT ,
            a.认领人编号 ,
            dbo.fn_成果作者(1, a.编号, '第一作者') AS 第一作者
    FROM    dbo.成果论文 a
            LEFT JOIN dbo.期刊 b ON a.刊物编号 = b.编号;


GO
ALTER FUNCTION [dbo].[tfn_成果论文] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            b.姓名 AS 认领人姓名 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v1_成果论文_列表 a
            LEFT JOIN 人员 b ON a.认领人编号 = b.编号
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

			GO

ALTER VIEW [dbo].[v1_期刊]
AS
    SELECT  * ,
            CONCAT(名称, '/', 英文刊名, '/', 主办单位, '/', 年度, '/', PMID, '/', DOI, '/',
                   UT) AS AllName
    FROM    期刊;
GO
            
ALTER TABLE dbo.成果论文 ADD 通讯作者 NVARCHAR(50),文献类型 NVARCHAR(50);
GO

DROP PROCEDURE [dbo].[sp_成果论文_增改];
GO

DROP TYPE [dbo].[tt_成果论文];
GO

CREATE TYPE [dbo].[tt_成果论文] AS TABLE(
[编号] [INT] NULL,
[认领人编号] [INT] NULL,
[论文标题] [NVARCHAR](200) NULL,
[论文标题类型] [NVARCHAR](50) NULL,
[论文Online日期] [DATE] NULL,
[论文正式出版日期] [DATE] NULL,
[他引次数] [INT] NULL,
[年度] [INT] NULL,
[收稿日期] [DATE] NULL,
[论文所属栏目] [NVARCHAR](50) NULL,
[版面费] [NUMERIC](18, 2) NULL,
[超额版面费] [NUMERIC](18, 2) NULL,
[超额费用来源] [NVARCHAR](50) NULL,
[奖励情况] [NVARCHAR](50) NULL,
[论文字数] [NUMERIC](18, 2) NULL,
[计划来源] [NVARCHAR](50) NULL,
[论文版面] [NVARCHAR](50) NULL,
[学科门类] [NVARCHAR](50) NULL,
[一级学科] [NVARCHAR](50) NULL,
[二级学科] [NVARCHAR](50) NULL,
[三级学科] [NVARCHAR](50) NULL,
[作者人数] [INT] NULL,
[关键字] [NVARCHAR](500) NULL,
[论文摘要] [NVARCHAR](1000) NULL,
[备注] [NVARCHAR](1000) NULL,
[刊物编号] [INT] NULL,
[卷号] [INT] NULL,
[期号] [INT] NULL,
[页码范围起] [INT] NULL,
[页码范围止] [INT] NULL,
[论文类型] [NVARCHAR](50) NULL,
[是否与行业联合发表] [BIT] NULL,
[是否与地方联合发表] [BIT] NULL,
[是否与国际联合发表] [BIT] NULL,
[是否跨学科] [BIT] NULL,
[是否与本专业相关] [BIT] NULL,
[检索信息页相关文件路径] [NTEXT] NULL,
[论文正文路径] [NTEXT] NULL,
[其他相关文件路径] [NTEXT] NULL,
[通讯作者] [NVARCHAR](50) NULL,
[文献类型] [NVARCHAR](50) NULL

);
GO




CREATE PROC [dbo].[sp_成果论文_增改]
    (
      @tt tt_成果论文 READONLY ,
      @tt_成果项目 tt_成果项目 READONLY ,
      @tt_成果作者 tt_成果作者 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 

    MERGE dbo.成果论文 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[认领人编号] = s.[认领人编号] ,
               t.[论文标题] = s.[论文标题] ,
               t.[论文标题类型] = s.[论文标题类型] ,
               t.[论文Online日期] = s.[论文Online日期] ,
               t.[论文正式出版日期] = s.[论文正式出版日期] ,
               t.[他引次数] = s.[他引次数] ,
               t.[年度] = s.[年度] ,
               t.[收稿日期] = s.[收稿日期] ,
               t.[论文所属栏目] = s.[论文所属栏目] ,
               t.[版面费] = s.[版面费] ,
               t.[超额版面费] = s.[超额版面费] ,
               t.[超额费用来源] = s.[超额费用来源] ,
               t.[奖励情况] = s.[奖励情况] ,
               t.[论文字数] = s.[论文字数] ,
               t.[计划来源] = s.[计划来源] ,
               t.[论文版面] = s.[论文版面] ,
               t.[学科门类] = s.[学科门类] ,
               t.[一级学科] = s.[一级学科] ,
               t.[二级学科] = s.[二级学科] ,
               t.[三级学科] = s.[三级学科] ,
               t.[作者人数] = s.[作者人数] ,
               t.[关键字] = s.[关键字] ,
               t.[论文摘要] = s.[论文摘要] ,
               t.[备注] = s.[备注] ,
               t.[刊物编号] = s.[刊物编号] ,
               t.[卷号] = s.[卷号] ,
               t.[期号] = s.[期号] ,
               t.[页码范围起] = s.[页码范围起] ,
               t.[页码范围止] = s.[页码范围止] ,
               t.[论文类型] = s.[论文类型] ,
               t.[是否与行业联合发表] = s.[是否与行业联合发表] ,
               t.[是否与地方联合发表] = s.[是否与地方联合发表] ,
               t.[是否与国际联合发表] = s.[是否与国际联合发表] ,
               t.[是否跨学科] = s.[是否跨学科] ,
               t.[是否与本专业相关] = s.[是否与本专业相关] ,
               t.[检索信息页相关文件路径] = s.[检索信息页相关文件路径] ,
               t.[论文正文路径] = s.[论文正文路径] ,
               t.[其他相关文件路径] = s.[其他相关文件路径] ,
               t.通讯作者 = s.通讯作者 ,
               t.文献类型 = s.文献类型
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [认领人编号] ,
                 [论文标题] ,
                 [论文标题类型] ,
                 [论文Online日期] ,
                 [论文正式出版日期] ,
                 [他引次数] ,
                 [年度] ,
                 [收稿日期] ,
                 [论文所属栏目] ,
                 [版面费] ,
                 [超额版面费] ,
                 [超额费用来源] ,
                 [奖励情况] ,
                 [论文字数] ,
                 [计划来源] ,
                 [论文版面] ,
                 [学科门类] ,
                 [一级学科] ,
                 [二级学科] ,
                 [三级学科] ,
                 [作者人数] ,
                 [关键字] ,
                 [论文摘要] ,
                 [备注] ,
                 [刊物编号] ,
                 [卷号] ,
                 [期号] ,
                 [页码范围起] ,
                 [页码范围止] ,
                 [论文类型] ,
                 [是否与行业联合发表] ,
                 [是否与地方联合发表] ,
                 [是否与国际联合发表] ,
                 [是否跨学科] ,
                 [是否与本专业相关] ,
                 [检索信息页相关文件路径] ,
                 [论文正文路径] ,
                 [其他相关文件路径] ,
                 通讯作者 ,
                 文献类型
               )
    OUTPUT
        Inserted.编号
        INTO @编号; 

    DECLARE @成果类型 INT = 1; --论文是定死1
    DECLARE @成果编号 INT;
    SELECT  @成果编号 = 编号
    FROM    @编号;

	--该论文的多条项目的维护
    MERGE dbo.成果项目 t
    USING @tt_成果项目 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.项目类型 = t.项目类型
        AND s.项目编号 = t.项目编号
    WHEN MATCHED THEN
        UPDATE SET
               t.是否项目带来成果 = s.是否项目带来成果
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 项目类型 ,
                 项目编号 ,
                 是否项目带来成果
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.项目类型 ,
                 s.项目编号 ,
                 s.是否项目带来成果
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

	--该论文的多条作者的维护
    MERGE 成果作者 t
    USING @tt_成果作者 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.作者编号 = t.作者编号
    WHEN MATCHED THEN
        UPDATE SET
               t.作者级别 = s.作者级别 ,
               t.工作量占比 = s.工作量占比 ,
               t.完成字数 = s.完成字数
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 作者级别 ,
                 作者编号 ,
                 工作量占比 ,
                 完成字数
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.作者级别 ,
                 s.作者编号 ,
                 s.工作量占比 ,
                 s.完成字数
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

    COMMIT TRAN;

	--返回一下论文编号
    SELECT  *
    FROM    @编号;



;
GO


DROP PROCEDURE [dbo].[sp_导入自定义论文];
GO

DROP TYPE [dbo].[tt_导入自定义论文];
GO

CREATE TYPE [dbo].[tt_导入自定义论文] AS TABLE(
[论文标题] [NVARCHAR](200) NULL,
[论文标题类型] [NVARCHAR](50) NULL,
[论文Online日期] [DATE] NULL,
[论文正式出版日期] [DATE] NULL,
[作者] [NVARCHAR](50) NULL,
[作者人数] [INT] NULL,
[他引次数] [INT] NULL,
[年度] [INT] NULL,
[收稿日期] [DATE] NULL,
[论文所属栏目] [NVARCHAR](50) NULL,
[论文字数] [NUMERIC](18, 2) NULL,
[计划来源] [NVARCHAR](50) NULL,
[论文版面] [NVARCHAR](50) NULL,
[学科门类] [NVARCHAR](50) NULL,
[一级学科] [NVARCHAR](50) NULL,
[二级学科] [NVARCHAR](50) NULL,
[三级学科] [NVARCHAR](50) NULL,
[关键字] [NVARCHAR](500) NULL,
[论文摘要] [NVARCHAR](1000) NULL,
[论文类型] [NVARCHAR](50) NULL,
[卷号] [INT] NULL,
[期号] [INT] NULL,
[页码范围] [NVARCHAR](50) NULL,
[页码范围起] [INT] NULL,
[页码范围止] [INT] NULL,
[刊物名称] [NVARCHAR](50) NULL,
[通讯作者] [NVARCHAR](50) NULL,
[文献类型] [NVARCHAR](50) NULL
);
GO



CREATE PROC [dbo].[sp_导入自定义论文]
    (
      @tt tt_导入自定义论文 READONLY
    )
AS
    DECLARE @t TABLE
        (
          论文编号 INT ,
          论文标题 NVARCHAR(200)
        );

    SET XACT_ABORT ON;
    BEGIN TRAN;

    INSERT  dbo.成果论文
            ( 论文标题 ,
              论文标题类型 ,
              论文Online日期 ,
              论文正式出版日期 ,
              他引次数 ,
              年度 ,
              收稿日期 ,
              论文所属栏目 ,
              论文字数 ,
              计划来源 ,
              论文版面 ,
              学科门类 ,
              一级学科 ,
              二级学科 ,
              三级学科 ,
              作者人数 ,
              关键字 ,
              论文摘要 ,
              刊物编号 ,
              卷号 ,
              期号 ,
              页码范围起 ,
              页码范围止 ,
              论文类型 ,
              通讯作者 ,
              文献类型
	        )
    OUTPUT  Inserted.编号 ,
            Inserted.论文标题
            INTO @t
            SELECT  a.论文标题 ,
                    a.论文标题类型 ,
                    a.论文Online日期 ,
                    a.论文正式出版日期 ,
                    a.他引次数 ,
                    a.年度 ,
                    a.收稿日期 ,
                    a.论文所属栏目 ,
                    a.论文字数 ,
                    a.计划来源 ,
                    a.论文版面 ,
                    a.学科门类 ,
                    a.一级学科 ,
                    a.二级学科 ,
                    a.三级学科 ,
                    a.作者人数 ,
                    a.关键字 ,
                    a.论文摘要 ,
                    c1.编号 ,
                    a.卷号 ,
                    a.期号 ,
                    a.页码范围起 ,
                    a.页码范围止 ,
                    a.论文类型 ,
                    a.通讯作者 ,
                    a.文献类型
            FROM    @tt a
                    OUTER APPLY ( SELECT TOP 1
                                            编号
                                  FROM      期刊 c
                                  WHERE     a.刊物名称 = c.名称
                                            OR a.刊物名称 = c.英文刊名
                                ) c1;

    INSERT  dbo.成果作者
            ( 成果类型 ,
              成果编号 ,
              作者级别 ,
              作者编号
            )
            SELECT  1 ,
                    a.论文编号 ,
                    '第一作者' ,
                    c1.编号
            FROM    @t a
                    JOIN @tt b ON a.论文标题 = b.论文标题
                    CROSS APPLY ( SELECT TOP 1
                                            编号
                                  FROM      人员 c
                                  WHERE     b.作者 = c.姓名
                                ) c1;
								
        
    COMMIT TRAN;


GO
ALTER VIEW [dbo].[v1_成果论文_列表]
AS
    SELECT  a.编号 ,
            a.论文标题 ,
            a.论文Online日期 ,
            a.论文正式出版日期 ,
            ISNULL(b.名称, b.英文刊名) AS 刊物名称 ,
            b.PMID ,
            b.DOI ,
            b.UT ,
            a.认领人编号 ,
            dbo.fn_成果作者(1, a.编号, '第一作者') AS 第一作者 ,
            a.通讯作者 ,
            a.文献类型
    FROM    dbo.成果论文 a
            LEFT JOIN dbo.期刊 b ON a.刊物编号 = b.编号;



GO


ALTER VIEW [dbo].[v1_成果论文_详情]
AS
    SELECT  a.编号 ,
            a.认领人编号 ,
            a.论文标题 ,
            a.论文标题类型 ,
            a.论文Online日期 ,
            a.论文正式出版日期 ,
            a.他引次数 ,
            a.年度 ,
            a.收稿日期 ,
            a.论文所属栏目 ,
            a.版面费 ,
            a.超额版面费 ,
            a.超额费用来源 ,
            a.奖励情况 ,
            a.论文字数 ,
            a.计划来源 ,
            a.论文版面 ,
            a.学科门类 ,
            a.一级学科 ,
            a.二级学科 ,
            a.三级学科 ,
            a.作者人数 ,
            a.关键字 ,
            a.论文摘要 ,
            a.备注 ,
            a.刊物编号 ,
            a.卷号 ,
            a.期号 ,
            a.页码范围起 ,
            a.页码范围止 ,
            a.论文类型 ,
            a.是否与行业联合发表 ,
            a.是否与地方联合发表 ,
            a.是否与国际联合发表 ,
            a.是否跨学科 ,
            a.是否与本专业相关 ,
            a.检索信息页相关文件路径 ,
            a.论文正文路径 ,
            a.其他相关文件路径 ,
            a.通讯作者 ,
            a.文献类型 ,
            b.代码 ,
            ISNULL(b.名称, b.英文刊名) AS 刊物名称 ,
            b.PMID ,
            b.DOI ,
            b.UT ,
            b.主办单位 ,
            b.期刊系列 ,
            b.JCR分区 ,
            b.编目名称 ,
            b.编目类别 ,
            b.创刊日期 ,
            b.被引用次数 ,
            b.影响因子 ,
            b.特征因子分值 ,
            b.ISSN号 ,
            b.CN号
    FROM    dbo.成果论文 a
            LEFT JOIN dbo.期刊 b ON a.刊物编号 = b.编号;




GO

dbo.sp_Rebuild;

GO

