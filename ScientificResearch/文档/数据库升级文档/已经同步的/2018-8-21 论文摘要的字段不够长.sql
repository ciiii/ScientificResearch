--2018-8-21 ����ժҪ���ֶβ�����


DROP PROCEDURE [dbo].[sp_��������];
GO

/****** Object:  UserDefinedTableType [dbo].[tt_��������]    Script Date: 2018/8/31 16:01:29 ******/
DROP TYPE [dbo].[tt_��������];
GO

/****** Object:  UserDefinedTableType [dbo].[tt_��������]    Script Date: 2018/8/31 16:01:29 ******/
CREATE TYPE [dbo].[tt_��������] AS TABLE(
[���ı���] [NVARCHAR](200) NULL,
[����] [NVARCHAR](50) NULL,
[��������] [INT] NULL,
[���] [INT] NULL,
[�ؼ���] [NVARCHAR](500) NULL,
[����ժҪ] [NVARCHAR](MAX) NULL,
[���] [INT] NULL,
[�ں�] [INT] NULL,
[ҳ�뷶Χ] [NVARCHAR](100) NULL,
[ҳ�뷶Χ��] [INT] NULL,
[ҳ�뷶Χֹ] [INT] NULL,
[��������] [NVARCHAR](200) NULL
);
GO


CREATE PROC [dbo].[sp_��������] ( @tt tt_�������� READONLY )
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
              ��� ,
              �������� ,
              �ؼ��� ,
              ����ժҪ ,
              ������ ,
              ��� ,
              �ں� ,
              ҳ�뷶Χ�� ,
              ҳ�뷶Χֹ 
          
            )
    OUTPUT  Inserted.��� ,
            Inserted.���ı���
            INTO @t
            SELECT  a.���ı��� ,
                    a.��� ,
                    a.�������� ,
                    a.�ؼ��� ,
                    a.����ժҪ ,
                    c1.��� ,
                    a.��� ,
                    a.�ں� ,
                    a.ҳ�뷶Χ�� ,
                    a.ҳ�뷶Χֹ
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

ALTER TABLE dbo.�ɹ����� ALTER COLUMN ����ժҪ NVARCHAR(MAX);

GO
