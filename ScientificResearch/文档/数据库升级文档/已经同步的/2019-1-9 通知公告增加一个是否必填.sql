
ALTER TABLE dbo.֪ͨ���� ADD �Ƿ�ض� BIT;

/****** Object:  StoredProcedure [dbo].[sp_֪ͨ����_����]    Script Date: 2019/1/9 15:36:48 ******/
DROP PROCEDURE [dbo].[sp_֪ͨ����_����]
GO

/****** Object:  UserDefinedTableType [dbo].[tt_֪ͨ����]    Script Date: 2019/1/9 15:36:26 ******/
DROP TYPE [dbo].[tt_֪ͨ����]
GO

/****** Object:  UserDefinedTableType [dbo].[tt_֪ͨ����]    Script Date: 2019/1/9 15:36:26 ******/
CREATE TYPE [dbo].[tt_֪ͨ����] AS TABLE(
	[���] [INT] NULL,
	[֪ͨ����] [NVARCHAR](50) NULL,
	[֪ͨ��ʶ] [NVARCHAR](50) NULL,
	[�����˱��] [INT] NULL,
	[֪ͨ����] [NVARCHAR](100) NULL,
	[�ر�ʱ��] [DATETIME] NULL,
	[����ļ�·��] [NVARCHAR](500) NULL,
	[֪ͨ����] [NTEXT] NULL,
	[��������] [INT] NULL,
	[�ѽ�������] [INT] NULL,
	[�Ƿ�����] [BIT] NULL,
	[����ʱ��] [DATETIME] NULL,
	[��ע] [NVARCHAR](1000) NULL,
	[�Ƿ�ض�] [BIT] NULL
)
GO

CREATE PROC [dbo].[sp_֪ͨ����_����]
    (
      @tt tt_֪ͨ���� READONLY ,
      @tt_֪ͨ����������� tt_֪ͨ����������� READONLY
    )
AS
    DECLARE @��� tt_���; 

    SET XACT_ABORT ON;

    BEGIN TRAN;

    MERGE dbo.֪ͨ���� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[֪ͨ����] = s.[֪ͨ����] ,
               t.[֪ͨ��ʶ] = s.[֪ͨ��ʶ] ,
				--t.�����˱�� = s.�����˱��,
               t.[֪ͨ����] = s.[֪ͨ����] ,
               t.[�ر�ʱ��] = s.[�ر�ʱ��] ,
               t.[����ļ�·��] = s.[����ļ�·��] ,
               t.[֪ͨ����] = s.[֪ͨ����] ,
               --t.[��������] = s.[��������] ,
               --t.[�ѽ�������] = s.[�ѽ�������] ,
               --t.[�Ƿ�����] = s.[�Ƿ�����] ,
               t.[��ע] = s.[��ע],
			   t.�Ƿ�ض� = s.�Ƿ�ض�
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.֪ͨ���� ,
                 s.֪ͨ��ʶ ,
                 s.�����˱�� ,
                 s.֪ͨ���� ,
                 s.�ر�ʱ�� ,
                 s.����ļ�·�� ,
                 s.֪ͨ���� ,
                 dbo.fn_����֪ͨ���������������(@tt_֪ͨ�����������) ,
                 0 ,
                 1 ,
                 GETDATE() ,
                 s.��ע ,
				 s.�Ƿ�ض�
               )
    OUTPUT
        Inserted.���
        INTO @���;

    DECLARE @֪ͨ������ INT;
    SELECT  @֪ͨ������ = ���
    FROM    @���;

    MERGE dbo.֪ͨ����������� AS t
    USING @tt_֪ͨ����������� AS s
    ON t.֪ͨ������ = @֪ͨ������
        AND t.���������� = s.����������
        AND t.�����߱�� = s.�����߱��
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @֪ͨ������ ,
                 s.���������� ,
                 s.�����߱��
               )
    WHEN NOT MATCHED BY SOURCE AND t.֪ͨ������ = @֪ͨ������ THEN
        DELETE;
    
    COMMIT TRAN;

    SELECT  *
    FROM    @���;

GO


