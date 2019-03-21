--[FlowTemplate]

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'ComponentName';

GO


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'TableName';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Id';

GO

/****** Object:  Table [dbo].[FlowTemplate]    Script Date: 2019/3/11 13:59:05 ******/
DROP TABLE [dbo].[FlowTemplate];
GO

/****** Object:  Table [dbo].[FlowTemplate]    Script Date: 2019/3/11 13:59:05 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[FlowTemplate]
    (
      [Id] [INT] NOT NULL ,
      [TableName] [NVARCHAR](100) NOT NULL ,
      [Name] [NVARCHAR](100) NOT NULL ,
      [ComponentName] [NVARCHAR](100) NOT NULL ,
      [Remark] [NVARCHAR](1000) NULL ,
      CONSTRAINT [PK_FLOWTEMPLATE] PRIMARY KEY CLUSTERED ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'来源表名',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'TableName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'流程名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'组件名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'ComponentName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'流程模板
   
   一个流程往往以一个表为"工作的对象";
   但是一个表可以作为多个流程的"工作的对象"
   例如:请假单
   
   该流程模板的某流程,其详情页面的组件名称
   固定一个参数是其"工作的对象"的Id
   如:请假单详情?id=1', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'FlowTemplate';
GO


--StepTemplate

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Style';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'EditComponentName';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'ViewComponentName';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Name';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'FlowTemplateId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Id';

GO

/****** Object:  Table [dbo].[StepTemplate]    Script Date: 2019/3/11 14:07:39 ******/
DROP TABLE [dbo].[StepTemplate];
GO

/****** Object:  Table [dbo].[StepTemplate]    Script Date: 2019/3/11 14:07:39 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[StepTemplate]
    (
      [Id] [INT] NOT NULL ,
      [FlowTemplateId] [INT] NOT NULL ,
      [Name] [NVARCHAR](100) NOT NULL ,
      [ViewComponentName] [NVARCHAR](100) NULL ,
      [EditComponentName] [NVARCHAR](100) NULL ,
      [Style] [NVARCHAR](100) NULL ,
	  	--[WayOfAssigningPerson] [INT] NULL,
      [Remark] [NVARCHAR](1000) NULL ,
      CONSTRAINT [PK_STEPTEMPLATE] PRIMARY KEY CLUSTERED ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'流程模板编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'FlowTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'查看组件名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'ViewComponentName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'编辑组件名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'EditComponentName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'样式',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Style';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤模板
   编号=流程模板编号的,为该流程模板的第一步骤
   比如流程模板为100,那么步骤为100的就是该流程的第一步,
   步骤模板的编号规则为:
   100  -第一步
   101 -做第二步,当然也可以是110大于100的就可以', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate';
GO

--StepTemplateState


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Name';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'State';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'StepTemplateId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Id';

GO

/****** Object:  Table [dbo].[StepTemplateState]    Script Date: 2019/3/11 14:18:12 ******/
DROP TABLE [dbo].[StepTemplateState];
GO

/****** Object:  Table [dbo].[StepTemplateState]    Script Date: 2019/3/11 14:18:12 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[StepTemplateState]
    (
      [Id] [INT] NOT NULL ,
      [StepTemplateId] [INT] NOT NULL ,
      [State] [INT] NOT NULL ,
      [Name] [NVARCHAR](100) NOT NULL ,
      [Remark] [NVARCHAR](1000) NULL ,
      CONSTRAINT [PK_STEPTEMPLATESTATE] PRIMARY KEY CLUSTERED ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤模板编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'StepTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'操作编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'State';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'状态说明',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'步骤模板中的某一步骤模板的状态
   某个具体的步骤模板,可以有多种状态;
   新生成一个步骤时,状态为0,比如提交一个请假到审核步骤,这个状态叫"待审核"
   又比如审核步骤时,可以有"通过"和"不通过操作"
   
   其中约定,1为进入下一步或者完成整个流程,-1为退回第一步,-2为终止整个流程;
   
   主键:步骤模板编号+状态编号
   编号:101(步骤模板编号) 1(状态编号) 则此状态为1011,
   如果状态编号是-1,则整个编号为-
   
   状态说明,如:
   审核步骤中:
   0:待审核
   1:审核通过
   -1:审核不通过', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepTemplateState';
GO

--StepTemplateStateChoice


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Sort';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'NextStepTemplateId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'StepTemplateStateId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Name';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Id';

GO

/****** Object:  Table [dbo].[StepTemplateStateChoice]    Script Date: 2019/3/11 14:25:48 ******/
DROP TABLE [dbo].[StepTemplateStateChoice];
GO

/****** Object:  Table [dbo].[StepTemplateStateChoice]    Script Date: 2019/3/11 14:25:48 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[StepTemplateStateChoice]
    (
      [Id] [INT] NOT NULL ,
      [Name] [NVARCHAR](100) NOT NULL ,
      [StepTemplateStateId] [INT] NOT NULL ,
      [NextStepTemplateId] [INT] NOT NULL ,
      [Sort] [INT] NOT NULL ,
      [Remark] [NVARCHAR](1000) NULL ,
      CONSTRAINT [PK_STEPTEMPLATESTATECHOICE] PRIMARY KEY CLUSTERED
        ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'选择名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤状态编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'StepTemplateStateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'下一步骤模板编号', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepTemplateStateChoice',
    @level2type = N'COLUMN', @level2name = N'NextStepTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'排序',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Sort';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'一个审核步骤的通过选择有多种可能的走向;
   state=0的没有下一步
   最后一步也应该没有下一步
   这个Sort其实就是不同的choice
   编号: 步骤模板编号+状态编号+sort
   10111这样的', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepTemplateStateChoice';
GO

--StepTemplateStateChoiceCondition


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Value';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Operator';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'PropName';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'StepTemplateStateChoiceId';

GO

/****** Object:  Table [dbo].[StepTemplateStateChoiceCondition]    Script Date: 2019/3/11 14:48:37 ******/
DROP TABLE [dbo].[StepTemplateStateChoiceCondition];
GO

/****** Object:  Table [dbo].[StepTemplateStateChoiceCondition]    Script Date: 2019/3/11 14:48:37 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[StepTemplateStateChoiceCondition]
    (
      [StepTemplateStateChoiceId] [INT] NOT NULL ,
      [PropName] [NVARCHAR](100) NOT NULL ,
      [Operator] [NVARCHAR](100) NOT NULL ,
      [Value] [NVARCHAR](100) NOT NULL ,
      [Remark] [NVARCHAR](1000) NULL
    )
ON  [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'步骤模板状态选择编号', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepTemplateStateChoiceCondition',
    @level2type = N'COLUMN', @level2name = N'StepTemplateStateChoiceId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'属性名称',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'PropName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'运算符',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Operator';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'预定义的值',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Value';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'进入哪个步骤模板状态的准入条件
   
   一个StepTemplateState 可能没有 StepTemplateStateConditions;
          则表示这个状态的转变,没有准入条件,
   
   也可能一或多条;
         则表示这个状态的转变,有这样那样的准入条件
         只有"相关数据"满足了所有这些准入条件,这个转变才是有效的;
   
   总的来看:一个审核通过的后续步骤可能是多个,但他们的操作状态其实是一样的都是0->1;
   那么在StepTemplateState里面选取哪个,就看着多个StepTemplateState各自对应的准入条件是否能被满足;
   可能剩下一个或多个满足的StepTemplateState,那么取第一个中的NextStepTemplateId,
   
   此为多入多出的关键;没有主键哈;
   ', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition';
GO

--flow

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreateDateTime';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'CreatorId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreatorType';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'State';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'SourceId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'FlowTemplateId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'Id';

GO

ALTER TABLE [dbo].[Flow] DROP CONSTRAINT [DF__Flow__CreateDate__0371755F];
GO

ALTER TABLE [dbo].[Flow] DROP CONSTRAINT [DF__Flow__State__027D5126];
GO

/****** Object:  Table [dbo].[Flow]    Script Date: 2019/3/11 16:45:37 ******/
DROP TABLE [dbo].[Flow];
GO

