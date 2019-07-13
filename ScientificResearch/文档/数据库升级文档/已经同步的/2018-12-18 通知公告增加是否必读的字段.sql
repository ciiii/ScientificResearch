ALTER TABLE dbo.通知公告 ADD 是否必读 BIT NULL;
GO

DROP PROCEDURE [dbo].[sp_通知公告_增改]
GO

DROP TYPE [dbo].[tt_通知公告]
GO

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
	 是否必读 BIT NULL
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

ALTER VIEW [dbo].[v2_通知公告] AS
SELECT  a.编号 ,
        a.通知类型 ,
        a.通知标识 ,
        a.发送人编号 ,
        a.通知名称 ,
        a.关闭时间 ,
        a.相关文件路径 ,
        a.通知内容 ,
        a.接收人数 ,
        a.已接收人数 ,
        a.是否启用 ,
        a.建立时间 ,
        a.备注 ,
		a.是否必读,
        b.工号 AS 发送人工号 ,
        b.姓名 AS 发送人姓名 ,
        b.部门编号 AS 发送人部门编号 ,
        b.部门名称 AS 发送人部门名称
FROM    dbo.通知公告 a
        LEFT JOIN dbo.v1_人员_带部门名 b ON a.发送人编号 = b.编号;
GO


ALTER VIEW [dbo].[v2_通知公告_列表] AS
SELECT  a.编号 ,
        a.通知类型 ,
        a.通知标识 ,
        a.发送人编号 ,
        a.通知名称 ,
        a.关闭时间 ,
        a.相关文件路径 ,
        --a.通知内容 ,
        a.接收人数 ,
        a.已接收人数 ,
        a.是否启用 ,
        a.建立时间 ,
        a.备注 ,
		a.是否必读,
        b.工号 AS 发送人工号 ,
        b.姓名 AS 发送人姓名 ,
        b.部门编号 AS 发送人部门编号 ,
        b.部门名称 AS 发送人部门名称
FROM    dbo.通知公告 a
        LEFT JOIN dbo.v1_人员_带部门名 b ON a.发送人编号 = b.编号;

GO


ALTER FUNCTION [dbo].[tfn_某人员可查看的通知公告] ( @人员编号 INT )
RETURNS TABLE
AS RETURN
    WITH    cte ( 人员编号, 接收者类型, 接收者编号 )
              AS ( SELECT   @人员编号 ,
                            0 ,
                            0
                   UNION ALL
                   SELECT   @人员编号 ,
                            10 ,
                            @人员编号
                   UNION ALL
                   SELECT   @人员编号 ,
                            20 ,
                            部门编号
                   FROM     dbo.人员
                   WHERE    编号 = @人员编号
                   UNION ALL
                   SELECT   @人员编号 ,
                            30 ,
                            b1.角色编号
                   FROM     dbo.人员角色 b1
                   WHERE    b1.人员编号 = @人员编号
                 )
    SELECT  a.编号 ,
            a.通知类型 ,
            a.通知标识 ,
            a.发送人编号 ,
            a.通知名称 ,
            a.关闭时间 ,
            a.相关文件路径 ,
            --a.通知内容 ,
            a.接收人数 ,
            a.已接收人数 ,
            a.是否启用 ,
            a.建立时间 ,
            a.备注 ,
			a.是否必读,
            a.发送人工号 ,
            a.发送人姓名 ,
            a.发送人部门编号 ,
            a.发送人部门名称 ,
            IIF(EXISTS ( SELECT 1
                         FROM   dbo.通知公告已接收人 b
                         WHERE  b.通知公告编号 = a.编号
                                AND b.接收人编号 = @人员编号 ), 1, 0) AS 是否已接收
    FROM    v2_通知公告 a
    WHERE   EXISTS ( SELECT 1
                     FROM   cte
                            JOIN dbo.通知公告接收条件 c ON cte.接收者类型 = c.接收者类型
                                                   AND cte.接收者编号 = c.接收者编号
                                                   AND c.通知公告编号 = a.编号 );
GO
					
EXEC dbo.sp_Rebuild;

