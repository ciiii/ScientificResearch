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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'���',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��Դ����',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'TableName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'ComponentName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'FlowTemplate', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ģ��
   
   һ������������һ����Ϊ"�����Ķ���";
   ����һ���������Ϊ������̵�"�����Ķ���"
   ����:��ٵ�
   
   ������ģ���ĳ����,������ҳ����������
   �̶�һ����������"�����Ķ���"��Id
   ��:��ٵ�����?id=1', @level0type = N'SCHEMA', @level0name = N'dbo',
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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'���',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ģ����',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'FlowTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�鿴�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'ViewComponentName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�༭�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'EditComponentName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ʽ',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Style';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplate', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ģ��
   ���=����ģ���ŵ�,Ϊ������ģ��ĵ�һ����
   ��������ģ��Ϊ100,��ô����Ϊ100�ľ��Ǹ����̵ĵ�һ��,
   ����ģ��ı�Ź���Ϊ:
   100  -��һ��
   101 -���ڶ���,��ȻҲ������110����100�ľͿ���', @level0type = N'SCHEMA',
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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'���',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ģ����',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'StepTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'State';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'״̬˵��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateState', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'����ģ���е�ĳһ����ģ���״̬
   ĳ������Ĳ���ģ��,�����ж���״̬;
   ������һ������ʱ,״̬Ϊ0,�����ύһ����ٵ���˲���,���״̬��"�����"
   �ֱ�����˲���ʱ,������"ͨ��"��"��ͨ������"
   
   ����Լ��,1Ϊ������һ�����������������,-1Ϊ�˻ص�һ��,-2Ϊ��ֹ��������;
   
   ����:����ģ����+״̬���
   ���:101(����ģ����) 1(״̬���) ���״̬Ϊ1011,
   ���״̬�����-1,���������Ϊ-
   
   ״̬˵��,��:
   ��˲�����:
   0:�����
   1:���ͨ��
   -1:��˲�ͨ��', @level0type = N'SCHEMA', @level0name = N'dbo',
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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'���',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'ѡ������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Name';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����״̬���',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'StepTemplateStateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'��һ����ģ����', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepTemplateStateChoice',
    @level2type = N'COLUMN', @level2name = N'NextStepTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Sort';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoice', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'һ����˲����ͨ��ѡ���ж��ֿ��ܵ�����;
   state=0��û����һ��
   ���һ��ҲӦ��û����һ��
   ���Sort��ʵ���ǲ�ͬ��choice
   ���: ����ģ����+״̬���+sort
   10111������', @level0type = N'SCHEMA', @level0name = N'dbo',
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
    @value = N'����ģ��״̬ѡ����', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'StepTemplateStateChoiceCondition',
    @level2type = N'COLUMN', @level2name = N'StepTemplateStateChoiceId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'PropName';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�����',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Operator';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Ԥ�����ֵ',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Value';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepTemplateStateChoiceCondition', @level2type = N'COLUMN',
    @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'�����ĸ�����ģ��״̬��׼������
   
   һ��StepTemplateState ����û�� StepTemplateStateConditions;
          ���ʾ���״̬��ת��,û��׼������,
   
   Ҳ����һ�����;
         ���ʾ���״̬��ת��,������������׼������
         ֻ��"�������"������������Щ׼������,���ת�������Ч��;
   
   �ܵ�����:һ�����ͨ���ĺ�����������Ƕ��,�����ǵĲ���״̬��ʵ��һ���Ķ���0->1;
   ��ô��StepTemplateState����ѡȡ�ĸ�,�Ϳ��Ŷ��StepTemplateState���Զ�Ӧ��׼�������Ƿ��ܱ�����;
   ����ʣ��һ�����������StepTemplateState,��ôȡ��һ���е�NextStepTemplateId,
   
   ��Ϊ�������Ĺؼ�;û��������;
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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'����ģ����,�������ΪsourceType', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Flow',
    @level2type = N'COLUMN', @level2name = N'FlowTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'��ع��������id', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'SourceId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'״̬',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'State';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreatorType';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'�����̵ķ����˱��', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreatorId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ʱ��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN',
    @level2name = N'CreateDateTime';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Flow', @level2type = N'COLUMN', @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����
   
   ״̬��: 0-δ���;1-�����;-2 ����ֹ;-3 �ѹ���
   ����-1��Ϊ�˺Ͳ�������״̬ƥ��,-1�ڲ�������״̬����Ϊ�˻ص�ĳһ��', @level0type = N'SCHEMA',
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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'���̱��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'FlowId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ģ����',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'StepTemplateId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'״̬',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'State';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorType';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'ִ���˱��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'ִ��ʱ��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'OperatorDatetime';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ʱ��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN',
    @level2name = N'CreateDatetime';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'��ע',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'Step', @level2type = N'COLUMN', @level2name = N'Remark';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����
   ״̬:Ĭ��0,�������ɲ�����״ֵ̬��д,�����ӦstempTemplateState�������Stateֵ
   
   ��ǰ�����״̬����"����ģ����+״̬���+����"��˵��
   ��Ȼ������"����ģ��״̬"id��ָ��,���任��״̬���Ƚ��鷳;', @level0type = N'SCHEMA',
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

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'�������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'Id';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'ָ��������',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepAssignedPersonType';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'ָ���˱��',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'StepAssignedPerson', @level2type = N'COLUMN',
    @level2name = N'StepAssignedPersonId';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description', @value = N'����ָ����
   ����Ѿ�������ҵ�������������
   ��������ģ��,����ģ�������Ԥ����', @level0type = N'SCHEMA', @level0name = N'dbo',
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
		--����ø�����״̬��Ϊ0,���߲���״̬��Ϊ0,��false
		--��������Ҫ�ж�,�����;�ϱ��˳�,�ܿ���ֻ������flow��state<>0���ж�;
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.Step a
                                JOIN dbo.Flow b ON a.FlowId = b.Id
                      WHERE     a.Id = @StepId
                                AND ( a.State <> 0
                                      OR b.State <> 0
                                    ) ) )
            RETURN 0;


		--��������ض��Ĳ���,�����"�˵�����"���ϸò���ָ���˵�"����",�򷵻�true
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
			--����ò���ģ����һ���ɲ����˵�"��ǩ"Ϊnull-0,������̷�����=���ڴ��������˾Ϳ��Բ���
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

        IF ( @PersonType = '��Ա' )
            SELECT  @result = ����
            FROM    dbo.��Ա
            WHERE   ��� = @PersonId;

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
            CASE WHEN a.State = 0 THEN 'δ���'
                 WHEN a.State = 1 THEN '�����'
                 WHEN a.State = -2 THEN '����'
                 WHEN a.State = -3 THEN '�ѹ���'
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
--1 �½�һ������,״̬Ϊ0;����,״̬>=0,��Ŀ�����ͬ������,ֻ����һ��;����������֤
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