/****** Object:  Table [dbo].[Flow]    Script Date: 2019/3/11 16:45:37 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[Flow]
    (
      [Id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [FlowTemplateId] [INT] NOT NULL ,
      [SourceId] [INT] NOT NULL ,
      [State] [INT] NOT NULL ,
      [CreatorType] [NVARCHAR](50) NOT NULL ,
      [CreatorId] [INT] NOT NULL ,
      [CreateDateTime] [DATETIME] NOT NULL ,
      [Remark] [NVARCHAR](1000) NULL ,
      CONSTRAINT [PK_FLOW] PRIMARY KEY CLUSTERED ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF__Flow__State__027D5126]  DEFAULT ((0)) FOR [State];
GO

ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF__Flow__CreateDate__0371755F]  DEFAULT (GETDATE()) FOR [CreateDateTime];
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'自增编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'流程模板编号,可以理解为sourceType', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Flow',
    @level2type = N'COLUMN', @level2name = N'FlowTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'相关工作对象的id', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'SourceId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'状态',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'State';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'发起人类型',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreatorType';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'此流程的发起人编号', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreatorId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'建立时间',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreateDateTime';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'流程
   
   状态有: 0-未完成;1-已完成;-2 被终止;-3 已过期
   保留-1是为了和步骤类型状态匹配,-1在步骤类型状态里面为退回到某一个', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Flow';
GO

--step

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'Remark';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'CreateDatetime';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorDatetime';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorType';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'State';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'StepTemplateId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'FlowId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'Id';

GO

ALTER TABLE [dbo].[Step] DROP CONSTRAINT [DF__Step__CreateDate__6F6A7CB2];
GO

ALTER TABLE [dbo].[Step] DROP CONSTRAINT [DF__Step__State__6E765879];
GO

/****** Object:  Table [dbo].[Step]    Script Date: 2019/3/11 16:43:00 ******/
DROP TABLE [dbo].[Step];
GO

/****** Object:  Table [dbo].[Step]    Script Date: 2019/3/11 16:43:00 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[Step]
    (
      [Id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [FlowId] [INT] NOT NULL ,
      [StepTemplateId] [INT] NOT NULL ,
      [State] [INT] NOT NULL ,
      [OperatorType] [NVARCHAR](50) NULL ,
      [OperatorId] [INT] NULL ,
      [OperatorDatetime] [DATETIME] NULL ,
      [CreateDatetime] [DATETIME] NOT NULL ,
      [Remark] [NVARCHAR](1000) NULL ,
      CONSTRAINT [PK_STEP] PRIMARY KEY CLUSTERED ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[Step] ADD  CONSTRAINT [DF__Step__State__6E765879]  DEFAULT ((0)) FOR [State];
GO

ALTER TABLE [dbo].[Step] ADD  CONSTRAINT [DF__Step__CreateDate__6F6A7CB2]  DEFAULT (GETDATE()) FOR [CreateDatetime];
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'自增编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'流程编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'FlowId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤模板编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'StepTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'状态',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'State';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'操作人类型',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorType';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'执行人编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'执行时间',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorDatetime';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'建立时间',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'CreateDatetime';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'备注',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤
   状态:默认0,操作后由操作的状态值填写,具体对应stempTemplateState表里面的State值
   
   当前步骤的状态用了"步骤模板编号+状态编号+排序"来说明
   虽然可以用"步骤模板状态"id来指定,但变换其状态来比较麻烦;', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Step';
GO




--StepAssignedPerson
EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepAssignedPersonId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepAssignedPersonType';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepId';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'Id';

GO

/****** Object:  Table [dbo].[StepAssignedPerson]    Script Date: 2019/3/11 16:39:52 ******/
DROP TABLE [dbo].[StepAssignedPerson];
GO

/****** Object:  Table [dbo].[StepAssignedPerson]    Script Date: 2019/3/11 16:39:52 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[StepAssignedPerson]
    (
      [Id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [StepId] [INT] NOT NULL ,
      [StepAssignedPersonType] [NVARCHAR](50) NOT NULL ,
      [StepAssignedPersonId] [INT] NOT NULL ,
      CONSTRAINT [PK_STEPASSIGNEDEMPLOYEE] PRIMARY KEY CLUSTERED ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'自增编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'指定人类型',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepAssignedPersonType';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'指定人编号',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepAssignedPersonId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'步骤指定人
   这个已经是流程业务里面的数据了
   不是流程模板,步骤模板里面的预定义', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepAssignedPerson';
GO


--FNIsPersonCanOperateStep
/****** Object:  UserDefinedFunction [dbo].[FNIsPersonCanOperateStep]    Script Date: 2019/3/11 17:23:29 ******/
DROP FUNCTION [dbo].[FNIsPersonCanOperateStep];
GO

/****** Object:  UserDefinedFunction [dbo].[TFNFlow]    Script Date: 2019/3/11 18:05:32 ******/
DROP FUNCTION [dbo].[TFNFlow];
GO

--TTPersonTypeAndId
/****** Object:  UserDefinedTableType [dbo].[TTPersonTypeAndId]    Script Date: 2019/3/11 17:14:27 ******/
DROP TYPE [dbo].[TTPersonTypeAndId];
GO

/****** Object:  UserDefinedTableType [dbo].[TTPersonTypeAndId]    Script Date: 2019/3/11 17:14:27 ******/
CREATE TYPE [dbo].[TTPersonTypeAndId] AS TABLE(
[PersonType] [NVARCHAR](50) NULL,
[PersonId] [INT] NULL
);
GO

/****** Object:  UserDefinedFunction [dbo].[FNIsPersonCanOperateStep]    Script Date: 2019/3/11 17:23:29 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE FUNCTION [dbo].[FNIsPersonCanOperateStep]
    (
      @StepId INT ,
      @Person TTPersonTypeAndId READONLY
    )
RETURNS BIT
AS
    BEGIN
		--如果该该流程状态不为0,或者步骤状态不为0,则false
		--两个都需要判断,如果中途废标退出,很可能只能依靠flow的state<>0来判断;
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.Step a
                                JOIN dbo.Flow b ON a.FlowId = b.Id
                      WHERE     a.Id = @StepId
                                AND ( a.State <> 0
                                      OR b.State <> 0
                                    ) ) )
            RETURN 0;


		--如果对于特定的步骤,传入的"人的特征"符合该步骤指定人的"描述",则返回true
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.StepAssignedPerson a
                                JOIN @Person b ON a.StepAssignedPersonType = b.PersonType
                                                  AND ( a.StepAssignedPersonId = 0
                                                        OR a.StepAssignedPersonId = b.PersonId
                                                      )
                      WHERE     a.StepId = @StepId ) )
            RETURN 1;
        ELSE
            IF ( EXISTS ( SELECT    1
                          FROM      dbo.Step a
                                    JOIN dbo.StepTemplate a1 ON a.StepTemplateId = a1.Id
                                    JOIN dbo.StepTemplateAssignedPerson a2 ON a1.Id = a2.StepTemplateId
                                    JOIN @Person b ON a2.StepAssignedPersonType = b.PersonType
                                                      AND ( a2.StepAssignedPersonId = 0
                                                            OR a2.StepAssignedPersonId = b.PersonId
                                                          )
                          WHERE     a.Id = @StepId ) )
                RETURN 1;
			--如果该步骤模板有一个可操作人的"标签"为null-0,则该流程发起人=现在传进来的人就可以操作
            ELSE
                IF ( EXISTS ( SELECT    1
                              FROM      dbo.Step a
                                        JOIN dbo.Flow a1 ON a.FlowId = a1.Id
                                        JOIN @Person a2 ON a1.CreatorType = a2.PersonType
                                                           AND a1.CreatorId = a2.PersonId
                                        JOIN dbo.StepTemplateAssignedPerson b ON a.StepTemplateId = b.StepTemplateId
                                                              AND b.StepAssignedPersonType IS NULL
                                                              AND b.StepAssignedPersonId = 0
                              WHERE     a.Id = @StepId ) )
                    RETURN 1;
                ELSE
                    RETURN 0;

        RETURN 0;
    END;

GO

--FNGetPersonInfoByType
/****** Object:  UserDefinedFunction [dbo].[FNGetPersonInfoByType]    Script Date: 2019/3/11 17:39:16 ******/
DROP FUNCTION [dbo].[FNGetPersonInfoByType];
GO

