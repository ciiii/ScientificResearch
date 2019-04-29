ALTER TABLE dbo.ҽԺ ADD Logo NVARCHAR(200);
GO

IF OBJECT_ID('sp_ҽԺ_����') IS NOT NULL
    BEGIN
        DROP PROC sp_ҽԺ_����;
    END;
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_ҽԺ' )
    BEGIN
        DROP TYPE  tt_ҽԺ;
    END;
CREATE TYPE tt_ҽԺ AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (200) NULL ,
[����] [NVARCHAR] (200) NULL ,
[��ϵ��] [NVARCHAR] (50) NULL,
[��ϵ�绰] [NVARCHAR] (50) NULL,
[��ַ] [NVARCHAR] (1000) NULL,
[�Ƿ�����] [BIT] NULL ,
[��ע] [NVARCHAR] (2000) NULL,
[Logo] [NVARCHAR] (200) NULL
);
GO

CREATE PROC sp_ҽԺ_���� ( @tt tt_ҽԺ READONLY )
AS
    DECLARE @output tt_ҽԺ;
    MERGE dbo.ҽԺ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[����] = s.[����] ,
               t.[����] = s.[����] ,
               t.[��ϵ��] = s.[��ϵ��] ,
               t.[��ϵ�绰] = s.[��ϵ�绰] ,
               t.[��ַ] = s.[��ַ] ,
               t.[�Ƿ�����] = s.[�Ƿ�����] ,
               t.[��ע] = s.[��ע] ,
               t.[Logo] = s.[Logo]
    WHEN NOT MATCHED THEN
        INSERT ( ���� ,
                 ���� ,
                 ��ϵ�� ,
                 ��ϵ�绰 ,
                 ��ַ ,
                 �Ƿ����� ,
                 ��ע ,
                 Logo
               )
        VALUES ( s.���� ,
                 s.���� ,
                 s.��ϵ�� ,
                 s.��ϵ�绰 ,
                 s.��ַ ,
                 s.�Ƿ����� ,
                 s.��ע ,
                 s.Logo 
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;
GO
