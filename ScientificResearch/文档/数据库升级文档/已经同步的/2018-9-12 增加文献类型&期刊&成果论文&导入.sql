INSERT  dbo.�ֵ�
        ( ����, ֵ, �ϼ����, ����, ����, ��ע )
VALUES  ( N'��������', -- ���� - nvarchar(50)
          N'����', -- ֵ - nvarchar(50)
          0, -- �ϼ���� - int
          1, -- ���� - int
          0, -- ���� - int
          N''  -- ��ע - nvarchar(500)
          ),
        ( N'��������', -- ���� - nvarchar(50)
          N'����', -- ֵ - nvarchar(50)
          0, -- �ϼ���� - int
          1, -- ���� - int
          0, -- ���� - int
          N''  -- ��ע - nvarchar(500)
          );

GO
          --100143	1001	�ڿ���ְ����ά��	������Ϣά��/�ֵ�.html?name=�ڿ���ְ����&type=1	True	100143	NULL	NULL
INSERT  dbo.Ȩ��
        ( ��� ,
          �ϼ���� ,
          ���� ,
          ·�� ,
          ���� ,
          ���� ,
          ͼ�� ,
          ��ע
        )
VALUES  ( 100144 , -- ��� - int
          1001 , -- �ϼ���� - int
          N'��������ά��' , -- ���� - nvarchar(50)
          N'������Ϣά��/�ֵ�.html?name=��������&type=1' , -- ·�� - nvarchar(500)
          1 , -- ���� - bit
          100144 , -- ���� - int
          NULL , -- ͼ�� - nvarchar(50)
          NULL   -- ��ע - nvarchar(500)
		 );
GO

