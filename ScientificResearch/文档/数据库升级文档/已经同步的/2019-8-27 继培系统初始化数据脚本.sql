
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
VALUES  ( 1,0,1,0,N'学习',N'ForClass', 1,N'',N'' ),
( 101,1,2,1,N'学习活动',N'ForClassActivity', 1,N'',N'' ),
( 102,1,2,2,N'学习资源',N'ForClassMaterial', 1,N'',N'' ),
( 103,1,2,3,N'题库资源',N'ForClassQuestionBank', 1,N'',N'' ),

( 2,0,1,0,N'考试',N'Test', 1,N'',N'' ),
( 201,2,2,1,N'理论考试',N'TestTheory', 1,N'',N'' ),
( 202,2,2,2,N'试卷',N'TestExaminationPaper', 1,N'',N'' ),
( 203,2,2,3,N'题库',N'TestQuestionBank', 1,N'',N'' ),
( 204,2,2,4,N'操作考试',N'TestOperation', 1,N'',N'' ),
( 205,2,2,5,N'评分表',N'TestScoreTable', 1,N'',N'' ),
( 206,2,2,6,N'自测',N'TestSelf', 1,N'',N'' ),

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
( 3,205),( 3,206),
( 3,3);

--助教老师没有pc端的权限;
GO

TRUNCATE TABLE dbo.继教微信角色权限;

--微信端
--系统管理员拥有所有权限
INSERT dbo.继教微信角色权限
        ( 继教角色编号, 继教微信权限编号 )
SELECT 1,编号 FROM dbo.继教微信权限;

--医院管理员和科室管理员拥有"管理员"菜单的权限
--助教老师有"操作评分"的权限;
INSERT dbo.继教微信角色权限
        ( 继教角色编号, 继教微信权限编号 )
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


DELETE  字典
WHERE   分类 = '试题难易度';

INSERT  dbo.字典
        ( 分类, 值, 上级编号, 级别, 排序, 备注 )
VALUES  ( N'试题难易度', N'难', 0, 0, 0, N'' ),
        ( N'试题难易度', N'易', 0, 0, 0, N'' );

		GO
        
TRUNCATE TABLE 继教试题类型;		
INSERT dbo.继教试题类型
        ( 编号, 名称, 最小答案数, 最大答案数, 分值, 备注 )
VALUES  ( 1, N'单项选择题',1,1,1,N''),
( 2, N'多项选择题',2,10,1,N''),
( 3, N'不定项项选择题',1,10,1,N''),
( 4, N'判断题',1,1,1,N'判断题的编码为对错,而不是ABCD')

GO


ALTER VIEW [dbo].[v_继教理论考试参与情况]
AS
    SELECT  b.考试编号,
	a.考试批次编号 ,
            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.答题开始时间 ,
			a.答题结束时间,
            a.得分 ,
            CAST(IIF(a.得分 >= c.及格分数, 1, 0) AS BIT) AS 是否通过
    FROM    dbo.继教理论考试参与情况 a
            JOIN dbo.继教考试批次 b ON a.考试批次编号 = b.编号
			JOIN 继教理论考试 c ON b.考试编号 = c.编号

GO


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
                    SELECT  @result =CONCAT(部门名称,'/',工号,'/', 姓名)
                    FROM    dbo.v1_人员_带部门名
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



ALTER PROCEDURE [dbo].[sp_GetList]
    @tbName NVARCHAR(200) ,        --表名
    @tbFields NVARCHAR(1000) = '*' ,      --返回字段
    @keyFields NVARCHAR(1000) = '' ,      --主键字段
    @OrderType BIT = 0 ,  --排序类型,1是升序,0是降序
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(4000) = ''     --查询条件
    --@Total INT OUTPUT ,         --返回总记录数
    --@SQLstr NVARCHAR(4000) OUTPUT
