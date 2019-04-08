CREATE TYPE tt_教学本院策略 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[教学专业编号] [INT] NULL ,
[专业基地管理员编号] [INT] NULL,
[建立日期] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学本院策略_增改
    (
      @tt tt_教学本院策略 READONLY
    )
AS
    DECLARE @output tt_教学本院策略;
    MERGE dbo.教学本院策略 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[教学专业编号] = s.[教学专业编号] ,
               t.[专业基地管理员编号] = s.[专业基地管理员编号] ,
               t.[建立日期] = s.[建立日期] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 名称 ,
                 教学专业编号 ,
                 专业基地管理员编号 ,
                 建立日期 ,
                 备注
               )
        VALUES ( s.名称 ,
                 s.教学专业编号 ,
                 s.专业基地管理员编号 ,
                 s.建立日期 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学本院科室 AS TABLE
(
[编号] [INT] NULL ,
[教学专业本院策略编号] [INT] NULL ,
[排序值] [INT] NULL ,
[教学专业科室编号] [INT] NULL ,
[本院科室编号] [INT] NULL ,
[是否必选] [BIT] NULL ,
[培训时长] [INT] NULL ,
[最低管床数量] [INT] NULL ,
[最低全程管理数量] [INT] NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学本院科室_增改
    (
      @tt tt_教学本院科室 READONLY
    )
AS
    DECLARE @output tt_教学本院科室;
    MERGE dbo.教学本院科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业本院策略编号] = s.[教学专业本院策略编号] ,
               t.[排序值] = s.[排序值] ,
               t.[教学专业科室编号] = s.[教学专业科室编号] ,
               t.[本院科室编号] = s.[本院科室编号] ,
               t.[是否必选] = s.[是否必选] ,
               t.[培训时长] = s.[培训时长] ,
               t.[最低管床数量] = s.[最低管床数量] ,
               t.[最低全程管理数量] = s.[最低全程管理数量] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业本院策略编号 ,
                 排序值 ,
                 教学专业科室编号 ,
                 本院科室编号 ,
                 是否必选 ,
                 培训时长 ,
                 最低管床数量 ,
                 最低全程管理数量 ,
                 备注
               )
        VALUES ( s.教学专业本院策略编号 ,
                 s.排序值 ,
                 s.教学专业科室编号 ,
                 s.本院科室编号 ,
                 s.是否必选 ,
                 s.培训时长 ,
                 s.最低管床数量 ,
                 s.最低全程管理数量 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学本院科室任务 AS TABLE
(
[编号] [INT] NULL ,
[教学本院科室编号] [INT] NULL ,
[项目名称] [NVARCHAR] (50) NULL ,
[任务类型编号] [INT] NULL ,
[是否门诊] [BIT] NULL ,
[是否病房] [BIT] NULL ,
[是否医技] [BIT] NULL ,
[最低评分要求] [INT] NULL ,
[数量要求] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学本院科室任务_增改
    (
      @tt tt_教学本院科室任务 READONLY
    )
AS
    DECLARE @output tt_教学本院科室任务;
    MERGE dbo.教学本院科室任务 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学本院科室编号] = s.[教学本院科室编号] ,
               t.[项目名称] = s.[项目名称] ,
               t.[任务类型编号] = s.[任务类型编号] ,
               t.[是否门诊] = s.[是否门诊] ,
               t.[是否病房] = s.[是否病房] ,
               t.[是否医技] = s.[是否医技] ,
               t.[最低评分要求] = s.[最低评分要求] ,
               t.[数量要求] = s.[数量要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学本院科室编号 ,
                 项目名称 ,
                 任务类型编号 ,
                 是否门诊 ,
                 是否病房 ,
                 是否医技 ,
                 最低评分要求 ,
                 数量要求 ,
                 备注
               )
        VALUES ( s.教学本院科室编号 ,
                 s.项目名称 ,
                 s.任务类型编号 ,
                 s.是否门诊 ,
                 s.是否病房 ,
                 s.是否医技 ,
                 s.最低评分要求 ,
                 s.数量要求 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_教学病例 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转任务编号] [INT] NULL ,
[文献类型] [NVARCHAR] (50) NULL,
[病例类型] [NVARCHAR] (50) NULL,
[病人编号] [INT] NULL,
[病例内容] [NVARCHAR] (2000) NULL,
[附件] [NVARCHAR] (200) NULL,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL,
[是否通过审核] [BIT] NULL 
);
GO

