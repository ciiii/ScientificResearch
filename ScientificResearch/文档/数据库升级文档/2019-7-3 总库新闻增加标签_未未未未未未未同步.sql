
IF ( OBJECT_ID('新闻分类') IS NOT NULL )
    DROP TABLE 新闻分类;
GO

CREATE TABLE [dbo].[新闻分类]
    (
      [编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_新闻分类] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

INSERT  dbo.新闻分类
        ( 编号, 名称, 备注 )
VALUES  ( 1, N'指南', N'' ),
        ( 2, N'前沿', N'' );

GO

IF ( OBJECT_ID('标签') IS NOT NULL )
    DROP TABLE 标签;
GO

CREATE TABLE [dbo].[标签]
    (
      [编号] [INT] NOT NULL ,
      [新闻分类编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_标签] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

INSERT  dbo.标签
        ( 编号, 新闻分类编号, 名称, 备注 )
VALUES  ( 1, 1, N'内容提要', N'' ),
        ( 2, 1, N'呼吸系统', N'' ),
        ( 3, 1, N'肿瘤', N'' ),
        ( 4, 1, N'其他', N'' ),
        ( 5, 1, N'心血管系统', N'' ),
        ( 6, 1, N'心血管相关指南', N'' ),
        ( 7, 1, N'消化系统', N'' ),
        ( 8, 1, N'胃', N'' ),
        ( 9, 1, N'肠', N'' ),
        ( 10, 1, N'肝胆', N'' ),
        ( 11, 1, N'泌尿生殖系统', N'' ),
        ( 12, 1, N'泌尿系统', N'' ),
        ( 13, 1, N'乳腺', N'' ),
        ( 14, 1, N'乳腺相关指南', N'' ),
        ( 15, 1, N'其他系统', N'' ),
        ( 16, 1, N'神经', N'' ),
        ( 17, 1, N'血液', N'' ),
        ( 18, 1, N'其他', N'' ),
        ( 19, 1, N'其他', N'' ),
        ( 20, 1, N'其他相关指南', N'' );

GO

IF ( OBJECT_ID('新闻标签') IS NOT NULL )
    DROP TABLE 新闻标签;
GO

CREATE TABLE [dbo].[新闻标签]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [新闻编号] [INT] NOT NULL ,
      [标签编号] INT NOT NULL ,
      CONSTRAINT [PK_新闻标签] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

IF ( OBJECT_ID('新闻') IS NOT NULL )
    DROP TABLE dbo.新闻;
GO

CREATE TABLE [dbo].[新闻]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [新闻分类编号] [INT] NOT NULL ,
      [标题] [NVARCHAR](200) NOT NULL ,
      [内容] [NVARCHAR](MAX) NULL ,
      [建立时间] [DATETIME] NULL ,
      CONSTRAINT [PK_新闻] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

IF ( OBJECT_ID('v_新闻_详情') IS NOT NULL )
    DROP VIEW dbo.v_新闻_详情;
GO

CREATE VIEW v_新闻_详情
AS
    SELECT  a.编号 ,
            a.新闻分类编号 ,
            b.名称 AS 新闻分类名称 ,
            a.标题 ,
            STUFF(( SELECT  ',' + z2.名称
                    FROM    新闻标签 z1
                            JOIN dbo.标签 z2 ON z1.新闻编号 = a.编号
                                              AND z1.标签编号 = z2.编号
                  FOR
                    XML PATH('')
                  ), 1, 1, '') AS 标签 ,
            a.内容 ,
            a.建立时间
    FROM    dbo.新闻 a
            JOIN dbo.新闻分类 b ON a.新闻分类编号 = b.编号;


GO


IF ( OBJECT_ID('v_新闻_列表') IS NOT NULL )
    DROP VIEW dbo.v_新闻_列表;
GO

CREATE VIEW v_新闻_列表
AS
    SELECT  编号 ,
            新闻分类编号 ,
            新闻分类名称 ,
            标题 ,标签,
            --内容 ,
            建立时间
    FROM    dbo.v_新闻_详情;

	GO
   
-----------------
IF OBJECT_ID('sp_新闻_增改') IS NOT NULL
    BEGIN
        DROP PROC sp_新闻_增改;
    END;

	GO
    
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_新闻' )
    BEGIN
        DROP TYPE  tt_新闻;
    END;

	GO
    
CREATE TYPE tt_新闻 AS TABLE
(
[编号] [INT] NULL ,
[新闻分类编号] [INT] NULL ,
[标题] [NVARCHAR] (200) NULL ,
[内容] [NTEXT] NULL,
[建立时间] [DATETIME] NULL
);
GO

CREATE PROC sp_新闻_增改 ( @tt tt_新闻 READONLY )
AS
    DECLARE @output tt_新闻;
    MERGE dbo.新闻 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[新闻分类编号] = s.[新闻分类编号] ,
               t.[标题] = s.[标题] ,
               t.[内容] = s.[内容]
    WHEN NOT MATCHED THEN
        INSERT ( 新闻分类编号, 标题, 内容, 建立时间 )
        VALUES ( s.[新闻分类编号] ,
                 s.[标题] ,
                 s.[内容] ,
                 GETDATE()
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


-------------------
IF OBJECT_ID('sp_新闻标签_增改') IS NOT NULL
    BEGIN
        DROP PROC sp_新闻标签_增改;
    END;
	GO
    
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_新闻标签' )
    BEGIN
        DROP TYPE  tt_新闻标签;
    END;
	GO
    
CREATE TYPE tt_新闻标签 AS TABLE
(
[编号] [INT] NULL ,
[新闻编号] [INT] NULL ,
[标签编号] [INT] NULL 
);
GO

CREATE PROC sp_新闻标签_增改
    (
      @fId INT ,
      @tt tt_新闻标签 READONLY
    )
AS
    DECLARE @output tt_新闻标签;
    MERGE dbo.新闻标签 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[新闻编号] = @fId ,
               t.[标签编号] = s.[标签编号]
    WHEN NOT MATCHED THEN
        INSERT ( 新闻编号, 标签编号 )
        VALUES ( @fId, s.[标签编号] )
    WHEN NOT MATCHED BY SOURCE AND t.新闻编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;
GO
