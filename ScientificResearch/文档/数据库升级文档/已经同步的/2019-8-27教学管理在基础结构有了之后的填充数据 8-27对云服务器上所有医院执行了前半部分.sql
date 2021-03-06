--千万注意在本地测试/演示库是全部运行,会生成一些基本的测试数据
--而在model.正式库不能全部运行,到该到的地方即可;


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

--往届应届新搞一个
SELECT  *
FROM    字典
WHERE   分类 = '往届应届';

DELETE  字典
WHERE   分类 = '往届应届';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'往届应届', N'应届生', 0, 0, 0, N'' ),
        ( N'往届应届', N'往届生', 0, 0, 0, N'' );

GO

--送培方式新搞一个
SELECT  *
FROM    字典
WHERE   分类 = '送培方式';

DELETE  字典
WHERE   分类 = '送培方式';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'送培方式', N'社会人', 0, 0, 0, N'' ),
        ( N'送培方式', N'单位人', 0, 0, 0, N'' ),
        ( N'送培方式', N'研究生', 0, 0, 0, N'' );
GO

--医疗卫生机构类型新搞一个
SELECT  *
FROM    字典
WHERE   分类 = '医疗卫生机构类型';

DELETE  字典
WHERE   分类 = '医疗卫生机构类型';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'医疗卫生机构类型', N'医院', 0, 0, 0, N'' ),
        ( N'医疗卫生机构类型', N'专业公共卫生机构', 0, 0, 0, N'' ),
        ( N'医疗卫生机构类型', N'基层医疗卫生机构', 0, 0, 0, N'' );
GO

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
GO

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

--教学医疗事故处理类别
SELECT  *
FROM    字典
WHERE   分类 = '教学医疗事故处理类别';

DELETE  字典
WHERE   分类 = '教学医疗事故处理类别';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'教学医疗事故处理类别', N'医疗差错', 0, 0, 0, N'' ),
        ( N'教学医疗事故处理类别', N'医疗事故', 0, 0, 0, N'' );

GO

--民族,可以就用原来的;
SELECT  *
FROM    字典
WHERE   分类 = '民族';


--宿舍职位
SELECT  *
FROM    字典
WHERE   分类 = '宿舍职位';

DELETE  字典
WHERE   分类 = '宿舍职位';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'宿舍职位', N'室长', 0, 0, 0, N'' ),
        ( N'宿舍职位', N'管理员', 0, 0, 0, N'' ),
        ( N'宿舍职位', N'室员', 0, 0, 0, N'' );

GO



--教学评分等级
SELECT  *
FROM    教学评分等级;

TRUNCATE TABLE 教学评分等级;

INSERT  dbo.教学评分等级
        (  等级名称, 最小分值, 最大分值, 备注 )
VALUES  (  N'未掌握', 0, 59, N'' ),
        ( N'基本掌握', 60, 79, N'' ),
        (  N'已掌握', 80, 100, N'' );
GO

--教学专业科室任务类型
SELECT  *
FROM    dbo.教学专业科室任务类型;
TRUNCATE TABLE 教学专业科室任务类型;

INSERT  dbo.教学专业科室任务类型
        ( 编号, 名称, 备注 )
VALUES  ( 1, N'技能', N'' ),
        ( 2, N'疾病', N'' );
GO



--教学活动类型;
--SELECT  *
--FROM    dbo.教学活动类型;
TRUNCATE TABLE 教学活动类型;

INSERT  dbo.教学活动类型
        ( 编号, 名称, 活动内容模板, 备注 )
VALUES  ( 1, N'小讲课', N'', N'' ),
        ( 2, N'大讲课', N'', N'' ),
        ( 3, N'教学查房', N'', N'' ),
        ( 4, N'入科教育', N'', N'' ),
        ( 5, N'岗前培训', N'', N'' ),
        ( 6, N'病例讨论', N'', N'' ),
        ( 7, N'技能训练', N'', N'' );
		GO
        
--教学活动评价项目,仅仅做演示用
SELECT  *
FROM    dbo.教学活动评价项目;

TRUNCATE TABLE 教学活动评价项目;

INSERT  dbo.教学活动评价项目
        ( 教学活动类型编号, 名称, 标准分, 说明, 备注 )
VALUES  ( 1, -- 教学活动类型编号 - int
          N'提前1-2日告知学生讲解内容及相关准备要求', -- 名称 - nvarchar(50)
          10, -- 标准分 - int
          N'', -- 说明 - nvarchar(500)
          N''  -- 备注 - nvarchar(500)
          ),
        ( 1, -- 教学活动类型编号 - int
          N'结合实际病例，体现临床思维和临床技能训练', -- 名称 - nvarchar(50)
          10, -- 标准分 - int
          N'', -- 说明 - nvarchar(500)
          N''  -- 备注 - nvarchar(500)
          );

GO

--教学角色
SELECT  *
FROM    dbo.教学角色;

TRUNCATE TABLE dbo.教学角色;

INSERT  dbo.教学角色
        ( 编号, 名称, 能否直接配置人员, 备注 )
VALUES  ( 1, N'系统管理员', 1, N'' ),
        ( 2, N'医院管理员', 1, N'' ),
        ( 3, N'科室管理员', 0, N'' ),
        ( 4, N'带教老师', 0, N'' ),
        ( 5, N'护士', 1, N'' );
GO

SELECT  *
FROM    dbo.教学角色 a
        JOIN dbo.教学人员角色 b ON a.编号 = b.教学角色编号
        JOIN 人员 c ON b.人员编号 = c.编号;

--教学360评价方向
SELECT  *
FROM    dbo.教学角色;

SELECT  *
FROM    dbo.教学360评价方向;
TRUNCATE TABLE 教学360评价方向;
INSERT  dbo.教学360评价方向
        ( 编号, 名称, 来源类型, 目标类型, 备注 )
VALUES  ( 1, N'学员互评', 0, 0, N'' ),
        ( 2, N'学员对医院管理员', 0, 2, N'' ),
        ( 3, N'学员对科室管理员', 0, 3, N'' ),
        ( 4, N'学员对带教老师', 0, 4, N'' ),
        ( 5, N'医院管理员对学员', 2, 0, N'' ),
        ( 6, N'医院管理员对科室管理员', 2, 3, N'' ),
        ( 7, N'医院管理员对带教老师', 2, 4, N'' ),
        ( 8, N'科室管理员对学员', 3, 0, N'' ),
        ( 9, N'科室管理员对医院管理员', 3, 2, N'' ),
        ( 10, N'科室管理员对带教老师', 3, 4, N'' ),
        ( 11, N'带教老师对学员', 4, 0, N'' ),
        ( 12, N'带教老师对医院管理员', 4, 2, N'' ),
        ( 13, N'带教老师对科室管理员', 4, 3, N'' );

