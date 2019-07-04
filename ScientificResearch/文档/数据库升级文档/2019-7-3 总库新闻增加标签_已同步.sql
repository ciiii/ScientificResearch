
IF ( OBJECT_ID('���ŷ���') IS NOT NULL )
    DROP TABLE ���ŷ���;
GO

CREATE TABLE [dbo].[���ŷ���]
    (
      [���] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_���ŷ���] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

INSERT  dbo.���ŷ���
        ( ���, ����, ��ע )
VALUES  ( 1, N'ָ��', N'' ),
        ( 2, N'ǰ��', N'' );

GO

IF ( OBJECT_ID('��ǩ') IS NOT NULL )
    DROP TABLE ��ǩ;
GO

CREATE TABLE [dbo].[��ǩ]
    (
      [���] [INT] NOT NULL ,
      [���ŷ�����] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ǩ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

INSERT  dbo.��ǩ
        ( ���, ���ŷ�����, ����, ��ע )
VALUES 
(1,1,N'��Ѫ��',N''),
(2,1,N'�ڷ���',N''),
(3,1,N'����',N''),
(4,1,N'����',N''),
(5,1,N'����',N''),
(6,1,N'�ǿ�',N''),
(7,1,N'����',N''),
(8,1,N'����',N''),
(9,1,N'����',N''),
(10,1,N'����',N''),
(11,1,N'�ۿ�',N''),
(12,1,N'���Ǻ�',N''),
(13,1,N'Σ��֢',N''),
(14,1,N'��ʪ',N''),
(15,1,N'����',N''),
(16,1,N'ѪҺ',N''),
(17,1,N'����',N''),
(18,1,N'��������',N''),
(19,1,N'����',N''),
(20,1,N'����',N''),
(21,1,N'ȫ��ҽѧ',N''),
(22,1,N'��ǻ',N''),
(23,1,N'Ƥ���Բ�',N''),
(24,1,N'Ԥ��ҽѧ',N''),
(25,1,N'����',N''),
(26,1,N'Ӱ��',N''),
(27,1,N'����',N''),
(28,1,N'����',N''),
(29,1,N'����',N''),
(30,1,N'ҩѧ',N''),
(31,1,N'�Ŵ�',N''),
(32,1,N'�༭д��',N''),
(33,1,N'����ҽѧ',N''),
(34,1,N'����ҽѧ',N''),
(35,1,N'΢��',N''),
(36,1,N'����',N''),
(37,1,N'ҽѧ����',N''),
(38,1,N'��ҽ��ҩ',N'');

GO

IF ( OBJECT_ID('���ű�ǩ') IS NOT NULL )
    DROP TABLE ���ű�ǩ;
GO

CREATE TABLE [dbo].[���ű�ǩ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [���ű��] [INT] NOT NULL ,
      [��ǩ���] INT NOT NULL ,
      CONSTRAINT [PK_���ű�ǩ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

IF ( OBJECT_ID('����') IS NOT NULL )
    DROP TABLE dbo.����;
GO

CREATE TABLE [dbo].[����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [���ŷ�����] [INT] NOT NULL ,
      [����] [NVARCHAR](200) NOT NULL ,
      [����] [NVARCHAR](MAX) NULL ,
      [����ʱ��] [DATETIME] NULL ,
      CONSTRAINT [PK_����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

IF ( OBJECT_ID('v_����_����') IS NOT NULL )
    DROP VIEW dbo.v_����_����;
GO

CREATE VIEW v_����_����
AS
    SELECT  a.��� ,
            a.���ŷ����� ,
            b.���� AS ���ŷ������� ,
            a.���� ,
            STUFF(( SELECT  ',' + z2.����
                    FROM    ���ű�ǩ z1
                            JOIN dbo.��ǩ z2 ON z1.���ű�� = a.���
                                              AND z1.��ǩ��� = z2.���
                  FOR
                    XML PATH('')
                  ), 1, 1, '') AS ��ǩ ,
            a.���� ,
            a.����ʱ��
    FROM    dbo.���� a
            JOIN dbo.���ŷ��� b ON a.���ŷ����� = b.���;


GO


IF ( OBJECT_ID('v_����_�б�') IS NOT NULL )
    DROP VIEW dbo.v_����_�б�;
GO

CREATE VIEW v_����_�б�
AS
    SELECT  ��� ,
            ���ŷ����� ,
            ���ŷ������� ,
            ���� ,��ǩ,
            --���� ,
            ����ʱ��
    FROM    dbo.v_����_����;

	GO
   
-----------------
IF OBJECT_ID('sp_����_����') IS NOT NULL
    BEGIN
        DROP PROC sp_����_����;
    END;

	GO
    
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_����' )
    BEGIN
        DROP TYPE  tt_����;
    END;

	GO
    
CREATE TYPE tt_���� AS TABLE
(
[���] [INT] NULL ,
[���ŷ�����] [INT] NULL ,
[����] [NVARCHAR] (200) NULL ,
[����] [NTEXT] NULL,
[����ʱ��] [DATETIME] NULL
);
GO

CREATE PROC sp_����_���� ( @tt tt_���� READONLY )
AS
    DECLARE @output tt_����;
    MERGE dbo.���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���ŷ�����] = s.[���ŷ�����] ,
               t.[����] = s.[����] ,
               t.[����] = s.[����]
    WHEN NOT MATCHED THEN
        INSERT ( ���ŷ�����, ����, ����, ����ʱ�� )
        VALUES ( s.[���ŷ�����] ,
                 s.[����] ,
                 s.[����] ,
                 GETDATE()
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


-------------------
IF OBJECT_ID('sp_���ű�ǩ_����') IS NOT NULL
    BEGIN
        DROP PROC sp_���ű�ǩ_����;
    END;
	GO
    
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_���ű�ǩ' )
    BEGIN
        DROP TYPE  tt_���ű�ǩ;
    END;
	GO
    
CREATE TYPE tt_���ű�ǩ AS TABLE
(
[���] [INT] NULL ,
[���ű��] [INT] NULL ,
[��ǩ���] [INT] NULL 
);
GO

CREATE PROC sp_���ű�ǩ_����
    (
      @fId INT ,
      @tt tt_���ű�ǩ READONLY
    )
AS
    DECLARE @output tt_���ű�ǩ;
    MERGE dbo.���ű�ǩ t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[���ű��] = @fId ,
               t.[��ǩ���] = s.[��ǩ���]
    WHEN NOT MATCHED THEN
        INSERT ( ���ű��, ��ǩ��� )
        VALUES ( @fId, s.[��ǩ���] )
    WHEN NOT MATCHED BY SOURCE AND t.���ű�� = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;
GO
