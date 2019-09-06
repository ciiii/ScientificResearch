
ALTER FUNCTION [dbo].[FNGetPersonInfoByType]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT 
    )
RETURNS NVARCHAR(500)
AS
    BEGIN

        DECLARE @result NVARCHAR(500);

        IF ( @PersonType IS NULL )
            BEGIN

                IF ( @PersonId = 0 )
                    SELECT  @result = '发起人或负责人';
            END;

        IF ( @PersonType = '人员' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '所有医院员工';
                ELSE
                    SELECT  @result = 姓名
                    FROM    dbo.人员
                    WHERE   编号 = @PersonId;
            END;
            
        IF ( @PersonType = '教学学员' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '所有教学学员';
                ELSE
                    SELECT  @result = 姓名
                    FROM    dbo.教学学员
                    WHERE   编号 = @PersonId;
            END;

        IF ( @PersonType = '教学角色' )
            SELECT  @result = 名称
            FROM    dbo.教学角色
            WHERE   编号 = @PersonId;

		IF ( @PersonType = '继教角色' )
            SELECT  @result = 名称
            FROM    dbo.继教角色
            WHERE   编号 = @PersonId;

        IF ( @PersonType = '部门'
             OR @PersonType = '教学科室'
           )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '所有部门';
                ELSE
                    SELECT  @result = 名称
                    FROM    dbo.部门
                    WHERE   编号 = @PersonId;
            END;
            
        RETURN @result;

    END;
GO


TRUNCATE TABLE dbo.继教能级;
INSERT dbo.继教能级
        ( 名称, 备注 )
VALUES  ( N'N0',N''),( N'N1',N''),( N'N2',N''),( N'N3',N''),( N'N4',N'')

GO

TRUNCATE TABLE dbo.继教权限;

--首页是谁都有的
INSERT dbo.继教权限
        ( 编号, 上级编号, 深度, 排序值, 名称, 组件名, 是否菜单, 图标, 备注 )
VALUES  ( 1,0,1,0,N'慕课',N'ForClass', 1,N'',N'' ),
( 101,1,2,1,N'慕课活动',N'ForClassActivity', 1,N'',N'' ),
( 102,1,2,2,N'素材库',N'ForClassMaterial', 1,N'',N'' ),
( 103,1,2,3,N'题库',N'ForClassQuestionBank', 1,N'',N'' ),

( 2,0,1,0,N'考试',N'Test', 1,N'',N'' ),
( 201,2,2,1,N'理论考试',N'TestTheory', 1,N'',N'' ),
( 202,2,2,2,N'试卷',N'TestExaminationPaper', 1,N'',N'' ),
( 203,2,2,3,N'题库',N'TestQuestionBank', 1,N'',N'' ),
( 204,2,2,4,N'操作考试',N'TestOperation', 1,N'',N'' ),
( 205,2,2,5,N'评分表',N'TestScoreTable', 1,N'',N'' ),

( 3,0,1,0,N'签到',N'SignIn', 1,N'',N'' ),

( 4,0,1,0,N'组织机构',N'Organization', 1,N'',N'' ),
( 401,4,2,1,N'部门人员信息',N'OrganizationPersonnelInformation', 1,N'',N'' ),

( 5,0,1,0,N'系统设置',N'SystemSettings', 1,N'',N'' ),
( 501,5,2,1,N'登录日志',N'SystemSettingsLoginLog', 1,N'',N'' ),
( 502,5,2,2,N'权限管理',N'SystemSettingsRightsManagement', 1,N'',N'' ),
 ( 50201,502,3,1,N'角色及权限',N'', 1,N'',N'' ),
( 503,5,2,3,N'设置',N'SystemSettingsSetUp', 1,N'',N'' ),
( 504,5,2,4,N'基础信息',N'SystemSettingsBasicInformation', 1,N'',N'' ),
 ( 50401,505,3,1,N'学历',N'', 1,N'',N'' ),
 ( 50402,505,3,2,N'职称',N'', 1,N'',N'' ),
 ( 50403,505,3,3,N'学科',N'', 1,N'',N'' ),
 ( 50404,505,3,4,N'民族',N'', 1,N'',N'' ),
 ( 50405,505,3,5,N'能级',N'', 1,N'',N'' );

GO

--微信端,"首页","我的活动","个人中心"都是固定死的
TRUNCATE TABLE dbo.继教微信权限;

INSERT dbo.继教微信权限
        ( 编号, 上级编号, 深度, 排序值, 名称, 组件名, 是否菜单, 图标, 备注 )
VALUES  ( 1,0,1,1,N'操作评分',N'',1,N'',N''),( 2,0,1,2,N'管理员',N'',1,N'',N'')

GO

TRUNCATE TABLE 继教角色;

INSERT dbo.继教角色
        ( 编号, 名称, 能否直接配置人员, 备注 )
VALUES  ( 1,N'系统管理员', 1,N''),
 ( 2,N'医院管理员', 1,N''),
( 3,N'科室管理员', 0,N''),
( 4,N'助教老师', 1,N'')
GO

--0001加入系统管理员
TRUNCATE TABLE dbo.继教人员角色;
INSERT dbo.继教人员角色
        ( 继教角色编号, 人员编号 )
VALUES  ( 1, -- 继教角色编号 - int
          2  -- 人员编号 - int
          )

GO

TRUNCATE TABLE dbo.继教角色权限;

--pc端
--系统管理员拥有所有权限;
INSERT dbo.继教角色权限
        ( 继教角色编号, 继教权限编号 )
		SELECT 1,编号 FROM dbo.继教权限;

--医院管理员拥有所有权限
INSERT dbo.继教角色权限
        ( 继教角色编号, 继教权限编号 )
		SELECT 2,编号 FROM dbo.继教权限;

--科室管理员拥有业务权限
INSERT dbo.继教角色权限
        ( 继教角色编号, 继教权限编号 )
VALUES  ( 3,1),
( 3,101),
( 3,102),
( 3,103),
( 3,2),
( 3,201),
( 3,202),
( 3,203),
( 3,204),
( 3,205),
( 3,3);

--助教老师没有pc端的权限;
GO

TRUNCATE TABLE dbo.继教微信端角色权限;

--微信端
--系统管理员拥有所有权限
INSERT dbo.继教微信端角色权限
        ( 继培角色编号, 继培微信端权限编号 )
SELECT 1,编号 FROM dbo.继教微信权限;

--医院管理员和科室管理员拥有"管理员"菜单的权限
--助教老师有"操作评分"的权限;
INSERT dbo.继教微信端角色权限
        ( 继培角色编号, 继培微信端权限编号 )
VALUES  ( 2,2),(3,2),(4,1);

GO

TRUNCATE TABLE dbo.继教设置;
INSERT dbo.继教设置
        ( 课时课件通过时长百分比 ,
          理论考试及格分百分比 ,
          最大允许离开界面次数
        )
VALUES  ( 80 , -- 课时课件通过时长百分比 - int
          60 , -- 理论考试及格分百分比 - int
          3  -- 最大允许离开界面次数 - int
        );
GO

