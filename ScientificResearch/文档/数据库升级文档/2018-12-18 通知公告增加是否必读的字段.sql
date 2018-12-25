ALTER TABLE dbo.֪ͨ���� ADD �Ƿ�ض� BIT NULL;
GO

DROP PROCEDURE [dbo].[sp_֪ͨ����_����]
GO

DROP TYPE [dbo].[tt_֪ͨ����]
GO

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
	 �Ƿ�ض� BIT NULL
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

ALTER VIEW [dbo].[v2_֪ͨ����] AS
SELECT  a.��� ,
        a.֪ͨ���� ,
        a.֪ͨ��ʶ ,
        a.�����˱�� ,
        a.֪ͨ���� ,
        a.�ر�ʱ�� ,
        a.����ļ�·�� ,
        a.֪ͨ���� ,
        a.�������� ,
        a.�ѽ������� ,
        a.�Ƿ����� ,
        a.����ʱ�� ,
        a.��ע ,
		a.�Ƿ�ض�,
        b.���� AS �����˹��� ,
        b.���� AS ���������� ,
        b.���ű�� AS �����˲��ű�� ,
        b.�������� AS �����˲�������
FROM    dbo.֪ͨ���� a
        LEFT JOIN dbo.v1_��Ա_�������� b ON a.�����˱�� = b.���;
GO


ALTER VIEW [dbo].[v2_֪ͨ����_�б�] AS
SELECT  a.��� ,
        a.֪ͨ���� ,
        a.֪ͨ��ʶ ,
        a.�����˱�� ,
        a.֪ͨ���� ,
        a.�ر�ʱ�� ,
        a.����ļ�·�� ,
        --a.֪ͨ���� ,
        a.�������� ,
        a.�ѽ������� ,
        a.�Ƿ����� ,
        a.����ʱ�� ,
        a.��ע ,
		a.�Ƿ�ض�,
        b.���� AS �����˹��� ,
        b.���� AS ���������� ,
        b.���ű�� AS �����˲��ű�� ,
        b.�������� AS �����˲�������
FROM    dbo.֪ͨ���� a
        LEFT JOIN dbo.v1_��Ա_�������� b ON a.�����˱�� = b.���;

GO


ALTER FUNCTION [dbo].[tfn_ĳ��Ա�ɲ鿴��֪ͨ����] ( @��Ա��� INT )
RETURNS TABLE
AS RETURN
    WITH    cte ( ��Ա���, ����������, �����߱�� )
              AS ( SELECT   @��Ա��� ,
                            0 ,
                            0
                   UNION ALL
                   SELECT   @��Ա��� ,
                            10 ,
                            @��Ա���
                   UNION ALL
                   SELECT   @��Ա��� ,
                            20 ,
                            ���ű��
                   FROM     dbo.��Ա
                   WHERE    ��� = @��Ա���
                   UNION ALL
                   SELECT   @��Ա��� ,
                            30 ,
                            b1.��ɫ���
                   FROM     dbo.��Ա��ɫ b1
                   WHERE    b1.��Ա��� = @��Ա���
                 )
    SELECT  a.��� ,
            a.֪ͨ���� ,
            a.֪ͨ��ʶ ,
            a.�����˱�� ,
            a.֪ͨ���� ,
            a.�ر�ʱ�� ,
            a.����ļ�·�� ,
            --a.֪ͨ���� ,
            a.�������� ,
            a.�ѽ������� ,
            a.�Ƿ����� ,
            a.����ʱ�� ,
            a.��ע ,
			a.�Ƿ�ض�,
            a.�����˹��� ,
            a.���������� ,
            a.�����˲��ű�� ,
            a.�����˲������� ,
            IIF(EXISTS ( SELECT 1
                         FROM   dbo.֪ͨ�����ѽ����� b
                         WHERE  b.֪ͨ������ = a.���
                                AND b.�����˱�� = @��Ա��� ), 1, 0) AS �Ƿ��ѽ���
    FROM    v2_֪ͨ���� a
    WHERE   EXISTS ( SELECT 1
                     FROM   cte
                            JOIN dbo.֪ͨ����������� c ON cte.���������� = c.����������
                                                   AND cte.�����߱�� = c.�����߱��
                                                   AND c.֪ͨ������ = a.��� );
GO
					
EXEC dbo.sp_Rebuild;