AS
    DECLARE @strSql VARCHAR(MAX);     --主语句
    DECLARE @strOrder VARCHAR(200);    --排序
    DECLARE @strSqlCount NVARCHAR(MAX);  --查询记录总数主语句
    DECLARE @SQLstr NVARCHAR(4000);

    --SELECT  @keyFields = STUFF(( SELECT ',' + c.name
    --                             FROM   sysindexes i
    --                                    JOIN sysindexkeys k ON i.id = k.id
    --                                                          AND i.indid = k.indid
    --                                    JOIN sysobjects o ON i.id = o.id
    --                                    JOIN syscolumns c ON i.id = c.id
    --                                                         AND k.colid = c.colid
    --                                    JOIN systypes t ON c.xusertype = t.xusertype
    --                             WHERE  o.xtype = 'U'
    --                                    AND o.name = @tbName
    --                                    AND EXISTS ( SELECT 1
    --                                                 FROM   sysobjects
    --                                                 WHERE  xtype = 'PK'
    --                                                        AND parent_obj = i.id
    --                                                        AND name = i.name )
    --                           FOR
    --                             XML PATH('')
    --                           ), 1, 1, '');
				--			    SET @keyFields = ISNULL(@keyFields,'(select 1)');
--------------排序-----------------1是降序,0未升序
    IF @OrderStr = ''
        SET @OrderStr = '1';
		--SET @OrderStr = '(SELECT 1)';

    SET @strOrder = ' order by ' + @OrderStr
        + IIF(@OrderType = 0, ' desc ', ' asc ');

    IF @tbFields = ''
        SET @tbFields = '*';

    IF @strWhere != ''
        BEGIN
            SET @strSql = 'select ' + @tbFields + ' from ' + @tbName
                + ' where ' + @strWhere + ' ' + @strOrder;
        END;
    ELSE
        BEGIN
            SET @strSql = 'select ' + @tbFields + ' from ' + @tbName
                + @strOrder;
        END;
    --BEGIN TRY
        
    SET @SQLstr = @strSql;
    PRINT @strSql;
    EXEC(@strSql);

    --    RETURN 1;
    --END TRY  
    --BEGIN CATCH 
		
    --    DECLARE @ErrorMessage NVARCHAR(4000);
    --    DECLARE @ErrorSeverity INT;
    --    DECLARE @ErrorState INT;

    --    SELECT  @ErrorMessage = ERROR_MESSAGE() + ' sql:' + @SQLstr ,
    --            @ErrorSeverity = ERROR_SEVERITY() ,
    --            @ErrorState = ERROR_STATE();

    --    RAISERROR (@ErrorMessage,  -- Message text.
				--   @ErrorSeverity, -- Severity.
				--   @ErrorState     -- State.
				--   );
		
    --END CATCH;
    --SET ANSI_NULLS ON; 

GO


ALTER PROCEDURE [dbo].[sp_GetPagingList]
    @tbName NVARCHAR(200) ,        --表名
    @tbFields NVARCHAR(1000) = '*' ,      --返回字段
    @keyFields NVARCHAR(1000) = '' ,      --主键字段
    @OrderType BIT = 0 ,  --排序类型,1是升序,0是降序
    @PageSize INT = 10 ,                 --页尺寸
    @PageIndex INT = 1 ,                --页码
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(4000) = ''     --查询条件
    --@Total INT OUTPUT ,         --返回总记录数
    --@SQLstr NVARCHAR(4000) OUTPUT
