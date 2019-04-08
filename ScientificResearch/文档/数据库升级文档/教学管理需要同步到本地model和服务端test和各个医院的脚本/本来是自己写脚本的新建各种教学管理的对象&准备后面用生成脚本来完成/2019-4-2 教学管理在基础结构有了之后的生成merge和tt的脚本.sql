CREATE TYPE tt_��ѧ��Ժ���� AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[��ѧרҵ���] [INT] NULL ,
[רҵ���ع���Ա���] [INT] NULL,
[��������] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��Ժ����_����
    (
      @tt tt_��ѧ��Ժ���� READONLY
    )
AS
    DECLARE @output tt_��ѧ��Ժ����;
    MERGE dbo.��ѧ��Ժ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[����] = s.[����] ,
               t.[��ѧרҵ���] = s.[��ѧרҵ���] ,
               t.[רҵ���ع���Ա���] = s.[רҵ���ع���Ա���] ,
               t.[��������] = s.[��������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���� ,
                 ��ѧרҵ��� ,
                 רҵ���ع���Ա��� ,
                 �������� ,
                 ��ע
               )
        VALUES ( s.���� ,
                 s.��ѧרҵ��� ,
                 s.רҵ���ع���Ա��� ,
                 s.�������� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ��Ժ���� AS TABLE
(
[���] [INT] NULL ,
[��ѧרҵ��Ժ���Ա��] [INT] NULL ,
[����ֵ] [INT] NULL ,
[��ѧרҵ���ұ��] [INT] NULL ,
[��Ժ���ұ��] [INT] NULL ,
[�Ƿ��ѡ] [BIT] NULL ,
[��ѵʱ��] [INT] NULL ,
[��͹ܴ�����] [INT] NULL ,
[���ȫ�̹�������] [INT] NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��Ժ����_����
    (
      @tt tt_��ѧ��Ժ���� READONLY
    )
AS
    DECLARE @output tt_��ѧ��Ժ����;
    MERGE dbo.��ѧ��Ժ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧרҵ��Ժ���Ա��] = s.[��ѧרҵ��Ժ���Ա��] ,
               t.[����ֵ] = s.[����ֵ] ,
               t.[��ѧרҵ���ұ��] = s.[��ѧרҵ���ұ��] ,
               t.[��Ժ���ұ��] = s.[��Ժ���ұ��] ,
               t.[�Ƿ��ѡ] = s.[�Ƿ��ѡ] ,
               t.[��ѵʱ��] = s.[��ѵʱ��] ,
               t.[��͹ܴ�����] = s.[��͹ܴ�����] ,
               t.[���ȫ�̹�������] = s.[���ȫ�̹�������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧרҵ��Ժ���Ա�� ,
                 ����ֵ ,
                 ��ѧרҵ���ұ�� ,
                 ��Ժ���ұ�� ,
                 �Ƿ��ѡ ,
                 ��ѵʱ�� ,
                 ��͹ܴ����� ,
                 ���ȫ�̹������� ,
                 ��ע
               )
        VALUES ( s.��ѧרҵ��Ժ���Ա�� ,
                 s.����ֵ ,
                 s.��ѧרҵ���ұ�� ,
                 s.��Ժ���ұ�� ,
                 s.�Ƿ��ѡ ,
                 s.��ѵʱ�� ,
                 s.��͹ܴ����� ,
                 s.���ȫ�̹������� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ��Ժ�������� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��Ժ���ұ��] [INT] NULL ,
[��Ŀ����] [NVARCHAR] (50) NULL ,
[�������ͱ��] [INT] NULL ,
[�Ƿ�����] [BIT] NULL ,
[�Ƿ񲡷�] [BIT] NULL ,
[�Ƿ�ҽ��] [BIT] NULL ,
[�������Ҫ��] [INT] NULL ,
[����Ҫ��] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��Ժ��������_����
    (
      @tt tt_��ѧ��Ժ�������� READONLY
    )
AS
    DECLARE @output tt_��ѧ��Ժ��������;
    MERGE dbo.��ѧ��Ժ�������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��Ժ���ұ��] = s.[��ѧ��Ժ���ұ��] ,
               t.[��Ŀ����] = s.[��Ŀ����] ,
               t.[�������ͱ��] = s.[�������ͱ��] ,
               t.[�Ƿ�����] = s.[�Ƿ�����] ,
               t.[�Ƿ񲡷�] = s.[�Ƿ񲡷�] ,
               t.[�Ƿ�ҽ��] = s.[�Ƿ�ҽ��] ,
               t.[�������Ҫ��] = s.[�������Ҫ��] ,
               t.[����Ҫ��] = s.[����Ҫ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��Ժ���ұ�� ,
                 ��Ŀ���� ,
                 �������ͱ�� ,
                 �Ƿ����� ,
                 �Ƿ񲡷� ,
                 �Ƿ�ҽ�� ,
                 �������Ҫ�� ,
                 ����Ҫ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ��Ժ���ұ�� ,
                 s.��Ŀ���� ,
                 s.�������ͱ�� ,
                 s.�Ƿ����� ,
                 s.�Ƿ񲡷� ,
                 s.�Ƿ�ҽ�� ,
                 s.�������Ҫ�� ,
                 s.����Ҫ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_��ѧ���� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת������] [INT] NULL ,
[��������] [NVARCHAR] (50) NULL,
[��������] [NVARCHAR] (50) NULL,
[���˱��] [INT] NULL,
[��������] [NVARCHAR] (2000) NULL,
[����] [NVARCHAR] (200) NULL,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL,
[�Ƿ�ͨ�����] [BIT] NULL 
);
GO