--2 �½�������̵ĵ�һ������,״̬Ϊ0;����������,������,ִ��ʱ����3��Ŀǰû����
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
--���ݲ���id�Ͳ���state,�ҵ���һ������ģ��id;û�ҵ�����0;
--���condition����û������������,��ô����Ϊ����;
AS --SPGetNextTemplateId 2,1
	
    IF ( @state = 0
         OR @state < -1
       )
        THROW 50001,N'������Լ��,״̬0�Լ�����-1����û����һ��',1;

    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.Step
                      WHERE     Id = @stepId )
       )
        THROW 50001,N'û���ҵ���Ӧ����,Ҳ�����ҵ���һ������ģ��',1;

    --DECLARE @result INT; 
    SET @result = NULL;
    IF ( EXISTS ( SELECT    1
                  FROM      Step a
                            JOIN dbo.StepTemplateState b ON a.StepTemplateId = b.StepTemplateId
                                                            AND a.Id = @stepId
                                                            AND b.State = @state
                            JOIN dbo.StepTemplateStateChoice c ON b.Id = c.StepTemplateStateId ) )
		--���������һ��;
		--state=0,state<-1���Ѿ����ʼˢ����
		--û��stepidҲӦ��ˢ��;
		--����,������,û����һ����,���ǽ���������;
        BEGIN

            DECLARE @sourecTableName NVARCHAR(50);
            DECLARE @sourceId INT;
			--�ݴ�Դ������,����+��¼Id
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
			--�õ�ÿ��choice���ɵ�where����
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
			--xml for path �ᴦ��<>Ϊ�������
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
      --@NextStepTemplateId INT ,  --�������ó�;����Ϊnull,��ʾû����һ����;
      @Remark NVARCHAR(MAX)
    )
AS --���˲���״̬Ϊ0���ܲ���;
    IF ( EXISTS ( SELECT    1
                  FROM      dbo.Step
                  WHERE     Id = @StepId
                            AND State <> 0 ) )
        THROW 50001,N'�˲��費���ڻ������',1;

	--�����ڲ���������������,������״̬��Ϊ0;
    IF ( @State = 0 )
        THROW 50001,N'����״̬����',1;

	--StepTemplateState����Ҫ������������������state
    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.Step a
                                JOIN dbo.StepTemplateState b ON a.Id = @StepId
                                                              AND a.StepTemplateId = b.StepTemplateId
                                                              AND b.State = @State )
       )
        THROW 50001,N'�ò��費����ָ���Ĳ���',1;

    DECLARE @StepTemplateId INT;
    DECLARE @FlowId INT;
    DECLARE @NextStepId INT= 0;	--��һ����Id,��������

    SELECT  @StepTemplateId = StepTemplateId ,
            @FlowId = FlowId
    FROM    dbo.Step
    WHERE   Id = @StepId;

    SET XACT_ABORT ON;
    BEGIN TRAN;
--1 ���´˲���״̬
    UPDATE  dbo.Step
    SET     State = @State ,
            @OperatorType = @OperatorType ,
            OperatorId = @OperatorId ,
            OperatorDatetime = GETDATE() ,
            Remark = @Remark
    WHERE   Id = @StepId;

--���״̬Ϊ-2�Լ�-1���� ����ֹ��������
--����״̬��Ϊ��Ӧ״̬,
    IF ( @State < -1 )
        UPDATE  dbo.Flow
        SET     State = @State
        WHERE   Id = @FlowId;

--���״̬>=-1 �������һ��
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

					--Ϊ��һ������ָ��������;2019-3-13������ʱ���÷ŵ�������,ԭ�����һ��ıʼ�;
                END;
            ELSE --����Ѿ������һ��
                BEGIN
                    UPDATE  dbo.Flow
                    SET     State = 1
                    WHERE   Id = @FlowId;
                END;

        END;
    COMMIT TRAN;

    SELECT  @NextStepId;
  -- = 0��ʾû����һ����
GO


/****** Object:  Table [dbo].[��ѧ��Ա��ɫ]    Script Date: 2019/3/14 14:11:17 ******/
DROP TABLE [dbo].[��ѧ��Ա��ɫ];
GO

/****** Object:  Table [dbo].[��ѧ��Ա��ɫ]    Script Date: 2019/3/14 14:11:17 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��Ա��ɫ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ��ɫ���] [INT] NOT NULL ,
      [��Ա���] [INT] NOT NULL ,
      CONSTRAINT [PK_��ѧ��Ա��ɫ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[��ѧ��ɫ]    Script Date: 2019/3/14 14:16:02 ******/
DROP TABLE [dbo].[��ѧ��ɫ];
GO

/****** Object:  Table [dbo].[��ѧ��ɫ]    Script Date: 2019/3/14 14:16:02 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��ɫ]
    (
      [���] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ��ɫ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[��ѧ��ɫȨ��]    Script Date: 2019/3/14 14:22:24 ******/
DROP TABLE [dbo].[��ѧ��ɫȨ��];
GO

/****** Object:  Table [dbo].[��ѧ��ɫȨ��]    Script Date: 2019/3/14 14:22:24 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��ɫȨ��]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ��ɫ���] [INT] NOT NULL ,
      [��ѧȨ�ޱ��] [INT] NOT NULL ,
      CONSTRAINT [PK_��ѧ��ɫȨ��] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'��ѧȨ��', @level2type = N'COLUMN', @level2name = N'�Ƿ�˵�';

GO

EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'��ѧȨ��', @level2type = N'COLUMN', @level2name = N'ȫ���';

GO

ALTER TABLE [dbo].[��ѧȨ��] DROP CONSTRAINT [DF_��ѧȨ��_�Ƿ�˵�];
GO

/****** Object:  Table [dbo].[��ѧȨ��]    Script Date: 2019/3/14 14:39:29 ******/
DROP TABLE [dbo].[��ѧȨ��];
GO