--0 学员
--1	系统管理员
--2	医院管理员
--3	科室管理员
--4	带教老师
GO

--教学360评价分类 教学360评价项目
TRUNCATE TABLE 教学360评价分类;
TRUNCATE TABLE 教学360评价项目;

INSERT  dbo.教学360评价分类
        ( 编号, 目标类型, 名称 )
VALUES  ( 1, 0, N'职业道德' ),
        ( 2, 0, N'人际关系和交流能力' ),
        ( 3, 2, N'带教态度' ),
        ( 4, 2, N'带教环境' ),
        ( 5, 2, N'教学内容' ),
        ( 6, 2, N'教学方法' ),
        ( 7, 2, N'教学评价' ),
        ( 8, 3, N'评价内容' ),
        ( 9, 4, N'态度' ),
        ( 10, 4, N'知识' ),
        ( 11, 4, N'技能' ),
        ( 12, 4, N'教学管理' );

INSERT  dbo.教学360评价项目
        ( 教学360评价分类编号, 名称, 标准分 )
VALUES  ( 1, '对患者表示尊敬', 5 ),
        ( 1, '对护士表示尊敬', 5 ),
        ( 1, '对支持人员表示尊敬', 5 ),
        ( 1, '对患者及家属富有同情心', 5 ),
        ( 1, '在适当的时候寻找协商和指导', 10 ),
        ( 1, '有效地与他人团结协作', 10 ),
        ( 1, '富有责任感', 10 ),
        ( 1, '能够完成指派的任务', 10 ),
        ( 1, '能够控制协调自身压力', 5 ),
        ( 1, '及时处理案头工作', 10 ),
        ( 2, '与患者有效地沟通', 5 ),
        ( 2, '与患者家属有效地交流', 5 ),
        ( 2, '与其他医务工作者有效地交流', 5 ),
        ( 2, '与患者交流有关信息', 5 ),
        ( 2, '保存完整的医疗记录', 5 ),
        ( 3, '医院管理员关心体贴学员，为学员排忧解难', 5 ),
        ( 3, '医院管理员教学意识强，教学服务思想牢固', 5 ),
        ( 3, '对住培工作的重视程度高', 5 ),
        ( 3, '及时、耐心的解答学员的提问和疑难问题', 5 ),
        ( 3, '严格要求自己，有良好的医德医风', 5 ),
        ( 4, '医院教学氛围浓，教学环境好', 5 ),
        ( 4, '以身作则，仪表端庄，礼仪规范', 5 ),
        ( 4, '有优良的服务质量', 5 ),
        ( 5, '了解学员的教育和工作经历背景，核实学习需要', 5 ),
        ( 5, '组织安排学员的学术活动，包括学术交流会，讲座等', 5 ),
        ( 5, '注重培养学员专业技能的同时，注重医德建设', 5 ),
        ( 5, '注重启发学员思维和能力培养', 5 ),
        ( 6, '能督促指导科室及带教老师及时批改学员所书写的病案，并给予有效指导', 5 ),
        ( 6, '采用教学方法、形式和内容和谐统一', 5 ),
        ( 6, '制定合适的教学计划', 5 ),
        ( 6, '理论联系实际，注意学员信息反馈', 5 ),
        ( 7, '做好学籍管理工作', 5 ),
        ( 7, '征求学员意见，及时解决问题', 5 ),
        ( 7, '有序组织各项考核，并对学习情况与成绩进行分析、管理', 5 ),
        ( 7, '工作责任心强，精益求精', 5 ),
        ( 8, '及时安排学员入科，并分配合适的带教老师', 10 ),
        ( 8, '帮助学员融入医疗团队、介绍给他人、感到自己是团队一分子', 10 ),
        ( 8, '感到自己是受欢迎和被接受的', 10 ),
        ( 8, '入科时进行入科教育', 10 ),
        ( 8, '提供了公平合理的培训机会、培训量', 10 ),
        ( 8, '较好完成科内人员工作中的协调、沟通', 15 ),
        ( 8, '在保证医疗安全的前提下，尽可能多的提供临床实践机会', 10 ),
        ( 8, '关心住院医师理论学习和知识更新，指导读书报告、综述或论文的书写', 10 ),
        ( 8, '出科考核严格认真、轮转手册审核及时', 15 ),
        ( 9, '为人师表、师德规范', 5 ),
        ( 9, '对病人关心体贴、奉献精神', 5 ),
        ( 9, '热爱本职工作', 5 ),
        ( 9, '具有带教意识、及时指导住院医师', 5 ),
        ( 9, '能与住院医师交流、了解住院医师需求', 5 ),
        ( 10, '专科知识丰富', 5 ),
        ( 10, '理论能与具体病例联系', 5 ),
        ( 10, '指导住院医师参与各种书写，并严格把关住院医师病例的书写质量', 5 ),
        ( 10, '清楚而简要的回答住院医师的提问，对专业知识理解透彻', 5 ),
        ( 10, '指导住院医师健康教育,了解本科专业国内外新动向', 5 ),
        ( 11, '能在示范操作前做好充分准备', 5 ),
        ( 11, '示范操作正确、娴熟、标准化', 5 ),
        ( 11, '提供尽可能多的机会让住院医师接诊病人', 5 ),
        ( 11, '住院医师操作时，能认真检查，发现问题加以解决', 5 ),
        ( 11, '能指导住院医师进行较复杂的操作而非包办', 5 ),
        ( 12, '能及时完成教学任务', 5 ),
        ( 12, '带教方式灵活，能按照住院医师规范化要求来完成带教任务', 5 ),
        ( 12, '批评注意方式、方法，保护住院医师的自尊心', 5 ),
        ( 12, '对住院医师思维能力的培养', 5 ),
        ( 12, '收集住院医师反馈信息，调查完善教学活动', 5 );

		--SELECT * FROM dbo.教学360评价方向 a JOIN dbo.教学360评价分类 b ON a.目标类型 = b.目标类型 JOIN dbo.教学360评价项目 c ON b.编号 = c.教学360评价分类编号 ORDER BY a.编号;
		GO
        
