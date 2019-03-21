--SELECT * FROM 教学学员类型;
TRUNCATE TABLE  教学学员类型;
INSERT  dbo.教学学员类型
        ( 编号, 名称 )
VALUES  ( 1, N'实习生' ),
        ( 2, N'进修生' );
GO

--SELECT * FROM dbo.部门

--学历可以用原有的;
--SELECT * FROM 字典 WHERE 分类 = '学历'; 

--职称新搞一个
SELECT  *
FROM    字典
WHERE   分类 = '职称';

DELETE  字典
WHERE   分类 = '职称';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'职称', N'主治医师', 0, 0, 0, N'' ),
        ( N'职称', N'主任医师', 0, 0, 0, N'' ),
        ( N'职称', N'副主任医师', 0, 0, 0, N'' ),
        ( N'职称', N'医师', 0, 0, 0, N'' ),
        ( N'职称', N'见习医师', 0, 0, 0, N'' );

--学科,也新搞一个,原来的太臃肿;
SELECT  *
FROM    学科;

SELECT  *
FROM    字典
WHERE   分类 = '学科';

DELETE  字典
WHERE   分类 = '学科';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'学科', N'基础医学', 0, 0, 0, N'' ),
        ( N'学科', N'临床医学', 0, 0, 0, N'' ),
        ( N'学科', N'口腔医学', 0, 0, 0, N'' ),
        ( N'学科', N'预防医学', 0, 0, 0, N'' ),
        ( N'学科', N'中医学', 0, 0, 0, N'' ),
        ( N'学科', N'中西医临床医学', 0, 0, 0, N'' ),
        ( N'学科', N'针灸推拿学', 0, 0, 0, N'' ),
        ( N'学科', N'中西医临床', 0, 0, 0, N'' ),
        ( N'学科', N'针灸推拿学（针刀方向）', 0, 0, 0, N'' );

GO

--民族,可以就用原来的;
SELECT  *
FROM    字典
WHERE   分类 = '民族';

--培训专业
SELECT  *
FROM    dbo.教学专业;

TRUNCATE TABLE dbo.教学专业;

INSERT  dbo.教学专业
        ( 名称, 年份, 是否国家标准, 标准代码, 最低培训时长, 学习要求及目标, 备注 )
VALUES  ( N'中医内科', 2015, 1, N'', 100, N'', N'' ),
        ( N'中医外科', 2015, 1, N'', 100, N'', N'' );

GO

--教学专业科室
SELECT  *
FROM    dbo.教学专业科室;

SELECT  *
FROM    教学专业 a
        JOIN 教学专业科室 b ON a.编号 = b.教学专业编号;

TRUNCATE TABLE dbo.教学专业科室;

INSERT  dbo.教学专业科室
        ( 教学专业编号, 排序值, 科室名称, 最低培训时长, 最低管床数量, 最低全程管理数量, 科室要求, 备注 )
VALUES  ( 1, 0, N'急诊科', 8, 2, 1, N'', N'' ),
        ( 1, 0, N'心血管科', 8, 2, 1, N'', N'' ),
        ( 1, 0, N'呼吸科（肺病科）', 8, 2, 1, N'', N'' ),
        ( 2, 0, N'中医肛肠科病房', 2, 2, 1, N'', N'' ),
        ( 2, 0, N'中医皮肤科病房', 2, 2, 1, N'', N'' );

GO

--教学评分等级
SELECT  *
FROM    教学评分等级;

TRUNCATE TABLE 教学评分等级;

INSERT  dbo.教学评分等级
        ( 分类名称, 等级名称, 最小分值, 最大分值, 备注 )
VALUES  ( N'教学专业科室要求', N'未掌握', 0, 59, N'' ),
        ( N'教学专业科室要求', N'基本掌握', 60, 79, N'' ),
        ( N'教学专业科室要求', N'已掌握', 80, 100, N'' );
GO

--教学专业科室要求
SELECT * FROM dbo.教学专业科室要求;

TRUNCATE TABLE 教学专业科室要求;

INSERT dbo.教学专业科室要求
        ( 教学专业科室编号, 项目名称, 说明, 最低评分要求, 备注 )
