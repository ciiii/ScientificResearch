--要导入的文件夹
SET IDENTITY_INSERT 继教文件夹 ON;

WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹  WHERE 名称='共享试题'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹 a JOIN cte ON a.父编号 = cte.编号
)
INSERT 继教文件夹(编号 ,
       父编号 ,
       类型 ,
       名称 ,
       完整路径名 ,
       排序值 ,
       层级 ,
       归属人类型 ,
       归属人编号 ,
       建立时间 ,
       备注)
SELECT * FROM cte;

SET IDENTITY_INSERT 继教文件夹 OFF;

--要导入的试题
SET IDENTITY_INSERT 继教试题 ON;

WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹  WHERE 名称='共享试题'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹 a JOIN cte ON a.父编号 = cte.编号
)
INSERT 继教试题 (编号 ,
       文件夹编号 ,
       类型编号 ,
       题干 ,
       题目解析 ,
       难易度 ,
       建立时间 ,
       备注)
SELECT b.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教试题 b JOIN cte ON b.文件夹编号 = cte.编号;

SET IDENTITY_INSERT 继教试题 off;

--要导入的试题的备选答案
WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹  WHERE 名称='共享试题'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹 a JOIN cte ON a.父编号 = cte.编号
),cte试题 AS(
SELECT b.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教试题 b JOIN cte ON b.文件夹编号 = cte.编号)
INSERT 继教试题备选答案
SELECT c.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教试题备选答案 c JOIN cte试题 ON c.试题编号=cte试题.编号;

--要导入的试题的正确答案
WITH cte AS (
SELECT * FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹  WHERE 名称='共享试题'
UNION ALL
SELECT a.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教文件夹 a JOIN cte ON a.父编号 = cte.编号
),cte试题 AS(
SELECT b.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教试题 b JOIN cte ON b.文件夹编号 = cte.编号)
INSERT 继教试题正确答案
SELECT c.* FROM ScientificResearch_Test_fromServer_20200309.dbo.继教试题正确答案 c JOIN cte试题 ON c.试题编号=cte试题.编号;