--权限
--SELECT * FROM dbo.教学角色;

--SELECT * FROM dbo.教学角色权限;

--SELECT * FROM dbo.教学人员角色;

--SELECT * FROM dbo.权限;

TRUNCATE TABLE dbo.教学权限;
INSERT  dbo.教学权限
        ( 编号, 上级编号, 深度, 排序值, 名称, PC端组件名, 移动端组件名, 是否菜单, 图标, 备注 )
VALUES  ( 1, 0, 1, 1, N'教学办公', N'', N'', 1, N'office', N'' ),
        ( 101, 1, 2, 1, N'通知公告', N'notice', N'notice', 1, N'', N'' ),
        ( 102, 1, 2, 2, N'下载中心', N'download', N'download', 1, N'', N'' ),
        ( 103, 1, 2, 3, N'个人资料', N'personal', N'personal', 1, N'', N'' ),
        ( 2, 0, 1, 2, N'审核管理', N'', N'', 1, N'audit',
          N'流程中的审核,提炼到这块一起展现;但不包括发起申请.' ),
        ( 201, 2, 2, 1, N'请假审核', N'leaveAudit', N'leaveAudit', 1, N'',
          N'学员的申请请假和请假一览在另一个系统,这里只有老师们的审核管理;学员申请请假都可以放在具体的轮转图形里面,打回后修改申请不行.' ),
        ( 202, 2, 2, 2, N'出科审核', N'auditSection', N'auditSection', 1, N'', N'' ),
        ( 203, 2, 2, 3, N'轮转手册审核', N'rotationAudit', N'rotationAudit', 1, N'', N'' ),
        ( 204, 2, 2, 4, N'结业审核', N'completionAudit', N'completionAudit', 1, N'', N'' ),
        --( 205, 2, 2, 5, N'教学活动反馈审核', N'activityFeedbackAudit', N'', 1, N'',
        --  N'' ),
        ( 3, 0, 1, 3, N'培训管理', N'', N'', 1, N'trainingManage', N'' ),
        ( 301, 3, 2, 1, N'导录学员', N'studentFiles', N'studentFiles', 1, N'', N'' ),
        ( 302, 3, 2, 2, N'我的学员', N'myStudent', N'myStudent', 1, N'', N'这里应该有各种导入导出' ),
		( 3021, 3, 2, 3, N'我的学员轮转', N'myStudentRotation', N'myStudentRotation', 1, N'', N'' ),
        ( 303, 3, 2, 4, N'学员报到', N'studentReport', N'studentReport', 1, N'', N'' ),
        ( 304, 3, 2, 5, N'学员宿舍安排', N'dormitoryArrangement', N'dormitoryArrangement', 1, N'', N'' ), 
			--学员轮转管理是这里的核心,主要的操作有:
			--新增学员轮转计划,就是从一个指定的轮转策略,指定要轮转的科室和时长,指定要轮转的学员,自动安排轮转计划;
			--对于在科的(有实际入科时间,且无实际出科时间的,为在科)科室管理员以上可以补轮转,查看补轮转在306
			--对于在科的,医院管理员可以退培,查看退培记录在307
			--对于已入科的,带教老师可以增改学员考试成绩,查看/修改考试成绩在308,科室管理员/带教老师可以导入导出成绩;
			--对于已入科的,带教老师可以增加医疗差错及事故记录;查看记录在309
			--对于可以入科但未入科的,科室管理员可以入科,查看在310
			--对于在科的,科室管理员可以更换带教老师,查看在311
			--对于在科的,科室管理员可以打考勤,查看在312;
        ( 305, 3, 2, 6, N'学员轮转管理', N'studentRotationManage', N'studentRotationManage', 1, N'', N'' ),
        ( 306, 3, 2, 7, N'学员补轮转', N'repairRotation', N'repairRotation', 1, N'', N'' ),
        ( 307, 3, 2, 8, N'学员退培', N'retireTraining', N'retireTraining', 1, N'', N'' ),
        ( 308, 3, 2, 9, N'学员考试成绩', N'testScores', N'testScores', 1, N'', N'' ),
        ( 309, 3, 2, 10, N'医疗差错及事故记录', N'medicalErrorRecord', N'medicalErrorRecord', 1, N'', N'' ),
        ( 310, 3, 2, 11, N'学员入科', N'studentEntry', N'studentEntry', 1, N'',
          N'属于科室管理员.学员科室报到及带教老师安排;选择带教老师时,带教老师当前带了几个学生还做了提示;' ),
        ( 311, 3, 2, 12, N'更换带教老师', N'changeTeacher', N'changeTeacher', 1, N'', N'' ),
        ( 312, 3, 2, 13, N'考勤', N'signIn', N'signIn', 1, N'', N'' ),

		--
        ( 4, 0, 1, 4, N'360评价', N'', N'', 1, N'360Evaluate', N'' ), 
		--大家分角色拥有的:
        ( 404, 4, 2, 4, N'学员互评', N'evaluate360?from=0&to=0', N'evaluate360?from=0&to=0', 1, N'', N'' ),
        ( 405, 4, 2, 5, N'学员对医院管理员', N'evaluate360?from=0&to=2', N'evaluate360?from=0&to=2', 1, N'',N'' ),
        ( 406, 4, 2, 6, N'学员对科室管理员', N'evaluate360?from=0&to=3', N'evaluate360?from=0&to=3', 1, N'',
          N'' ),
        ( 407, 4, 2, 7, N'学员对带教老师', N'evaluate360?from=0&to=4', N'evaluate360?from=0&to=4', 1, N'', N'' ),
        ( 408, 4, 2, 8, N'医院管理员对学员', N'evaluate360?from=2&to=0', N'evaluate360?from=2&to=0', 1, N'',
          N'' ),
        ( 409, 4, 2, 9, N'医院管理员对科室管理员', N'evaluate360?from=2&to=3', N'evaluate360?from=2&to=3',
          1, N'', N'' ),
        ( 410, 4, 2, 10, N'医院管理员对带教老师', N'evaluate360?from=2&to=4', N'evaluate360?from=2&to=4', 1, N'',
          N'' ),
        ( 411, 4, 2, 11, N'科室管理员对学员', N'evaluate360?from=3&to=0', N'evaluate360?from=3&to=0', 1, N'',
          N'' ),
        ( 412, 4, 2, 12, N'科室管理员对医院管理员', N'evaluate360?from=3&to=2',
          N'evaluate360?from=3&to=2', 1, N'', N'' ),
        ( 413, 4, 2, 13, N'科室管理员对带教老师', N'evaluate360?from=3&to=4', N'evaluate360?from=3&to=4', 1,
          N'', N'' ),
        ( 414, 4, 2, 14, N'带教老师对学员', N'evaluate360?from=4&to=0', N'evaluate360?from=4&to=0', 1, N'', N'' ),
        ( 415, 4, 2, 15, N'带教老师对医院管理员', N'evaluate360?from=4&to=2', N'evaluate360?from=4&to=2', 1, N'',
          N'' ),
        ( 416, 4, 2, 16, N'带教老师对科室管理员', N'evaluate360?from=4&to=3', N'evaluate360?from=4&to=3', 1,
          N'', N'' ),
		  ( 417, 4, 2, 17, N'评价查询', N'evaluateQuery', N'evaluateQuery', 1,
          N'', N'' ),
		  ( 418, 4, 2, 18, N'对我的评价', N'teacherToDepartmentAdmin', N'teacherToDepartmentAdmin', 1,
          N'', N'' ),

        ( 5, 0, 1, 5, N'教学活动', N'', N'', 1, N'teachingActivities', N'' ), 
			
			--可以在这里针对各个教学活动类型:发布活动,查看,修改;查看/审核该类型的学员反馈;
			--至于学员,是否可以只有手机端?
        ( 502, 5, 2, 2, N'小讲课', N'activities?type=1', N'activities?type=1', 1, N'', N'' ),
        ( 503, 5, 2, 3, N'大讲课', N'activities?type=2', N'activities?type=2', 1, N'', N'' ),
        ( 504, 5, 2, 4, N'教学查房', N'activities?type=3', N'activities?type=3', 1, N'', N'' ),
        ( 505, 5, 2, 5, N'入科教育', N'activities?type=4', N'activities?type=4', 1, N'', N'' ),
        ( 506, 5, 2, 6, N'岗前培训', N'activities?type=5', N'activities?type=5', 1, N'', N'' ),
        ( 507, 5, 2, 7, N'病例讨论', N'activities?type=6', N'activities?type=6', 1, N'', N'' ),
        ( 508, 5, 2, 8, N'技能训练', N'activities?type=7', N'activities?type=7', 1, N'', N'' ), 
        ( 509, 5, 2, 9, N'教学活动查询', N'activitiesQuery', N'activitiesQuery', 1, N'', N'' ), 

			--统计这一块先不管
        ( 6, 0, 1, 6, N'查询统计', N'', N'', 1, N'statistics', N'' ),
        ( 601, 6, 2, 1, N'学员招录统计', N'studentRecruitingStatistics', N'studentRecruitingStatistics', 1, N'',
          N'' ),
        --( 602, 6, 2, 2, N'学员报到统计', N'studentReportStatistics', N'', 1, N'',
        --  N'' ),
        ( 603, 6, 2, 3, N'学员培训统计', N'studentTrainingStatistics', N'studentTrainingStatistics', 1, N'',
          N'' ),
        --( 604, 6, 2, 4, N'学员考勤统计', N'studentSignInStatistics', N'', 1, N'',
        --  N'' ), --这个是否应该集成到学员培训统计里面?
        --( 605, 6, 2, 5, N'科室工作统计', N'dormitoryJobStatistics', N'', 1, N'', N'' ),
        --( 606, 6, 2, 6, N'带教老师工作统计', N'teacherJobStatistics', N'', 1, N'', N'' ),
        ( 607, 6, 2, 7, N'教学活动统计', N'teachingActivitiesStatistics', N'teachingActivitiesStatistics', 1,
          N'', N'' ),
        ( 608, 6, 2, 8, N'360评价统计', N'360EvaluateStatistics', N'360EvaluateStatistics', 1, N'', N'' ),
        ( 7, 0, 1, 7, N'组织机构', N'', N'', 1, N'organization', N'' ),
        ( 701, 7, 2, 1, N'部门人员信息维护', N'departmentInfo', N'', 1, N'', N'' ),
        ( 702, 7, 2, 2, N'学员档案', N'studentFiles', N'', 1, N'', N'' ),
        ( 8, 0, 1, 8, N'系统设置', N'', N'', 1, N'set', N'' ),
        ( 801, 8, 2, 1, N'登录日志', N'log', N'', 1, N'', N'' ),
        ( 802, 8, 2, 2, N'权限管理', N'', N'', 1, N'', N'' ),
        --( 80201, 802, 3, 1, N'权限一览', N'jurisdiction', N'', 1, N'', N'' ),
        ( 80202, 802, 3, 1, N'角色及权限', N'roleJurisdiction', N'', 1, N'', N'' ),
        ( 803, 8, 2, 3, N'流程一览', N'flowPath', N'', 1, N'', N'' ),
        ( 804, 8, 2, 4, N'培训设置', N'', N'', 1, N'', N'' ),
        ( 80401, 804, 3, 1, N'标准培训专业设置', N'trainingMajorSettings', N'', 1, N'',
          N'标准规培专业配置,年份作为一个属性.而不是每年不同的专业配置' ),
        ( 80402, 804, 3, 2, N'标准规培科室设置', N'trainingDepartmentSettings', N'', 1,
          N'', N'属于哪个标准培训专业,基本信息,任务' ),
        ( 80403, 804, 3, 3, N'教学策略', N'teachingStrategies', N'', 1, N'',
          N'比如本科实习生培训策略这样的,一个策略+一个专业,对应多个本院科室轮转安排.' ),
        ( 80404, 804, 3, 4, N'本院科室对应', N'departmentMatching', N'', 1, N'', N'' ),
        ( 805, 8, 2, 5, N'教学活动设置', N'', N'', 1, N'', N'' ),
        ( 80501, 805, 3, 1, N'教学活动分类', N'activitiesClassify', N'', 1, N'',
          N'这个就查看一下' ),
        ( 80502, 805, 3, 2, N'教学活动评价项目设置', N'activitiesEvaluateSettings', N'',
          1, N'', N'' ),
        ( 806, 8, 2, 6, N'360评价设置', N'', N'', 1, N'', N'' ),
        ( 80601, 806, 3, 1, N'360评价方向', N'360EvaluateDirection', N'', 1, N'',
          N'' ),
        ( 80602, 806, 3, 2, N'360评价分类', N'360EvaluateClassify', N'', 1, N'',
          N'' ),
        ( 80603, 806, 3, 3, N'360评价项目', N'360EvaluateProject', N'', 1, N'',
          N'' ),
        ( 807, 8, 2, 7, N'基础信息设置', N'', N'', 1, N'', N'' ),
        ( 80701, 807, 3, 1, N'学员类型', N'studentType', N'', 1, N'', N'' ),
        ( 80702, 807, 3, 2, N'宿舍', N'dormitory', N'', 1, N'', N'' ),
        ( 80703, 807, 3, 3, N'学历', N'basicInfo?type=学历', N'', 1, N'', N'' ),
        ( 80704, 807, 3, 4, N'往届应届', N'basicInfo?type=往届应届', N'', 1, N'', N'' ),
        ( 80705, 807, 3, 5, N'送培方式', N'basicInfo?type=送培方式', N'', 1, N'', N'' ),
        ( 80706, 807, 3, 6, N'医疗卫生机构类型', N'basicInfo?type=医疗卫生机构类型', N'', 1,
          N'', N'' ),
        ( 80707, 807, 3, 7, N'职称', N'basicInfo?type=职称', N'', 1, N'', N'' ),
        ( 80708, 807, 3, 8, N'学科', N'basicInfo?type=学科', N'', 1, N'', N'' ),
        ( 80709, 807, 3, 9, N'民族', N'basicInfo?type=民族', N'', 1, N'', N'' );

