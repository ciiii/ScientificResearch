--2018-8-21 论文摘要的字段不够长


DROP PROCEDURE [dbo].[sp_导入论文];
GO

/****** Object:  UserDefinedTableType [dbo].[tt_导入论文]    Script Date: 2018/8/31 16:01:29 ******/
DROP TYPE [dbo].[tt_导入论文];
GO

/****** Object:  UserDefinedTableType [dbo].[tt_导入论文]    Script Date: 2018/8/31 16:01:29 ******/
CREATE TYPE [dbo].[tt_导入论文] AS TABLE(
[论文标题] [NVARCHAR](200) NULL,
[作者] [NVARCHAR](50) NULL,
[作者人数] [INT] NULL,
[年度] [INT] NULL,
[关键字] [NVARCHAR](500) NULL,
[论文摘要] [NVARCHAR](MAX) NULL,
[卷号] [INT] NULL,
[期号] [INT] NULL,
[页码范围] [NVARCHAR](100) NULL,
[页码范围起] [INT] NULL,
[页码范围止] [INT] NULL,
[刊物名称] [NVARCHAR](200) NULL
);
GO


CREATE PROC [dbo].[sp_导入论文] ( @tt tt_导入论文 READONLY )
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
              年度 ,
              作者人数 ,
              关键字 ,
              论文摘要 ,
              刊物编号 ,
              卷号 ,
              期号 ,
              页码范围起 ,
              页码范围止 
          
            )
    OUTPUT  Inserted.编号 ,
            Inserted.论文标题
            INTO @t
            SELECT  a.论文标题 ,
                    a.年度 ,
                    a.作者人数 ,
                    a.关键字 ,
                    a.论文摘要 ,
                    c1.编号 ,
                    a.卷号 ,
                    a.期号 ,
                    a.页码范围起 ,
                    a.页码范围止
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

ALTER TABLE dbo.成果论文 ALTER COLUMN 论文摘要 NVARCHAR(MAX);

GO
