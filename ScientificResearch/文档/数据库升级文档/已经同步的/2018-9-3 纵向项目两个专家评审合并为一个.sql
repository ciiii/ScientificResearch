
/****** Object:  StoredProcedure [dbo].[sp_ר������_����]    Script Date: 2018/9/3 16:30:41 ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO


ALTER PROC [dbo].[sp_ר������_����]
    (
      --@����ģ���� INT ,
      @������ INT ,
      @tt tt_ר������ READONLY
    )
AS
    DECLARE @��� tt_���; 
    DECLARE @��Ŀ��� INT;
    DECLARE @����ģ���� INT;

    SELECT  @��Ŀ��� = b.��Ŀ��� ,
            @����ģ���� = b.����ģ����
    FROM    ���� a
            JOIN ���� b ON a.���̱�� = b.���
    WHERE   a.��� = @������;

    MERGE dbo.ר������ t
    USING @tt s
    ON t.����ģ���� = @����ģ����
        AND t.��Ŀ��� = @��Ŀ���
        AND s.������ = t.������
    WHEN MATCHED THEN
        UPDATE SET
               t.ר�ұ�� = s.ר�ұ�� ,
               t.[����] = s.[����] ,
               t.[��ע] = s.[��ע]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @����ģ���� ,
                 @��Ŀ��� ,
                 s.ר�ұ�� ,
                 s.������ ,
                 s.���� ,
                 s.��ע ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.����ģ���� = @����ģ����
        AND t.��Ŀ��� = @��Ŀ��� THEN
        DELETE
    OUTPUT
        Inserted.���
        INTO @���;
    SELECT  *
    FROM    @���;
;