/****** Object:  Table [dbo].[��ѧȨ��]    Script Date: 2019/3/14 14:39:29 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧȨ��]
    (
      [���] [INT] NOT NULL ,
      [�ϼ����] [INT] NOT NULL ,
      [ȫ���] [NVARCHAR](50) NOT NULL ,
      [���] [INT] NOT NULL ,
      [����ֵ] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [PC�������] [NVARCHAR](100) NULL ,
      [�ƶ��������] [NVARCHAR](100) NULL ,
      [�Ƿ�˵�] [BIT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧȨ��] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧȨ��] ADD  CONSTRAINT [DF_��ѧȨ��_�Ƿ�˵�]  DEFAULT ((1)) FOR [�Ƿ�˵�];
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'��ʱ��2λ����ȫ���,��ƴ��λȫ���', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'��ѧȨ��',
    @level2type = N'COLUMN', @level2name = N'ȫ���';
GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'���ǲ˵����ǰ�ť֮���;', @level0type = N'SCHEMA', @level0name = N'dbo',
    @level1type = N'TABLE', @level1name = N'��ѧȨ��', @level2type = N'COLUMN',
    @level2name = N'�Ƿ�˵�';
GO



/****** Object:  Table [dbo].[��ѧ������ʦ]    Script Date: 2019/3/14 14:56:20 ******/
DROP TABLE [dbo].[��ѧ������ʦ];
GO

/****** Object:  Table [dbo].[��ѧ������ʦ]    Script Date: 2019/3/14 14:56:20 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ������ʦ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ���ұ��] [INT] NOT NULL ,
      [������ʦ���] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ������ʦ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


ALTER TABLE [dbo].[��ѧ����] DROP CONSTRAINT [DF_��ѧ����_���ѧԱ����];
GO

/****** Object:  Table [dbo].[��ѧ����]    Script Date: 2019/3/14 15:11:29 ******/
DROP TABLE [dbo].[��ѧ����];
GO

/****** Object:  Table [dbo].[��ѧ����]    Script Date: 2019/3/14 15:11:29 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ����]
    (
      [���] [INT] NOT NULL ,
      [���ҹ���Ա���] [INT] NULL ,
      [���ѧԱ����] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧ����] ADD  CONSTRAINT [DF_��ѧ����_���ѧԱ����]  DEFAULT ((5)) FOR [���ѧԱ����];
GO


/****** Object:  Table [dbo].[��ѧ����¥]    Script Date: 2019/3/14 15:19:38 ******/
DROP TABLE [dbo].[��ѧ����¥];
GO

/****** Object:  Table [dbo].[��ѧ����¥]    Script Date: 2019/3/14 15:19:38 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ����¥]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [����] [INT] NULL ,
      [��Ԫ��] [INT] NULL ,
      [ÿ��Ԫÿ�㻧��] [INT] NULL ,
      [ÿ������] [INT] NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ����¥] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[��ѧѧԱ]    Script Date: 2019/3/14 15:59:44 ******/
DROP TABLE [dbo].[��ѧѧԱ];
GO

/****** Object:  Table [dbo].[��ѧѧԱ]    Script Date: 2019/3/14 15:59:44 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧѧԱ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ԴѧУ���] [INT] NULL ,
      [��Դѧ�����] [INT] NULL ,
      [ѧԱ���ͱ��] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [ͷ��·��] [NVARCHAR](100) NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [�Ա�] [NVARCHAR](50) NULL ,
      [����] [NVARCHAR](50) NULL ,
      [֤������] [NVARCHAR](50) NULL ,
      [֤������] [NVARCHAR](50) NULL ,
      [��������] [DATE] NULL ,
      [�ֻ�����] [NVARCHAR](50) NULL ,
      [������ò] [NVARCHAR](50) NULL ,
      [��������] [NVARCHAR](50) NULL ,
      [QQ����] [NVARCHAR](50) NULL ,
      [΢�ź�] [NVARCHAR](50) NULL ,
      [��ͥסַ] [NVARCHAR](50) NULL ,
      [ȡ��ִҵ֤������] [DATE] NULL ,
      [ְҵ֤����] [NVARCHAR](50) NULL ,
      [ȡ��ҽʦ�ʸ�֤������] [DATE] NULL ,
      [ҽʦ�ʸ�֤����] [NVARCHAR](50) NULL ,
      [���ѧ��] [NVARCHAR](50) NULL ,
      [��ҵ���] [INT] NULL ,
      [��ҵѧУ] [NVARCHAR](100) NULL ,
      [��ҵרҵ] [NVARCHAR](100) NULL ,
      [��ҵ֤����] [NVARCHAR](100) NULL ,
      [ѧλ֤����] [NVARCHAR](100) NULL ,
      [ѧԱ��ѵ���] [INT] NOT NULL ,
      [ѧԱ��ѵ����] [INT] NOT NULL ,
      [�Ƿ�Ӧ����] [BIT] NULL ,
      [רҵ���] [INT] NOT NULL ,
      [���෽ʽ] [NVARCHAR](50) NULL ,
      [������λ] [NVARCHAR](100) NULL ,
      [ҽ����������] [NVARCHAR](100) NULL ,
      [����ʱ��] [DATETIME] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧѧԱ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[��ѧѧԱ���ᰲ��]    Script Date: 2019/3/14 16:32:52 ******/
DROP TABLE [dbo].[��ѧѧԱ���ᰲ��];
GO

/****** Object:  Table [dbo].[��ѧѧԱ���ᰲ��]    Script Date: 2019/3/14 16:32:52 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧѧԱ���ᰲ��]
    (
      [���] [INT] NOT NULL ,
      [����¥���] [INT] NULL ,
      [�Ž�������] [NVARCHAR](50) NULL ,
      [���ƺż�����] [NVARCHAR](50) NULL ,
      [ְλ] [NVARCHAR](50) NULL ,
      [ˮ����] [NUMERIC](18, 2) NULL ,
      [������] [NUMERIC](18, 2) NULL ,
      [������] [NUMERIC](18, 2) NULL ,
      [���ɽ����] [NUMERIC](18, 2) NULL ,
      [��ס����] [DATE] NULL ,
      [�˳�����] [DATE] NULL ,
      [�˳�ԭ��] [NVARCHAR](500) NULL ,
      [���ᰲ��˵��] [NVARCHAR](500) NULL ,
      [����ʱ��] [DATETIME] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧѧԺ���ᰲ��] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[��ѧѧԱ����]    Script Date: 2019/3/14 16:35:08 ******/
