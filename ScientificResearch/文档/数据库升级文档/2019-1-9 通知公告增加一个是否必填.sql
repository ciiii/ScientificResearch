
ALTER TABLE dbo.通知公告 ADD 是否必读 BIT;

/****** Object:  StoredProcedure [dbo].[sp_通知公告_增改]    Script Date: 2019/1/9 15:36:48 ******/
DROP PROCEDURE [dbo].[sp_通知公告_增改]
GO

/****** Object:  UserDefinedTableType [dbo].[tt_通知公告]    Script Date: 2019/1/9 15:36:26 ******/
DROP TYPE [dbo].[tt_通知公告]
GO

/****** Object:  UserDefinedTableType [dbo].[tt_通知公告]    Script Date: 2019/1/9 15:36:26 ******/
CREATE TYPE [dbo].[tt_通知公告] AS TABLE(
	[编号] [INT] NULL,
	[通知类型] [NVARCHAR](50) NULL,
	[通知标识] [NVARCHAR](50) NULL,
	[发送人编号] [INT] NULL,
	[通知名称] [NVARCHAR](100) NULL,
	[关闭时间] [DATETIME] NULL,
	[相关文件路径] [NVARCHAR](500) NULL,
	[通知内容] [NTEXT] NULL,
	[接收人数] [INT] NULL,
	[已接收人数] [INT] NULL,
	[是否启用] [BIT] NULL,
	[建立时间] [DATETIME] NULL,
	[备注] [NVARCHAR](1000) NULL,
	[是否必读] [BIT] NULL
)
GO

CREATE PROC [dbo].[sp_通知公告_增改]
    (
      @tt tt_通知公告 READONLY ,
      @tt_通知公告接收条件 tt_通知公告接收条件 READONLY
    )
AS
    DECLARE @编号 tt_编号; 

    SET XACT_ABORT ON;

    BEGIN TRAN;

    MERGE dbo.通知公告 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[通知类型] = s.[通知类型] ,
               t.[通知标识] = s.[通知标识] ,
				--t.发送人编号 = s.发送人编号,
               t.[通知名称] = s.[通知名称] ,
               t.[关闭时间] = s.[关闭时间] ,
               t.[相关文件路径] = s.[相关文件路径] ,
               t.[通知内容] = s.[通知内容] ,
               --t.[接收人数] = s.[接收人数] ,
               --t.[已接收人数] = s.[已接收人数] ,
               --t.[是否启用] = s.[是否启用] ,
               t.[备注] = s.[备注],
			   t.是否必读 = s.是否必读
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.通知类型 ,
                 s.通知标识 ,
                 s.发送人编号 ,
                 s.通知名称 ,
                 s.关闭时间 ,
                 s.相关文件路径 ,
                 s.通知内容 ,
                 dbo.fn_满足通知公告接收条件人数(@tt_通知公告接收条件) ,
                 0 ,
                 1 ,
                 GETDATE() ,
                 s.备注 ,
				 s.是否必读
               )
    OUTPUT
        Inserted.编号
        INTO @编号;

    DECLARE @通知公告编号 INT;
    SELECT  @通知公告编号 = 编号
    FROM    @编号;

    MERGE dbo.通知公告接收条件 AS t
    USING @tt_通知公告接收条件 AS s
    ON t.通知公告编号 = @通知公告编号
        AND t.接收者类型 = s.接收者类型
        AND t.接收者编号 = s.接收者编号
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @通知公告编号 ,
                 s.接收者类型 ,
                 s.接收者编号
               )
    WHEN NOT MATCHED BY SOURCE AND t.通知公告编号 = @通知公告编号 THEN
        DELETE;
    
    COMMIT TRAN;

    SELECT  *
    FROM    @编号;

GO