GO

--教学角色权限
TRUNCATE TABLE dbo.教学角色权限;
--系统管理员
INSERT  dbo.教学角色权限
        ( 教学角色编号, 教学权限编号 )
        VALUES(1,1),(1,101),(1,102),(1,103),
		(1,2),(1,201),(1,202),(1,203),(1,204),
		(1,3),(1,301),(1,302),(1,3021),(1,303),(1,304),(1,305),(1,306),(1,307),
		(1,4),(1,408),(1,409),(1,410),(1,417),(1,418),
		(1,5),(1,502),(1,503),(1,504),(1,505),(1,506),(1,507),(1,508),(1,509),
		(1,6),(1,601),(1,603),(1,607),(1,608),
		(1,7),(1,701),(1,702),
		(1,8),(1,801),
			(1,802),(1,80202),
			(1,803),
			(1,804),(1,80401),(1,80402),(1,80403),(1,80404),
			(1,805),(1,80501),(1,80502),
			(1,806),(1,80601),(1,80602),(1,80603),
			(1,807),(1,80701),(1,80702),(1,80703),(1,80704),(1,80705),(1,80706),(1,80707),(1,80708),(1,80709);
--医院管理员
INSERT  dbo.教学角色权限
        ( 教学角色编号, 教学权限编号 )
        VALUES(2,1),(2,101),(2,102),(2,103),
		(2,2),(2,201),(2,202),(2,203),(2,204),
		(2,3),(2,301),(2,302),(2,303),(2,304),(2,305),(2,306),(2,307),
		(2,4),(2,408),(2,409),(2,410),(2,417),(2,418),
		(2,5),(2,502),(2,503),(2,504),(2,505),(2,506),(2,507),(2,508),(2,509),
		(2,6),(2,601),(2,603),(2,607),(2,608),
		(2,7),(2,701),(2,702),
		(2,8),(2,801),
			(2,802),(2,80202),
			(2,803),
			(2,804),(2,80401),(2,80402),(2,80403),(2,80404),
			(2,805),(2,80501),(2,80502),
			(2,806),(2,80601),(2,80602),(2,80603),
			(2,807),(2,80701),(2,80702),(2,80703),(2,80704),(2,80705),(2,80706),(2,80707),(2,80708),(2,80709);