/****** Object:  UserDefinedFunction [dbo].[FNGetPersonInfoByType]    Script Date: 2019/3/11 17:39:16 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE FUNCTION [dbo].[FNGetPersonInfoByType]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT 
    )
RETURNS NVARCHAR(500)
AS
    BEGIN

        DECLARE @result NVARCHAR(500);

        IF ( @PersonType = '人员' )
            SELECT  @result = 姓名
            FROM    dbo.人员
            WHERE   编号 = @PersonId;

        RETURN @result;

    END;

GO

--[VStep]
/****** Object:  View [dbo].[VStep]    Script Date: 2019/3/11 17:49:30 ******/
DROP VIEW [dbo].[VStep];
GO

/****** Object:  View [dbo].[VStep]    Script Date: 2019/3/11 17:49:30 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO


CREATE VIEW [dbo].[VStep]
AS
    SELECT  a.Id ,
            b.FlowTemplateId ,
            a.FlowId ,
            a.StepTemplateId ,
            b.Name AS StepTemplateName ,
            b.ViewComponentName ,
            b.EditComponentName ,
            b.Style ,
            a.State ,
            c.Name AS StateName ,
            a.OperatorType ,
            a.OperatorId ,
            dbo.FNGetPersonInfoByType(a.OperatorType, a.OperatorId) AS OpeartorInfo ,
            a.OperatorDatetime ,
            a.CreateDatetime ,
            a.Remark
    FROM    dbo.Step a
            JOIN dbo.StepTemplate b ON a.StepTemplateId = b.Id
            JOIN dbo.StepTemplateState c ON c.StepTemplateId = a.StepTemplateId
                                            AND c.State = a.State;


GO

--VFlow
/****** Object:  View [dbo].[VFlow]    Script Date: 2019/3/11 17:57:37 ******/
DROP VIEW [dbo].[VFlow];
GO

/****** Object:  View [dbo].[VFlow]    Script Date: 2019/3/11 17:57:37 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE VIEW [dbo].[VFlow]
AS
    SELECT  a.Id ,
            a.FlowTemplateId ,
            c.Name AS FlowTemplateName ,
            c.ComponentName AS FlowTemplateComponentName ,
            a.SourceId ,
            a.State ,
            CASE WHEN a.State = 0 THEN '未完成'
                 WHEN a.State = 1 THEN '已完成'
                 WHEN a.State = -2 THEN '作废'
                 WHEN a.State = -3 THEN '已过期'
            END AS StateName ,
            a.CreatorType ,
            a.CreatorId ,
            dbo.FNGetPersonInfoByType(a.CreatorType, a.CreatorId) AS CreatorInfo ,
            a.CreateDateTime ,
            a.Remark ,
            d.Id AS LastStepId ,
            d.StepTemplateId AS LastStepTemplateId ,
            d.StepTemplateName AS LastStepTemplateName ,
            d.ViewComponentName AS LastViewStepComponentName ,
            d.EditComponentName AS LastEditStepComponentName ,
            d.Style AS LastStepTemplateStyle ,
            d.State AS LastStepState ,
            d.StateName AS LastStepStateName ,
            d.OperatorType AS LastStepOperatorType ,
            d.OperatorId AS LastStepOperatorId ,
            d.OpeartorInfo AS LastStepOpeartorInfo ,
            d.OperatorDatetime AS LastStepOperatorDatetime
    FROM    dbo.Flow a
            JOIN dbo.FlowTemplate c ON a.FlowTemplateId = c.Id
            OUTER APPLY ( SELECT TOP 1
                                    *
                          FROM      dbo.VStep
                          WHERE     FlowId = a.Id
                          ORDER BY  Id DESC
                        ) d;

GO

--TFNFlow


/****** Object:  UserDefinedFunction [dbo].[TFNFlow]    Script Date: 2019/3/11 18:05:32 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE FUNCTION [dbo].[TFNFlow]
    (
      @FlowTemplateId INT ,
      @SourceId INT ,
      @Person TTPersonTypeAndId READONLY
    )
RETURNS TABLE
AS RETURN
    SELECT  * ,
            dbo.FNIsPersonCanOperateStep(LastStepId, @Person) AS IsCanOperate
    FROM    dbo.VFlow
    WHERE   FlowTemplateId = ISNULL(@FlowTemplateId, FlowTemplateId)
            AND SourceId = ISNULL(@SourceId, SourceId);
GO


--[SPFlowInit]
/****** Object:  StoredProcedure [dbo].[SPFlowInit]    Script Date: 2019/3/12 15:22:50 ******/
DROP PROCEDURE [dbo].[SPFlowInit];
GO

/****** Object:  StoredProcedure [dbo].[SPFlowInit]    Script Date: 2019/3/12 15:22:50 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE PROC [dbo].[SPFlowInit]
    (
      @FlowTemplateId INT ,
      @SourceId INT ,
      @CreatorType NVARCHAR(50) ,
      @CreatorId INT
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;
--1 新建一个流程,状态为0;其中,状态>=0,项目编号相同的流程,只能有一个;触发器来保证
    INSERT  dbo.Flow
            ( FlowTemplateId ,
              SourceId ,
              CreatorType ,
              CreatorId 
	        )
    VALUES  ( @FlowTemplateId ,
              @SourceId ,
              @CreatorType ,
              @CreatorId 
	        );

--2 新建这个流程的第一个步骤,状态为0;操作人类型,操作人,执行时间这3个目前没得填
    INSERT  dbo.Step
            ( StepTemplateId ,
              FlowId 
            )
            SELECT  b.Id ,
                    SCOPE_IDENTITY()
            FROM    dbo.FlowTemplate a
                    JOIN dbo.StepTemplate b ON a.Id = b.FlowTemplateId
                                               AND a.Id = @FlowTemplateId
                                               AND a.Id = b.Id;
        
    SELECT  SCOPE_IDENTITY();
    COMMIT TRAN;

GO


--[SPGetNextStepTemplateId]
/****** Object:  StoredProcedure [dbo].[SPGetNextStepTemplateId]    Script Date: 2019/3/12 16:19:24 ******/
DROP PROCEDURE [dbo].[SPGetNextStepTemplateId];
GO