VALUES  ( 1, -- 教学科室编号 - int
          N'常见腹部损伤、急腹症(包括急性阑尾炎、胃肠穿孔、肠梗阻、急性重症胰腺炎、急性梗阻型化脓性胆管炎、腹膜炎等）、消化道出血等的病因、临床表现、诊断与鉴别诊断及手术适应证', -- 项目名称 - nvarchar(50)
          N'', -- 说明 - nvarchar(200)
          80, -- 最低评分要求 - int
          N''  -- 备注 - nvarchar(500)
          )

SELECT * FROM dbo.教学专业科室要求 a LEFT JOIN 教学评分等级 b ON b.分类名称='教学专业科室要求' AND a.最低评分要求 BETWEEN b.最小分值 AND b.最大分值;
GO

--教学专业科室任务类型
SELECT * FROM dbo.教学专业科室任务类型;
TRUNCATE TABLE 教学专业科室任务类型;

INSERT dbo.教学专业科室任务类型
        ( 编号, 名称, 备注 )
VALUES  ( 1,N'技能',N''),( 2,N'疾病',N'');
go


--教学专业科室任务
SELECT * FROM dbo.教学专业科室任务;
TRUNCATE TABLE 教学专业科室任务;

INSERT dbo.教学专业科室任务
        ( 教学专业科室编号 ,
          项目名称 ,
          任务类型编号 ,
          是否门诊 ,
          是否病房 ,
          是否医技 ,
          最低评分要求 ,
          数量要求 ,
          备注
        )
VALUES  ( 1 ,N'心肺复苏术' , 1 , 1 ,0,1 ,80 ,2 ,N''),( 1 ,N'洗胃术' , 1 , 1 ,0,1 ,80 ,3 ,N''),( 1 ,N'胸腹腔穿刺术' , 1 , 1 ,0,1 ,80 ,2 ,N'')
GO

SELECT * FROM dbo.人员;
SELECT * FROM dbo.教学专业

SELECT * FROM 教学本院策略 a left JOIN dbo.v1_人员 b ON a.专业基地管理员编号 = b.编号;
TRUNCATE TABLE 教学本院策略;

INSERT dbo.教学本院策略
        ( 名称, 教学专业编号, 专业基地管理员编号, 建立日期, 备注 )
VALUES  ( N'本科中医内科实习',1,3083, GETDATE(),N''),( N'研究生中医内科实习',1,3084, GETDATE(),N'');

GO

--教学科室
SELECT * FROM dbo.教学科室;
TRUNCATE TABLE 教学科室;
INSERT dbo.教学科室
        ( 编号, 科室管理员编号, 最大学员人数, 备注 )
VALUES  ( 10052,3094, 5, N'' ),( 10053,3095, 5, N'' ) ;

SELECT * FROM 教学科室 a JOIN 部门 b ON a.编号 = b.编号;

GO

--教学本院科室
--对于一个策略
SELECT * FROM dbo.教学本院策略 WHERE 编号 = 1;
--它对应的教学专业下的所有专业科室:
SELECT * FROM dbo.教学专业科室 WHERE 教学专业编号 = 1;
--标准的科室,是映射到本院的那个科室
SELECT * FROM 教学科室 a JOIN 部门 b ON a.编号 = b.编号;
--最终在教学本院科室做一个对应;
SELECT * FROM dbo.教学本院科室;

TRUNCATE TABLE 教学本院科室;

INSERT dbo.教学本院科室
        ( 教学专业本院策略编号 ,
          排序值 ,
          教学专业科室编号 ,
          本院科室编号 ,
          是否必选 ,
          培训时长 ,
          最低管床数量 ,
          最低全程管理数量 ,
          备注
        )
VALUES  ( 1 , -- 教学专业本院策略编号 - int
          0 , -- 排序值 - int
          1 , -- 教学专业科室编号 - int
          10052 , -- 本院科室编号 - int
          1 , -- 是否必选 - bit
          2 , -- 培训时长 - int
          3 , -- 最低管床数量 - int
          3 , -- 最低全程管理数量 - int
          N''  -- 备注 - nvarchar(500)
        ),( 1 , -- 教学专业本院策略编号 - int
          0 , -- 排序值 - int
          1 , -- 教学专业科室编号 - int
          10053 , -- 本院科室编号 - int
          1 , -- 是否必选 - bit
          2 , -- 培训时长 - int
          3 , -- 最低管床数量 - int
          3 , -- 最低全程管理数量 - int
          N''  -- 备注 - nvarchar(500)
        )