CREATE PROC sp_教学病例_增改 ( @tt tt_教学病例 READONLY )
AS
    DECLARE @output tt_教学病例;
    MERGE dbo.教学病例 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转任务编号] = s.[教学轮转任务编号] ,
               t.[文献类型] = s.[文献类型] ,
               t.[病例类型] = s.[病例类型] ,
               t.[病人编号] = s.[病人编号] ,
               t.[病例内容] = s.[病例内容] ,
               t.[附件] = s.[附件] ,
               t.[备注] = s.[备注] ,
               t.[是否通过审核] = s.[是否通过审核]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转任务编号 ,
                 文献类型 ,
                 病例类型 ,
                 病人编号 ,
                 病例内容 ,
                 附件 ,
                 建立时间 ,
                 备注 ,
                 是否通过审核
               )
        VALUES ( s.教学轮转任务编号 ,
                 s.文献类型 ,
                 s.病例类型 ,
                 s.病人编号 ,
                 s.病例内容 ,
                 s.附件 ,
                 GETDATE() ,
                 s.备注 ,
                 s.是否通过审核 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_教学病人 AS TABLE
(
[编号] [INT] NULL ,
[姓名] [NVARCHAR] (50) NULL ,
[性别] [NVARCHAR] (10) NULL,
[出生日期] [DATE] NULL,
[住院号] [NVARCHAR] (50) NULL,
[住院床号] [NVARCHAR] (50) NULL,
[主要诊断] [NVARCHAR] (500) NULL,
[次要诊断] [NVARCHAR] (500) NULL,
[入院日期] [DATE] NULL,
[出院日期] [DATE] NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学病人_增改 ( @tt tt_教学病人 READONLY )
AS
    DECLARE @output tt_教学病人;
    MERGE dbo.教学病人 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[姓名] = s.[姓名] ,
               t.[性别] = s.[性别] ,
               t.[出生日期] = s.[出生日期] ,
               t.[住院号] = s.[住院号] ,
               t.[住院床号] = s.[住院床号] ,
               t.[主要诊断] = s.[主要诊断] ,
               t.[次要诊断] = s.[次要诊断] ,
               t.[入院日期] = s.[入院日期] ,
               t.[出院日期] = s.[出院日期] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 姓名 ,
                 性别 ,
                 出生日期 ,
                 住院号 ,
                 住院床号 ,
                 主要诊断 ,
                 次要诊断 ,
                 入院日期 ,
                 出院日期 ,
                 备注
               )
        VALUES ( s.姓名 ,
                 s.性别 ,
                 s.出生日期 ,
                 s.住院号 ,
                 s.住院床号 ,
                 s.主要诊断 ,
                 s.次要诊断 ,
                 s.入院日期 ,
                 s.出院日期 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_教学补轮转 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[说明] [NVARCHAR] (500) NULL,
[开始日期] [DATE] NULL ,
[结束日期] [DATE] NULL ,
[建立人] [INT] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学补轮转_增改 ( @tt tt_教学补轮转 READONLY )
AS
    DECLARE @output tt_教学补轮转;
    MERGE dbo.教学补轮转 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[说明] = s.[说明] ,
               t.[开始日期] = s.[开始日期] ,
               t.[结束日期] = s.[结束日期] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 说明 ,
                 开始日期 ,
                 结束日期 ,
                 建立人 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.教学轮转编号 ,
                 s.说明 ,
                 s.开始日期 ,
                 s.结束日期 ,
                 s.建立人 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学出科申请 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[申请出科日期] [DATE] NULL ,
[出科小结] [NVARCHAR] (500) NULL,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL,
[是否通过审核] [BIT] NULL 
);
GO

CREATE PROC sp_教学出科申请_增改
    (
      @tt tt_教学出科申请 READONLY
    )
AS
    DECLARE @output tt_教学出科申请;
    MERGE dbo.教学出科申请 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[申请出科日期] = s.[申请出科日期] ,
               t.[出科小结] = s.[出科小结] ,
               t.[备注] = s.[备注] ,
               t.[是否通过审核] = s.[是否通过审核]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 申请出科日期 ,
                 出科小结 ,
                 建立时间 ,
                 备注 ,
                 是否通过审核
               )
        VALUES ( s.教学轮转编号 ,
                 s.申请出科日期 ,
                 s.出科小结 ,
                 GETDATE() ,
                 s.备注 ,
                 s.是否通过审核 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学出勤类型 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学出勤类型_增改
    (
      @tt tt_教学出勤类型 READONLY
    )
AS
    DECLARE @output tt_教学出勤类型;
    MERGE dbo.教学出勤类型 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[名称] = s.[名称] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 名称, 备注 )
        VALUES ( s.编号, s.名称, s.备注 )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学出勤情况 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[考勤日期] [DATE] NULL ,
[教学出勤类型编号] [INT] NULL ,
[说明] [NVARCHAR] (500) NULL,
[建立人] [INT] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学出勤情况_增改
    (
      @tt tt_教学出勤情况 READONLY
    )
AS
    DECLARE @output tt_教学出勤情况;
    MERGE dbo.教学出勤情况 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[考勤日期] = s.[考勤日期] ,
               t.[教学出勤类型编号] = s.[教学出勤类型编号] ,
               t.[说明] = s.[说明] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 考勤日期 ,
                 教学出勤类型编号 ,
                 说明 ,
                 建立人 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.教学轮转编号 ,
                 s.考勤日期 ,
                 s.教学出勤类型编号 ,
                 s.说明 ,
                 s.建立人 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
IF OBJECT_ID('sp_教学带教老师_增改') IS NOT NULL
    BEGIN
        DROP PROC sp_教学带教老师_增改;
    END;
IF EXISTS ( SELECT  1
            FROM    sys.types
            WHERE   is_table_type = 1
                    AND name = 'tt_教学带教老师' )
    BEGIN
        DROP TYPE  tt_教学带教老师;
    END;
