ALTER TABLE dbo.医院 ADD Logo NVARCHAR(200);
GO

IF OBJECT_ID('sp_医院_增改') IS NOT NULL
    BEGIN
        DROP PROC sp_医院_增改;
    END;
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_医院' )
    BEGIN
        DROP TYPE  tt_医院;
    END;
CREATE TYPE tt_医院 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (200) NULL ,
[代码] [NVARCHAR] (200) NULL ,
[联系人] [NVARCHAR] (50) NULL,
[联系电话] [NVARCHAR] (50) NULL,
[地址] [NVARCHAR] (1000) NULL,
[是否启用] [BIT] NULL ,
[备注] [NVARCHAR] (2000) NULL,
[Logo] [NVARCHAR] (200) NULL
);
GO

CREATE PROC sp_医院_增改 ( @tt tt_医院 READONLY )
AS
    DECLARE @output tt_医院;
    MERGE dbo.医院 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[代码] = s.[代码] ,
               t.[联系人] = s.[联系人] ,
               t.[联系电话] = s.[联系电话] ,
               t.[地址] = s.[地址] ,
               t.[是否启用] = s.[是否启用] ,
               t.[备注] = s.[备注] ,
               t.[Logo] = s.[Logo]
    WHEN NOT MATCHED THEN
        INSERT ( 名称 ,
                 代码 ,
                 联系人 ,
                 联系电话 ,
                 地址 ,
                 是否启用 ,
                 备注 ,
                 Logo
               )
        VALUES ( s.名称 ,
                 s.代码 ,
                 s.联系人 ,
                 s.联系电话 ,
                 s.地址 ,
                 s.是否启用 ,
                 s.备注 ,
                 s.Logo 
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;
GO