/****** Object:  StoredProcedure [dbo].[SPGetNextStepTemplateId]    Script Date: 2019/3/12 16:19:24 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE PROC [dbo].[SPGetNextStepTemplateId]
    (
      @stepId INT ,
      @state INT ,
      @result INT OUTPUT
    )
--根据步骤id和操作state,找到下一步步骤模板id;没找到返回0;
--如果condition里面没有满足条件的,那么就视为结束;
AS --SPGetNextTemplateId 2,1
	
    IF ( @state = 0
         OR @state < -1
       )
        THROW 50001,N'按规则约定,状态0以及走向-1以下没有下一步',1;

    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.Step
                      WHERE     Id = @stepId )
       )
        THROW 50001,N'没有找到对应步骤,也不会找到下一步步骤模板',1;

    --DECLARE @result INT; 
    SET @result = NULL;
    IF ( EXISTS ( SELECT    1
                  FROM      Step a
                            JOIN dbo.StepTemplateState b ON a.StepTemplateId = b.StepTemplateId
                                                            AND a.Id = @stepId
                                                            AND b.State = @state
                            JOIN dbo.StepTemplateStateChoice c ON b.Id = c.StepTemplateStateId ) )
		--如果存在下一步;
		--state=0,state<-1的已经在最开始刷掉了
		--没有stepid也应该刷掉;
		--所以,按规则,没有下一步的,就是结束步骤了;
        BEGIN

            DECLARE @sourecTableName NVARCHAR(50);
            DECLARE @sourceId INT;
			--暂存源表数据,表名+记录Id
            SELECT  @sourecTableName = c.TableName ,
                    @sourceId = b.SourceId
            FROM    dbo.Step a
                    JOIN dbo.Flow b ON a.FlowId = b.Id
                    JOIN dbo.FlowTemplate c ON b.FlowTemplateId = c.Id
            WHERE   a.Id = @stepId;

--PRINT @sourecTableName;
--PRINT @sourceId;

--SELECT @sql=CONCAT('select * from ' ,@sourecTableName, ' where Id = ',@sourceId,'');
--PRINT @sql;

--fake
--SET @sourecTableName = N'Employee';
--SET @sourceId = 1;

            DECLARE @sql NVARCHAR(2000) = '';
			--得到每个choice构成的where条件
            WITH    cte
                      AS ( SELECT   c.NextStepTemplateId ,
                                    c.Sort ,
                                    ISNULL(STUFF(( SELECT   CONCAT(' and ',
                                                              d.PropName, ' ',
                                                              d.Operator, ' ',
                                                              d.Value)
                                                   FROM     dbo.StepTemplateStateChoiceCondition d
                                                   WHERE    d.StepTemplateStateChoiceId = c.Id
                                                 FOR
                                                   XML PATH('')
                                                 ), 1, 5, ''), '1=1') AS whereCondition
                           FROM     dbo.Step a
                                    JOIN dbo.StepTemplateState b ON a.StepTemplateId = b.StepTemplateId
                                                              AND a.Id = @stepId
                                                              AND b.State = @state
                                    JOIN dbo.StepTemplateStateChoice c ON b.Id = c.StepTemplateStateId
                         )
                SELECT  @sql = @sql + CONCAT(' UNION ALL ', 'SELECT ',
                                             NextStepTemplateId,
                                             ' as NextStepTemplateId,', Sort,
                                             ' as Sort FROM ',
                                             @sourecTableName, ' WHERE Id =',
                                             @sourceId, ' AND ',
                                             whereCondition)
                FROM    cte;

            SELECT  @sql = 'WITH cte AS(' + STUFF(@sql, 1, 11, '')
                    + ')SELECT TOP 1 @result = NextStepTemplateId FROM cte ORDER BY cte.Sort ';
			--xml for path 会处理<>为特殊符号
            SET @sql = REPLACE(@sql, '&gt;', '>');
            SET @sql = REPLACE(@sql, '&lt;', '<');

            PRINT @sql;

            EXEC sys.sp_executesql @sql, N'@result int output', @result OUTPUT;
        END;
    --SELECT  @result;



GO


--[StepTemplateAssignedPerson]

/****** Object:  Table [dbo].[StepTemplateAssignedPerson]    Script Date: 2019/3/12 17:56:09 ******/
DROP TABLE [dbo].[StepTemplateAssignedPerson];
GO

/****** Object:  Table [dbo].[StepTemplateAssignedPerson]    Script Date: 2019/3/12 17:56:09 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[StepTemplateAssignedPerson]
    (
      [Id] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [StepTemplateId] [INT] NOT NULL ,
      [StepAssignedPersonType] [NVARCHAR](50) NOT NULL ,
      [StepAssignedPersonId] [INT] NOT NULL ,
      [Remark] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_StepTemplateAssignedPerson] PRIMARY KEY CLUSTERED
        ( [Id] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


--[SPStepDone]

/****** Object:  StoredProcedure [dbo].[SPStepDone]    Script Date: 2019/3/13 17:18:31 ******/
DROP PROCEDURE [dbo].[SPStepDone];
GO

/****** Object:  StoredProcedure [dbo].[SPStepDone]    Script Date: 2019/3/13 17:18:31 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE PROC [dbo].[SPStepDone]
    (
      @StepId INT ,
      @State INT ,
      @OperatorType NVARCHAR(50) ,
      @OperatorId INT ,
      --@NextStepTemplateId INT ,  --外面计算得出;可能为null,表示没有下一步了;
      @Remark NVARCHAR(MAX)
    )
AS --当此步骤状态为0才能操作;
    IF ( EXISTS ( SELECT    1
                  FROM      dbo.Step
                  WHERE     Id = @StepId
                            AND State <> 0 ) )
        THROW 50001,N'此步骤不存在或已完成',1;

	--不能在步骤完成这个动作里,将步骤状态设为0;
    IF ( @State = 0 )
        THROW 50001,N'操作状态错误',1;

	--StepTemplateState里面要有这个步骤继续操作的state
    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.Step a
                                JOIN dbo.StepTemplateState b ON a.Id = @StepId
                                                              AND a.StepTemplateId = b.StepTemplateId
                                                              AND b.State = @State )
       )
        THROW 50001,N'该步骤不存在指定的操作',1;

    DECLARE @StepTemplateId INT;
    DECLARE @FlowId INT;
    DECLARE @NextStepId INT= 0;	--下一步骤Id,后面生成

    SELECT  @StepTemplateId = StepTemplateId ,
            @FlowId = FlowId
    FROM    dbo.Step
    WHERE   Id = @StepId;

    SET XACT_ABORT ON;
    BEGIN TRAN;
--1 更新此步骤状态
    UPDATE  dbo.Step
    SET     State = @State ,
            @OperatorType = @OperatorType ,
            OperatorId = @OperatorId ,
            OperatorDatetime = GETDATE() ,
            Remark = @Remark
    WHERE   Id = @StepId;

--如果状态为-2以及-1以下 则终止整个流程
--流程状态变为响应状态,
    IF ( @State < -1 )
        UPDATE  dbo.Flow
        SET     State = @State
        WHERE   Id = @FlowId;

--如果状态>=-1 则进行下一步
    ELSE
        BEGIN
            DECLARE @NextStepTemplateId INT;
            EXEC dbo.SPGetNextStepTemplateId @stepId = @StepId, -- int
                @state = @State, -- int
                @result = @NextStepTemplateId OUTPUT; -- int
			
            IF ( @NextStepTemplateId IS NOT NULL )
                BEGIN
                    INSERT  dbo.Step
                            ( StepTemplateId, FlowId )
                    VALUES  ( @NextStepTemplateId, @FlowId );
                    SET @NextStepId = SCOPE_IDENTITY();

					--为下一步设置指定操作人;2019-3-13看来暂时不用放到这里了,原因见这一天的笔记;
                END;
            ELSE --如果已经是最后一步
                BEGIN
                    UPDATE  dbo.Flow
                    SET     State = 1
                    WHERE   Id = @FlowId;
                END;

        END;
    COMMIT TRAN;

    SELECT  @NextStepId;
  -- = 0表示没有下一步了
GO


/****** Object:  Table [dbo].[教学人员角色]    Script Date: 2019/3/14 14:11:17 ******/
DROP TABLE [dbo].[教学人员角色];
GO

/****** Object:  Table [dbo].[教学人员角色]    Script Date: 2019/3/14 14:11:17 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学人员角色]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学角色编号] [INT] NOT NULL ,
      [人员编号] [INT] NOT NULL ,
      CONSTRAINT [PK_教学人员角色] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[教学角色]    Script Date: 2019/3/14 14:16:02 ******/
DROP TABLE [dbo].[教学角色];
GO

/****** Object:  Table [dbo].[教学角色]    Script Date: 2019/3/14 14:16:02 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学角色]
    (
      [编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学角色] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[教学角色权限]    Script Date: 2019/3/14 14:22:24 ******/
DROP TABLE [dbo].[教学角色权限];
GO

/****** Object:  Table [dbo].[教学角色权限]    Script Date: 2019/3/14 14:22:24 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学角色权限]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学角色编号] [INT] NOT NULL ,
      [教学权限编号] [INT] NOT NULL ,
      CONSTRAINT [PK_教学角色权限] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'教学权限', @level2type = N'COLUMN', @level2name = N'是否菜单';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'教学权限', @level2type = N'COLUMN', @level2name = N'全编号';

GO

ALTER TABLE [dbo].[教学权限] DROP CONSTRAINT [DF_教学权限_是否菜单];
GO

/****** Object:  Table [dbo].[教学权限]    Script Date: 2019/3/14 14:39:29 ******/
DROP TABLE [dbo].[教学权限];
GO

/****** Object:  Table [dbo].[教学权限]    Script Date: 2019/3/14 14:39:29 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学权限]
    (
      [编号] [INT] NOT NULL ,
      [上级编号] [INT] NOT NULL ,
      [全编号] [NVARCHAR](50) NOT NULL ,
      [深度] [INT] NOT NULL ,
      [排序值] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [PC端组件名] [NVARCHAR](100) NULL ,
      [移动端组件名] [NVARCHAR](100) NULL ,
      [是否菜单] [BIT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学权限] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[教学权限] ADD  CONSTRAINT [DF_教学权限_是否菜单]  DEFAULT ((1)) FOR [是否菜单];
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'暂时以2位来补全编号,并拼接位全编号', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'教学权限',
    @level2type = N'COLUMN', @level2name = N'全编号';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'不是菜单就是按钮之类的;', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'教学权限', @level2type = N'COLUMN',
    @level2name = N'是否菜单';
GO



/****** Object:  Table [dbo].[教学带教老师]    Script Date: 2019/3/14 14:56:20 ******/
DROP TABLE [dbo].[教学带教老师];
GO