CREATE TYPE tt_教学带教老师 AS TABLE
(
[教学科室编号] [INT] NULL ,
[带教老师编号] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学带教老师_增改
    (
      @tt tt_教学带教老师 READONLY
    )
AS
    DECLARE @output tt_教学带教老师;
    MERGE dbo.教学带教老师 t
    USING @tt s
    ON s.教学科室编号 = t.教学科室编号
        AND s.带教老师编号 = t.带教老师编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学科室编号] = s.[教学科室编号] ,
               t.[带教老师编号] = s.[带教老师编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学科室编号, 带教老师编号, 备注 )
        VALUES ( s.教学科室编号 ,
                 s.带教老师编号 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;
GO


CREATE TYPE tt_教学更换带教老师 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[原带教老师编号] [INT] NULL ,
[新带教老师编号] [INT] NULL ,
[建立人] [INT] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学更换带教老师_增改
    (
      @tt tt_教学更换带教老师 READONLY
    )
AS
    DECLARE @output tt_教学更换带教老师;
    MERGE dbo.教学更换带教老师 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[原带教老师编号] = s.[原带教老师编号] ,
               t.[新带教老师编号] = s.[新带教老师编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 原带教老师编号 ,
                 新带教老师编号 ,
                 建立人 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.教学轮转编号 ,
                 s.原带教老师编号 ,
                 s.新带教老师编号 ,
                 s.建立人 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学管床病人 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[病人编号] [INT] NULL ,
[是否全程陪护] [BIT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学管床病人_增改
    (
      @tt tt_教学管床病人 READONLY
    )
AS
    DECLARE @output tt_教学管床病人;
    MERGE dbo.教学管床病人 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[病人编号] = s.[病人编号] ,
               t.[是否全程陪护] = s.[是否全程陪护] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号, 病人编号, 是否全程陪护, 备注 )
        VALUES ( s.教学轮转编号 ,
                 s.病人编号 ,
                 s.是否全程陪护 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学活动 AS TABLE
(
[编码] [INT] NULL ,
[活动主题] [NVARCHAR] (200) NULL ,
[活动开始时间] [DATETIME] NULL ,
[活动结束时间] [DATETIME] NULL ,
[活动地点] [NVARCHAR] (200) NULL ,
[教学活动类型编号] [INT] NULL ,
[主讲人编号] [INT] NULL,
[主讲人姓名] [NVARCHAR] (50) NULL,
[主讲人职称] [NVARCHAR] (50) NULL,
[活动内容] [NVARCHAR] (2000) NULL,
[教学病例] [NVARCHAR] (200) NULL,
[病人编号] [INT] NULL,
[建立人] [INT] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学活动_增改 ( @tt tt_教学活动 READONLY )
AS
    DECLARE @output tt_教学活动;
    MERGE dbo.教学活动 t
    USING @tt s
    ON s.编码 = t.编码
    WHEN MATCHED THEN
        UPDATE SET
               t.[活动主题] = s.[活动主题] ,
               t.[活动开始时间] = s.[活动开始时间] ,
               t.[活动结束时间] = s.[活动结束时间] ,
               t.[活动地点] = s.[活动地点] ,
               t.[教学活动类型编号] = s.[教学活动类型编号] ,
               t.[主讲人编号] = s.[主讲人编号] ,
               t.[主讲人姓名] = s.[主讲人姓名] ,
               t.[主讲人职称] = s.[主讲人职称] ,
               t.[活动内容] = s.[活动内容] ,
               t.[教学病例] = s.[教学病例] ,
               t.[病人编号] = s.[病人编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 活动主题 ,
                 活动开始时间 ,
                 活动结束时间 ,
                 活动地点 ,
                 教学活动类型编号 ,
                 主讲人编号 ,
                 主讲人姓名 ,
                 主讲人职称 ,
                 活动内容 ,
                 教学病例 ,
                 病人编号 ,
                 建立人 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.活动主题 ,
                 s.活动开始时间 ,
                 s.活动结束时间 ,
                 s.活动地点 ,
                 s.教学活动类型编号 ,
                 s.主讲人编号 ,
                 s.主讲人姓名 ,
                 s.主讲人职称 ,
                 s.活动内容 ,
                 s.教学病例 ,
                 s.病人编号 ,
                 s.建立人 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学活动反馈 AS TABLE
(
[编号] [INT] NULL ,
[教学活动编号] [INT] NULL ,
[学员编号] [INT] NULL ,
[反馈内容] [NVARCHAR] (2000) NULL ,
[附件] [NVARCHAR] (200) NULL,
[是否通过反馈] [BIT] NULL,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学活动反馈_增改
    (
      @tt tt_教学活动反馈 READONLY
    )
AS
    DECLARE @output tt_教学活动反馈;
    MERGE dbo.教学活动反馈 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学活动编号] = s.[教学活动编号] ,
               t.[学员编号] = s.[学员编号] ,
               t.[反馈内容] = s.[反馈内容] ,
               t.[附件] = s.[附件] ,
               t.[是否通过反馈] = s.[是否通过反馈] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学活动编号 ,
                 学员编号 ,
                 反馈内容 ,
                 附件 ,
                 是否通过反馈 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.教学活动编号 ,
                 s.学员编号 ,
                 s.反馈内容 ,
                 s.附件 ,
                 s.是否通过反馈 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学活动可参与者 AS TABLE
(
[编号] [INT] NULL ,
[教学活动编号] [INT] NULL ,
[学员编号] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学活动可参与者_增改
    (
      @tt tt_教学活动可参与者 READONLY
    )
AS
    DECLARE @output tt_教学活动可参与者;
    MERGE dbo.教学活动可参与者 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学活动编号] = s.[教学活动编号] ,
               t.[学员编号] = s.[学员编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学活动编号, 学员编号, 备注 )
        VALUES ( s.教学活动编号, s.学员编号, s.备注 )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学活动类型 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[活动内容模板] [NVARCHAR] (2000) NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学活动类型_增改
    (
      @tt tt_教学活动类型 READONLY
    )
AS
    DECLARE @output tt_教学活动类型;
    MERGE dbo.教学活动类型 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[名称] = s.[名称] ,
               t.[活动内容模板] = s.[活动内容模板] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 名称, 活动内容模板, 备注 )
        VALUES ( s.编号 ,
                 s.名称 ,
                 s.活动内容模板 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学活动评价 AS TABLE
(
[编号] [INT] NULL ,
[评价人类型] [NVARCHAR] (50) NULL ,
[评价人编号] [INT] NULL ,
[教学活动编号] [INT] NULL ,
[教学活动评价项目编号] [INT] NULL ,
[评分] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学活动评价_增改
    (
      @tt tt_教学活动评价 READONLY
    )
AS
    DECLARE @output tt_教学活动评价;
    MERGE dbo.教学活动评价 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[评价人类型] = s.[评价人类型] ,
               t.[评价人编号] = s.[评价人编号] ,
               t.[教学活动编号] = s.[教学活动编号] ,
               t.[教学活动评价项目编号] = s.[教学活动评价项目编号] ,
               t.[评分] = s.[评分] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 评价人类型 ,
                 评价人编号 ,
                 教学活动编号 ,
                 教学活动评价项目编号 ,
                 评分 ,
                 备注
               )
        VALUES ( s.评价人类型 ,
                 s.评价人编号 ,
                 s.教学活动编号 ,
                 s.教学活动评价项目编号 ,
                 s.评分 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学活动评价项目 AS TABLE
(
[编号] [INT] NULL ,
[教学活动类型编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[标准分] [INT] NULL ,
[说明] [NVARCHAR] (500) NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学活动评价项目_增改
    (
      @tt tt_教学活动评价项目 READONLY
    )
AS
    DECLARE @output tt_教学活动评价项目;
    MERGE dbo.教学活动评价项目 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学活动类型编号] = s.[教学活动类型编号] ,
               t.[名称] = s.[名称] ,
               t.[标准分] = s.[标准分] ,
               t.[说明] = s.[说明] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学活动类型编号, 名称, 标准分, 说明, 备注 )
        VALUES ( s.教学活动类型编号 ,
                 s.名称 ,
                 s.标准分 ,
                 s.说明 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO


CREATE TYPE tt_教学角色权限 AS TABLE
(
[编号] [INT] NULL ,
[教学角色编号] [INT] NULL ,
[教学权限编号] [INT] NULL 
);
GO

CREATE PROC sp_教学角色权限_增改
    (
      @tt tt_教学角色权限 READONLY
    )
AS
    DECLARE @output tt_教学角色权限;
    MERGE dbo.教学角色权限 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学角色编号] = s.[教学角色编号] ,
               t.[教学权限编号] = s.[教学权限编号]
    WHEN NOT MATCHED THEN
        INSERT ( 教学角色编号, 教学权限编号 )
        VALUES ( s.教学角色编号, s.教学权限编号 )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学结业申请 AS TABLE
(
[编号] [INT] NULL ,
[学员编号] [INT] NULL ,
[说明] [NVARCHAR] (500) NULL,
[申请结业日期] [DATE] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL,
[是否通过审核] [BIT] NULL 
);
GO

CREATE PROC sp_教学结业申请_增改
    (
      @tt tt_教学结业申请 READONLY
    )
AS
    DECLARE @output tt_教学结业申请;
    MERGE dbo.教学结业申请 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[学员编号] = s.[学员编号] ,
               t.[说明] = s.[说明] ,
               t.[申请结业日期] = s.[申请结业日期] ,
               t.[备注] = s.[备注] ,
               t.[是否通过审核] = s.[是否通过审核]
    WHEN NOT MATCHED THEN
        INSERT ( 学员编号 ,
                 说明 ,
                 申请结业日期 ,
                 建立时间 ,
                 备注 ,
                 是否通过审核
               )
        VALUES ( s.学员编号 ,
                 s.说明 ,
                 s.申请结业日期 ,
                 GETDATE() ,
                 s.备注 ,
                 s.是否通过审核 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学考试成绩 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[考试类型] [NVARCHAR] (50) NULL ,
[成绩] [INT] NULL ,
[建立人] [INT] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学考试成绩_增改
    (
      @tt tt_教学考试成绩 READONLY
    )
AS
    DECLARE @output tt_教学考试成绩;
    MERGE dbo.教学考试成绩 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[考试类型] = s.[考试类型] ,
               t.[成绩] = s.[成绩] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 考试类型 ,
                 成绩 ,
                 建立人 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.教学轮转编号 ,
                 s.考试类型 ,
                 s.成绩 ,
                 s.建立人 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学科室 AS TABLE
(
[编号] [INT] NULL ,
[科室管理员编号] [INT] NULL,
[最大学员人数] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学科室_增改 ( @tt tt_教学科室 READONLY )
AS
    DECLARE @output tt_教学科室;
    MERGE dbo.教学科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[科室管理员编号] = s.[科室管理员编号] ,
               t.[最大学员人数] = s.[最大学员人数] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 科室管理员编号, 最大学员人数, 备注 )
        VALUES ( s.编号 ,
                 s.科室管理员编号 ,
                 s.最大学员人数 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学轮转 AS TABLE
(
[编号] [INT] NULL ,
[学员编号] [INT] NULL ,
[计划入科日期] [DATE] NULL ,
[计划出科日期] [DATE] NULL ,
[实际入科日期] [DATE] NULL,
[实际出科日期] [DATE] NULL,
[本院科室编号] [INT] NULL ,
[带教老师编号] [INT] NULL ,
[最低管床数量] [INT] NULL ,
[最低全程管理数量] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学轮转_增改 ( @tt tt_教学轮转 READONLY )
AS
    DECLARE @output tt_教学轮转;
    MERGE dbo.教学轮转 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[学员编号] = s.[学员编号] ,
               t.[计划入科日期] = s.[计划入科日期] ,
               t.[计划出科日期] = s.[计划出科日期] ,
               t.[实际入科日期] = s.[实际入科日期] ,
               t.[实际出科日期] = s.[实际出科日期] ,
               t.[本院科室编号] = s.[本院科室编号] ,
               t.[带教老师编号] = s.[带教老师编号] ,
               t.[最低管床数量] = s.[最低管床数量] ,
               t.[最低全程管理数量] = s.[最低全程管理数量] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 学员编号 ,
                 计划入科日期 ,
                 计划出科日期 ,
                 实际入科日期 ,
                 实际出科日期 ,
                 本院科室编号 ,
                 带教老师编号 ,
                 最低管床数量 ,
                 最低全程管理数量 ,
                 备注
               )
        VALUES ( s.学员编号 ,
                 s.计划入科日期 ,
                 s.计划出科日期 ,
                 s.实际入科日期 ,
                 s.实际出科日期 ,
                 s.本院科室编号 ,
                 s.带教老师编号 ,
                 s.最低管床数量 ,
                 s.最低全程管理数量 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学轮转任务 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[项目名称] [NVARCHAR] (50) NULL ,
[任务类型编号] [INT] NULL ,
[是否门诊] [BIT] NULL ,
[是否病房] [BIT] NULL ,
[是否医技] [BIT] NULL ,
[最低评分要求] [INT] NULL ,
[数量要求] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学轮转任务_增改
    (
      @tt tt_教学轮转任务 READONLY
    )
AS
    DECLARE @output tt_教学轮转任务;
    MERGE dbo.教学轮转任务 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[项目名称] = s.[项目名称] ,
               t.[任务类型编号] = s.[任务类型编号] ,
               t.[是否门诊] = s.[是否门诊] ,
               t.[是否病房] = s.[是否病房] ,
               t.[是否医技] = s.[是否医技] ,
               t.[最低评分要求] = s.[最低评分要求] ,
               t.[数量要求] = s.[数量要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 项目名称 ,
                 任务类型编号 ,
                 是否门诊 ,
                 是否病房 ,
                 是否医技 ,
                 最低评分要求 ,
                 数量要求 ,
                 备注
               )
        VALUES ( s.教学轮转编号 ,
                 s.项目名称 ,
                 s.任务类型编号 ,
                 s.是否门诊 ,
                 s.是否病房 ,
                 s.是否医技 ,
                 s.最低评分要求 ,
                 s.数量要求 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学评分等级 AS TABLE
(
[编号] [INT] NULL ,
[分类名称] [NVARCHAR] (50) NULL ,
[等级名称] [NVARCHAR] (50) NULL ,
[最小分值] [INT] NULL ,
[最大分值] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学评分等级_增改
    (
      @tt tt_教学评分等级 READONLY
    )
AS
    DECLARE @output tt_教学评分等级;
    MERGE dbo.教学评分等级 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[分类名称] = s.[分类名称] ,
               t.[等级名称] = s.[等级名称] ,
               t.[最小分值] = s.[最小分值] ,
               t.[最大分值] = s.[最大分值] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 分类名称, 等级名称, 最小分值, 最大分值, 备注 )
        VALUES ( s.分类名称 ,
                 s.等级名称 ,
                 s.最小分值 ,
                 s.最大分值 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学请假申请 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[请假开始日期] [DATE] NULL ,
[请假天数] [INT] NULL ,
[请假事由] [NVARCHAR] (500) NULL ,
[轮转延期开始日期] [DATE] NULL,
[轮转延期结束日期] [DATE] NULL,
[建立人] [INT] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL,
[是否通过审核] [BIT] NULL 
);
GO

CREATE PROC sp_教学请假申请_增改
    (
      @tt tt_教学请假申请 READONLY
    )
AS
    DECLARE @output tt_教学请假申请;
    MERGE dbo.教学请假申请 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[请假开始日期] = s.[请假开始日期] ,
               t.[请假天数] = s.[请假天数] ,
               t.[请假事由] = s.[请假事由] ,
               t.[轮转延期开始日期] = s.[轮转延期开始日期] ,
               t.[轮转延期结束日期] = s.[轮转延期结束日期] ,
               t.[备注] = s.[备注] ,
               t.[是否通过审核] = s.[是否通过审核]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 请假开始日期 ,
                 请假天数 ,
                 请假事由 ,
                 轮转延期开始日期 ,
                 轮转延期结束日期 ,
                 建立人 ,
                 建立时间 ,
                 备注 ,
                 是否通过审核
               )
        VALUES ( s.教学轮转编号 ,
                 s.请假开始日期 ,
                 s.请假天数 ,
                 s.请假事由 ,
                 s.轮转延期开始日期 ,
                 s.轮转延期结束日期 ,
                 s.建立人 ,
                 GETDATE() ,
                 s.备注 ,
                 s.是否通过审核 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学人员角色 AS TABLE
(
[编号] [INT] NULL ,
[教学角色编号] [INT] NULL ,
[人员编号] [INT] NULL 
);
GO

CREATE PROC sp_教学人员角色_增改
    (
      @tt tt_教学人员角色 READONLY
    )
AS
    DECLARE @output tt_教学人员角色;
    MERGE dbo.教学人员角色 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学角色编号] = s.[教学角色编号] ,
               t.[人员编号] = s.[人员编号]
    WHEN NOT MATCHED THEN
        INSERT ( 教学角色编号, 人员编号 )
        VALUES ( s.教学角色编号, s.人员编号 )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学宿舍楼 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[层数] [INT] NULL,
[单元数] [INT] NULL,
[每单元每层户数] [INT] NULL,
[每户床数] [INT] NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学宿舍楼_增改 ( @tt tt_教学宿舍楼 READONLY )
AS
    DECLARE @output tt_教学宿舍楼;
    MERGE dbo.教学宿舍楼 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[层数] = s.[层数] ,
               t.[单元数] = s.[单元数] ,
               t.[每单元每层户数] = s.[每单元每层户数] ,
               t.[每户床数] = s.[每户床数] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 名称 ,
                 层数 ,
                 单元数 ,
                 每单元每层户数 ,
                 每户床数 ,
                 备注
               )
        VALUES ( s.名称 ,
                 s.层数 ,
                 s.单元数 ,
                 s.每单元每层户数 ,
                 s.每户床数 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学退培申请 AS TABLE
(
[编号] [INT] NULL ,
[学员编号] [INT] NULL ,
[说明] [NVARCHAR] (500) NULL,
[申请退培日期] [DATE] NULL ,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL,
[是否通过审核] [BIT] NULL 
);
GO

CREATE PROC sp_教学退培申请_增改
    (
      @tt tt_教学退培申请 READONLY
    )
AS
    DECLARE @output tt_教学退培申请;
    MERGE dbo.教学退培申请 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[学员编号] = s.[学员编号] ,
               t.[说明] = s.[说明] ,
               t.[申请退培日期] = s.[申请退培日期] ,
               t.[备注] = s.[备注] ,
               t.[是否通过审核] = s.[是否通过审核]
    WHEN NOT MATCHED THEN
        INSERT ( 学员编号 ,
                 说明 ,
                 申请退培日期 ,
                 建立时间 ,
                 备注 ,
                 是否通过审核
               )
        VALUES ( s.学员编号 ,
                 s.说明 ,
                 s.申请退培日期 ,
                 GETDATE() ,
                 s.备注 ,
                 s.是否通过审核 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学学员 AS TABLE
(
[编号] [INT] NULL ,
[来源学校编号] [INT] NULL,
[来源学生编号] [INT] NULL,
[学员类型编号] [INT] NULL ,
[工号] [NVARCHAR] (50) NULL ,
[密码] [NVARCHAR] (50) NULL ,
[头像路径] [NVARCHAR] (100) NULL,
[姓名] [NVARCHAR] (50) NULL ,
[性别] [NVARCHAR] (50) NULL,
[民族] [NVARCHAR] (50) NULL,
[证件类型] [NVARCHAR] (50) NULL,
[证件号码] [NVARCHAR] (50) NULL,
[出生日期] [DATE] NULL,
[手机号码] [NVARCHAR] (50) NULL,
[政治面貌] [NVARCHAR] (50) NULL,
[电子邮箱] [NVARCHAR] (50) NULL,
[QQ号码] [NVARCHAR] (50) NULL,
[微信号] [NVARCHAR] (50) NULL,
[家庭住址] [NVARCHAR] (50) NULL,
[取得执业证书日期] [DATE] NULL,
[职业证书编号] [NVARCHAR] (50) NULL,
[取得医师资格证书日期] [DATE] NULL,
[医师资格证书编号] [NVARCHAR] (50) NULL,
[最高学历] [NVARCHAR] (50) NULL,
[毕业年份] [INT] NULL,
[毕业学校] [NVARCHAR] (100) NULL,
[毕业专业] [NVARCHAR] (100) NULL,
[毕业证编码] [NVARCHAR] (100) NULL,
[学位证编码] [NVARCHAR] (100) NULL,
[学员培训年界] [INT] NULL ,
[学员培训年限] [INT] NULL ,
[是否应届生] [BIT] NULL,
[专业编号] [INT] NULL ,
[送培方式] [NVARCHAR] (50) NULL,
[工作单位] [NVARCHAR] (100) NULL,
[医疗卫生机构] [NVARCHAR] (100) NULL,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学学员_增改 ( @tt tt_教学学员 READONLY )
AS
    DECLARE @output tt_教学学员;
    MERGE dbo.教学学员 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[来源学校编号] = s.[来源学校编号] ,
               t.[来源学生编号] = s.[来源学生编号] ,
               t.[学员类型编号] = s.[学员类型编号] ,
               t.[工号] = s.[工号] ,
               t.[密码] = s.[密码] ,
               t.[头像路径] = s.[头像路径] ,
               t.[姓名] = s.[姓名] ,
               t.[性别] = s.[性别] ,
               t.[民族] = s.[民族] ,
               t.[证件类型] = s.[证件类型] ,
               t.[证件号码] = s.[证件号码] ,
               t.[出生日期] = s.[出生日期] ,
               t.[手机号码] = s.[手机号码] ,
               t.[政治面貌] = s.[政治面貌] ,
               t.[电子邮箱] = s.[电子邮箱] ,
               t.[QQ号码] = s.[QQ号码] ,
               t.[微信号] = s.[微信号] ,
               t.[家庭住址] = s.[家庭住址] ,
               t.[取得执业证书日期] = s.[取得执业证书日期] ,
               t.[职业证书编号] = s.[职业证书编号] ,
               t.[取得医师资格证书日期] = s.[取得医师资格证书日期] ,
               t.[医师资格证书编号] = s.[医师资格证书编号] ,
               t.[最高学历] = s.[最高学历] ,
               t.[毕业年份] = s.[毕业年份] ,
               t.[毕业学校] = s.[毕业学校] ,
               t.[毕业专业] = s.[毕业专业] ,
               t.[毕业证编码] = s.[毕业证编码] ,
               t.[学位证编码] = s.[学位证编码] ,
               t.[学员培训年界] = s.[学员培训年界] ,
               t.[学员培训年限] = s.[学员培训年限] ,
               t.[是否应届生] = s.[是否应届生] ,
               t.[专业编号] = s.[专业编号] ,
               t.[送培方式] = s.[送培方式] ,
               t.[工作单位] = s.[工作单位] ,
               t.[医疗卫生机构] = s.[医疗卫生机构] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 来源学校编号 ,
                 来源学生编号 ,
                 学员类型编号 ,
                 工号 ,
                 密码 ,
                 头像路径 ,
                 姓名 ,
                 性别 ,
                 民族 ,
                 证件类型 ,
                 证件号码 ,
                 出生日期 ,
                 手机号码 ,
                 政治面貌 ,
                 电子邮箱 ,
                 QQ号码 ,
                 微信号 ,
                 家庭住址 ,
                 取得执业证书日期 ,
                 职业证书编号 ,
                 取得医师资格证书日期 ,
                 医师资格证书编号 ,
                 最高学历 ,
                 毕业年份 ,
                 毕业学校 ,
                 毕业专业 ,
                 毕业证编码 ,
                 学位证编码 ,
                 学员培训年界 ,
                 学员培训年限 ,
                 是否应届生 ,
                 专业编号 ,
                 送培方式 ,
                 工作单位 ,
                 医疗卫生机构 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.来源学校编号 ,
                 s.来源学生编号 ,
                 s.学员类型编号 ,
                 s.工号 ,
                 s.密码 ,
                 s.头像路径 ,
                 s.姓名 ,
                 s.性别 ,
                 s.民族 ,
                 s.证件类型 ,
                 s.证件号码 ,
                 s.出生日期 ,
                 s.手机号码 ,
                 s.政治面貌 ,
                 s.电子邮箱 ,
                 s.QQ号码 ,
                 s.微信号 ,
                 s.家庭住址 ,
                 s.取得执业证书日期 ,
                 s.职业证书编号 ,
                 s.取得医师资格证书日期 ,
                 s.医师资格证书编号 ,
                 s.最高学历 ,
                 s.毕业年份 ,
                 s.毕业学校 ,
                 s.毕业专业 ,
                 s.毕业证编码 ,
                 s.学位证编码 ,
                 s.学员培训年界 ,
                 s.学员培训年限 ,
                 s.是否应届生 ,
                 s.专业编号 ,
                 s.送培方式 ,
                 s.工作单位 ,
                 s.医疗卫生机构 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO

CREATE TYPE tt_教学学员类型 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学学员类型_增改
    (
      @tt tt_教学学员类型 READONLY
    )
AS
    DECLARE @output tt_教学学员类型;
    MERGE dbo.教学学员类型 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[名称] = s.[名称] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 名称, 备注 )
        VALUES ( s.编号, s.名称, s.备注 )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学学员培训 AS TABLE
(
[编号] [INT] NULL ,
[报到时间] [DATETIME] NULL,
[教学本院策略编号] [INT] NULL,
[计划开始培训日期] [DATE] NULL,
[计划结束培训日期] [DATE] NULL,
[实际开始培训日期] [DATE] NULL,
[实际结束培训日期] [DATE] NULL,
[退培日期] [DATE] NULL,
[结业日期] [DATE] NULL,
[证书] [NVARCHAR] (200) NULL,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学学员培训_增改
    (
      @tt tt_教学学员培训 READONLY
    )
AS
    DECLARE @output tt_教学学员培训;
    MERGE dbo.教学学员培训 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[报到时间] = s.[报到时间] ,
               t.[教学本院策略编号] = s.[教学本院策略编号] ,
               t.[计划开始培训日期] = s.[计划开始培训日期] ,
               t.[计划结束培训日期] = s.[计划结束培训日期] ,
               t.[实际开始培训日期] = s.[实际开始培训日期] ,
               t.[实际结束培训日期] = s.[实际结束培训日期] ,
               t.[退培日期] = s.[退培日期] ,
               t.[结业日期] = s.[结业日期] ,
               t.[证书] = s.[证书] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号 ,
                 报到时间 ,
                 教学本院策略编号 ,
                 计划开始培训日期 ,
                 计划结束培训日期 ,
                 实际开始培训日期 ,
                 实际结束培训日期 ,
                 退培日期 ,
                 结业日期 ,
                 证书 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.编号 ,
                 s.报到时间 ,
                 s.教学本院策略编号 ,
                 s.计划开始培训日期 ,
                 s.计划结束培训日期 ,
                 s.实际开始培训日期 ,
                 s.实际结束培训日期 ,
                 s.退培日期 ,
                 s.结业日期 ,
                 s.证书 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学学员宿舍安排 AS TABLE
(
[编号] [INT] NULL ,
[宿舍楼编号] [INT] NULL,
[门禁卡卡号] [NVARCHAR] (50) NULL,
[门牌号及床号] [NVARCHAR] (50) NULL,
[职位] [NVARCHAR] (50) NULL,
[水起数] [NUMERIC] (18,2) NULL,
[电起数] [NUMERIC] (18,2) NULL,
[气起数] [NUMERIC] (18,2) NULL,
[滞纳金比例] [NUMERIC] (18,2) NULL,
[入住日期] [DATE] NULL,
[退出日期] [DATE] NULL,
[退出原因] [NVARCHAR] (500) NULL,
[宿舍安排说明] [NVARCHAR] (500) NULL,
[建立时间] [DATETIME] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学学员宿舍安排_增改
    (
      @tt tt_教学学员宿舍安排 READONLY
    )
AS
    DECLARE @output tt_教学学员宿舍安排;
    MERGE dbo.教学学员宿舍安排 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[宿舍楼编号] = s.[宿舍楼编号] ,
               t.[门禁卡卡号] = s.[门禁卡卡号] ,
               t.[门牌号及床号] = s.[门牌号及床号] ,
               t.[职位] = s.[职位] ,
               t.[水起数] = s.[水起数] ,
               t.[电起数] = s.[电起数] ,
               t.[气起数] = s.[气起数] ,
               t.[滞纳金比例] = s.[滞纳金比例] ,
               t.[入住日期] = s.[入住日期] ,
               t.[退出日期] = s.[退出日期] ,
               t.[退出原因] = s.[退出原因] ,
               t.[宿舍安排说明] = s.[宿舍安排说明] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号 ,
                 宿舍楼编号 ,
                 门禁卡卡号 ,
                 门牌号及床号 ,
                 职位 ,
                 水起数 ,
                 电起数 ,
                 气起数 ,
                 滞纳金比例 ,
                 入住日期 ,
                 退出日期 ,
                 退出原因 ,
                 宿舍安排说明 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.编号 ,
                 s.宿舍楼编号 ,
                 s.门禁卡卡号 ,
                 s.门牌号及床号 ,
                 s.职位 ,
                 s.水起数 ,
                 s.电起数 ,
                 s.气起数 ,
                 s.滞纳金比例 ,
                 s.入住日期 ,
                 s.退出日期 ,
                 s.退出原因 ,
                 s.宿舍安排说明 ,
                 GETDATE() ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学医疗差错及事故记录 AS TABLE
(
[编号] [INT] NULL ,
[教学轮转编号] [INT] NULL ,
[处理日期] [DATE] NULL ,
[处理类别] [NVARCHAR] (50) NULL ,
[处理原因] [NVARCHAR] (500) NULL ,
[处理意见] [NVARCHAR] (500) NULL ,
[附件] [NVARCHAR] (200) NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学医疗差错及事故记录_增改
    (
      @tt tt_教学医疗差错及事故记录 READONLY
    )
AS
    DECLARE @output tt_教学医疗差错及事故记录;
    MERGE dbo.教学医疗差错及事故记录 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学轮转编号] = s.[教学轮转编号] ,
               t.[处理日期] = s.[处理日期] ,
               t.[处理类别] = s.[处理类别] ,
               t.[处理原因] = s.[处理原因] ,
               t.[处理意见] = s.[处理意见] ,
               t.[附件] = s.[附件] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学轮转编号 ,
                 处理日期 ,
                 处理类别 ,
                 处理原因 ,
                 处理意见 ,
                 附件 ,
                 备注
               )
        VALUES ( s.教学轮转编号 ,
                 s.处理日期 ,
                 s.处理类别 ,
                 s.处理原因 ,
                 s.处理意见 ,
                 s.附件 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学专业 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[年份] [INT] NULL ,
[是否国家标准] [BIT] NULL ,
[标准代码] [NVARCHAR] (50) NULL,
[最低培训时长] [INT] NULL,
[学习要求及目标] [NTEXT] NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学专业_增改 ( @tt tt_教学专业 READONLY )
AS
    DECLARE @output tt_教学专业;
    MERGE dbo.教学专业 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[年份] = s.[年份] ,
               t.[是否国家标准] = s.[是否国家标准] ,
               t.[标准代码] = s.[标准代码] ,
               t.[最低培训时长] = s.[最低培训时长] ,
               t.[学习要求及目标] = s.[学习要求及目标] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 名称 ,
                 年份 ,
                 是否国家标准 ,
                 标准代码 ,
                 最低培训时长 ,
                 学习要求及目标 ,
                 备注
               )
        VALUES ( s.名称 ,
                 s.年份 ,
                 s.是否国家标准 ,
                 s.标准代码 ,
                 s.最低培训时长 ,
                 s.学习要求及目标 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学专业科室 AS TABLE
(
[编号] [INT] NULL ,
[教学专业编号] [INT] NULL ,
[排序值] [INT] NULL ,
[科室名称] [NVARCHAR] (50) NULL ,
[最低培训时长] [INT] NULL ,
[最低管床数量] [INT] NULL ,
[最低全程管理数量] [INT] NULL ,
[科室要求] [NTEXT] NULL,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学专业科室_增改
    (
      @tt tt_教学专业科室 READONLY
    )
AS
    DECLARE @output tt_教学专业科室;
    MERGE dbo.教学专业科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业编号] = s.[教学专业编号] ,
               t.[排序值] = s.[排序值] ,
               t.[科室名称] = s.[科室名称] ,
               t.[最低培训时长] = s.[最低培训时长] ,
               t.[最低管床数量] = s.[最低管床数量] ,
               t.[最低全程管理数量] = s.[最低全程管理数量] ,
               t.[科室要求] = s.[科室要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业编号 ,
                 排序值 ,
                 科室名称 ,
                 最低培训时长 ,
                 最低管床数量 ,
                 最低全程管理数量 ,
                 科室要求 ,
                 备注
               )
        VALUES ( s.教学专业编号 ,
                 s.排序值 ,
                 s.科室名称 ,
                 s.最低培训时长 ,
                 s.最低管床数量 ,
                 s.最低全程管理数量 ,
                 s.科室要求 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学专业科室任务 AS TABLE
(
[编号] [INT] NULL ,
[教学专业科室编号] [INT] NULL ,
[项目名称] [NVARCHAR] (50) NULL ,
[任务类型编号] [INT] NULL ,
[是否门诊] [BIT] NULL ,
[是否病房] [BIT] NULL ,
[是否医技] [BIT] NULL ,
[最低评分要求] [INT] NULL ,
[数量要求] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学专业科室任务_增改
    (
      @tt tt_教学专业科室任务 READONLY
    )
AS
    DECLARE @output tt_教学专业科室任务;
    MERGE dbo.教学专业科室任务 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业科室编号] = s.[教学专业科室编号] ,
               t.[项目名称] = s.[项目名称] ,
               t.[任务类型编号] = s.[任务类型编号] ,
               t.[是否门诊] = s.[是否门诊] ,
               t.[是否病房] = s.[是否病房] ,
               t.[是否医技] = s.[是否医技] ,
               t.[最低评分要求] = s.[最低评分要求] ,
               t.[数量要求] = s.[数量要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业科室编号 ,
                 项目名称 ,
                 任务类型编号 ,
                 是否门诊 ,
                 是否病房 ,
                 是否医技 ,
                 最低评分要求 ,
                 数量要求 ,
                 备注
               )
        VALUES ( s.教学专业科室编号 ,
                 s.项目名称 ,
                 s.任务类型编号 ,
                 s.是否门诊 ,
                 s.是否病房 ,
                 s.是否医技 ,
                 s.最低评分要求 ,
                 s.数量要求 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学专业科室任务类型 AS TABLE
(
[编号] [INT] NULL ,
[名称] [NVARCHAR] (50) NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学专业科室任务类型_增改
    (
      @tt tt_教学专业科室任务类型 READONLY
    )
AS
    DECLARE @output tt_教学专业科室任务类型;
    MERGE dbo.教学专业科室任务类型 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[名称] = s.[名称] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 名称, 备注 )
        VALUES ( s.编号, s.名称, s.备注 )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
CREATE TYPE tt_教学专业科室要求 AS TABLE
(
[编号] [INT] NULL ,
[教学专业科室编号] [INT] NULL ,
[项目名称] [NVARCHAR] (500) NULL ,
[说明] [NVARCHAR] (200) NULL,
[最低评分要求] [INT] NULL ,
[备注] [NVARCHAR] (500) NULL
);
GO

CREATE PROC sp_教学专业科室要求_增改
    (
      @tt tt_教学专业科室要求 READONLY
    )
AS
    DECLARE @output tt_教学专业科室要求;
    MERGE dbo.教学专业科室要求 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业科室编号] = s.[教学专业科室编号] ,
               t.[项目名称] = s.[项目名称] ,
               t.[说明] = s.[说明] ,
               t.[最低评分要求] = s.[最低评分要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业科室编号 ,
                 项目名称 ,
                 说明 ,
                 最低评分要求 ,
                 备注
               )
        VALUES ( s.教学专业科室编号 ,
                 s.项目名称 ,
                 s.说明 ,
                 s.最低评分要求 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;
GO
-------------------------------------tfn
CREATE FUNCTION [dbo].[tfn_教学人员的权限] ( @工号 NVARCHAR(50) )
RETURNS TABLE
AS RETURN
    SELECT DISTINCT
            c.*
    FROM    人员 a1
            JOIN dbo.教学人员角色 a ON a1.编号 = a.人员编号
            JOIN dbo.教学角色权限 b ON a.教学角色编号 = b.教学角色编号
            JOIN 教学权限 c ON b.教学权限编号 = c.编号
    WHERE   a1.工号 = @工号;
