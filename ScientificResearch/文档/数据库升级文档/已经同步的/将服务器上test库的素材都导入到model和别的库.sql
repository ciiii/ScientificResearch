SET IDENTITY_INSERT �̽��ļ��� ON;

INSERT  �̽��ļ���
        ( ��� ,
          ����� ,
          ���� ,
          ���� ,
          ����·���� ,
          ����ֵ ,
          �㼶 ,
          ���������� ,
          �����˱�� ,
          ����ʱ�� ,
          ��ע
        )
        SELECT  *
        FROM    ScientificResearch_Test.dbo.�̽��ļ���
        WHERE   ���� = '�̽�Ľ���ز�';

SET IDENTITY_INSERT �̽��ļ��� OFF;

GO

SET IDENTITY_INSERT �̽�Ľ���ز� ON;

INSERT  �̽�Ľ���ز�
        ( ��� ,
          �ļ��б�� ,
          ���� ,
          ·�� ,
          ��С ,
          ʱ�� ,
          ����ʱ�� ,
          ��ע
        )
        SELECT  *
        FROM    ScientificResearch_Test.dbo.�̽�Ľ���ز�;

SET IDENTITY_INSERT �̽�Ľ���ز� OFF;

GO 