/****** Object:  Table [dbo].[教学带教老师]    Script Date: 2019/3/14 14:56:20 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学带教老师]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学科室编号] [INT] NOT NULL ,
      [带教老师编号] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学带教老师] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


ALTER TABLE [dbo].[教学科室] DROP CONSTRAINT [DF_教学科室_最大学员人数];
GO

/****** Object:  Table [dbo].[教学科室]    Script Date: 2019/3/14 15:11:29 ******/
DROP TABLE [dbo].[教学科室];
GO

/****** Object:  Table [dbo].[教学科室]    Script Date: 2019/3/14 15:11:29 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学科室]
    (
      [编号] [INT] NOT NULL ,
      [科室管理员编号] [INT] NULL ,
      [最大学员人数] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学科室] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[教学科室] ADD  CONSTRAINT [DF_教学科室_最大学员人数]  DEFAULT ((5)) FOR [最大学员人数];
GO


/****** Object:  Table [dbo].[教学宿舍楼]    Script Date: 2019/3/14 15:19:38 ******/
DROP TABLE [dbo].[教学宿舍楼];
GO

/****** Object:  Table [dbo].[教学宿舍楼]    Script Date: 2019/3/14 15:19:38 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学宿舍楼]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [层数] [INT] NULL ,
      [单元数] [INT] NULL ,
      [每单元每层户数] [INT] NULL ,
      [每户床数] [INT] NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学宿舍楼] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[教学学员]    Script Date: 2019/3/14 15:59:44 ******/
DROP TABLE [dbo].[教学学员];
GO

/****** Object:  Table [dbo].[教学学员]    Script Date: 2019/3/14 15:59:44 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学学员]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [来源学校编号] [INT] NULL ,
      [来源学生编号] [INT] NULL ,
      [学员类型编号] [INT] NOT NULL ,
      [工号] [NVARCHAR](50) NOT NULL ,
      [密码] [NVARCHAR](50) NOT NULL ,
      [头像路径] [NVARCHAR](100) NULL ,
      [姓名] [NVARCHAR](50) NOT NULL ,
      [性别] [NVARCHAR](50) NULL ,
      [民族] [NVARCHAR](50) NULL ,
      [证件类型] [NVARCHAR](50) NULL ,
      [证件号码] [NVARCHAR](50) NULL ,
      [出生日期] [DATE] NULL ,
      [手机号码] [NVARCHAR](50) NULL ,
      [政治面貌] [NVARCHAR](50) NULL ,
      [电子邮箱] [NVARCHAR](50) NULL ,
      [QQ号码] [NVARCHAR](50) NULL ,
      [微信号] [NVARCHAR](50) NULL ,
      [家庭住址] [NVARCHAR](50) NULL ,
      [取得执业证书日期] [DATE] NULL ,
      [职业证书编号] [NVARCHAR](50) NULL ,
      [取得医师资格证书日期] [DATE] NULL ,
      [医师资格证书编号] [NVARCHAR](50) NULL ,
      [最高学历] [NVARCHAR](50) NULL ,
      [毕业年份] [INT] NULL ,
      [毕业学校] [NVARCHAR](100) NULL ,
      [毕业专业] [NVARCHAR](100) NULL ,
      [毕业证编码] [NVARCHAR](100) NULL ,
      [学位证编码] [NVARCHAR](100) NULL ,
      [学员培训年界] [INT] NOT NULL ,
      [学员培训年限] [INT] NOT NULL ,
      [是否应届生] [BIT] NULL ,
      [专业编号] [INT] NOT NULL ,
      [送培方式] [NVARCHAR](50) NULL ,
      [工作单位] [NVARCHAR](100) NULL ,
      [医疗卫生机构] [NVARCHAR](100) NULL ,
      [建立时间] [DATETIME] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学学员] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[教学学员宿舍安排]    Script Date: 2019/3/14 16:32:52 ******/
DROP TABLE [dbo].[教学学员宿舍安排];
GO

/****** Object:  Table [dbo].[教学学员宿舍安排]    Script Date: 2019/3/14 16:32:52 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学学员宿舍安排]
    (
      [编号] [INT] NOT NULL ,
      [宿舍楼编号] [INT] NULL ,
      [门禁卡卡号] [NVARCHAR](50) NULL ,
      [门牌号及床号] [NVARCHAR](50) NULL ,
      [职位] [NVARCHAR](50) NULL ,
      [水起数] [NUMERIC](18, 2) NULL ,
      [电起数] [NUMERIC](18, 2) NULL ,
      [气起数] [NUMERIC](18, 2) NULL ,
      [滞纳金比例] [NUMERIC](18, 2) NULL ,
      [入住日期] [DATE] NULL ,
      [退出日期] [DATE] NULL ,
      [退出原因] [NVARCHAR](500) NULL ,
      [宿舍安排说明] [NVARCHAR](500) NULL ,
      [建立时间] [DATETIME] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学学院宿舍安排] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[教学学员类型]    Script Date: 2019/3/14 16:35:08 ******/
DROP TABLE [dbo].[教学学员类型];
GO

/****** Object:  Table [dbo].[教学学员类型]    Script Date: 2019/3/14 16:35:08 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学学员类型]
    (
      [编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_学员类型] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[教学360评价方向]    Script Date: 2019/3/14 17:17:18 ******/
DROP TABLE [dbo].[教学360评价方向];
GO

/****** Object:  Table [dbo].[教学360评价方向]    Script Date: 2019/3/14 17:17:18 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学360评价方向]
    (
      [编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [来源类型] [INT] NOT NULL ,
      [目标类型] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学360评价方向] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



/****** Object:  Table [dbo].[教学360评价分类]    Script Date: 2019/3/14 17:28:38 ******/
DROP TABLE [dbo].[教学360评价分类];
GO

/****** Object:  Table [dbo].[教学360评价分类]    Script Date: 2019/3/14 17:28:38 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学360评价分类]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学360评价方向编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](200) NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学360评价分类] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[教学360评价项目]    Script Date: 2019/3/14 17:30:40 ******/
DROP TABLE [dbo].[教学360评价项目];
GO

/****** Object:  Table [dbo].[教学360评价项目]    Script Date: 2019/3/14 17:30:40 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学360评价项目]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学360评价分类编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](200) NOT NULL ,
      [标准分] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学360评价项目] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



/****** Object:  Table [dbo].[教学360评价]    Script Date: 2019/3/14 17:37:21 ******/
DROP TABLE [dbo].[教学360评价];
GO

/****** Object:  Table [dbo].[教学360评价]    Script Date: 2019/3/14 17:37:21 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学360评价]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学360评价方向编号] [INT] NOT NULL ,
      [评价人编号] [INT] NOT NULL ,
      [被评价人编号] [INT] NOT NULL ,
      [评价内容] [NVARCHAR](500) NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学360评价] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[教学360评价评分]    Script Date: 2019/3/14 17:39:11 ******/
DROP TABLE [dbo].[教学360评价评分];
GO

/****** Object:  Table [dbo].[教学360评价评分]    Script Date: 2019/3/14 17:39:11 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学360评价评分]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学360评价编号] [INT] NOT NULL ,
      [教学360评价项目编号] [INT] NOT NULL ,
      [评分] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学360评价评分] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[教学活动类型]    Script Date: 2019/3/18 17:24:35 ******/
DROP TABLE [dbo].[教学活动类型];
GO

/****** Object:  Table [dbo].[教学活动类型]    Script Date: 2019/3/18 17:24:35 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学活动类型]
    (
      [编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [活动内容模板] [NVARCHAR](2000) NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学活动类型] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



/****** Object:  Table [dbo].[教学活动评价项目]    Script Date: 2019/3/18 14:25:49 ******/
DROP TABLE [dbo].[教学活动评价项目];
GO