DROP TABLE [dbo].[��ѧѧԱ����];
GO

/****** Object:  Table [dbo].[��ѧѧԱ����]    Script Date: 2019/3/14 16:35:08 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧѧԱ����]
    (
      [���] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_ѧԱ����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[��ѧ360���۷���]    Script Date: 2019/3/14 17:17:18 ******/
DROP TABLE [dbo].[��ѧ360���۷���];
GO

/****** Object:  Table [dbo].[��ѧ360���۷���]    Script Date: 2019/3/14 17:17:18 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ360���۷���]
    (
      [���] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��Դ����] [INT] NOT NULL ,
      [Ŀ������] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ360���۷���] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



/****** Object:  Table [dbo].[��ѧ360���۷���]    Script Date: 2019/3/14 17:28:38 ******/
DROP TABLE [dbo].[��ѧ360���۷���];
GO

/****** Object:  Table [dbo].[��ѧ360���۷���]    Script Date: 2019/3/14 17:28:38 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ360���۷���]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ360���۷�����] [INT] NOT NULL ,
      [����] [NVARCHAR](200) NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ360���۷���] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[��ѧ360������Ŀ]    Script Date: 2019/3/14 17:30:40 ******/
DROP TABLE [dbo].[��ѧ360������Ŀ];
GO

/****** Object:  Table [dbo].[��ѧ360������Ŀ]    Script Date: 2019/3/14 17:30:40 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ360������Ŀ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ360���۷�����] [INT] NOT NULL ,
      [����] [NVARCHAR](200) NOT NULL ,
      [��׼��] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ360������Ŀ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



/****** Object:  Table [dbo].[��ѧ360����]    Script Date: 2019/3/14 17:37:21 ******/
DROP TABLE [dbo].[��ѧ360����];
GO

/****** Object:  Table [dbo].[��ѧ360����]    Script Date: 2019/3/14 17:37:21 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ360����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ360���۷�����] [INT] NOT NULL ,
      [�����˱��] [INT] NOT NULL ,
      [�������˱��] [INT] NOT NULL ,
      [��������] [NVARCHAR](500) NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ360����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[��ѧ360��������]    Script Date: 2019/3/14 17:39:11 ******/
DROP TABLE [dbo].[��ѧ360��������];
GO

/****** Object:  Table [dbo].[��ѧ360��������]    Script Date: 2019/3/14 17:39:11 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ360��������]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ360���۱��] [INT] NOT NULL ,
      [��ѧ360������Ŀ���] [INT] NOT NULL ,
      [����] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ360��������] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[��ѧ�����]    Script Date: 2019/3/18 17:24:35 ******/
DROP TABLE [dbo].[��ѧ�����];
GO

/****** Object:  Table [dbo].[��ѧ�����]    Script Date: 2019/3/18 17:24:35 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ�����]
    (
      [���] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [�����ģ��] [NVARCHAR](2000) NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ�����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



/****** Object:  Table [dbo].[��ѧ�������Ŀ]    Script Date: 2019/3/18 14:25:49 ******/
DROP TABLE [dbo].[��ѧ�������Ŀ];
GO

/****** Object:  Table [dbo].[��ѧ�������Ŀ]    Script Date: 2019/3/18 14:25:49 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ�������Ŀ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ����ͱ��] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��׼��] [INT] NOT NULL ,
      [˵��] [NVARCHAR](500) NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ�������Ŀ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


/****** Object:  Table [dbo].[��ѧ�����]    Script Date: 2019/3/18 16:25:10 ******/
DROP TABLE [dbo].[��ѧ�����];
GO

/****** Object:  Table [dbo].[��ѧ�����]    Script Date: 2019/3/18 16:25:10 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ�����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [����������] [NVARCHAR](50) NOT NULL ,
      [�����˱��] [INT] NOT NULL ,
      [��ѧ����] [INT] NOT NULL ,
      [��ѧ�������Ŀ���] [INT] NOT NULL ,
      [����] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ�����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

--

/****** Object:  Table [dbo].[��ѧ�]    Script Date: 2019/3/20 15:00:39 ******/
DROP TABLE [dbo].[��ѧ�]
GO

/****** Object:  Table [dbo].[��ѧ�]    Script Date: 2019/3/20 15:00:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ�](
	[����] [INT] IDENTITY(1,1) NOT NULL,
	[�����] [NVARCHAR](200) NOT NULL,
	[���ʼʱ��] [DATETIME] NOT NULL,
	[�����ʱ��] [DATETIME] NOT NULL,
	[��ص�] [NVARCHAR](200) NOT NULL,
	[��ѧ����ͱ��] [INT] NOT NULL,
	[�����˱��] [INT] NULL,
	[����������] [NVARCHAR](50) NULL,
	[������ְ��] [NVARCHAR](50) NULL,
	[�����] [NVARCHAR](2000) NULL,
	[��ѧ����] [NVARCHAR](200) NULL,
	[���˱��] [INT] NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ�] PRIMARY KEY CLUSTERED 
(
	[����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

/****** Object:  Table [dbo].[��ѧ��ɲ�����]    Script Date: 2019/3/18 16:47:22 ******/
DROP TABLE [dbo].[��ѧ��ɲ�����];
GO

/****** Object:  Table [dbo].[��ѧ��ɲ�����]    Script Date: 2019/3/18 16:47:22 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��ɲ�����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ����] [INT] NOT NULL ,
      [����������] [INT] NOT NULL ,
      [�����߱��] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ��ɲ�����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[��ѧ���ֵȼ�]    Script Date: 2019/3/19 14:56:32 ******/
DROP TABLE [dbo].[��ѧ���ֵȼ�];
GO

/****** Object:  Table [dbo].[��ѧ���ֵȼ�]    Script Date: 2019/3/19 14:56:32 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ���ֵȼ�]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��������] [NVARCHAR](50) NOT NULL ,
      [�ȼ�����] [NVARCHAR](50) NOT NULL ,
      [��С��ֵ] [INT] NOT NULL ,
      [����ֵ] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ���ֵȼ�] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO


EXEC sys.sp_dropextendedproperty @name = N'MS_Description',
    @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE',
    @level1name = N'��ѧרҵ', @level2type = N'COLUMN', @level2name = N'�����ѵʱ��';

GO

/****** Object:  Table [dbo].[��ѧרҵ]    Script Date: 2019/3/19 14:57:01 ******/
DROP TABLE [dbo].[��ѧרҵ];
GO

