--Ҫ������ļ���
SET IDENTITY_INSERT �̽��ļ��� ON;

WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ���  WHERE ����='��������'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ��� a JOIN cte ON a.����� = cte.���
)
INSERT �̽��ļ���(��� ,
       ����� ,
       ���� ,
       ���� ,
       ����·���� ,
       ����ֵ ,
       �㼶 ,
       ���������� ,
       �����˱�� ,
       ����ʱ�� ,
       ��ע)
SELECT * FROM cte;

SET IDENTITY_INSERT �̽��ļ��� OFF;

--Ҫ���������
SET IDENTITY_INSERT �̽����� ON;

WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ���  WHERE ����='��������'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ��� a JOIN cte ON a.����� = cte.���
)
INSERT �̽����� (��� ,
       �ļ��б�� ,
       ���ͱ�� ,
       ��� ,
       ��Ŀ���� ,
       ���׶� ,
       ����ʱ�� ,
       ��ע)
SELECT b.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽����� b JOIN cte ON b.�ļ��б�� = cte.���;

SET IDENTITY_INSERT �̽����� off;

--Ҫ���������ı�ѡ��
WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ���  WHERE ����='��������'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ��� a JOIN cte ON a.����� = cte.���
),cte���� AS(
SELECT b.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽����� b JOIN cte ON b.�ļ��б�� = cte.���)
INSERT �̽����ⱸѡ��
SELECT c.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽����ⱸѡ�� c JOIN cte���� ON c.������=cte����.���;

--Ҫ������������ȷ��
WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ���  WHERE ����='��������'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽��ļ��� a JOIN cte ON a.����� = cte.���
),cte���� AS(
SELECT b.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽����� b JOIN cte ON b.�ļ��б�� = cte.���)
INSERT �̽�������ȷ��
SELECT c.* FROM ScientificResearch_Test_fromServer_20200309.dbo.�̽�������ȷ�� c JOIN cte���� ON c.������=cte����.���;
