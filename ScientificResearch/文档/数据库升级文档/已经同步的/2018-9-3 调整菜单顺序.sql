ALTER TABLE Ȩ�� ADD ���� INT NOT NULL DEFAULT(0);
GO
UPDATE  dbo.Ȩ��
SET     ���� = ���;
UPDATE  Ȩ��
SET     ���� = 1
WHERE   ��� = 1;
UPDATE  Ȩ��
SET     ���� = 5
WHERE   ��� = 2;
UPDATE  Ȩ��
SET     ���� = 4
WHERE   ��� = 3;
UPDATE  Ȩ��
SET     ���� = 6
WHERE   ��� = 4;
UPDATE  Ȩ��
SET     ���� = 3
WHERE   ��� = 5;
UPDATE  Ȩ��
SET     ���� = 2
WHERE   ��� = 6;
GO
EXEC dbo.sp_Rebuild;
GO


ALTER PROC [dbo].[sp_��¼]
    (
      @���� NVARCHAR(50) ,
      @���� NVARCHAR(50)
    )
AS
    DECLARE @��� INT;
    DECLARE @���� NVARCHAR(50);

    SELECT  @��� = ��� ,
            @���� = ����
    FROM    dbo.��Ա
    WHERE   ���� = @����
            AND ���� = @����;

    IF ( @��� IS NOT NULL )
        BEGIN
            --DECLARE @tt_��¼��־ tt_��¼��־;
            --INSERT  @tt_��¼��־
            --        ( ����, ����, ��¼ʱ�� )
            --VALUES  ( @����, @����, GETDATE() );
            --        --SELECT  ���� ,
            --        --        ���� ,
            --        --        GETDATE()
            --        --FROM    @tt_v1_��Ա_��������;
            
            --EXEC dbo.sp_��¼��־_�� @tt_��¼��־; 
			
            SELECT  *
            FROM    v1_��Ա_��������
            WHERE   ��� = @���;

            SELECT  *
            FROM    dbo.tfn_��Ա��Ȩ��(@����)
            ORDER BY ����;
        END;

    ELSE
        THROW 50001,N'��¼��Ϣ����',1;
GO


SELECT  *
FROM    Ȩ��;