/****** Object:  Table [dbo].[��ѧרҵ]    Script Date: 2019/3/19 14:57:01 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧרҵ]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [���] [INT] NOT NULL ,
      [�Ƿ���ұ�׼] [BIT] NOT NULL ,
      [��׼����] [NVARCHAR](50) NULL ,
      [�����ѵʱ��] [INT] NULL ,
      [ѧϰҪ��Ŀ��] [NVARCHAR](MAX) NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧרҵ] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

EXEC sys.sp_addextendedproperty @name = N'MS_Description',
    @value = N'��λ����?,ǰ̨��ʾ��������ĸ�ʽ.', @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'��ѧרҵ',
    @level2type = N'COLUMN', @level2name = N'�����ѵʱ��';
GO



ALTER TABLE [dbo].[��ѧרҵ����] DROP CONSTRAINT [DF_��ѧרҵ����_ȫ�̹�������];
GO

ALTER TABLE [dbo].[��ѧרҵ����] DROP CONSTRAINT [DF_��ѧרҵ����_��͹ܴ�����];
GO

/****** Object:  Table [dbo].[��ѧרҵ����]    Script Date: 2019/3/19 14:58:02 ******/
DROP TABLE [dbo].[��ѧרҵ����];
GO

/****** Object:  Table [dbo].[��ѧרҵ����]    Script Date: 2019/3/19 14:58:02 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧרҵ����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧרҵ���] [INT] NOT NULL ,
      [����ֵ] [INT] NOT NULL ,
      [��������] [NVARCHAR](50) NOT NULL ,
      [�����ѵʱ��] [INT] NOT NULL ,
      [��͹ܴ�����] [INT] NOT NULL ,
      [���ȫ�̹�������] [INT] NOT NULL ,
      [����Ҫ��] [NVARCHAR](MAX) NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧרҵ����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY] TEXTIMAGE_ON [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧרҵ����] ADD  CONSTRAINT [DF_��ѧרҵ����_��͹ܴ�����]  DEFAULT ((0)) FOR [��͹ܴ�����];
GO

ALTER TABLE [dbo].[��ѧרҵ����] ADD  CONSTRAINT [DF_��ѧרҵ����_ȫ�̹�������]  DEFAULT ((0)) FOR [ȫ�̹�������];
GO



ALTER TABLE [dbo].[��ѧרҵ��������] DROP CONSTRAINT [DF_��ѧרҵ��������_����Ҫ��];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] DROP CONSTRAINT [DF_��ѧרҵ��������_�������Ҫ��];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] DROP CONSTRAINT [DF_��ѧרҵ��������_�Ƿ�ҽ��];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] DROP CONSTRAINT [DF_Table_1_�Ƿ�];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] DROP CONSTRAINT [DF_��ѧרҵ��������_�Ƿ�����];
GO

/****** Object:  Table [dbo].[��ѧרҵ��������]    Script Date: 2019/3/19 15:38:48 ******/
DROP TABLE [dbo].[��ѧרҵ��������];
GO

/****** Object:  Table [dbo].[��ѧרҵ��������]    Script Date: 2019/3/19 15:38:48 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧרҵ��������]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧרҵ���ұ��] [INT] NOT NULL ,
      [��Ŀ����] [NVARCHAR](50) NOT NULL ,
      [�������ͱ��] [INT] NOT NULL ,
      [�Ƿ�����] [BIT] NOT NULL ,
      [�Ƿ񲡷�] [BIT] NOT NULL ,
      [�Ƿ�ҽ��] [BIT] NOT NULL ,
      [�������Ҫ��] [INT] NOT NULL ,
      [����Ҫ��] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧרҵ��������] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧרҵ��������] ADD  CONSTRAINT [DF_��ѧרҵ��������_�Ƿ�����]  DEFAULT ((0)) FOR [�Ƿ�����];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] ADD  CONSTRAINT [DF_Table_1_�Ƿ�]  DEFAULT ((0)) FOR [�Ƿ񲡷�];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] ADD  CONSTRAINT [DF_��ѧרҵ��������_�Ƿ�ҽ��]  DEFAULT ((0)) FOR [�Ƿ�ҽ��];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] ADD  CONSTRAINT [DF_��ѧרҵ��������_�������Ҫ��]  DEFAULT ((0)) FOR [�������Ҫ��];
GO

ALTER TABLE [dbo].[��ѧרҵ��������] ADD  CONSTRAINT [DF_��ѧרҵ��������_����Ҫ��]  DEFAULT ((0)) FOR [����Ҫ��];
GO

--
/****** Object:  Table [dbo].[��ѧ��Ժ����]    Script Date: 2019/3/19 15:40:26 ******/
DROP TABLE [dbo].[��ѧ��Ժ����];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ����]    Script Date: 2019/3/19 15:40:26 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��Ժ����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��ѧרҵ���] [INT] NOT NULL ,
      [רҵ���ع���Ա���] [INT] NULL ,
      [��������] [DATETIME] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧרҵ��Ժ����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

--









/****** Object:  Table [dbo].[��ѧרҵ������������]    Script Date: 2019/3/19 14:58:47 ******/
DROP TABLE [dbo].[��ѧרҵ������������];
GO

/****** Object:  Table [dbo].[��ѧרҵ������������]    Script Date: 2019/3/19 14:58:47 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧרҵ������������]
    (
      [���] [INT] NOT NULL ,
      [����] [NVARCHAR](50) NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧרҵ������������] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

/****** Object:  Table [dbo].[��ѧרҵ����Ҫ��]    Script Date: 2019/3/19 14:59:02 ******/
DROP TABLE [dbo].[��ѧרҵ����Ҫ��];
GO