--科室管理员
INSERT  dbo.教学角色权限
        ( 教学角色编号, 教学权限编号 )
        VALUES(3,1),(3,103),
		(3,2),(3,201),(3,202),(3,203),(3,204),
		(3,3),(3,302),(3,3021),(3,307),(3,308),(3,309),(3,310),(3,311),(3,312),
		(3,4),(3,411),(3,412),(3,413),(3,418),
		(3,5),(3,502),(3,503),(3,504),(3,505),(3,506),(3,507),(3,508),(3,509),
		(3,6),(3,601),(3,603),(3,607),(3,608),
		(3,8),(3,803);

--带教老师
INSERT  dbo.教学角色权限
        ( 教学角色编号, 教学权限编号 )
        VALUES(4,1),(4,103),
		(4,2),(4,201),(4,202),(4,203),(4,204),
		(4,3),(4,302),(4,3021),(4,307),(4,308),(4,309),
		(4,4),(4,414),(4,415),(4,416),(4,418),
		(4,5),(4,502),(4,503),(4,504),(4,505),(4,506),(4,507),(4,508),(4,509),
		(4,6),(4,601),(4,603),(4,607),(4,608),
		(4,8),(4,803);
GO

--

--流程:退培;请假;病例;出科;结业;教学活动反馈;
--其中,只有请假会涉及到三个角色分别审核;
--涉及的表:
--1 flowtemplate
--2 steptemplate
--3 StepTemplateAssignedPerson
--4 StepTemplateState
--5 StepTemplateStateChoice
--6 StepTemplateStateChoiceCondition
TRUNCATE TABLE dbo.FlowTemplate;

INSERT  dbo.FlowTemplate
        ( Id, TableName, Name, ComponentName, Remark )
VALUES  ( 100, N'教学退培申请', N'教学退培申请', N'', N'' ),
        ( 200, N'教学请假申请', N'教学请假申请', N'', N'' ),
        ( 300, N'教学轮转手册', N'轮转登记手册', N'', N'' ),
        ( 400, N'教学出科申请', N'教学出科申请', N'', N'' ),
        ( 500, N'教学结业申请', N'教学结业申请', N'', N'' ),
        ( 600, N'教学活动反馈', N'教学活动反馈', N'', N'' );

--
TRUNCATE TABLE dbo.StepTemplate;