--??
ALTER FUNCTION [dbo].[tfn_��ɫ��Ȩ��] ( @��ɫ��� INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            IIF(b.��� IS NULL, 0, 1) AS ӵ��
    FROM    dbo.Ȩ�� a
            LEFT JOIN ��ɫȨ�� b ON a.��� = b.Ȩ�ޱ��
                                AND b.��ɫ��� = @��ɫ���;

GO

ALTER TABLE �ڿ� ADD PMID INT , DOI NVARCHAR(100),UT NVARCHAR(100); 

GO
EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'PMID',
    @level0type = N'Schema', @level0name = 'dbo', @level1type = N'Table',
    @level1name = '�ڿ�', @level2type = N'Column', @level2name = 'PMID';  
GO  

EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'DOI',
    @level0type = N'Schema', @level0name = 'dbo', @level1type = N'Table',
    @level1name = '�ڿ�', @level2type = N'Column', @level2name = 'DOI';  
GO  
EXEC sp_addextendedproperty @name = N'MS_Description', @value = 'UT',
    @level0type = N'Schema', @level0name = 'dbo', @level1type = N'Table',
    @level1name = '�ڿ�', @level2type = N'Column', @level2name = 'UT';  
GO  

DROP PROCEDURE [dbo].[sp_�ڿ�_����];
GO
DROP TYPE [dbo].[tt_�ڿ�];
GO
CREATE TYPE [dbo].[tt_�ڿ�] AS TABLE(
[���] [INT] NULL,
[����] [NVARCHAR](50) NULL,
[����] [NVARCHAR](500) NULL,
[Ӣ�Ŀ���] [NVARCHAR](500) NULL,
[���쵥λ] [NVARCHAR](500) NULL,
[�ڿ�ϵ��] [NVARCHAR](500) NULL,
[��¼���] [NVARCHAR](1000) NULL,
[����] [NVARCHAR](50) NULL,
[JCR����] [NVARCHAR](50) NULL,
[��Ŀ����] [NVARCHAR](100) NULL,
[��Ŀ���] [NVARCHAR](100) NULL,
[���] [INT] NULL,
[��������] [DATE] NULL,
[�����ô���] [INT] NULL,
[Ӱ������] [NUMERIC](18, 3) NULL,
[�������ӷ�ֵ] [NUMERIC](18, 3) NULL,
[ISSN��] [NVARCHAR](50) NULL,
[CN��] [NVARCHAR](50) NULL,
[��������] [NVARCHAR](50) NULL,
[�����] [NVARCHAR](50) NULL,
[����] [NVARCHAR](50) NULL,
[��ע] [NVARCHAR](500) NULL,
PMID INT NULL,
DOI NVARCHAR(100) NULL,
UT NVARCHAR(100) NULL 
);
GO

CREATE PROC [dbo].[sp_�ڿ�_����] ( @tt_�ڿ� tt_�ڿ� READONLY )
AS
    MERGE dbo.�ڿ� t
    USING @tt_�ڿ� s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.���� = s.���� ,
               t.���� = s.���� ,
               t.Ӣ�Ŀ��� = s.Ӣ�Ŀ��� ,
               t.���쵥λ = s.���쵥λ ,
               t.�ڿ�ϵ�� = s.�ڿ�ϵ�� ,
               t.��¼��� = s.��¼��� ,
               t.���� = s.���� ,
               t.JCR���� = s.JCR���� ,
               t.��Ŀ���� = s.��Ŀ���� ,
               t.��Ŀ��� = s.��Ŀ��� ,
               t.��� = s.��� ,
               t.�������� = s.�������� ,
               t.�����ô��� = s.�����ô��� ,
               t.Ӱ������ = s.Ӱ������ ,
               t.�������ӷ�ֵ = s.�������ӷ�ֵ ,
               t.ISSN�� = s.ISSN�� ,
               t.CN�� = s.CN�� ,
               t.�������� = s.�������� ,
               t.����� = s.����� ,
               t.���� = s.���� ,
               t.��ע = s.��ע ,
               t.PMID = s.PMID ,
               t.DOI = s.DOI ,
               t.UT = s.UT
    WHEN NOT MATCHED THEN
        INSERT ( ���� ,
                 ���� ,
                 Ӣ�Ŀ��� ,
                 ���쵥λ ,
                 �ڿ�ϵ�� ,
                 ��¼��� ,
                 ���� ,
                 JCR���� ,
                 ��Ŀ���� ,
                 ��Ŀ��� ,
                 ��� ,
                 �������� ,
                 �����ô��� ,
                 Ӱ������ ,
                 �������ӷ�ֵ ,
                 ISSN�� ,
                 CN�� ,
                 �������� ,
                 ����� ,
                 ���� ,
                 ��ע ,
                 PMID ,
                 DOI ,
                 UT
			   )
        VALUES ( s.���� ,
                 s.���� ,
                 s.Ӣ�Ŀ��� ,
                 s.���쵥λ ,
                 s.�ڿ�ϵ�� ,
                 s.��¼��� ,
                 s.���� ,
                 s.JCR���� ,
                 s.��Ŀ���� ,
                 s.��Ŀ��� ,
                 s.��� ,
                 s.�������� ,
                 s.�����ô��� ,
                 s.Ӱ������ ,
                 s.�������ӷ�ֵ ,
                 s.ISSN�� ,
                 s.CN�� ,
                 s.�������� ,
                 s.����� ,
                 s.���� ,
                 s.��ע ,
                 s.PMID ,
                 s.DOI ,
                 s.UT
			   );
GO

ALTER VIEW [dbo].[v1_�ɹ�����_�б�]
AS
    SELECT  a.��� ,
            a.���ı��� ,
            a.����Online���� ,
            a.������ʽ�������� ,
            ISNULL(b.����, b.Ӣ�Ŀ���) AS �������� ,
            b.PMID ,
            b.DOI ,
            b.UT ,
            a.�����˱�� ,
            dbo.fn_�ɹ�����(1, a.���, '��һ����') AS ��һ����
    FROM    dbo.�ɹ����� a
            LEFT JOIN dbo.�ڿ� b ON a.������ = b.���;


GO
ALTER FUNCTION [dbo].[tfn_�ɹ�����] ( @��Ա��� INT, @����ģ���� INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            b.���� AS ���������� ,
            CONCAT(c.״̬����, '-', c.����״̬˵��) AS ��˽��� ,
            c.*
    FROM    dbo.v1_�ɹ�����_�б� a
            LEFT JOIN ��Ա b ON a.�����˱�� = b.���
            OUTER APPLY dbo.tfn_����(@����ģ����, a.���, @��Ա���) c;

			GO

ALTER VIEW [dbo].[v1_�ڿ�]
AS
    SELECT  * ,
            CONCAT(����, '/', Ӣ�Ŀ���, '/', ���쵥λ, '/', ���, '/', PMID, '/', DOI, '/',
                   UT) AS AllName
    FROM    �ڿ�;
GO
            
ALTER TABLE dbo.�ɹ����� ADD ͨѶ���� NVARCHAR(50),�������� NVARCHAR(50);
GO

DROP PROCEDURE [dbo].[sp_�ɹ�����_����];
GO

DROP TYPE [dbo].[tt_�ɹ�����];
GO

CREATE TYPE [dbo].[tt_�ɹ�����] AS TABLE(
[���] [INT] NULL,
[�����˱��] [INT] NULL,
[���ı���] [NVARCHAR](200) NULL,
[���ı�������] [NVARCHAR](50) NULL,
[����Online����] [DATE] NULL,
[������ʽ��������] [DATE] NULL,
[��������] [INT] NULL,
[���] [INT] NULL,
[�ո�����] [DATE] NULL,
[����������Ŀ] [NVARCHAR](50) NULL,
[�����] [NUMERIC](18, 2) NULL,
[��������] [NUMERIC](18, 2) NULL,
[���������Դ] [NVARCHAR](50) NULL,
[�������] [NVARCHAR](50) NULL,
[��������] [NUMERIC](18, 2) NULL,
[�ƻ���Դ] [NVARCHAR](50) NULL,
[���İ���] [NVARCHAR](50) NULL,
[ѧ������] [NVARCHAR](50) NULL,
[һ��ѧ��] [NVARCHAR](50) NULL,
[����ѧ��] [NVARCHAR](50) NULL,
[����ѧ��] [NVARCHAR](50) NULL,
[��������] [INT] NULL,
[�ؼ���] [NVARCHAR](500) NULL,
[����ժҪ] [NVARCHAR](1000) NULL,
[��ע] [NVARCHAR](1000) NULL,
[������] [INT] NULL,
[���] [INT] NULL,
[�ں�] [INT] NULL,
[ҳ�뷶Χ��] [INT] NULL,
[ҳ�뷶Χֹ] [INT] NULL,
[��������] [NVARCHAR](50) NULL,
[�Ƿ�����ҵ���Ϸ���] [BIT] NULL,
[�Ƿ���ط����Ϸ���] [BIT] NULL,
[�Ƿ���������Ϸ���] [BIT] NULL,
[�Ƿ��ѧ��] [BIT] NULL,
[�Ƿ��뱾רҵ���] [BIT] NULL,
[������Ϣҳ����ļ�·��] [NTEXT] NULL,
[��������·��] [NTEXT] NULL,
[��������ļ�·��] [NTEXT] NULL,
[ͨѶ����] [NVARCHAR](50) NULL,
[��������] [NVARCHAR](50) NULL

);
GO




CREATE PROC [dbo].[sp_�ɹ�����_����]
    (
      @tt tt_�ɹ����� READONLY ,
      @tt_�ɹ���Ŀ tt_�ɹ���Ŀ READONLY ,
      @tt_�ɹ����� tt_�ɹ����� READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @��� tt_���; 

    MERGE dbo.�ɹ����� t
    USING @tt s
    ON s.��� = t.���
    WHEN MATCHED THEN
        UPDATE SET
               t.[�����˱��] = s.[�����˱��] ,
               t.[���ı���] = s.[���ı���] ,
               t.[���ı�������] = s.[���ı�������] ,
               t.[����Online����] = s.[����Online����] ,
               t.[������ʽ��������] = s.[������ʽ��������] ,
               t.[��������] = s.[��������] ,
               t.[���] = s.[���] ,
               t.[�ո�����] = s.[�ո�����] ,
               t.[����������Ŀ] = s.[����������Ŀ] ,
               t.[�����] = s.[�����] ,
               t.[��������] = s.[��������] ,
               t.[���������Դ] = s.[���������Դ] ,
               t.[�������] = s.[�������] ,
               t.[��������] = s.[��������] ,
               t.[�ƻ���Դ] = s.[�ƻ���Դ] ,
               t.[���İ���] = s.[���İ���] ,
               t.[ѧ������] = s.[ѧ������] ,
               t.[һ��ѧ��] = s.[һ��ѧ��] ,
               t.[����ѧ��] = s.[����ѧ��] ,
               t.[����ѧ��] = s.[����ѧ��] ,
               t.[��������] = s.[��������] ,
               t.[�ؼ���] = s.[�ؼ���] ,
               t.[����ժҪ] = s.[����ժҪ] ,
               t.[��ע] = s.[��ע] ,
               t.[������] = s.[������] ,
               t.[���] = s.[���] ,
               t.[�ں�] = s.[�ں�] ,
               t.[ҳ�뷶Χ��] = s.[ҳ�뷶Χ��] ,
               t.[ҳ�뷶Χֹ] = s.[ҳ�뷶Χֹ] ,
               t.[��������] = s.[��������] ,
               t.[�Ƿ�����ҵ���Ϸ���] = s.[�Ƿ�����ҵ���Ϸ���] ,
               t.[�Ƿ���ط����Ϸ���] = s.[�Ƿ���ط����Ϸ���] ,
               t.[�Ƿ���������Ϸ���] = s.[�Ƿ���������Ϸ���] ,
               t.[�Ƿ��ѧ��] = s.[�Ƿ��ѧ��] ,
               t.[�Ƿ��뱾רҵ���] = s.[�Ƿ��뱾רҵ���] ,
               t.[������Ϣҳ����ļ�·��] = s.[������Ϣҳ����ļ�·��] ,
               t.[��������·��] = s.[��������·��] ,
               t.[��������ļ�·��] = s.[��������ļ�·��] ,
               t.ͨѶ���� = s.ͨѶ���� ,
               t.�������� = s.��������
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [�����˱��] ,
                 [���ı���] ,
                 [���ı�������] ,
                 [����Online����] ,
                 [������ʽ��������] ,
                 [��������] ,
                 [���] ,
                 [�ո�����] ,
                 [����������Ŀ] ,
                 [�����] ,
                 [��������] ,
                 [���������Դ] ,
                 [�������] ,
                 [��������] ,
                 [�ƻ���Դ] ,
                 [���İ���] ,
                 [ѧ������] ,
                 [һ��ѧ��] ,
                 [����ѧ��] ,
                 [����ѧ��] ,
                 [��������] ,
                 [�ؼ���] ,
                 [����ժҪ] ,
                 [��ע] ,
                 [������] ,
                 [���] ,
                 [�ں�] ,
                 [ҳ�뷶Χ��] ,
                 [ҳ�뷶Χֹ] ,
                 [��������] ,
                 [�Ƿ�����ҵ���Ϸ���] ,
                 [�Ƿ���ط����Ϸ���] ,
                 [�Ƿ���������Ϸ���] ,
                 [�Ƿ��ѧ��] ,
                 [�Ƿ��뱾רҵ���] ,
                 [������Ϣҳ����ļ�·��] ,
                 [��������·��] ,
                 [��������ļ�·��] ,
                 ͨѶ���� ,
                 ��������
               )
    OUTPUT
        Inserted.���
        INTO @���; 

    DECLARE @�ɹ����� INT = 1; --�����Ƕ���1
    DECLARE @�ɹ���� INT;
    SELECT  @�ɹ���� = ���
    FROM    @���;

	--�����ĵĶ�����Ŀ��ά��
    MERGE dbo.�ɹ���Ŀ t
    USING @tt_�ɹ���Ŀ s
    ON t.�ɹ����� = @�ɹ�����
        AND t.�ɹ���� = @�ɹ����
        AND s.��Ŀ���� = t.��Ŀ����
        AND s.��Ŀ��� = t.��Ŀ���
    WHEN MATCHED THEN
        UPDATE SET
               t.�Ƿ���Ŀ�����ɹ� = s.�Ƿ���Ŀ�����ɹ�
    WHEN NOT MATCHED THEN
        INSERT ( �ɹ����� ,
                 �ɹ���� ,
                 ��Ŀ���� ,
                 ��Ŀ��� ,
                 �Ƿ���Ŀ�����ɹ�
               )
        VALUES ( @�ɹ����� ,
                 @�ɹ���� ,
                 s.��Ŀ���� ,
                 s.��Ŀ��� ,
                 s.�Ƿ���Ŀ�����ɹ�
               )
    WHEN NOT MATCHED BY SOURCE AND t.�ɹ����� = @�ɹ�����
        AND t.�ɹ���� = @�ɹ���� THEN
        DELETE;

	--�����ĵĶ������ߵ�ά��
    MERGE �ɹ����� t
    USING @tt_�ɹ����� s
    ON t.�ɹ����� = @�ɹ�����
        AND t.�ɹ���� = @�ɹ����
        AND s.���߱�� = t.���߱��
    WHEN MATCHED THEN
        UPDATE SET
               t.���߼��� = s.���߼��� ,
               t.������ռ�� = s.������ռ�� ,
               t.������� = s.�������
    WHEN NOT MATCHED THEN
        INSERT ( �ɹ����� ,
                 �ɹ���� ,
                 ���߼��� ,
                 ���߱�� ,
                 ������ռ�� ,
                 �������
               )
        VALUES ( @�ɹ����� ,
                 @�ɹ���� ,
                 s.���߼��� ,
                 s.���߱�� ,
                 s.������ռ�� ,
                 s.�������
               )
    WHEN NOT MATCHED BY SOURCE AND t.�ɹ����� = @�ɹ�����
        AND t.�ɹ���� = @�ɹ���� THEN
        DELETE;

    COMMIT TRAN;

	--����һ�����ı��
    SELECT  *
    FROM    @���;



;
GO


DROP PROCEDURE [dbo].[sp_�����Զ�������];
GO

DROP TYPE [dbo].[tt_�����Զ�������];
GO

CREATE TYPE [dbo].[tt_�����Զ�������] AS TABLE(
[���ı���] [NVARCHAR](200) NULL,
[���ı�������] [NVARCHAR](50) NULL,
[����Online����] [DATE] NULL,
[������ʽ��������] [DATE] NULL,
[����] [NVARCHAR](50) NULL,
[��������] [INT] NULL,
[��������] [INT] NULL,
[���] [INT] NULL,
[�ո�����] [DATE] NULL,
[����������Ŀ] [NVARCHAR](50) NULL,
[��������] [NUMERIC](18, 2) NULL,
[�ƻ���Դ] [NVARCHAR](50) NULL,
[���İ���] [NVARCHAR](50) NULL,
[ѧ������] [NVARCHAR](50) NULL,
[һ��ѧ��] [NVARCHAR](50) NULL,
[����ѧ��] [NVARCHAR](50) NULL,
[����ѧ��] [NVARCHAR](50) NULL,
[�ؼ���] [NVARCHAR](500) NULL,
[����ժҪ] [NVARCHAR](1000) NULL,
[��������] [NVARCHAR](50) NULL,
[���] [INT] NULL,
[�ں�] [INT] NULL,
[ҳ�뷶Χ] [NVARCHAR](50) NULL,
[ҳ�뷶Χ��] [INT] NULL,
[ҳ�뷶Χֹ] [INT] NULL,
[��������] [NVARCHAR](50) NULL,
[ͨѶ����] [NVARCHAR](50) NULL,
[��������] [NVARCHAR](50) NULL
);
GO



CREATE PROC [dbo].[sp_�����Զ�������]
    (
      @tt tt_�����Զ������� READONLY
    )
AS
    DECLARE @t TABLE
        (
          ���ı�� INT ,
          ���ı��� NVARCHAR(200)
        );

    SET XACT_ABORT ON;
    BEGIN TRAN;

    INSERT  dbo.�ɹ�����
            ( ���ı��� ,
              ���ı������� ,
              ����Online���� ,
              ������ʽ�������� ,
              �������� ,
              ��� ,
              �ո����� ,
              ����������Ŀ ,
              �������� ,
              �ƻ���Դ ,
              ���İ��� ,
              ѧ������ ,
              һ��ѧ�� ,
              ����ѧ�� ,
              ����ѧ�� ,
              �������� ,
              �ؼ��� ,
              ����ժҪ ,
              ������ ,
              ��� ,
              �ں� ,
              ҳ�뷶Χ�� ,
              ҳ�뷶Χֹ ,
              �������� ,
              ͨѶ���� ,
              ��������
	        )
    OUTPUT  Inserted.��� ,
            Inserted.���ı���
            INTO @t
            SELECT  a.���ı��� ,
                    a.���ı������� ,
                    a.����Online���� ,
                    a.������ʽ�������� ,
                    a.�������� ,
                    a.��� ,
                    a.�ո����� ,
                    a.����������Ŀ ,
                    a.�������� ,
                    a.�ƻ���Դ ,
                    a.���İ��� ,
                    a.ѧ������ ,
                    a.һ��ѧ�� ,
                    a.����ѧ�� ,
                    a.����ѧ�� ,
                    a.�������� ,
                    a.�ؼ��� ,
                    a.����ժҪ ,
                    c1.��� ,
                    a.��� ,
                    a.�ں� ,
                    a.ҳ�뷶Χ�� ,
                    a.ҳ�뷶Χֹ ,
                    a.�������� ,
                    a.ͨѶ���� ,
                    a.��������
            FROM    @tt a
                    OUTER APPLY ( SELECT TOP 1
                                            ���
                                  FROM      �ڿ� c
                                  WHERE     a.�������� = c.����
                                            OR a.�������� = c.Ӣ�Ŀ���
                                ) c1;

    INSERT  dbo.�ɹ�����
            ( �ɹ����� ,
              �ɹ���� ,
              ���߼��� ,
              ���߱��
            )
            SELECT  1 ,
                    a.���ı�� ,
                    '��һ����' ,
                    c1.���
            FROM    @t a
                    JOIN @tt b ON a.���ı��� = b.���ı���
                    CROSS APPLY ( SELECT TOP 1
                                            ���
                                  FROM      ��Ա c
                                  WHERE     b.���� = c.����
                                ) c1;
								
        
    COMMIT TRAN;


GO
ALTER VIEW [dbo].[v1_�ɹ�����_�б�]
AS
    SELECT  a.��� ,
            a.���ı��� ,
            a.����Online���� ,
            a.������ʽ�������� ,
            ISNULL(b.����, b.Ӣ�Ŀ���) AS �������� ,
            b.PMID ,
            b.DOI ,
            b.UT ,
            a.�����˱�� ,
            dbo.fn_�ɹ�����(1, a.���, '��һ����') AS ��һ���� ,
            a.ͨѶ���� ,
            a.��������
    FROM    dbo.�ɹ����� a
            LEFT JOIN dbo.�ڿ� b ON a.������ = b.���;



GO


ALTER VIEW [dbo].[v1_�ɹ�����_����]
AS
    SELECT  a.��� ,
            a.�����˱�� ,
            a.���ı��� ,
            a.���ı������� ,
            a.����Online���� ,
            a.������ʽ�������� ,
            a.�������� ,
            a.��� ,
            a.�ո����� ,
            a.����������Ŀ ,
            a.����� ,
            a.�������� ,
            a.���������Դ ,
            a.������� ,
            a.�������� ,
            a.�ƻ���Դ ,
            a.���İ��� ,
            a.ѧ������ ,
            a.һ��ѧ�� ,
            a.����ѧ�� ,
            a.����ѧ�� ,
            a.�������� ,
            a.�ؼ��� ,
            a.����ժҪ ,
            a.��ע ,
            a.������ ,
            a.��� ,
            a.�ں� ,
            a.ҳ�뷶Χ�� ,
            a.ҳ�뷶Χֹ ,
            a.�������� ,
            a.�Ƿ�����ҵ���Ϸ��� ,
            a.�Ƿ���ط����Ϸ��� ,
            a.�Ƿ���������Ϸ��� ,
            a.�Ƿ��ѧ�� ,
            a.�Ƿ��뱾רҵ��� ,
            a.������Ϣҳ����ļ�·�� ,
            a.��������·�� ,
            a.��������ļ�·�� ,
            a.ͨѶ���� ,
            a.�������� ,
            b.���� ,
            ISNULL(b.����, b.Ӣ�Ŀ���) AS �������� ,
            b.PMID ,
            b.DOI ,
            b.UT ,
            b.���쵥λ ,
            b.�ڿ�ϵ�� ,
            b.JCR���� ,
            b.��Ŀ���� ,
            b.��Ŀ��� ,
            b.�������� ,
            b.�����ô��� ,
            b.Ӱ������ ,
            b.�������ӷ�ֵ ,
            b.ISSN�� ,
            b.CN��
    FROM    dbo.�ɹ����� a
            LEFT JOIN dbo.�ڿ� b ON a.������ = b.���;




GO

dbo.sp_Rebuild;

GO