AS
    DECLARE @strSql VARCHAR(MAX);     --主语句
    DECLARE @strOrder VARCHAR(200);    --排序
    DECLARE @strSqlCount NVARCHAR(MAX);  --查询记录总数主语句
    DECLARE @SQLstr NVARCHAR(4000);

    --SELECT  @keyFields = STUFF(( SELECT ',' + c.name
    --                             FROM   sysindexes i
    --                                    JOIN sysindexkeys k ON i.id = k.id
    --                                                          AND i.indid = k.indid
    --                                    JOIN sysobjects o ON i.id = o.id
    --                                    JOIN syscolumns c ON i.id = c.id
    --                                                         AND k.colid = c.colid
    --                                    JOIN systypes t ON c.xusertype = t.xusertype
    --                             WHERE  o.xtype = 'U'
    --                                    AND o.name = @tbName
    --                                    AND EXISTS ( SELECT 1
    --                                                 FROM   sysobjects
    --                                                 WHERE  xtype = 'PK'
    --                                                        AND parent_obj = i.id
    --                                                        AND name = i.name )
    --                           FOR
    --                             XML PATH('')
    --                           ), 1, 1, '');
				--			    SET @keyFields = ISNULL(@keyFields,'(select 1)');
    --IF @OrderStr != ''
    --    BEGIN
    --        IF @OrderType != 0
    --            SET @OrderStr = @OrderStr + ' asc ,';
    --        ELSE
    --            SET @OrderStr = @OrderStr + ' desc ,';
            
    --    END; 
    --IF @OrderType != 0
    --    SET @strOrder = ' order by ' + @OrderStr + ' ' + @keyFields + ' asc ';
    --ELSE
    --    SET @strOrder = ' order by ' + @OrderStr + ' ' + @keyFields + ' desc ';

    IF @OrderStr = ''
        SET @OrderStr = '1';
		--SET @OrderStr = '(SELECT 1)';

    SET @strOrder = ' order by ' + @OrderStr
        + IIF(@OrderType = 0, ' desc ', ' asc ');
--------------总记录数---------------
    IF @strWhere != ''
        BEGIN
            SET @strSqlCount = 'Select count(1) from  ' + @tbName + ' where  '
                + @strWhere;
        END;
    ELSE
        BEGIN
            SET @strSqlCount = 'Select count(1) from  ' + @tbName;
        END;
    IF @tbFields = ''
        SET @tbFields = '*';
    --IF @strWhere != ''
    --    BEGIN
            --SET @strSql = 'select top ' + STR(@PageSize) + ' ' + @tbFields
            --    + ' from ' + @tbName + ' where ' + @keyFields
            --    + ' not in (select top ' + STR(( @PageIndex - 1 ) * @PageSize)
            --    + ' ' + @keyFields + ' from ' + @tbName + ' where '
            --    + @strWhere + ' ' + @strOrder + '  ) and ' + @strWhere + ' '
            --    + @strOrder;

    SET @strSql = 'select ' + @tbFields + ' from ' + @tbName
        + IIF(@strWhere = '', '', ' where ' + @strWhere) + @strOrder
        + ' OFFSET ' + STR(( @PageIndex - 1 ) * @PageSize)
        + ' ROW FETCH NEXT ' + STR(@PageSize) + ' ROWS only; ';
    --    END;
    --ELSE
    --    BEGIN
    --        SET @strSql = 'select top ' + STR(@PageSize) + ' ' + @tbFields
    --            + ' from ' + @tbName + ' where ' + @keyFields
    --            + ' not in (select top ' + STR(( @PageIndex - 1 ) * @PageSize)
    --            + ' ' + @keyFields + ' from ' + @tbName + ' ' + @strOrder
    --            + ') ' + @strOrder;
    --    END;
   -- BEGIN TRY
    SET @SQLstr = @strSql;
        --PRINT @strSqlCount;
    EXEC sp_executesql @strSqlCount;
        PRINT @strSql;
    EXEC(@strSql);

    --    RETURN 1;
    --END TRY  
    --BEGIN CATCH 
		
    --    DECLARE @ErrorMessage NVARCHAR(4000);
    --    DECLARE @ErrorSeverity INT;
    --    DECLARE @ErrorState INT;

    --    SELECT  @ErrorMessage = ERROR_MESSAGE() + ' sql:' + @SQLstr ,
    --            @ErrorSeverity = ERROR_SEVERITY() ,
    --            @ErrorState = ERROR_STATE();

    --    RAISERROR (@ErrorMessage,  -- Message text.
				--   @ErrorSeverity, -- Severity.
				--   @ErrorState     -- State.
				--   );
		
    --END CATCH;
    --SET ANSI_NULLS ON; 
GO