/****** Object:  Table [dbo].[��ѧרҵ����Ҫ��]    Script Date: 2019/3/19 14:59:02 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧרҵ����Ҫ��]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ���ұ��] [INT] NOT NULL ,
      [��Ŀ����] [NVARCHAR](50) NOT NULL ,
      [˵��] [NVARCHAR](200) NULL ,
      [�������Ҫ��] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧרҵ����Ҫ��] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO



--


ALTER TABLE [dbo].[��ѧ��Ժ����] DROP CONSTRAINT [DF_��ѧ��Ժ����_���ȫ�̹�������];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] DROP CONSTRAINT [DF_Table_1_�ܴ�Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] DROP CONSTRAINT [DF_��ѧ��Ժ����_��ѵʱ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] DROP CONSTRAINT [DF_��ѧ��Ժ����_�Ƿ��ѡ];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] DROP CONSTRAINT [DF_��ѧ��Ժ����_����ֵ];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ����]    Script Date: 2019/3/19 15:40:50 ******/
DROP TABLE [dbo].[��ѧ��Ժ����];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ����]    Script Date: 2019/3/19 15:40:50 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��Ժ����]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧרҵ��Ժ���Ա��] [INT] NOT NULL ,
      [����ֵ] [INT] NOT NULL ,
      [��ѧרҵ���ұ��] [INT] NOT NULL ,
      [��Ժ���ұ��] [INT] NOT NULL ,
      [�Ƿ��ѡ] [BIT] NOT NULL ,
      [��ѵʱ��] [INT] NOT NULL ,
      [��͹ܴ�����] [INT] NOT NULL ,
      [���ȫ�̹�������] [INT] NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ��Ժ����] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧ��Ժ����] ADD  CONSTRAINT [DF_��ѧ��Ժ����_����ֵ]  DEFAULT ((1)) FOR [����ֵ];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] ADD  CONSTRAINT [DF_��ѧ��Ժ����_�Ƿ��ѡ]  DEFAULT ((1)) FOR [�Ƿ��ѡ];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] ADD  CONSTRAINT [DF_��ѧ��Ժ����_��ѵʱ��]  DEFAULT ((1)) FOR [��ѵʱ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] ADD  CONSTRAINT [DF_Table_1_�ܴ�Ҫ��]  DEFAULT ((0)) FOR [��͹ܴ�����];
GO

ALTER TABLE [dbo].[��ѧ��Ժ����] ADD  CONSTRAINT [DF_��ѧ��Ժ����_���ȫ�̹�������]  DEFAULT ((0)) FOR [���ȫ�̹�������];
GO

---



ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_����Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�������Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�ҽ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ񲡷�];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�����];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ��������]    Script Date: 2019/3/19 15:41:11 ******/
DROP TABLE [dbo].[��ѧ��Ժ��������];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ��������]    Script Date: 2019/3/19 15:41:11 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��Ժ��������]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ��Ժ���ұ��] [INT] NOT NULL ,
      [��Ŀ����] [NVARCHAR](50) NOT NULL ,
      [�������ͱ��] [INT] NOT NULL ,
      [�Ƿ�����] [BIT] NOT NULL ,
      [�Ƿ񲡷�] [BIT] NOT NULL ,
      [�Ƿ�ҽ��] [BIT] NOT NULL ,
      [�������Ҫ��] [INT] NOT NULL ,
      [����Ҫ��] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ��Ժ��������] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�����]  DEFAULT ((0)) FOR [�Ƿ�����];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ񲡷�]  DEFAULT ((0)) FOR [�Ƿ񲡷�];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�ҽ��]  DEFAULT ((0)) FOR [�Ƿ�ҽ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�������Ҫ��]  DEFAULT ((0)) FOR [�������Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_����Ҫ��]  DEFAULT ((0)) FOR [����Ҫ��];
GO



ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_����Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�������Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�ҽ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ񲡷�];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] DROP CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�����];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ��������]    Script Date: 2019/3/19 15:41:11 ******/
DROP TABLE [dbo].[��ѧ��Ժ��������];
GO

/****** Object:  Table [dbo].[��ѧ��Ժ��������]    Script Date: 2019/3/19 15:41:11 ******/
SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON;
GO

CREATE TABLE [dbo].[��ѧ��Ժ��������]
    (
      [���] [INT] IDENTITY(1, 1)
                 NOT NULL ,
      [��ѧ��Ժ���ұ��] [INT] NOT NULL ,
      [��Ŀ����] [NVARCHAR](50) NOT NULL ,
      [�������ͱ��] [INT] NOT NULL ,
      [�Ƿ�����] [BIT] NOT NULL ,
      [�Ƿ񲡷�] [BIT] NOT NULL ,
      [�Ƿ�ҽ��] [BIT] NOT NULL ,
      [�������Ҫ��] [INT] NOT NULL ,
      [����Ҫ��] [INT] NOT NULL ,
      [��ע] [NVARCHAR](500) NULL ,
      CONSTRAINT [PK_��ѧ��Ժ��������] PRIMARY KEY CLUSTERED ( [���] ASC )
        WITH ( PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
               IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
               ALLOW_PAGE_LOCKS = ON ) ON [PRIMARY]
    )
ON  [PRIMARY];

GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�����]  DEFAULT ((0)) FOR [�Ƿ�����];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ񲡷�]  DEFAULT ((0)) FOR [�Ƿ񲡷�];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�Ƿ�ҽ��]  DEFAULT ((0)) FOR [�Ƿ�ҽ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_�������Ҫ��]  DEFAULT ((0)) FOR [�������Ҫ��];
GO

ALTER TABLE [dbo].[��ѧ��Ժ��������] ADD  CONSTRAINT [DF_��ѧ��Ժ��������_����Ҫ��]  DEFAULT ((0)) FOR [����Ҫ��];
GO


--


/****** Object:  Table [dbo].[��ѧѧԱ��ѵ]    Script Date: 2019/3/19 16:57:50 ******/
DROP TABLE [dbo].[��ѧѧԱ��ѵ]
GO

/****** Object:  Table [dbo].[��ѧѧԱ��ѵ]    Script Date: 2019/3/19 16:57:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧѧԱ��ѵ](
	[���] [INT] NOT NULL,
	[����ʱ��] [DATETIME] NULL,
	[��ѧ��Ժ���Ա��] [INT] NULL,
	[�ƻ���ʼ��ѵ����] [DATE] NULL,
	[�ƻ�������ѵ����] [DATE] NULL,
	[ʵ�ʿ�ʼ��ѵ����] [DATE] NULL,
	[ʵ�ʽ�����ѵ����] [DATE] NULL,
	[��������] [DATE] NULL,
	[��ҵ����] [DATE] NULL,
	[֤��] [NVARCHAR](200) NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧѧԱ��ѵ] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

ALTER TABLE [dbo].[��ѧ��ҵ����] DROP CONSTRAINT [DF_��ѧ��ҵ����_�Ƿ�ͨ�����]
GO

/****** Object:  Table [dbo].[��ѧ��ҵ����]    Script Date: 2019/3/20 17:02:25 ******/
DROP TABLE [dbo].[��ѧ��ҵ����]
GO