/****** Object:  Table [dbo].[教学活动评价项目]    Script Date: 2019/3/18 14:25:49 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学活动评价项目]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学活动类型编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [标准分] [INT] NOT NULL ,
      [说明] [NVARCHAR](500) NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学活动评价项目] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[教学活动评价]    Script Date: 2019/3/18 16:25:10 ******/
DROP TABLE [dbo].[教学活动评价];
GO

/****** Object:  Table [dbo].[教学活动评价]    Script Date: 2019/3/18 16:25:10 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学活动评价]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [评价人类型] [NVARCHAR](50) NOT NULL ,
      [评价人编号] [INT] NOT NULL ,
      [教学活动编号] [INT] NOT NULL ,
      [教学活动评价项目编号] [INT] NOT NULL ,
      [评分] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学活动评价] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

--

/****** Object:  Table [dbo].[教学活动]    Script Date: 2019/3/20 15:00:39 ******/
DROP TABLE [dbo].[教学活动]
GO

/****** Object:  Table [dbo].[教学活动]    Script Date: 2019/3/20 15:00:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学活动](
	[编码] [INT] IDENTITY(1,1) NOT NULL,
	[活动主题] [NVARCHAR](200) NOT NULL,
	[活动开始时间] [DATETIME] NOT NULL,
	[活动结束时间] [DATETIME] NOT NULL,
	[活动地点] [NVARCHAR](200) NOT NULL,
	[教学活动类型编号] [INT] NOT NULL,
	[主讲人编号] [INT] NULL,
	[主讲人姓名] [NVARCHAR](50) NULL,
	[主讲人职称] [NVARCHAR](50) NULL,
	[活动内容] [NVARCHAR](2000) NULL,
	[教学病例] [NVARCHAR](200) NULL,
	[病人编号] [INT] NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学活动] PRIMARY KEY CLUSTERED 
(
	[编码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

/****** Object:  Table [dbo].[教学活动可参与者]    Script Date: 2019/3/18 16:47:22 ******/
DROP TABLE [dbo].[教学活动可参与者];
GO

/****** Object:  Table [dbo].[教学活动可参与者]    Script Date: 2019/3/18 16:47:22 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学活动可参与者]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学活动编号] [INT] NOT NULL ,
      [接受者类型] [INT] NOT NULL ,
      [接受者编号] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学活动可参与者] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[教学评分等级]    Script Date: 2019/3/19 14:56:32 ******/
DROP TABLE [dbo].[教学评分等级];
GO

/****** Object:  Table [dbo].[教学评分等级]    Script Date: 2019/3/19 14:56:32 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学评分等级]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [分类名称] [NVARCHAR](50) NOT NULL ,
      [等级名称] [NVARCHAR](50) NOT NULL ,
      [最小分值] [INT] NOT NULL ,
      [最大分值] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学评分等级] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'教学专业', @level2type = N'COLUMN', @level2name = N'最低培训时长';

GO

/****** Object:  Table [dbo].[教学专业]    Script Date: 2019/3/19 14:57:01 ******/
DROP TABLE [dbo].[教学专业];
GO

/****** Object:  Table [dbo].[教学专业]    Script Date: 2019/3/19 14:57:01 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学专业]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [年份] [INT] NOT NULL ,
      [是否国家标准] [BIT] NOT NULL ,
      [标准代码] [NVARCHAR](50) NULL ,
      [最低培训时长] [INT] NULL ,
      [学习要求及目标] [NVARCHAR](MAX) NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学专业] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'单位是周?,前台显示可以做别的格式.', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'教学专业',
    @level2type = N'COLUMN', @level2name = N'最低培训时长';
GO



ALTER TABLE [dbo].[教学专业科室] DROP CONSTRAINT [DF_教学专业科室_全程管理数量];
GO

ALTER TABLE [dbo].[教学专业科室] DROP CONSTRAINT [DF_教学专业科室_最低管床数量];
GO

/****** Object:  Table [dbo].[教学专业科室]    Script Date: 2019/3/19 14:58:02 ******/
DROP TABLE [dbo].[教学专业科室];
GO

/****** Object:  Table [dbo].[教学专业科室]    Script Date: 2019/3/19 14:58:02 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学专业科室]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学专业编号] [INT] NOT NULL ,
      [排序值] [INT] NOT NULL ,
      [科室名称] [NVARCHAR](50) NOT NULL ,
      [最低培训时长] [INT] NOT NULL ,
      [最低管床数量] [INT] NOT NULL ,
      [最低全程管理数量] [INT] NOT NULL ,
      [科室要求] [NVARCHAR](MAX) NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学专业科室] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

ALTER TABLE [dbo].[教学专业科室] ADD  CONSTRAINT [DF_教学专业科室_最低管床数量]  DEFAULT ((0)) FOR [最低管床数量];
GO

ALTER TABLE [dbo].[教学专业科室] ADD  CONSTRAINT [DF_教学专业科室_全程管理数量]  DEFAULT ((0)) FOR [全程管理数量];
GO



ALTER TABLE [dbo].[教学专业科室任务] DROP CONSTRAINT [DF_教学专业科室任务_数量要求];
GO

ALTER TABLE [dbo].[教学专业科室任务] DROP CONSTRAINT [DF_教学专业科室任务_最低评分要求];
GO

ALTER TABLE [dbo].[教学专业科室任务] DROP CONSTRAINT [DF_教学专业科室任务_是否医技];
GO

ALTER TABLE [dbo].[教学专业科室任务] DROP CONSTRAINT [DF_Table_1_是否];
GO

ALTER TABLE [dbo].[教学专业科室任务] DROP CONSTRAINT [DF_教学专业科室任务_是否门诊];
GO

/****** Object:  Table [dbo].[教学专业科室任务]    Script Date: 2019/3/19 15:38:48 ******/
DROP TABLE [dbo].[教学专业科室任务];
GO

/****** Object:  Table [dbo].[教学专业科室任务]    Script Date: 2019/3/19 15:38:48 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学专业科室任务]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学专业科室编号] [INT] NOT NULL ,
      [项目名称] [NVARCHAR](50) NOT NULL ,
      [任务类型编号] [INT] NOT NULL ,
      [是否门诊] [BIT] NOT NULL ,
      [是否病房] [BIT] NOT NULL ,
      [是否医技] [BIT] NOT NULL ,
      [最低评分要求] [INT] NOT NULL ,
      [数量要求] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学专业科室任务] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊];
GO

ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_Table_1_是否]  DEFAULT ((0)) FOR [是否病房];
GO

ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_是否医技]  DEFAULT ((0)) FOR [是否医技];
GO

ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求];
GO

ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_数量要求]  DEFAULT ((0)) FOR [数量要求];
GO

--
/****** Object:  Table [dbo].[教学本院策略]    Script Date: 2019/3/19 15:40:26 ******/
DROP TABLE [dbo].[教学本院策略];
GO

/****** Object:  Table [dbo].[教学本院策略]    Script Date: 2019/3/19 15:40:26 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学本院策略]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [教学专业编号] [INT] NOT NULL ,
      [专业基地管理员编号] [INT] NULL ,
      [建立日期] [DATETIME] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学专业本院策略] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

--









/****** Object:  Table [dbo].[教学专业科室任务类型]    Script Date: 2019/3/19 14:58:47 ******/
DROP TABLE [dbo].[教学专业科室任务类型];
GO

/****** Object:  Table [dbo].[教学专业科室任务类型]    Script Date: 2019/3/19 14:58:47 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学专业科室任务类型]
    (
      [编号] [INT] NOT NULL ,
      [名称] [NVARCHAR](50) NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学专业科室任务类型] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[教学专业科室要求]    Script Date: 2019/3/19 14:59:02 ******/
DROP TABLE [dbo].[教学专业科室要求];
GO

