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
        WHERE ���� = '�̽�Ľ���ز�' AND ( ��� <> 161 and �����<> 161);

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
        FROM    ScientificResearch_Test.dbo.�̽�Ľ���ز� WHERE �ļ��б�� NOT IN (161,162,173,283); 

SET IDENTITY_INSERT �̽�Ľ���ز� OFF;

GO 