/****** Object:  Table [dbo].[��ѧ��ҵ����]    Script Date: 2019/3/20 17:02:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ��ҵ����](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[ѧԱ���] [INT] NOT NULL,
	[˵��] [NVARCHAR](500) NULL,
	[�����ҵ����] [DATE] NOT NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
	[�Ƿ�ͨ�����] [BIT] NOT NULL,
 CONSTRAINT [PK_��ѧ��ҵ����] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[��ѧ��ҵ����] ADD  CONSTRAINT [DF_��ѧ��ҵ����_�Ƿ�ͨ�����]  DEFAULT ((0)) FOR [�Ƿ�ͨ�����]
GO


GO

---

ALTER TABLE [dbo].[��ѧ��������] DROP CONSTRAINT [DF_��ѧ��������_�Ƿ�ͨ�����]
GO

/****** Object:  Table [dbo].[��ѧ��������]    Script Date: 2019/3/20 16:58:49 ******/
DROP TABLE [dbo].[��ѧ��������]
GO

/****** Object:  Table [dbo].[��ѧ��������]    Script Date: 2019/3/20 16:58:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ��������](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[ѧԱ���] [INT] NOT NULL,
	[˵��] [NVARCHAR](500) NULL,
	[������������] [DATE] NOT NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
	[�Ƿ�ͨ�����] [BIT] NOT NULL,
 CONSTRAINT [PK_��ѧ��������] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[��ѧ��������] ADD  CONSTRAINT [DF_��ѧ��������_�Ƿ�ͨ�����]  DEFAULT ((0)) FOR [�Ƿ�ͨ�����]
GO

--

/****** Object:  Table [dbo].[��ѧҽ�Ʋ���¹ʼ�¼]    Script Date: 2019/3/20 14:32:02 ******/
DROP TABLE [dbo].[��ѧҽ�Ʋ���¹ʼ�¼]
GO

/****** Object:  Table [dbo].[��ѧҽ�Ʋ���¹ʼ�¼]    Script Date: 2019/3/20 14:32:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧҽ�Ʋ���¹ʼ�¼](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[��������] [DATE] NOT NULL,
	[�������] [NVARCHAR](50) NOT NULL,
	[����ԭ��] [NVARCHAR](500) NOT NULL,
	[�������] [NVARCHAR](500) NOT NULL,
	[����] [NVARCHAR](200) NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧҽ�Ʋ���¹ʼ�¼] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--

/****** Object:  Table [dbo].[��ѧ���Գɼ�]    Script Date: 2019/3/20 14:32:41 ******/
DROP TABLE [dbo].[��ѧ���Գɼ�]
GO

/****** Object:  Table [dbo].[��ѧ���Գɼ�]    Script Date: 2019/3/20 14:32:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ���Գɼ�](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[��������] [NVARCHAR](50) NOT NULL,
	[�ɼ�] [INT] NOT NULL,
	[������] [INT] NOT NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ���Գɼ�] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--
/****** Object:  Table [dbo].[��ѧ�������]    Script Date: 2019/3/20 17:00:19 ******/
DROP TABLE [dbo].[��ѧ�������]
GO

/****** Object:  Table [dbo].[��ѧ�������]    Script Date: 2019/3/20 17:00:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ�������](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[��ٿ�ʼ����] [DATE] NOT NULL,
	[�������] [INT] NOT NULL,
	[�������] [NVARCHAR](500) NOT NULL,
	[��ת���ڿ�ʼ����] [DATE] NULL,
	[��ת���ڽ�������] [DATE] NULL,
	[������] [INT] NOT NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
	[�Ƿ�ͨ�����] [BIT] NOT NULL,
 CONSTRAINT [PK_��ѧ�������] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--

/****** Object:  Table [dbo].[��ѧ��������]    Script Date: 2019/3/20 14:33:46 ******/
DROP TABLE [dbo].[��ѧ��������]
GO

/****** Object:  Table [dbo].[��ѧ��������]    Script Date: 2019/3/20 14:33:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ��������](
	[���] [INT] NOT NULL,
	[����] [NVARCHAR](50) NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ��������] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--

/****** Object:  Table [dbo].[��ѧ�������]    Script Date: 2019/3/20 14:34:19 ******/
DROP TABLE [dbo].[��ѧ�������]
GO

/****** Object:  Table [dbo].[��ѧ�������]    Script Date: 2019/3/20 14:34:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ�������](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[��������] [DATE] NOT NULL,
	[��ѧ�������ͱ��] [INT] NOT NULL,
	[˵��] [NVARCHAR](500) NULL,
	[������] [INT] NOT NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ�������] PRIMARY KEY CLUSTERED 
(
	[���] ASC
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

/****** Object:  Table [dbo].[��ѧ����ת]    Script Date: 2019/3/20 14:35:15 ******/
DROP TABLE [dbo].[��ѧ����ת]
GO

/****** Object:  Table [dbo].[��ѧ����ת]    Script Date: 2019/3/20 14:35:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ����ת](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[˵��] [NVARCHAR](500) NULL,
	[��ʼ����] [DATE] NOT NULL,
	[��������] [DATE] NOT NULL,
	[������] [INT] NOT NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ����ת] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--
/****** Object:  Table [dbo].[��ѧ��������]    Script Date: 2019/3/20 17:01:10 ******/
DROP TABLE [dbo].[��ѧ��������]
GO

/****** Object:  Table [dbo].[��ѧ��������]    Script Date: 2019/3/20 17:01:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ��������](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[�����������] [DATE] NOT NULL,
	[����С��] [NVARCHAR](500) NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
	[�Ƿ�ͨ�����] [BIT] NOT NULL,
 CONSTRAINT [PK_��ѧ��������] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--

ALTER TABLE [dbo].[��ѧ��ת] DROP CONSTRAINT [DF_��ѧ��ת_���ȫ�̹�������]
GO

ALTER TABLE [dbo].[��ѧ��ת] DROP CONSTRAINT [DF_��ѧ��ת_��͹ܴ�����]
GO

/****** Object:  Table [dbo].[��ѧ��ת]    Script Date: 2019/3/20 14:36:05 ******/
DROP TABLE [dbo].[��ѧ��ת]
GO