/****** Object:  Table [dbo].[教学专业科室要求]    Script Date: 2019/3/19 14:59:02 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学专业科室要求]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学科室编号] [INT] NOT NULL ,
      [项目名称] [NVARCHAR](50) NOT NULL ,
      [说明] [NVARCHAR](200) NULL ,
      [最低评分要求] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学专业科室要求] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



--


ALTER TABLE [dbo].[教学本院科室] DROP CONSTRAINT [DF_教学本院科室_最低全程管理数量];
GO

ALTER TABLE [dbo].[教学本院科室] DROP CONSTRAINT [DF_Table_1_管床要求];
GO

ALTER TABLE [dbo].[教学本院科室] DROP CONSTRAINT [DF_教学本院科室_培训时长];
GO

ALTER TABLE [dbo].[教学本院科室] DROP CONSTRAINT [DF_教学本院科室_是否必选];
GO

ALTER TABLE [dbo].[教学本院科室] DROP CONSTRAINT [DF_教学本院科室_排序值];
GO

/****** Object:  Table [dbo].[教学本院科室]    Script Date: 2019/3/19 15:40:50 ******/
DROP TABLE [dbo].[教学本院科室];
GO

/****** Object:  Table [dbo].[教学本院科室]    Script Date: 2019/3/19 15:40:50 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学本院科室]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学专业本院策略编号] [INT] NOT NULL ,
      [排序值] [INT] NOT NULL ,
      [教学专业科室编号] [INT] NOT NULL ,
      [本院科室编号] [INT] NOT NULL ,
      [是否必选] [BIT] NOT NULL ,
      [培训时长] [INT] NOT NULL ,
      [最低管床数量] [INT] NOT NULL ,
      [最低全程管理数量] [INT] NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学本院科室] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_排序值]  DEFAULT ((1)) FOR [排序值];
GO

ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_是否必选]  DEFAULT ((1)) FOR [是否必选];
GO

ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_培训时长]  DEFAULT ((1)) FOR [培训时长];
GO

ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_Table_1_管床要求]  DEFAULT ((0)) FOR [最低管床数量];
GO

ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_最低全程管理数量]  DEFAULT ((0)) FOR [最低全程管理数量];
GO

---



ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_数量要求];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_最低评分要求];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_是否医技];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_是否病房];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_是否门诊];
GO

/****** Object:  Table [dbo].[教学本院科室任务]    Script Date: 2019/3/19 15:41:11 ******/
DROP TABLE [dbo].[教学本院科室任务];
GO

/****** Object:  Table [dbo].[教学本院科室任务]    Script Date: 2019/3/19 15:41:11 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学本院科室任务]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学本院科室编号] [INT] NOT NULL ,
      [项目名称] [NVARCHAR](50) NOT NULL ,
      [任务类型编号] [INT] NOT NULL ,
      [是否门诊] [BIT] NOT NULL ,
      [是否病房] [BIT] NOT NULL ,
      [是否医技] [BIT] NOT NULL ,
      [最低评分要求] [INT] NOT NULL ,
      [数量要求] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学本院科室任务] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否病房]  DEFAULT ((0)) FOR [是否病房];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否医技]  DEFAULT ((0)) FOR [是否医技];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_数量要求]  DEFAULT ((0)) FOR [数量要求];
GO



ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_数量要求];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_最低评分要求];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_是否医技];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_是否病房];
GO

ALTER TABLE [dbo].[教学本院科室任务] DROP CONSTRAINT [DF_教学本院科室任务_是否门诊];
GO

/****** Object:  Table [dbo].[教学本院科室任务]    Script Date: 2019/3/19 15:41:11 ******/
DROP TABLE [dbo].[教学本院科室任务];
GO

/****** Object:  Table [dbo].[教学本院科室任务]    Script Date: 2019/3/19 15:41:11 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[教学本院科室任务]
    (
      [编号] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [教学本院科室编号] [INT] NOT NULL ,
      [项目名称] [NVARCHAR](50) NOT NULL ,
      [任务类型编号] [INT] NOT NULL ,
      [是否门诊] [BIT] NOT NULL ,
      [是否病房] [BIT] NOT NULL ,
      [是否医技] [BIT] NOT NULL ,
      [最低评分要求] [INT] NOT NULL ,
      [数量要求] [INT] NOT NULL ,
      [备注] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_教学本院科室任务] PRIMARY KEY CLUSTERED ( [编号] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否病房]  DEFAULT ((0)) FOR [是否病房];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否医技]  DEFAULT ((0)) FOR [是否医技];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求];
GO

ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_数量要求]  DEFAULT ((0)) FOR [数量要求];
GO


--


/****** Object:  Table [dbo].[教学学员培训]    Script Date: 2019/3/19 16:57:50 ******/
DROP TABLE [dbo].[教学学员培训]
GO

/****** Object:  Table [dbo].[教学学员培训]    Script Date: 2019/3/19 16:57:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学学员培训](
	[编号] [INT] NOT NULL,
	[报到时间] [DATETIME] NULL,
	[教学本院策略编号] [INT] NULL,
	[计划开始培训日期] [DATE] NULL,
	[计划结束培训日期] [DATE] NULL,
	[实际开始培训日期] [DATE] NULL,
	[实际结束培训日期] [DATE] NULL,
	[退培日期] [DATE] NULL,
	[结业日期] [DATE] NULL,
	[证书] [NVARCHAR](200) NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学学员培训] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

ALTER TABLE [dbo].[教学结业申请] DROP CONSTRAINT [DF_教学结业申请_是否通过审核]
GO

/****** Object:  Table [dbo].[教学结业申请]    Script Date: 2019/3/20 17:02:25 ******/
DROP TABLE [dbo].[教学结业申请]
GO

/****** Object:  Table [dbo].[教学结业申请]    Script Date: 2019/3/20 17:02:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学结业申请](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[学员编号] [INT] NOT NULL,
	[说明] [NVARCHAR](500) NULL,
	[申请结业日期] [DATE] NOT NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
	[是否通过审核] [BIT] NOT NULL,
 CONSTRAINT [PK_教学结业申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[教学结业申请] ADD  CONSTRAINT [DF_教学结业申请_是否通过审核]  DEFAULT ((0)) FOR [是否通过审核]
GO


GO

---

ALTER TABLE [dbo].[教学退培申请] DROP CONSTRAINT [DF_教学退培申请_是否通过审核]
GO

/****** Object:  Table [dbo].[教学退培申请]    Script Date: 2019/3/20 16:58:49 ******/
DROP TABLE [dbo].[教学退培申请]
GO

/****** Object:  Table [dbo].[教学退培申请]    Script Date: 2019/3/20 16:58:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学退培申请](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[学员编号] [INT] NOT NULL,
	[说明] [NVARCHAR](500) NULL,
	[申请退培日期] [DATE] NOT NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
	[是否通过审核] [BIT] NOT NULL,
 CONSTRAINT [PK_教学退培申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[教学退培申请] ADD  CONSTRAINT [DF_教学退培申请_是否通过审核]  DEFAULT ((0)) FOR [是否通过审核]
GO

--

/****** Object:  Table [dbo].[教学医疗差错及事故记录]    Script Date: 2019/3/20 14:32:02 ******/
DROP TABLE [dbo].[教学医疗差错及事故记录]
GO

/****** Object:  Table [dbo].[教学医疗差错及事故记录]    Script Date: 2019/3/20 14:32:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学医疗差错及事故记录](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[处理日期] [DATE] NOT NULL,
	[处理类别] [NVARCHAR](50) NOT NULL,
	[处理原因] [NVARCHAR](500) NOT NULL,
	[处理意见] [NVARCHAR](500) NOT NULL,
	[附件] [NVARCHAR](200) NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学医疗差错及事故记录] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

/****** Object:  Table [dbo].[教学考试成绩]    Script Date: 2019/3/20 14:32:41 ******/
DROP TABLE [dbo].[教学考试成绩]
GO

/****** Object:  Table [dbo].[教学考试成绩]    Script Date: 2019/3/20 14:32:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学考试成绩](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[考试类型] [NVARCHAR](50) NOT NULL,
	[成绩] [INT] NOT NULL,
	[建立人] [INT] NOT NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学考试成绩] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--
/****** Object:  Table [dbo].[教学请假申请]    Script Date: 2019/3/20 17:00:19 ******/
DROP TABLE [dbo].[教学请假申请]
GO