INSERT  dbo.StepTemplate
        ( Id, FlowTemplateId, Name, ViewComponentName, EditComponentName,
          Style, Remark )
VALUES  ( 100, 100, N'申请退培', N'retireTrainingDetails', N'editRetireTraining', N'iconicon-edit', N'' ),
        ( 110, 100, N'退培审核', N'retireTrainingDetails', N'examineCommon', N'icon-shenhe', N'' ),
        ( 200, 200, N'请假申请', N'leaveDetails', N'editLeave', N'iconicon-edit', N'' ),
        ( 210, 200, N'带教老师审核', N'leaveDetails', N'examineCommon', N'icon-shenhe', N'2天内' ),
        ( 220, 200, N'科室管理员审核', N'leaveDetails', N'examineCommon', N'icon-shenhe', N'5天内' ),
        ( 230, 200, N'医院管理员审核',  N'leaveDetails', N'examineCommon', N'icon-shenhe', N'' ),
        ( 300, 300, N'提交轮转登记手册', N'rotationDetails', N'editRotation', N'iconicon-edit', N'' ),
        ( 310, 300, N'带教老师审核', N'rotationDetails', N'examineCommon', N'icon-shenhe', N'' ),
        ( 400, 400, N'出科申请', N'outDepartmentDetails', N'editOutDepartment', N'iconicon-edit', N'' ),
        ( 410, 400, N'科室管理员审核', N'outDepartmentDetails', N'examineCommon', N'icon-shenhe', N'' ),
        ( 420, 400, N'医院管理员审核', N'outDepartmentDetails', N'examineCommon', N'icon-shenhe', N'' ),
        ( 500, 500, N'申请结业', N'graduationDetails', N'editGraduation', N'iconicon-edit', N'' ),
        ( 510, 500, N'结业审核', N'graduationDetails', N'examineCommon', N'icon-shenhe', N'' ),
        ( 600, 600, N'提交教学活动反馈', N'activityDetails', N'editActivity', N'iconicon-edit', N'' ),
        ( 610, 600, N'教学活动反馈审核', N'activityDetails', N'examineCommon', N'icon-shenhe', N'' );
--
TRUNCATE TABLE StepTemplateAssignedPerson;

INSERT  dbo.StepTemplateAssignedPerson
        ( StepTemplateId, StepAssignedPersonType, StepAssignedPersonId, Remark )
VALUES  ( 100, NULL, 0, N'' ),
        ( 110, N'教学角色', 2, N'' ),
        ( 200, NULL, 0, N'' ),
        ( 210, N'教学角色', 4, N'' ),
        ( 220, N'教学角色', 3, N'' ),
        ( 230, N'教学角色', 2, N'' ),
        ( 300, NULL, 0, N'' ),
        ( 310, N'教学角色', 4, N'' ),
        ( 400, NULL, 0, N'' ),
        ( 410, N'教学角色', 3, N'' ),
        ( 420, N'教学角色', 2, N'' ),
        ( 500, NULL, 0, N'' ),
        ( 510, N'教学角色', 2, N'' ),
        ( 600, NULL, 0, N'' ),
        ( 610, N'教学角色', 2, N'' ),
        ( 610, N'教学角色', 3, N'' ),
        ( 610, N'教学角色', 4, N'' );

--StepTemplateState
TRUNCATE TABLE StepTemplateState;

INSERT  dbo.StepTemplateState
        ( Id, StepTemplateId, State, Name, Remark )
VALUES  ( 1000, 100, 0, N'待完善', N'' ),
        ( 1001, 100, 1, N'提交', N'' ),
        ( -1002, 100, -2, N'作废', N'' ),
        ( 1100, 110, 0, N'待审核', N'' ),
        ( 1101, 110, 1, N'审核通过', N'' ),
        ( -1101, 110, -1, N'审核不通过', N'' ),
        ( -1102, 110, -2, N'作废', N'' ),
        ( 2000, 200, 0, N'待完善', N'' ),
        ( 2001, 200, 1, N'提交', N'' ),
        ( 2100, 210, 0, N'待审核', N'' ),
        ( 2101, 210, 1, N'审核通过', N'' ),
        ( -2102, 210, -2, N'审核不通过', N'' ),
        ( 2200, 220, 0, N'待审核', N'' ),
        ( 2201, 220, 1, N'审核通过', N'' ),
        ( -2202, 220, -2, N'审核不通过', N'' ),
        ( 2300, 230, 0, N'待医审核', N'' ),
        ( 2301, 230, 1, N'审核通过', N'' ),
        ( -2302, 230, -2, N'审核不通过', N'' ),
        ( 3000, 300, 0, N'待完善', N'' ),
        ( 3001, 300, 1, N'提交', N'' ),
        ( -3002, 300, -2, N'作废', N'' ),
        ( 3100, 310, 0, N'待审核', N'' ),
        ( 3101, 310, 1, N'审核通过', N'' ),
        ( -3101, 310, -1, N'审核不通过', N'' ),
        ( -3102, 310, -2, N'作废', N'' ),
        ( 4000, 400, 0, N'待完善', N'' ),
        ( 4001, 400, 1, N'提交', N'' ),
        ( 4100, 410, 0, N'待审核', N'' ),
        ( 4101, 410, 1, N'审核通过', N'' ),
        ( -4102, 410, -2, N'审核不通过', N'' ),
        ( 4200, 420, 0, N'待审核', N'' ),
        ( 4201, 420, 1, N'审核通过', N'' ),
        ( -4202, 420, -2, N'审核不通过', N'' ),
        ( 5000, 500, 0, N'待完善', N'' ),
        ( 5001, 500, 1, N'提交', N'' ),
        ( -5002, 500, -2, N'作废', N'' ),
        ( 5100, 510, 0, N'待审核', N'' ),
        ( 5101, 510, 1, N'审核通过', N'' ),
        ( -5101, 510, -1, N'审核不通过', N'' ),
        ( -5102, 510, -2, N'作废', N'' ),
        ( 6000, 600, 0, N'待提交', N'' ),
        ( 6001, 600, 1, N'提交', N'' ),
        ( -6002, 600, -2, N'作废', N'' ),
        ( 6100, 610, 0, N'待审核', N'' ),
        ( 6101, 610, 1, N'审核通过', N'' ),
        ( -6101, 610, -1, N'审核不通过', N'' ),
        ( -6102, 610, -2, N'作废', N'' );