/****** Object:  Table [dbo].[��ѧ��ת]    Script Date: 2019/3/20 14:36:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ��ת](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[ѧԱ���] [INT] NOT NULL,
	[�ƻ��������] [DATE] NOT NULL,
	[�ƻ���������] [DATE] NOT NULL,
	[ʵ���������] [DATE] NULL,
	[ʵ�ʳ�������] [DATE] NULL,
	[��Ժ���ұ��] [INT] NOT NULL,
	[������ʦ���] [INT] NOT NULL,
	[��͹ܴ�����] [INT] NOT NULL,
	[���ȫ�̹�������] [INT] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ��ת] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[��ѧ��ת] ADD  CONSTRAINT [DF_��ѧ��ת_��͹ܴ�����]  DEFAULT ((0)) FOR [��͹ܴ�����]
GO

ALTER TABLE [dbo].[��ѧ��ת] ADD  CONSTRAINT [DF_��ѧ��ת_���ȫ�̹�������]  DEFAULT ((0)) FOR [���ȫ�̹�������]
GO

--
/****** Object:  Table [dbo].[��ѧ����]    Script Date: 2019/3/20 15:13:42 ******/
DROP TABLE [dbo].[��ѧ����]
GO

/****** Object:  Table [dbo].[��ѧ����]    Script Date: 2019/3/20 15:13:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ����](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[����] [NVARCHAR](50) NOT NULL,
	[�Ա�] [NVARCHAR](10) NULL,
	[��������] [DATE] NULL,
	[סԺ��] [NVARCHAR](50) NULL,
	[סԺ����] [NVARCHAR](50) NULL,
	[��Ҫ���] [NVARCHAR](500) NULL,
	[��Ҫ���] [NVARCHAR](500) NULL,
	[��Ժ����] [DATE] NULL,
	[��Ժ����] [DATE] NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ����] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--


ALTER TABLE [dbo].[��ѧ�ܴ�����] DROP CONSTRAINT [DF_��ѧ�ܴ�����_�Ƿ�ȫ���㻤]
GO

/****** Object:  Table [dbo].[��ѧ�ܴ�����]    Script Date: 2019/3/20 15:14:10 ******/
DROP TABLE [dbo].[��ѧ�ܴ�����]
GO

/****** Object:  Table [dbo].[��ѧ�ܴ�����]    Script Date: 2019/3/20 15:14:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ�ܴ�����](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[���˱��] [INT] NOT NULL,
	[�Ƿ�ȫ���㻤] [BIT] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
 CONSTRAINT [PK_��ѧ�ܴ�����] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[��ѧ�ܴ�����] ADD  CONSTRAINT [DF_��ѧ�ܴ�����_�Ƿ�ȫ���㻤]  DEFAULT ((0)) FOR [�Ƿ�ȫ���㻤]
GO
--


ALTER TABLE [dbo].[��ѧ��ת����] DROP CONSTRAINT [DF_��ѧ��ת����_����Ҫ��]
GO

ALTER TABLE [dbo].[��ѧ��ת����] DROP CONSTRAINT [DF_��ѧ��ת����_�������Ҫ��]
GO

ALTER TABLE [dbo].[��ѧ��ת����] DROP CONSTRAINT [DF_��ѧ��ת����_�Ƿ�ҽ��]
GO

ALTER TABLE [dbo].[��ѧ��ת����] DROP CONSTRAINT [DF_��ѧ��ת����_�Ƿ񲡷�]
GO

ALTER TABLE [dbo].[��ѧ��ת����] DROP CONSTRAINT [DF_��ѧ��ת����_�Ƿ�����]
GO

/****** Object:  Table [dbo].[��ѧ��ת����]    Script Date: 2019/3/20 16:39:53 ******/
DROP TABLE [dbo].[��ѧ��ת����]
GO

/****** Object:  Table [dbo].[��ѧ��ת����]    Script Date: 2019/3/20 16:39:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ��ת����](
	[���] [INT] NOT NULL,
	[��ѧ��ת���] [INT] NOT NULL,
	[��Ŀ����] [NVARCHAR](50) NOT NULL,
	[�������ͱ��] [INT] NOT NULL,
	[�Ƿ�����] [BIT] NOT NULL,
	[�Ƿ񲡷�] [BIT] NOT NULL,
	[�Ƿ�ҽ��] [BIT] NOT NULL,
	[�������Ҫ��] [INT] NOT NULL,
	[����Ҫ��] [INT] NOT NULL,
	[��ע] [NVARCHAR](500) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[��ѧ��ת����] ADD  CONSTRAINT [DF_��ѧ��ת����_�Ƿ�����]  DEFAULT ((0)) FOR [�Ƿ�����]
GO

ALTER TABLE [dbo].[��ѧ��ת����] ADD  CONSTRAINT [DF_��ѧ��ת����_�Ƿ񲡷�]  DEFAULT ((0)) FOR [�Ƿ񲡷�]
GO

ALTER TABLE [dbo].[��ѧ��ת����] ADD  CONSTRAINT [DF_��ѧ��ת����_�Ƿ�ҽ��]  DEFAULT ((0)) FOR [�Ƿ�ҽ��]
GO

ALTER TABLE [dbo].[��ѧ��ת����] ADD  CONSTRAINT [DF_��ѧ��ת����_�������Ҫ��]  DEFAULT ((0)) FOR [�������Ҫ��]
GO

ALTER TABLE [dbo].[��ѧ��ת����] ADD  CONSTRAINT [DF_��ѧ��ת����_����Ҫ��]  DEFAULT ((0)) FOR [����Ҫ��]
GO
--

ALTER TABLE [dbo].[��ѧ����] DROP CONSTRAINT [DF_��ѧ����_�Ƿ�ͨ�����]
GO

/****** Object:  Table [dbo].[��ѧ����]    Script Date: 2019/3/20 16:42:32 ******/
DROP TABLE [dbo].[��ѧ����]
GO

/****** Object:  Table [dbo].[��ѧ����]    Script Date: 2019/3/20 16:42:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[��ѧ����](
	[���] [INT] IDENTITY(1,1) NOT NULL,
	[��ѧ��ת������] [INT] NOT NULL,
	[��������] [NVARCHAR](50) NULL,
	[��������] [NVARCHAR](50) NULL,
	[���˱��] [INT] NULL,
	[��������] [NVARCHAR](2000) NULL,
	[����] [NVARCHAR](200) NULL,
	[����ʱ��] [DATETIME] NOT NULL,
	[��ע] [NVARCHAR](500) NULL,
	[�Ƿ�ͨ�����] [BIT] NOT NULL,
 CONSTRAINT [PK_��ѧ����] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[��ѧ����] ADD  CONSTRAINT [DF_��ѧ����_�Ƿ�ͨ�����]  DEFAULT ((0)) FOR [�Ƿ�ͨ�����]
GO

--