/****** Object:  Table [dbo].[教学请假申请]    Script Date: 2019/3/20 17:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学请假申请](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[请假开始日期] [DATE] NOT NULL,
	[请假天数] [INT] NOT NULL,
	[请假事由] [NVARCHAR](500) NOT NULL,
	[轮转延期开始日期] [DATE] NULL,
	[轮转延期结束日期] [DATE] NULL,
	[建立人] [INT] NOT NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
	[是否通过审核] [BIT] NOT NULL,
 CONSTRAINT [PK_教学请假申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--

/****** Object:  Table [dbo].[教学出勤类型]    Script Date: 2019/3/20 14:33:46 ******/
DROP TABLE [dbo].[教学出勤类型]
GO

/****** Object:  Table [dbo].[教学出勤类型]    Script Date: 2019/3/20 14:33:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学出勤类型](
	[编号] [INT] NOT NULL,
	[名称] [NVARCHAR](50) NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学出勤类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--

/****** Object:  Table [dbo].[教学出勤情况]    Script Date: 2019/3/20 14:34:19 ******/
DROP TABLE [dbo].[教学出勤情况]
GO

/****** Object:  Table [dbo].[教学出勤情况]    Script Date: 2019/3/20 14:34:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学出勤情况](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[考勤日期] [DATE] NOT NULL,
	[教学出勤类型编号] [INT] NOT NULL,
	[说明] [NVARCHAR](500) NULL,
	[建立人] [INT] NOT NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学出勤情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

/****** Object:  Table [dbo].[Id]    Script Date: 2019/3/20 14:34:46 ******/
DROP TABLE [dbo].[Id]
GO

/****** Object:  Table [dbo].[Id]    Script Date: 2019/3/20 14:34:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Id](
	[Id] [INT] NOT NULL,
 CONSTRAINT [PK_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

/****** Object:  Table [dbo].[教学补轮转]    Script Date: 2019/3/20 14:35:15 ******/
DROP TABLE [dbo].[教学补轮转]
GO

/****** Object:  Table [dbo].[教学补轮转]    Script Date: 2019/3/20 14:35:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学补轮转](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[说明] [NVARCHAR](500) NULL,
	[开始日期] [DATE] NOT NULL,
	[结束日期] [DATE] NOT NULL,
	[建立人] [INT] NOT NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学补轮转] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--
/****** Object:  Table [dbo].[教学出科申请]    Script Date: 2019/3/20 17:01:10 ******/
DROP TABLE [dbo].[教学出科申请]
GO

/****** Object:  Table [dbo].[教学出科申请]    Script Date: 2019/3/20 17:01:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学出科申请](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[申请出科日期] [DATE] NOT NULL,
	[出科小结] [NVARCHAR](500) NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
	[是否通过审核] [BIT] NOT NULL,
 CONSTRAINT [PK_教学出科申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--

ALTER TABLE [dbo].[教学轮转] DROP CONSTRAINT [DF_教学轮转_最低全程管理数量]
GO

ALTER TABLE [dbo].[教学轮转] DROP CONSTRAINT [DF_教学轮转_最低管床数量]
GO

/****** Object:  Table [dbo].[教学轮转]    Script Date: 2019/3/20 14:36:05 ******/
DROP TABLE [dbo].[教学轮转]
GO

/****** Object:  Table [dbo].[教学轮转]    Script Date: 2019/3/20 14:36:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学轮转](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[学员编号] [INT] NOT NULL,
	[计划入科日期] [DATE] NOT NULL,
	[计划出科日期] [DATE] NOT NULL,
	[实际入科日期] [DATE] NULL,
	[实际出科日期] [DATE] NULL,
	[本院科室编号] [INT] NOT NULL,
	[带教老师编号] [INT] NOT NULL,
	[最低管床数量] [INT] NOT NULL,
	[最低全程管理数量] [INT] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学轮转] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[教学轮转] ADD  CONSTRAINT [DF_教学轮转_最低管床数量]  DEFAULT ((0)) FOR [最低管床数量]
GO

ALTER TABLE [dbo].[教学轮转] ADD  CONSTRAINT [DF_教学轮转_最低全程管理数量]  DEFAULT ((0)) FOR [最低全程管理数量]
GO

--
/****** Object:  Table [dbo].[教学病人]    Script Date: 2019/3/20 15:13:42 ******/
DROP TABLE [dbo].[教学病人]
GO

/****** Object:  Table [dbo].[教学病人]    Script Date: 2019/3/20 15:13:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学病人](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[姓名] [NVARCHAR](50) NOT NULL,
	[性别] [NVARCHAR](10) NULL,
	[出生日期] [DATE] NULL,
	[住院号] [NVARCHAR](50) NULL,
	[住院床号] [NVARCHAR](50) NULL,
	[主要诊断] [NVARCHAR](500) NULL,
	[次要诊断] [NVARCHAR](500) NULL,
	[入院日期] [DATE] NULL,
	[出院日期] [DATE] NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学病人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--


ALTER TABLE [dbo].[教学管床病人] DROP CONSTRAINT [DF_教学管床病人_是否全程陪护]
GO

/****** Object:  Table [dbo].[教学管床病人]    Script Date: 2019/3/20 15:14:10 ******/
DROP TABLE [dbo].[教学管床病人]
GO

/****** Object:  Table [dbo].[教学管床病人]    Script Date: 2019/3/20 15:14:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学管床病人](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[病人编号] [INT] NOT NULL,
	[是否全程陪护] [BIT] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_教学管床病人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[教学管床病人] ADD  CONSTRAINT [DF_教学管床病人_是否全程陪护]  DEFAULT ((0)) FOR [是否全程陪护]
GO
--


ALTER TABLE [dbo].[教学轮转任务] DROP CONSTRAINT [DF_教学轮转任务_数量要求]
GO

ALTER TABLE [dbo].[教学轮转任务] DROP CONSTRAINT [DF_教学轮转任务_最低评分要求]
GO

ALTER TABLE [dbo].[教学轮转任务] DROP CONSTRAINT [DF_教学轮转任务_是否医技]
GO

ALTER TABLE [dbo].[教学轮转任务] DROP CONSTRAINT [DF_教学轮转任务_是否病房]
GO

ALTER TABLE [dbo].[教学轮转任务] DROP CONSTRAINT [DF_教学轮转任务_是否门诊]
GO

/****** Object:  Table [dbo].[教学轮转任务]    Script Date: 2019/3/20 16:39:53 ******/
DROP TABLE [dbo].[教学轮转任务]
GO

/****** Object:  Table [dbo].[教学轮转任务]    Script Date: 2019/3/20 16:39:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学轮转任务](
	[编号] [INT] NOT NULL,
	[教学轮转编号] [INT] NOT NULL,
	[项目名称] [NVARCHAR](50) NOT NULL,
	[任务类型编号] [INT] NOT NULL,
	[是否门诊] [BIT] NOT NULL,
	[是否病房] [BIT] NOT NULL,
	[是否医技] [BIT] NOT NULL,
	[最低评分要求] [INT] NOT NULL,
	[数量要求] [INT] NOT NULL,
	[备注] [NVARCHAR](500) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊]
GO

ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_是否病房]  DEFAULT ((0)) FOR [是否病房]
GO

ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_是否医技]  DEFAULT ((0)) FOR [是否医技]
GO

ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求]
GO

ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_数量要求]  DEFAULT ((0)) FOR [数量要求]
GO
--

ALTER TABLE [dbo].[教学病例] DROP CONSTRAINT [DF_教学病例_是否通过审核]
GO

/****** Object:  Table [dbo].[教学病例]    Script Date: 2019/3/20 16:42:32 ******/
DROP TABLE [dbo].[教学病例]
GO

/****** Object:  Table [dbo].[教学病例]    Script Date: 2019/3/20 16:42:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[教学病例](
	[编号] [INT] IDENTITY(1,1) NOT NULL,
	[教学轮转任务编号] [INT] NOT NULL,
	[文献类型] [NVARCHAR](50) NULL,
	[病例类型] [NVARCHAR](50) NULL,
	[病人编号] [INT] NULL,
	[病例内容] [NVARCHAR](2000) NULL,
	[附件] [NVARCHAR](200) NULL,
	[建立时间] [DATETIME] NOT NULL,
	[备注] [NVARCHAR](500) NULL,
	[是否通过审核] [BIT] NOT NULL,
 CONSTRAINT [PK_教学病例] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[教学病例] ADD  CONSTRAINT [DF_教学病例_是否通过审核]  DEFAULT ((0)) FOR [是否通过审核]
GO

--