--StepTemplateStateChoice
TRUNCATE TABLE StepTemplateStateChoice;
INSERT  dbo.StepTemplateStateChoice
        ( Id, Name, StepTemplateStateId, NextStepTemplateId, Sort, Remark )
VALUES  ( 10011, N'进入退培审核', 1001, 110, 1, N'' ),
        ( -11011, N'退回退培申请', -1101, 100, 1, N'' ),
        ( 20011, N'进入带教老师审核', 2001, 210, 1, N'' ),
        ( 21011, N'进入科室管理员审核', 2101, 220, 1, N'' ),
        ( 22011, N'进入医院管理员审核', 2201, 230, 1, N'' ),
        ( 30011, N'进入轮转登记手册审核', 3001, 310, 1, N'' ),
        ( -31011, N'退回轮转登记手册提交', -3101, 300, 1, N'' ),
        ( 40011, N'进入科室管理员审核', 4001, 410, 1, N'' ),
        ( 41011, N'进入医院管理员审核', 4101, 420, 1, N'' ),
        ( 50011, N'进入结业审核', 5001, 510, 1, N'' ),
        ( -51011, N'退回退培申请', -5101, 500, 1, N'' ),
        ( 60011, N'进入教学活动反馈审核', 6001, 610, 1, N'' ),
        ( -61011, N'退回教学活动反馈提交', -6101, 600, 1, N'' );

 --StepTemplateStateChoiceCondition
TRUNCATE TABLE dbo.StepTemplateStateChoiceCondition;

INSERT  dbo.StepTemplateStateChoiceCondition
        ( StepTemplateStateChoiceId, PropName, Operator, Value, Remark )
VALUES  ( 21011, -- StepTemplateStateChoiceId - int
          N'请假天数', -- PropName - nvarchar(100)
          N'gt;', -- Operator - nvarchar(100)
          N'2', -- Value - nvarchar(100)
          N''  -- Remark - nvarchar(1000)
          ),
        ( 22011, -- StepTemplateStateChoiceId - int
          N'请假天数', -- PropName - nvarchar(100)
          N'gt;', -- Operator - nvarchar(100)
          N'5', -- Value - nvarchar(100)
          N''  -- Remark - nvarchar(1000)
          );

GO

TRUNCATE TABLE dbo.教学考勤类型;         
INSERT  dbo.教学考勤类型
        ( 编号, 名称, 备注 )
VALUES  ( 1, N'正常白班', N'' ),
        ( 2, N'正常休假', N'' ),
        ( 3, N'迟到', N'' ),
        ( 4, N'早退', N'' ),
        ( 5, N'脱岗', N'' ),
        ( 6, N'旷工', N'' ),
        ( 7, N'夜班', N'' ),
        ( 8, N'请假', N'' );

GO
        


--教学轮转手册类型分类
SELECT  *
FROM    字典
WHERE   分类 = '教学轮转手册类型分类';

DELETE  字典
WHERE   分类 = '教学轮转手册类型分类';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'教学轮转手册类型分类', N'病种病例', 0, 0, 0, N'' ),
        ( N'教学轮转手册类型分类', N'技能操作', 0, 0, 0, N'' );

GO

--
TRUNCATE TABLE 教学轮转手册类型;
INSERT dbo.教学轮转手册类型
        ( 编号 ,
          分类 ,
          名称 ,
          是否门诊 ,
          是否病床 ,
          是否医技 ,
          内容模板 ,
          备注
        )
VALUES  ( 1 , N'病种病例' , N'大病历'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 2 , N'病种病例' , N'门诊诊治'  , 1 ,NULL ,NULL ,N'' ,N''),
 ( 3 , N'病种病例' , N'急诊诊治'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 4 , N'病种病例' , N'抢救记录'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 5 , N'病种病例' , N'会诊记录'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 6 , N'技能操作' , N'操作记录'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 7 , N'技能操作' , N'手术记录'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 8 , N'技能操作' , N'门诊记录'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 9 , N'技能操作' , N'门诊手术'  , NULL ,NULL ,NULL ,N'' ,N''),
 ( 10 , N'技能操作' , N'医技报告'  , NULL ,NULL ,NULL ,N'' ,N'')

 GO
 TRUNCATE TABLE 教学人员角色;
 INSERT  dbo.教学人员角色
        ( 教学角色编号, 人员编号 )
VALUES ( 1, 2 );
 TRUNCATE TABLE dbo.教学专业;
 TRUNCATE TABLE dbo.教学专业科室;
 TRUNCATE TABLE 教学专业科室要求;
TRUNCATE TABLE 教学专业科室任务;
TRUNCATE TABLE 教学本院策略;
TRUNCATE TABLE 教学科室;
TRUNCATE TABLE 教学本院科室;
TRUNCATE TABLE dbo.教学本院科室任务;

TRUNCATE TABLE 教学结业申请;
TRUNCATE TABLE 教学退培申请;
TRUNCATE TABLE dbo.教学学员培训;
TRUNCATE TABLE dbo.教学轮转;
TRUNCATE TABLE dbo.教学出科申请;
TRUNCATE TABLE dbo.教学更换带教老师;
TRUNCATE TABLE dbo.教学补轮转;
TRUNCATE TABLE dbo.教学考勤情况
TRUNCATE TABLE dbo.教学轮转任务;
TRUNCATE TABLE dbo.教学轮转手册完成任务;
TRUNCATE TABLE dbo.教学轮转手册;
TRUNCATE TABLE 教学医疗差错及事故记录;
TRUNCATE TABLE dbo.教学考试成绩;
TRUNCATE TABLE dbo.教学请假申请;

TRUNCATE TABLE dbo.Flow;
TRUNCATE TABLE dbo.Step;
TRUNCATE TABLE dbo.StepAssignedPerson;

 --------------------------------------------------------------------------------------------------------------------
 --下面是在云服务器上不一定要放置的,或者说,要进一步整理才可以放置
 --------------------------------------------------------------------------------------------------------------------
 
--教学人员角色,这个在应用到云服务器数据库时不应有;
TRUNCATE TABLE 教学人员角色;

INSERT  dbo.教学人员角色
        ( 教学角色编号, 人员编号 )