CREATE PROC sp_��ѧ����_���� ( @tt tt_��ѧ���� READONLY )
AS
    DECLARE @output tt_��ѧ����;
    MERGE dbo.��ѧ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת������] = s.[��ѧ��ת������] ,
               t.[��������] = s.[��������] ,
               t.[��������] = s.[��������] ,
               t.[���˱��] = s.[���˱��] ,
               t.[��������] = s.[��������] ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע] ,
               t.[�Ƿ�ͨ�����] = s.[�Ƿ�ͨ�����]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת������ ,
                 �������� ,
                 �������� ,
                 ���˱�� ,
                 �������� ,
                 ���� ,
                 ����ʱ�� ,
                 ��ע ,
                 �Ƿ�ͨ�����
               )
        VALUES ( s.��ѧ��ת������ ,
                 s.�������� ,
                 s.�������� ,
                 s.���˱�� ,
                 s.�������� ,
                 s.���� ,
                 GETDATE() ,
                 s.��ע ,
                 s.�Ƿ�ͨ����� 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_��ѧ���� AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[�Ա�] [NVARCHAR] (10) NULL,
[��������] [DATE] NULL,
[סԺ��] [NVARCHAR] (50) NULL,
[סԺ����] [NVARCHAR] (50) NULL,
[��Ҫ���] [NVARCHAR] (500) NULL,
[��Ҫ���] [NVARCHAR] (500) NULL,
[��Ժ����] [DATE] NULL,
[��Ժ����] [DATE] NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ����_���� ( @tt tt_��ѧ���� READONLY )
AS
    DECLARE @output tt_��ѧ����;
    MERGE dbo.��ѧ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[����] = s.[����] ,
               t.[�Ա�] = s.[�Ա�] ,
               t.[��������] = s.[��������] ,
               t.[סԺ��] = s.[סԺ��] ,
               t.[סԺ����] = s.[סԺ����] ,
               t.[��Ҫ���] = s.[��Ҫ���] ,
               t.[��Ҫ���] = s.[��Ҫ���] ,
               t.[��Ժ����] = s.[��Ժ����] ,
               t.[��Ժ����] = s.[��Ժ����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���� ,
                 �Ա� ,
                 �������� ,
                 סԺ�� ,
                 סԺ���� ,
                 ��Ҫ��� ,
                 ��Ҫ��� ,
                 ��Ժ���� ,
                 ��Ժ���� ,
                 ��ע
               )
        VALUES ( s.���� ,
                 s.�Ա� ,
                 s.�������� ,
                 s.סԺ�� ,
                 s.סԺ���� ,
                 s.��Ҫ��� ,
                 s.��Ҫ��� ,
                 s.��Ժ���� ,
                 s.��Ժ���� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_��ѧ����ת AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[˵��] [NVARCHAR] (500) NULL,
[��ʼ����] [DATE] NULL ,
[��������] [DATE] NULL ,
[������] [INT] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ����ת_���� ( @tt tt_��ѧ����ת READONLY )
AS
    DECLARE @output tt_��ѧ����ת;
    MERGE dbo.��ѧ����ת t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[˵��] = s.[˵��] ,
               t.[��ʼ����] = s.[��ʼ����] ,
               t.[��������] = s.[��������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 ˵�� ,
                 ��ʼ���� ,
                 �������� ,
                 ������ ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.˵�� ,
                 s.��ʼ���� ,
                 s.�������� ,
                 s.������ ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ�������� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[�����������] [DATE] NULL ,
[����С��] [NVARCHAR] (500) NULL,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL,
[�Ƿ�ͨ�����] [BIT] NULL 
);
GO

CREATE PROC sp_��ѧ��������_����
    (
      @tt tt_��ѧ�������� READONLY
    )
AS
    DECLARE @output tt_��ѧ��������;
    MERGE dbo.��ѧ�������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[�����������] = s.[�����������] ,
               t.[����С��] = s.[����С��] ,
               t.[��ע] = s.[��ע] ,
               t.[�Ƿ�ͨ�����] = s.[�Ƿ�ͨ�����]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 ����������� ,
                 ����С�� ,
                 ����ʱ�� ,
                 ��ע ,
                 �Ƿ�ͨ�����
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.����������� ,
                 s.����С�� ,
                 GETDATE() ,
                 s.��ע ,
                 s.�Ƿ�ͨ����� 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ�������� AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��������_����
    (
      @tt tt_��ѧ�������� READONLY
    )
AS
    DECLARE @output tt_��ѧ��������;
    MERGE dbo.��ѧ�������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���, ����, ��ע )
        VALUES ( s.���, s.����, s.��ע )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ������� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[��������] [DATE] NULL ,
[��ѧ�������ͱ��] [INT] NULL ,
[˵��] [NVARCHAR] (500) NULL,
[������] [INT] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�������_����
    (
      @tt tt_��ѧ������� READONLY
    )
AS
    DECLARE @output tt_��ѧ�������;
    MERGE dbo.��ѧ������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[��������] = s.[��������] ,
               t.[��ѧ�������ͱ��] = s.[��ѧ�������ͱ��] ,
               t.[˵��] = s.[˵��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 �������� ,
                 ��ѧ�������ͱ�� ,
                 ˵�� ,
                 ������ ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.�������� ,
                 s.��ѧ�������ͱ�� ,
                 s.˵�� ,
                 s.������ ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
IF OBJECT_ID('sp_��ѧ������ʦ_����') IS NOT NULL
    BEGIN
        DROP PROC sp_��ѧ������ʦ_����;
    END;
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_��ѧ������ʦ' )
    BEGIN
        DROP TYPE  tt_��ѧ������ʦ;
    END;
CREATE TYPE tt_��ѧ������ʦ AS TABLE
(
[��ѧ���ұ��] [INT] NULL ,
[������ʦ���] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ������ʦ_����
    (
      @tt tt_��ѧ������ʦ READONLY
    )
AS
    DECLARE @output tt_��ѧ������ʦ;
    MERGE dbo.��ѧ������ʦ t
    USING @tt s
    ON s.��ѧ���ұ�� = t.��ѧ���ұ��
        AND s.������ʦ��� = t.������ʦ���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ���ұ��] = s.[��ѧ���ұ��] ,
               t.[������ʦ���] = s.[������ʦ���] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ���ұ��, ������ʦ���, ��ע )
        VALUES ( s.��ѧ���ұ�� ,
                 s.������ʦ��� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;
GO


CREATE TYPE tt_��ѧ����������ʦ AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[ԭ������ʦ���] [INT] NULL ,
[�´�����ʦ���] [INT] NULL ,
[������] [INT] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ����������ʦ_����
    (
      @tt tt_��ѧ����������ʦ READONLY
    )
AS
    DECLARE @output tt_��ѧ����������ʦ;
    MERGE dbo.��ѧ����������ʦ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[ԭ������ʦ���] = s.[ԭ������ʦ���] ,
               t.[�´�����ʦ���] = s.[�´�����ʦ���] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 ԭ������ʦ��� ,
                 �´�����ʦ��� ,
                 ������ ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.ԭ������ʦ��� ,
                 s.�´�����ʦ��� ,
                 s.������ ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ�ܴ����� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[���˱��] [INT] NULL ,
[�Ƿ�ȫ���㻤] [BIT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�ܴ�����_����
    (
      @tt tt_��ѧ�ܴ����� READONLY
    )
AS
    DECLARE @output tt_��ѧ�ܴ�����;
    MERGE dbo.��ѧ�ܴ����� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[���˱��] = s.[���˱��] ,
               t.[�Ƿ�ȫ���㻤] = s.[�Ƿ�ȫ���㻤] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת���, ���˱��, �Ƿ�ȫ���㻤, ��ע )
        VALUES ( s.��ѧ��ת��� ,
                 s.���˱�� ,
                 s.�Ƿ�ȫ���㻤 ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ� AS TABLE
(
[����] [INT] NULL ,
[�����] [NVARCHAR] (200) NULL ,
[���ʼʱ��] [DATETIME] NULL ,
[�����ʱ��] [DATETIME] NULL ,
[��ص�] [NVARCHAR] (200) NULL ,
[��ѧ����ͱ��] [INT] NULL ,
[�����˱��] [INT] NULL,
[����������] [NVARCHAR] (50) NULL,
[������ְ��] [NVARCHAR] (50) NULL,
[�����] [NVARCHAR] (2000) NULL,
[��ѧ����] [NVARCHAR] (200) NULL,
[���˱��] [INT] NULL,
[������] [INT] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�_���� ( @tt tt_��ѧ� READONLY )
AS
    DECLARE @output tt_��ѧ�;
    MERGE dbo.��ѧ� t
    USING @tt s
    ON s.���� = t.����
    WHEN MATCHED THEN
        UPDATE SET
               t.[�����] = s.[�����] ,
               t.[���ʼʱ��] = s.[���ʼʱ��] ,
               t.[�����ʱ��] = s.[�����ʱ��] ,
               t.[��ص�] = s.[��ص�] ,
               t.[��ѧ����ͱ��] = s.[��ѧ����ͱ��] ,
               t.[�����˱��] = s.[�����˱��] ,
               t.[����������] = s.[����������] ,
               t.[������ְ��] = s.[������ְ��] ,
               t.[�����] = s.[�����] ,
               t.[��ѧ����] = s.[��ѧ����] ,
               t.[���˱��] = s.[���˱��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ����� ,
                 ���ʼʱ�� ,
                 �����ʱ�� ,
                 ��ص� ,
                 ��ѧ����ͱ�� ,
                 �����˱�� ,
                 ���������� ,
                 ������ְ�� ,
                 ����� ,
                 ��ѧ���� ,
                 ���˱�� ,
                 ������ ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.����� ,
                 s.���ʼʱ�� ,
                 s.�����ʱ�� ,
                 s.��ص� ,
                 s.��ѧ����ͱ�� ,
                 s.�����˱�� ,
                 s.���������� ,
                 s.������ְ�� ,
                 s.����� ,
                 s.��ѧ���� ,
                 s.���˱�� ,
                 s.������ ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ����� AS TABLE
(
[���] [INT] NULL ,
[��ѧ����] [INT] NULL ,
[ѧԱ���] [INT] NULL ,
[��������] [NVARCHAR] (2000) NULL ,
[����] [NVARCHAR] (200) NULL,
[�Ƿ�ͨ������] [BIT] NULL,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�����_����
    (
      @tt tt_��ѧ����� READONLY
    )
AS
    DECLARE @output tt_��ѧ�����;
    MERGE dbo.��ѧ����� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ����] = s.[��ѧ����] ,
               t.[ѧԱ���] = s.[ѧԱ���] ,
               t.[��������] = s.[��������] ,
               t.[����] = s.[����] ,
               t.[�Ƿ�ͨ������] = s.[�Ƿ�ͨ������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ���� ,
                 ѧԱ��� ,
                 �������� ,
                 ���� ,
                 �Ƿ�ͨ������ ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ���� ,
                 s.ѧԱ��� ,
                 s.�������� ,
                 s.���� ,
                 s.�Ƿ�ͨ������ ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ��ɲ����� AS TABLE
(
[���] [INT] NULL ,
[��ѧ����] [INT] NULL ,
[ѧԱ���] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��ɲ�����_����
    (
      @tt tt_��ѧ��ɲ����� READONLY
    )
AS
    DECLARE @output tt_��ѧ��ɲ�����;
    MERGE dbo.��ѧ��ɲ����� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ����] = s.[��ѧ����] ,
               t.[ѧԱ���] = s.[ѧԱ���] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ����, ѧԱ���, ��ע )
        VALUES ( s.��ѧ����, s.ѧԱ���, s.��ע )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ����� AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[�����ģ��] [NVARCHAR] (2000) NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�����_����
    (
      @tt tt_��ѧ����� READONLY
    )
AS
    DECLARE @output tt_��ѧ�����;
    MERGE dbo.��ѧ����� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[����] = s.[����] ,
               t.[�����ģ��] = s.[�����ģ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���, ����, �����ģ��, ��ע )
        VALUES ( s.��� ,
                 s.���� ,
                 s.�����ģ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ����� AS TABLE
(
[���] [INT] NULL ,
[����������] [NVARCHAR] (50) NULL ,
[�����˱��] [INT] NULL ,
[��ѧ����] [INT] NULL ,
[��ѧ�������Ŀ���] [INT] NULL ,
[����] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�����_����
    (
      @tt tt_��ѧ����� READONLY
    )
AS
    DECLARE @output tt_��ѧ�����;
    MERGE dbo.��ѧ����� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[����������] = s.[����������] ,
               t.[�����˱��] = s.[�����˱��] ,
               t.[��ѧ����] = s.[��ѧ����] ,
               t.[��ѧ�������Ŀ���] = s.[��ѧ�������Ŀ���] ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���������� ,
                 �����˱�� ,
                 ��ѧ���� ,
                 ��ѧ�������Ŀ��� ,
                 ���� ,
                 ��ע
               )
        VALUES ( s.���������� ,
                 s.�����˱�� ,
                 s.��ѧ���� ,
                 s.��ѧ�������Ŀ��� ,
                 s.���� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ�������Ŀ AS TABLE
(
[���] [INT] NULL ,
[��ѧ����ͱ��] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[��׼��] [INT] NULL ,
[˵��] [NVARCHAR] (500) NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ�������Ŀ_����
    (
      @tt tt_��ѧ�������Ŀ READONLY
    )
AS
    DECLARE @output tt_��ѧ�������Ŀ;
    MERGE dbo.��ѧ�������Ŀ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ����ͱ��] = s.[��ѧ����ͱ��] ,
               t.[����] = s.[����] ,
               t.[��׼��] = s.[��׼��] ,
               t.[˵��] = s.[˵��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ����ͱ��, ����, ��׼��, ˵��, ��ע )
        VALUES ( s.��ѧ����ͱ�� ,
                 s.���� ,
                 s.��׼�� ,
                 s.˵�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_��ѧ��ɫȨ�� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ɫ���] [INT] NULL ,
[��ѧȨ�ޱ��] [INT] NULL 
);
GO

CREATE PROC sp_��ѧ��ɫȨ��_����
    (
      @tt tt_��ѧ��ɫȨ�� READONLY
    )
AS
    DECLARE @output tt_��ѧ��ɫȨ��;
    MERGE dbo.��ѧ��ɫȨ�� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ɫ���] = s.[��ѧ��ɫ���] ,
               t.[��ѧȨ�ޱ��] = s.[��ѧȨ�ޱ��]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ɫ���, ��ѧȨ�ޱ�� )
        VALUES ( s.��ѧ��ɫ���, s.��ѧȨ�ޱ�� )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ��ҵ���� AS TABLE
(
[���] [INT] NULL ,
[ѧԱ���] [INT] NULL ,
[˵��] [NVARCHAR] (500) NULL,
[�����ҵ����] [DATE] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL,
[�Ƿ�ͨ�����] [BIT] NULL 
);
GO

CREATE PROC sp_��ѧ��ҵ����_����
    (
      @tt tt_��ѧ��ҵ���� READONLY
    )
AS
    DECLARE @output tt_��ѧ��ҵ����;
    MERGE dbo.��ѧ��ҵ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[ѧԱ���] = s.[ѧԱ���] ,
               t.[˵��] = s.[˵��] ,
               t.[�����ҵ����] = s.[�����ҵ����] ,
               t.[��ע] = s.[��ע] ,
               t.[�Ƿ�ͨ�����] = s.[�Ƿ�ͨ�����]
    WHEN NOT MATCHED THEN
        INSERT ( ѧԱ��� ,
                 ˵�� ,
                 �����ҵ���� ,
                 ����ʱ�� ,
                 ��ע ,
                 �Ƿ�ͨ�����
               )
        VALUES ( s.ѧԱ��� ,
                 s.˵�� ,
                 s.�����ҵ���� ,
                 GETDATE() ,
                 s.��ע ,
                 s.�Ƿ�ͨ����� 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ���Գɼ� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[��������] [NVARCHAR] (50) NULL ,
[�ɼ�] [INT] NULL ,
[������] [INT] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ���Գɼ�_����
    (
      @tt tt_��ѧ���Գɼ� READONLY
    )
AS
    DECLARE @output tt_��ѧ���Գɼ�;
    MERGE dbo.��ѧ���Գɼ� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[��������] = s.[��������] ,
               t.[�ɼ�] = s.[�ɼ�] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 �������� ,
                 �ɼ� ,
                 ������ ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.�������� ,
                 s.�ɼ� ,
                 s.������ ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ���� AS TABLE
(
[���] [INT] NULL ,
[���ҹ���Ա���] [INT] NULL,
[���ѧԱ����] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ����_���� ( @tt tt_��ѧ���� READONLY )
AS
    DECLARE @output tt_��ѧ����;
    MERGE dbo.��ѧ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[���ҹ���Ա���] = s.[���ҹ���Ա���] ,
               t.[���ѧԱ����] = s.[���ѧԱ����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���, ���ҹ���Ա���, ���ѧԱ����, ��ע )
        VALUES ( s.��� ,
                 s.���ҹ���Ա��� ,
                 s.���ѧԱ���� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ��ת AS TABLE
(
[���] [INT] NULL ,
[ѧԱ���] [INT] NULL ,
[�ƻ��������] [DATE] NULL ,
[�ƻ���������] [DATE] NULL ,
[ʵ���������] [DATE] NULL,
[ʵ�ʳ�������] [DATE] NULL,
[��Ժ���ұ��] [INT] NULL ,
[������ʦ���] [INT] NULL ,
[��͹ܴ�����] [INT] NULL ,
[���ȫ�̹�������] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��ת_���� ( @tt tt_��ѧ��ת READONLY )
AS
    DECLARE @output tt_��ѧ��ת;
    MERGE dbo.��ѧ��ת t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[ѧԱ���] = s.[ѧԱ���] ,
               t.[�ƻ��������] = s.[�ƻ��������] ,
               t.[�ƻ���������] = s.[�ƻ���������] ,
               t.[ʵ���������] = s.[ʵ���������] ,
               t.[ʵ�ʳ�������] = s.[ʵ�ʳ�������] ,
               t.[��Ժ���ұ��] = s.[��Ժ���ұ��] ,
               t.[������ʦ���] = s.[������ʦ���] ,
               t.[��͹ܴ�����] = s.[��͹ܴ�����] ,
               t.[���ȫ�̹�������] = s.[���ȫ�̹�������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ѧԱ��� ,
                 �ƻ�������� ,
                 �ƻ��������� ,
                 ʵ��������� ,
                 ʵ�ʳ������� ,
                 ��Ժ���ұ�� ,
                 ������ʦ��� ,
                 ��͹ܴ����� ,
                 ���ȫ�̹������� ,
                 ��ע
               )
        VALUES ( s.ѧԱ��� ,
                 s.�ƻ�������� ,
                 s.�ƻ��������� ,
                 s.ʵ��������� ,
                 s.ʵ�ʳ������� ,
                 s.��Ժ���ұ�� ,
                 s.������ʦ��� ,
                 s.��͹ܴ����� ,
                 s.���ȫ�̹������� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ��ת���� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[��Ŀ����] [NVARCHAR] (50) NULL ,
[�������ͱ��] [INT] NULL ,
[�Ƿ�����] [BIT] NULL ,
[�Ƿ񲡷�] [BIT] NULL ,
[�Ƿ�ҽ��] [BIT] NULL ,
[�������Ҫ��] [INT] NULL ,
[����Ҫ��] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ��ת����_����
    (
      @tt tt_��ѧ��ת���� READONLY
    )
AS
    DECLARE @output tt_��ѧ��ת����;
    MERGE dbo.��ѧ��ת���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[��Ŀ����] = s.[��Ŀ����] ,
               t.[�������ͱ��] = s.[�������ͱ��] ,
               t.[�Ƿ�����] = s.[�Ƿ�����] ,
               t.[�Ƿ񲡷�] = s.[�Ƿ񲡷�] ,
               t.[�Ƿ�ҽ��] = s.[�Ƿ�ҽ��] ,
               t.[�������Ҫ��] = s.[�������Ҫ��] ,
               t.[����Ҫ��] = s.[����Ҫ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 ��Ŀ���� ,
                 �������ͱ�� ,
                 �Ƿ����� ,
                 �Ƿ񲡷� ,
                 �Ƿ�ҽ�� ,
                 �������Ҫ�� ,
                 ����Ҫ�� ,
                 ��ע
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.��Ŀ���� ,
                 s.�������ͱ�� ,
                 s.�Ƿ����� ,
                 s.�Ƿ񲡷� ,
                 s.�Ƿ�ҽ�� ,
                 s.�������Ҫ�� ,
                 s.����Ҫ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ���ֵȼ� AS TABLE
(
[���] [INT] NULL ,
[��������] [NVARCHAR] (50) NULL ,
[�ȼ�����] [NVARCHAR] (50) NULL ,
[��С��ֵ] [INT] NULL ,
[����ֵ] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ���ֵȼ�_����
    (
      @tt tt_��ѧ���ֵȼ� READONLY
    )
AS
    DECLARE @output tt_��ѧ���ֵȼ�;
    MERGE dbo.��ѧ���ֵȼ� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��������] = s.[��������] ,
               t.[�ȼ�����] = s.[�ȼ�����] ,
               t.[��С��ֵ] = s.[��С��ֵ] ,
               t.[����ֵ] = s.[����ֵ] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��������, �ȼ�����, ��С��ֵ, ����ֵ, ��ע )
        VALUES ( s.�������� ,
                 s.�ȼ����� ,
                 s.��С��ֵ ,
                 s.����ֵ ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧ������� AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[��ٿ�ʼ����] [DATE] NULL ,
[�������] [INT] NULL ,
[�������] [NVARCHAR] (500) NULL ,
[��ת���ڿ�ʼ����] [DATE] NULL,
[��ת���ڽ�������] [DATE] NULL,
[������] [INT] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL,
[�Ƿ�ͨ�����] [BIT] NULL 
);
GO

CREATE PROC sp_��ѧ�������_����
    (
      @tt tt_��ѧ������� READONLY
    )
AS
    DECLARE @output tt_��ѧ�������;
    MERGE dbo.��ѧ������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[��ٿ�ʼ����] = s.[��ٿ�ʼ����] ,
               t.[�������] = s.[�������] ,
               t.[�������] = s.[�������] ,
               t.[��ת���ڿ�ʼ����] = s.[��ת���ڿ�ʼ����] ,
               t.[��ת���ڽ�������] = s.[��ת���ڽ�������] ,
               t.[��ע] = s.[��ע] ,
               t.[�Ƿ�ͨ�����] = s.[�Ƿ�ͨ�����]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 ��ٿ�ʼ���� ,
                 ������� ,
                 ������� ,
                 ��ת���ڿ�ʼ���� ,
                 ��ת���ڽ������� ,
                 ������ ,
                 ����ʱ�� ,
                 ��ע ,
                 �Ƿ�ͨ�����
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.��ٿ�ʼ���� ,
                 s.������� ,
                 s.������� ,
                 s.��ת���ڿ�ʼ���� ,
                 s.��ת���ڽ������� ,
                 s.������ ,
                 GETDATE() ,
                 s.��ע ,
                 s.�Ƿ�ͨ����� 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧ��Ա��ɫ AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ɫ���] [INT] NULL ,
[��Ա���] [INT] NULL 
);
GO

CREATE PROC sp_��ѧ��Ա��ɫ_����
    (
      @tt tt_��ѧ��Ա��ɫ READONLY
    )
AS
    DECLARE @output tt_��ѧ��Ա��ɫ;
    MERGE dbo.��ѧ��Ա��ɫ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ɫ���] = s.[��ѧ��ɫ���] ,
               t.[��Ա���] = s.[��Ա���]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ɫ���, ��Ա��� )
        VALUES ( s.��ѧ��ɫ���, s.��Ա��� )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧ����¥ AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[����] [INT] NULL,
[��Ԫ��] [INT] NULL,
[ÿ��Ԫÿ�㻧��] [INT] NULL,
[ÿ������] [INT] NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧ����¥_���� ( @tt tt_��ѧ����¥ READONLY )
AS
    DECLARE @output tt_��ѧ����¥;
    MERGE dbo.��ѧ����¥ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[����] = s.[����] ,
               t.[����] = s.[����] ,
               t.[��Ԫ��] = s.[��Ԫ��] ,
               t.[ÿ��Ԫÿ�㻧��] = s.[ÿ��Ԫÿ�㻧��] ,
               t.[ÿ������] = s.[ÿ������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���� ,
                 ���� ,
                 ��Ԫ�� ,
                 ÿ��Ԫÿ�㻧�� ,
                 ÿ������ ,
                 ��ע
               )
        VALUES ( s.���� ,
                 s.���� ,
                 s.��Ԫ�� ,
                 s.ÿ��Ԫÿ�㻧�� ,
                 s.ÿ������ ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧ�������� AS TABLE
(
[���] [INT] NULL ,
[ѧԱ���] [INT] NULL ,
[˵��] [NVARCHAR] (500) NULL,
[������������] [DATE] NULL ,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL,
[�Ƿ�ͨ�����] [BIT] NULL 
);
GO

CREATE PROC sp_��ѧ��������_����
    (
      @tt tt_��ѧ�������� READONLY
    )
AS
    DECLARE @output tt_��ѧ��������;
    MERGE dbo.��ѧ�������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[ѧԱ���] = s.[ѧԱ���] ,
               t.[˵��] = s.[˵��] ,
               t.[������������] = s.[������������] ,
               t.[��ע] = s.[��ע] ,
               t.[�Ƿ�ͨ�����] = s.[�Ƿ�ͨ�����]
    WHEN NOT MATCHED THEN
        INSERT ( ѧԱ��� ,
                 ˵�� ,
                 ������������ ,
                 ����ʱ�� ,
                 ��ע ,
                 �Ƿ�ͨ�����
               )
        VALUES ( s.ѧԱ��� ,
                 s.˵�� ,
                 s.������������ ,
                 GETDATE() ,
                 s.��ע ,
                 s.�Ƿ�ͨ����� 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧѧԱ AS TABLE
(
[���] [INT] NULL ,
[��ԴѧУ���] [INT] NULL,
[��Դѧ�����] [INT] NULL,
[ѧԱ���ͱ��] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[����] [NVARCHAR] (50) NULL ,
[ͷ��·��] [NVARCHAR] (100) NULL,
[����] [NVARCHAR] (50) NULL ,
[�Ա�] [NVARCHAR] (50) NULL,
[����] [NVARCHAR] (50) NULL,
[֤������] [NVARCHAR] (50) NULL,
[֤������] [NVARCHAR] (50) NULL,
[��������] [DATE] NULL,
[�ֻ�����] [NVARCHAR] (50) NULL,
[������ò] [NVARCHAR] (50) NULL,
[��������] [NVARCHAR] (50) NULL,
[QQ����] [NVARCHAR] (50) NULL,
[΢�ź�] [NVARCHAR] (50) NULL,
[��ͥסַ] [NVARCHAR] (50) NULL,
[ȡ��ִҵ֤������] [DATE] NULL,
[ְҵ֤����] [NVARCHAR] (50) NULL,
[ȡ��ҽʦ�ʸ�֤������] [DATE] NULL,
[ҽʦ�ʸ�֤����] [NVARCHAR] (50) NULL,
[���ѧ��] [NVARCHAR] (50) NULL,
[��ҵ���] [INT] NULL,
[��ҵѧУ] [NVARCHAR] (100) NULL,
[��ҵרҵ] [NVARCHAR] (100) NULL,
[��ҵ֤����] [NVARCHAR] (100) NULL,
[ѧλ֤����] [NVARCHAR] (100) NULL,
[ѧԱ��ѵ���] [INT] NULL ,
[ѧԱ��ѵ����] [INT] NULL ,
[�Ƿ�Ӧ����] [BIT] NULL,
[רҵ���] [INT] NULL ,
[���෽ʽ] [NVARCHAR] (50) NULL,
[������λ] [NVARCHAR] (100) NULL,
[ҽ����������] [NVARCHAR] (100) NULL,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧѧԱ_���� ( @tt tt_��ѧѧԱ READONLY )
AS
    DECLARE @output tt_��ѧѧԱ;
    MERGE dbo.��ѧѧԱ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ԴѧУ���] = s.[��ԴѧУ���] ,
               t.[��Դѧ�����] = s.[��Դѧ�����] ,
               t.[ѧԱ���ͱ��] = s.[ѧԱ���ͱ��] ,
               t.[����] = s.[����] ,
               t.[����] = s.[����] ,
               t.[ͷ��·��] = s.[ͷ��·��] ,
               t.[����] = s.[����] ,
               t.[�Ա�] = s.[�Ա�] ,
               t.[����] = s.[����] ,
               t.[֤������] = s.[֤������] ,
               t.[֤������] = s.[֤������] ,
               t.[��������] = s.[��������] ,
               t.[�ֻ�����] = s.[�ֻ�����] ,
               t.[������ò] = s.[������ò] ,
               t.[��������] = s.[��������] ,
               t.[QQ����] = s.[QQ����] ,
               t.[΢�ź�] = s.[΢�ź�] ,
               t.[��ͥסַ] = s.[��ͥסַ] ,
               t.[ȡ��ִҵ֤������] = s.[ȡ��ִҵ֤������] ,
               t.[ְҵ֤����] = s.[ְҵ֤����] ,
               t.[ȡ��ҽʦ�ʸ�֤������] = s.[ȡ��ҽʦ�ʸ�֤������] ,
               t.[ҽʦ�ʸ�֤����] = s.[ҽʦ�ʸ�֤����] ,
               t.[���ѧ��] = s.[���ѧ��] ,
               t.[��ҵ���] = s.[��ҵ���] ,
               t.[��ҵѧУ] = s.[��ҵѧУ] ,
               t.[��ҵרҵ] = s.[��ҵרҵ] ,
               t.[��ҵ֤����] = s.[��ҵ֤����] ,
               t.[ѧλ֤����] = s.[ѧλ֤����] ,
               t.[ѧԱ��ѵ���] = s.[ѧԱ��ѵ���] ,
               t.[ѧԱ��ѵ����] = s.[ѧԱ��ѵ����] ,
               t.[�Ƿ�Ӧ����] = s.[�Ƿ�Ӧ����] ,
               t.[רҵ���] = s.[רҵ���] ,
               t.[���෽ʽ] = s.[���෽ʽ] ,
               t.[������λ] = s.[������λ] ,
               t.[ҽ����������] = s.[ҽ����������] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ԴѧУ��� ,
                 ��Դѧ����� ,
                 ѧԱ���ͱ�� ,
                 ���� ,
                 ���� ,
                 ͷ��·�� ,
                 ���� ,
                 �Ա� ,
                 ���� ,
                 ֤������ ,
                 ֤������ ,
                 �������� ,
                 �ֻ����� ,
                 ������ò ,
                 �������� ,
                 QQ���� ,
                 ΢�ź� ,
                 ��ͥסַ ,
                 ȡ��ִҵ֤������ ,
                 ְҵ֤���� ,
                 ȡ��ҽʦ�ʸ�֤������ ,
                 ҽʦ�ʸ�֤���� ,
                 ���ѧ�� ,
                 ��ҵ��� ,
                 ��ҵѧУ ,
                 ��ҵרҵ ,
                 ��ҵ֤���� ,
                 ѧλ֤���� ,
                 ѧԱ��ѵ��� ,
                 ѧԱ��ѵ���� ,
                 �Ƿ�Ӧ���� ,
                 רҵ��� ,
                 ���෽ʽ ,
                 ������λ ,
                 ҽ���������� ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��ԴѧУ��� ,
                 s.��Դѧ����� ,
                 s.ѧԱ���ͱ�� ,
                 s.���� ,
                 s.���� ,
                 s.ͷ��·�� ,
                 s.���� ,
                 s.�Ա� ,
                 s.���� ,
                 s.֤������ ,
                 s.֤������ ,
                 s.�������� ,
                 s.�ֻ����� ,
                 s.������ò ,
                 s.�������� ,
                 s.QQ���� ,
                 s.΢�ź� ,
                 s.��ͥסַ ,
                 s.ȡ��ִҵ֤������ ,
                 s.ְҵ֤���� ,
                 s.ȡ��ҽʦ�ʸ�֤������ ,
                 s.ҽʦ�ʸ�֤���� ,
                 s.���ѧ�� ,
                 s.��ҵ��� ,
                 s.��ҵѧУ ,
                 s.��ҵרҵ ,
                 s.��ҵ֤���� ,
                 s.ѧλ֤���� ,
                 s.ѧԱ��ѵ��� ,
                 s.ѧԱ��ѵ���� ,
                 s.�Ƿ�Ӧ���� ,
                 s.רҵ��� ,
                 s.���෽ʽ ,
                 s.������λ ,
                 s.ҽ���������� ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_��ѧѧԱ���� AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧѧԱ����_����
    (
      @tt tt_��ѧѧԱ���� READONLY
    )
AS
    DECLARE @output tt_��ѧѧԱ����;
    MERGE dbo.��ѧѧԱ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���, ����, ��ע )
        VALUES ( s.���, s.����, s.��ע )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧѧԱ��ѵ AS TABLE
(
[���] [INT] NULL ,
[����ʱ��] [DATETIME] NULL,
[��ѧ��Ժ���Ա��] [INT] NULL,
[�ƻ���ʼ��ѵ����] [DATE] NULL,
[�ƻ�������ѵ����] [DATE] NULL,
[ʵ�ʿ�ʼ��ѵ����] [DATE] NULL,
[ʵ�ʽ�����ѵ����] [DATE] NULL,
[��������] [DATE] NULL,
[��ҵ����] [DATE] NULL,
[֤��] [NVARCHAR] (200) NULL,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧѧԱ��ѵ_����
    (
      @tt tt_��ѧѧԱ��ѵ READONLY
    )
AS
    DECLARE @output tt_��ѧѧԱ��ѵ;
    MERGE dbo.��ѧѧԱ��ѵ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[����ʱ��] = s.[����ʱ��] ,
               t.[��ѧ��Ժ���Ա��] = s.[��ѧ��Ժ���Ա��] ,
               t.[�ƻ���ʼ��ѵ����] = s.[�ƻ���ʼ��ѵ����] ,
               t.[�ƻ�������ѵ����] = s.[�ƻ�������ѵ����] ,
               t.[ʵ�ʿ�ʼ��ѵ����] = s.[ʵ�ʿ�ʼ��ѵ����] ,
               t.[ʵ�ʽ�����ѵ����] = s.[ʵ�ʽ�����ѵ����] ,
               t.[��������] = s.[��������] ,
               t.[��ҵ����] = s.[��ҵ����] ,
               t.[֤��] = s.[֤��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��� ,
                 ����ʱ�� ,
                 ��ѧ��Ժ���Ա�� ,
                 �ƻ���ʼ��ѵ���� ,
                 �ƻ�������ѵ���� ,
                 ʵ�ʿ�ʼ��ѵ���� ,
                 ʵ�ʽ�����ѵ���� ,
                 �������� ,
                 ��ҵ���� ,
                 ֤�� ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��� ,
                 s.����ʱ�� ,
                 s.��ѧ��Ժ���Ա�� ,
                 s.�ƻ���ʼ��ѵ���� ,
                 s.�ƻ�������ѵ���� ,
                 s.ʵ�ʿ�ʼ��ѵ���� ,
                 s.ʵ�ʽ�����ѵ���� ,
                 s.�������� ,
                 s.��ҵ���� ,
                 s.֤�� ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧѧԱ���ᰲ�� AS TABLE
(
[���] [INT] NULL ,
[����¥���] [INT] NULL,
[�Ž�������] [NVARCHAR] (50) NULL,
[���ƺż�����] [NVARCHAR] (50) NULL,
[ְλ] [NVARCHAR] (50) NULL,
[ˮ����] [NUMERIC] (18,2) NULL,
[������] [NUMERIC] (18,2) NULL,
[������] [NUMERIC] (18,2) NULL,
[���ɽ����] [NUMERIC] (18,2) NULL,
[��ס����] [DATE] NULL,
[�˳�����] [DATE] NULL,
[�˳�ԭ��] [NVARCHAR] (500) NULL,
[���ᰲ��˵��] [NVARCHAR] (500) NULL,
[����ʱ��] [DATETIME] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧѧԱ���ᰲ��_����
    (
      @tt tt_��ѧѧԱ���ᰲ�� READONLY
    )
AS
    DECLARE @output tt_��ѧѧԱ���ᰲ��;
    MERGE dbo.��ѧѧԱ���ᰲ�� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[����¥���] = s.[����¥���] ,
               t.[�Ž�������] = s.[�Ž�������] ,
               t.[���ƺż�����] = s.[���ƺż�����] ,
               t.[ְλ] = s.[ְλ] ,
               t.[ˮ����] = s.[ˮ����] ,
               t.[������] = s.[������] ,
               t.[������] = s.[������] ,
               t.[���ɽ����] = s.[���ɽ����] ,
               t.[��ס����] = s.[��ס����] ,
               t.[�˳�����] = s.[�˳�����] ,
               t.[�˳�ԭ��] = s.[�˳�ԭ��] ,
               t.[���ᰲ��˵��] = s.[���ᰲ��˵��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��� ,
                 ����¥��� ,
                 �Ž������� ,
                 ���ƺż����� ,
                 ְλ ,
                 ˮ���� ,
                 ������ ,
                 ������ ,
                 ���ɽ���� ,
                 ��ס���� ,
                 �˳����� ,
                 �˳�ԭ�� ,
                 ���ᰲ��˵�� ,
                 ����ʱ�� ,
                 ��ע
               )
        VALUES ( s.��� ,
                 s.����¥��� ,
                 s.�Ž������� ,
                 s.���ƺż����� ,
                 s.ְλ ,
                 s.ˮ���� ,
                 s.������ ,
                 s.������ ,
                 s.���ɽ���� ,
                 s.��ס���� ,
                 s.�˳����� ,
                 s.�˳�ԭ�� ,
                 s.���ᰲ��˵�� ,
                 GETDATE() ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧҽ�Ʋ���¹ʼ�¼ AS TABLE
(
[���] [INT] NULL ,
[��ѧ��ת���] [INT] NULL ,
[��������] [DATE] NULL ,
[�������] [NVARCHAR] (50) NULL ,
[����ԭ��] [NVARCHAR] (500) NULL ,
[�������] [NVARCHAR] (500) NULL ,
[����] [NVARCHAR] (200) NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧҽ�Ʋ���¹ʼ�¼_����
    (
      @tt tt_��ѧҽ�Ʋ���¹ʼ�¼ READONLY
    )
AS
    DECLARE @output tt_��ѧҽ�Ʋ���¹ʼ�¼;
    MERGE dbo.��ѧҽ�Ʋ���¹ʼ�¼ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧ��ת���] = s.[��ѧ��ת���] ,
               t.[��������] = s.[��������] ,
               t.[�������] = s.[�������] ,
               t.[����ԭ��] = s.[����ԭ��] ,
               t.[�������] = s.[�������] ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧ��ת��� ,
                 �������� ,
                 ������� ,
                 ����ԭ�� ,
                 ������� ,
                 ���� ,
                 ��ע
               )
        VALUES ( s.��ѧ��ת��� ,
                 s.�������� ,
                 s.������� ,
                 s.����ԭ�� ,
                 s.������� ,
                 s.���� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧרҵ AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[���] [INT] NULL ,
[�Ƿ���ұ�׼] [BIT] NULL ,
[��׼����] [NVARCHAR] (50) NULL,
[�����ѵʱ��] [INT] NULL,
[ѧϰҪ��Ŀ��] [NTEXT] NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧרҵ_���� ( @tt tt_��ѧרҵ READONLY )
AS
    DECLARE @output tt_��ѧרҵ;
    MERGE dbo.��ѧרҵ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[����] = s.[����] ,
               t.[���] = s.[���] ,
               t.[�Ƿ���ұ�׼] = s.[�Ƿ���ұ�׼] ,
               t.[��׼����] = s.[��׼����] ,
               t.[�����ѵʱ��] = s.[�����ѵʱ��] ,
               t.[ѧϰҪ��Ŀ��] = s.[ѧϰҪ��Ŀ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���� ,
                 ��� ,
                 �Ƿ���ұ�׼ ,
                 ��׼���� ,
                 �����ѵʱ�� ,
                 ѧϰҪ��Ŀ�� ,
                 ��ע
               )
        VALUES ( s.���� ,
                 s.��� ,
                 s.�Ƿ���ұ�׼ ,
                 s.��׼���� ,
                 s.�����ѵʱ�� ,
                 s.ѧϰҪ��Ŀ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧרҵ���� AS TABLE
(
[���] [INT] NULL ,
[��ѧרҵ���] [INT] NULL ,
[����ֵ] [INT] NULL ,
[��������] [NVARCHAR] (50) NULL ,
[�����ѵʱ��] [INT] NULL ,
[��͹ܴ�����] [INT] NULL ,
[���ȫ�̹�������] [INT] NULL ,
[����Ҫ��] [NTEXT] NULL,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧרҵ����_����
    (
      @tt tt_��ѧרҵ���� READONLY
    )
AS
    DECLARE @output tt_��ѧרҵ����;
    MERGE dbo.��ѧרҵ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧרҵ���] = s.[��ѧרҵ���] ,
               t.[����ֵ] = s.[����ֵ] ,
               t.[��������] = s.[��������] ,
               t.[�����ѵʱ��] = s.[�����ѵʱ��] ,
               t.[��͹ܴ�����] = s.[��͹ܴ�����] ,
               t.[���ȫ�̹�������] = s.[���ȫ�̹�������] ,
               t.[����Ҫ��] = s.[����Ҫ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧרҵ��� ,
                 ����ֵ ,
                 �������� ,
                 �����ѵʱ�� ,
                 ��͹ܴ����� ,
                 ���ȫ�̹������� ,
                 ����Ҫ�� ,
                 ��ע
               )
        VALUES ( s.��ѧרҵ��� ,
                 s.����ֵ ,
                 s.�������� ,
                 s.�����ѵʱ�� ,
                 s.��͹ܴ����� ,
                 s.���ȫ�̹������� ,
                 s.����Ҫ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧרҵ�������� AS TABLE
(
[���] [INT] NULL ,
[��ѧרҵ���ұ��] [INT] NULL ,
[��Ŀ����] [NVARCHAR] (50) NULL ,
[�������ͱ��] [INT] NULL ,
[�Ƿ�����] [BIT] NULL ,
[�Ƿ񲡷�] [BIT] NULL ,
[�Ƿ�ҽ��] [BIT] NULL ,
[�������Ҫ��] [INT] NULL ,
[����Ҫ��] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧרҵ��������_����
    (
      @tt tt_��ѧרҵ�������� READONLY
    )
AS
    DECLARE @output tt_��ѧרҵ��������;
    MERGE dbo.��ѧרҵ�������� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧרҵ���ұ��] = s.[��ѧרҵ���ұ��] ,
               t.[��Ŀ����] = s.[��Ŀ����] ,
               t.[�������ͱ��] = s.[�������ͱ��] ,
               t.[�Ƿ�����] = s.[�Ƿ�����] ,
               t.[�Ƿ񲡷�] = s.[�Ƿ񲡷�] ,
               t.[�Ƿ�ҽ��] = s.[�Ƿ�ҽ��] ,
               t.[�������Ҫ��] = s.[�������Ҫ��] ,
               t.[����Ҫ��] = s.[����Ҫ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧרҵ���ұ�� ,
                 ��Ŀ���� ,
                 �������ͱ�� ,
                 �Ƿ����� ,
                 �Ƿ񲡷� ,
                 �Ƿ�ҽ�� ,
                 �������Ҫ�� ,
                 ����Ҫ�� ,
                 ��ע
               )
        VALUES ( s.��ѧרҵ���ұ�� ,
                 s.��Ŀ���� ,
                 s.�������ͱ�� ,
                 s.�Ƿ����� ,
                 s.�Ƿ񲡷� ,
                 s.�Ƿ�ҽ�� ,
                 s.�������Ҫ�� ,
                 s.����Ҫ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧרҵ������������ AS TABLE
(
[���] [INT] NULL ,
[����] [NVARCHAR] (50) NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧרҵ������������_����
    (
      @tt tt_��ѧרҵ������������ READONLY
    )
AS
    DECLARE @output tt_��ѧרҵ������������;
    MERGE dbo.��ѧרҵ������������ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���] = s.[���] ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ���, ����, ��ע )
        VALUES ( s.���, s.����, s.��ע )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_��ѧרҵ����Ҫ�� AS TABLE
(
[���] [INT] NULL ,
[��ѧרҵ���ұ��] [INT] NULL ,
[��Ŀ����] [NVARCHAR] (500) NULL ,
[˵��] [NVARCHAR] (200) NULL,
[�������Ҫ��] [INT] NULL ,
[��ע] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_��ѧרҵ����Ҫ��_����
    (
      @tt tt_��ѧרҵ����Ҫ�� READONLY
    )
AS
    DECLARE @output tt_��ѧרҵ����Ҫ��;
    MERGE dbo.��ѧרҵ����Ҫ�� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[��ѧרҵ���ұ��] = s.[��ѧרҵ���ұ��] ,
               t.[��Ŀ����] = s.[��Ŀ����] ,
               t.[˵��] = s.[˵��] ,
               t.[�������Ҫ��] = s.[�������Ҫ��] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT ( ��ѧרҵ���ұ�� ,
                 ��Ŀ���� ,
                 ˵�� ,
                 �������Ҫ�� ,
                 ��ע
               )
        VALUES ( s.��ѧרҵ���ұ�� ,
                 s.��Ŀ���� ,
                 s.˵�� ,
                 s.�������Ҫ�� ,
                 s.��ע 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
-------------------------------------tfn
CREATE FUNCTION [dbo].[tfn_��ѧ��Ա��Ȩ��] ( @���� NVARCHAR(50) )
RETURNS TABLE
AS RETURN
    SELECT DISTINCT
            c.*
    FROM    ��Ա a1
            JOIN dbo.��ѧ��Ա��ɫ a ON a1.��� = a.��Ա���
            JOIN dbo.��ѧ��ɫȨ�� b ON a.��ѧ��ɫ��� = b.��ѧ��ɫ���
            JOIN ��ѧȨ�� c ON b.��ѧȨ�ޱ�� = c.���
    WHERE   a1.���� = @����;
