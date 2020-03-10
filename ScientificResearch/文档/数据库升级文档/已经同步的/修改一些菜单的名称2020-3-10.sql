
TRUNCATE TABLE dbo.继教权限;

--首页是谁都有的
INSERT dbo.继教权限
        ( 编号, 上级编号, 深度, 排序值, 名称, 组件名, 是否菜单, 图标, 备注 )
VALUES  ( 1,0,1,0,N'学习',N'ForClass', 1,N'',N'' ),
( 101,1,2,1,N'学习活动',N'ForClassActivity', 1,N'',N'' ),
( 102,1,2,2,N'学习资源',N'ForClassMaterial', 1,N'',N'' ),
( 103,1,2,3,N'题库资源',N'ForClassQuestionBank', 1,N'',N'' ),

( 2,0,1,0,N'考试',N'Test', 1,N'',N'' ),
( 201,2,2,1,N'理论考试',N'TestTheory', 1,N'',N'' ),
( 202,2,2,2,N'试卷中心',N'TestExaminationPaper', 1,N'',N'' ),
( 203,2,2,3,N'题库资源',N'TestQuestionBank', 1,N'',N'' ),
( 204,2,2,4,N'操作考试',N'TestOperation', 1,N'',N'' ),
( 205,2,2,5,N'评分表',N'TestScoreTable', 1,N'',N'' ),
( 206,2,2,6,N'课堂作业',N'TestSelf', 1,N'',N'' ),

( 3,0,1,0,N'签到',N'SignIn', 1,N'',N'' ),

( 4,0,1,0,N'组织机构',N'Organization', 1,N'',N'' ),
( 401,4,2,1,N'部门人员信息',N'OrganizationPersonnelInformation', 1,N'',N'' ),

( 5,0,1,0,N'系统设置',N'SystemSettings', 1,N'',N'' ),
( 501,5,2,1,N'登录日志',N'SystemSettingsLoginLog', 1,N'',N'' ),
( 502,5,2,2,N'权限管理',N'SystemSettingsRightsManagement', 1,N'',N'' ),
 ( 50201,502,3,1,N'角色及权限',N'SystemSettingsRightsManagementRole', 1,N'',N'' ),
( 503,5,2,3,N'业务设置',N'SystemSettingsBusiness', 1,N'',N'' ),
 ( 50301,503,3,1,N'基本规则',N'SystemSettingsBasicRules', 1,N'',N'' ),
 ( 50302,503,3,2,N'培训计划',N'SystemSettingStrainingPlan', 1,N'',N'' ),
 ( 50303,503,3,3,N'活动项目分类',N'SystemSettingsSetUpActiveItemClass', 1,N'',N'' ),
( 504,5,2,4,N'基础信息',N'SystemSettingsBasicInformation', 1,N'',N'' ),
 ( 50401,504,3,1,N'学历',N'SystemSettingsBasicInformationBasic?type=学历', 1,N'',N'' ),
 ( 50402,504,3,2,N'职称',N'SystemSettingsBasicInformationBasic?type=职称', 1,N'',N'' ),
 ( 50403,504,3,3,N'学科',N'SystemSettingsBasicInformationBasic?type=学科', 1,N'',N'' ),
 ( 50404,504,3,4,N'民族',N'SystemSettingsBasicInformationBasic?type=民族', 1,N'',N'' ),
 ( 50405,504,3,5,N'能级',N'SystemSettingsBasicInformationLevels', 1,N'',N'' ),
 ( 50406,504,3,6,N'标签',N'SystemSettingsBasicInformationLabel', 1,N'',N'' ),
 ( 50407,504,3,7,N'难易度',N'SystemSettingsBasicInformationBasic?type=难易度', 1,N'',N'' );

GO