VALUES ( 1, 2 ), ( 2, 3100 ),
        ( 3, 3094 ),
        ( 3, 3095 ),
        ( 4, 3096 ),
        ( 4, 3097 ),
        ( 4, 3098 ),
        ( 4, 3099 );
GO


--SELECT  *
--FROM    dbo.人员;
--SELECT  *
--FROM    dbo.教学专业;

--SELECT  *
--FROM    教学本院策略 a
--        LEFT JOIN dbo.v1_人员 b ON a.专业基地管理员编号 = b.编号;

--培训专业
SELECT  *
FROM    dbo.教学专业;

TRUNCATE TABLE dbo.教学专业;

INSERT  dbo.教学专业
        ( 名称, 年份, 是否国家标准, 标准代码, 最低培训时长, 学习要求及目标, 备注 )
VALUES  ( N'内科', 2015, 1, N'', 100, N'', N'' ),
        ( N'外科', 2015, 1, N'', 100, N'', N'' );

GO



--教学专业科室,仅仅做一个示例
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
        ( 2, 0, N'眼科', 2, 2, 1, N'', N'' ),
        ( 2, 0, N'皮肤科病房', 2, 2, 1, N'', N'' );

GO

--教学专业科室要求,仅仅做演示用
SELECT  *
FROM    dbo.教学专业科室要求;

TRUNCATE TABLE 教学专业科室要求;

INSERT  dbo.教学专业科室要求
        ( 教学专业科室编号 ,
          项目名称 ,
          说明 ,
          最低评分要求 ,
          备注
        )
VALUES  ( 1 , -- 教学科室编号 - int
          N'常见腹部损伤、急腹症(包括急性阑尾炎、胃肠穿孔、肠梗阻、急性重症胰腺炎、急性梗阻型化脓性胆管炎、腹膜炎等）、消化道出血等的病因、临床表现、诊断与鉴别诊断及手术适应证' , -- 项目名称 - nvarchar(50)
          N'' , -- 说明 - nvarchar(200)
          80 , -- 最低评分要求 - int
          N''  -- 备注 - nvarchar(500)
        );

SELECT  *
FROM    dbo.教学专业科室要求 a
        LEFT JOIN 教学评分等级 b ON a.最低评分要求 BETWEEN b.最小分值 AND b.最大分值;
GO


--教学专业科室任务,仅仅做演示用
SELECT  *
FROM    dbo.教学专业科室任务;
TRUNCATE TABLE 教学专业科室任务;

INSERT  dbo.教学专业科室任务
        ( 教学专业科室编号, 项目名称, 任务类型编号, 是否门诊, 是否病房, 是否医技, 最低评分要求, 数量要求, 备注 )
VALUES  ( 1, N'心肺复苏术', 1, 1, 0, 1, 80, 2, N'' ),
        ( 1, N'洗胃术', 1, 1, 0, 1, 80, 3, N'' ),
        ( 1, N'胸腹腔穿刺术', 1, 1, 0, 1, 80, 2, N'' );
GO

SELECT * FROM 教学本院策略;
TRUNCATE TABLE 教学本院策略;

--这个在应用到云服务器数据库时不应有;
INSERT  dbo.教学本院策略
        ( 名称, 教学专业编号, 专业基地管理员编号, 建立日期, 备注 )
VALUES  ( N'本科内科实习', 1, 3083, GETDATE(), N'' ),
        ( N'研究生内科实习', 1, 3084, GETDATE(), N'' );

GO

--教学科室 这个在应用到云服务器数据库时不应有;
----它对应的教学专业下的所有专业科室:
--SELECT  *
--FROM    dbo.教学专业科室
--WHERE   教学专业编号 = 1;
----标准的科室,是映射到本院的那个科室
--SELECT  *
--FROM    教学科室 a
--        JOIN 部门 b ON a.编号 = b.编号;
----最终在教学本院科室做一个对应;
--SELECT  *
--FROM    dbo.教学本院科室;
SELECT  *
FROM    dbo.教学科室;

TRUNCATE TABLE 教学科室;
INSERT  dbo.教学科室
        ( 编号, 科室管理员编号, 最大学员人数, 备注 )
VALUES  ( 10052, 3094, 5, N'' ),
        ( 10053, 3095, 5, N'' );

SELECT  *
FROM    教学科室 a
        JOIN 部门 b ON a.编号 = b.编号;

GO


--教学本院科室
SELECT * FROM dbo.教学本院科室

TRUNCATE TABLE 教学本院科室;

--里面的数据,默认值都是从专业科室设置里面取的;这个在应用到云服务器数据库时不应有;
INSERT  dbo.教学本院科室
        ( 教学本院策略编号, 排序值, 教学专业科室编号, 本院科室编号, 是否必选, 培训时长, 最低管床数量, 最低全程管理数量, 备注 )
VALUES  ( 2, -- 教学专业本院策略编号 - int
          0, -- 排序值 - int
          1, -- 教学专业科室编号 - int
          10052, -- 本院科室编号 - int
          1, -- 是否必选 - bit
          2, -- 培训时长 - int
          3, -- 最低管床数量 - int
          3, -- 最低全程管理数量 - int
          N''  -- 备注 - nvarchar(500)
          ),
        ( 2, -- 教学专业本院策略编号 - int
          0, -- 排序值 - int
          1, -- 教学专业科室编号 - int
          10053, -- 本院科室编号 - int
          1, -- 是否必选 - bit
          2, -- 培训时长 - int
          3, -- 最低管床数量 - int
          3, -- 最低全程管理数量 - int
          N''  -- 备注 - nvarchar(500)
          );
GO

--同时还需要填充专业科室默认的任务;当然可以在后面自己改;
SELECT  *
FROM    dbo.教学本院科室任务;

TRUNCATE TABLE dbo.教学本院科室任务;

INSERT  dbo.教学本院科室任务
        ( 教学本院科室编号 ,
          项目名称 ,
          任务类型编号 ,
          是否门诊 ,
          是否病房 ,
          是否医技 ,
          最低评分要求 ,
          数量要求 ,
          备注
        )
        SELECT  2 ,
                项目名称 ,
                任务类型编号 ,
                是否门诊 ,
                是否病房 ,
                是否医技 ,
                最低评分要求 ,
                数量要求 ,
                备注
        FROM    dbo.教学专业科室任务
        WHERE   教学专业科室编号 = 1;
GO
