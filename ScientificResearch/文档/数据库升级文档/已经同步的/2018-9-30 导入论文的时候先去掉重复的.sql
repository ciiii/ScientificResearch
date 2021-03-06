

ALTER PROC [dbo].[sp_导入论文] ( @tt tt_导入论文 READONLY )
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
                                ) c1 
								WHERE NOT EXISTS(SELECT 1 FROM 成果论文 b WHERE a.论文标题 = b.论文标题);

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


