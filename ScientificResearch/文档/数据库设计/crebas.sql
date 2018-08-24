/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018/4/25 9:17:36                            */
/*==============================================================*/


alter table dbo.人员
   drop constraint PK_人员
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.人员')
            and   type = 'U')
   drop table dbo.人员
go

alter table dbo.人员角色
   drop constraint PK_人员角色
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.人员角色')
            and   type = 'U')
   drop table dbo.人员角色
go

alter table dbo.任职
   drop constraint PK_任职
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.任职')
            and   type = 'U')
   drop table dbo.任职
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.区域')
            and   type = 'U')
   drop table dbo.区域
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.合同买方性质')
            and   type = 'U')
   drop table dbo.合同买方性质
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.国民行业代码')
            and   type = 'U')
   drop table dbo.国民行业代码
go

alter table dbo.字典
   drop constraint PK_字典
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.字典')
            and   type = 'U')
   drop table dbo.字典
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.学科')
            and   type = 'U')
   drop table dbo.学科
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.技术领域')
            and   type = 'U')
   drop table dbo.技术领域
go

alter table dbo.期刊
   drop constraint PK_期刊
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.期刊')
            and   type = 'U')
   drop table dbo.期刊
go

alter table dbo.权限
   drop constraint PK_权限
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.权限')
            and   type = 'U')
   drop table dbo.权限
go

alter table 登录日志
   drop constraint PK_登录日志
go

if exists (select 1
            from  sysobjects
           where  id = object_id('登录日志')
            and   type = 'U')
   drop table 登录日志
go

alter table dbo.经费模版
   drop constraint PK_经费模版
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.经费模版')
            and   type = 'U')
   drop table dbo.经费模版
go

alter table dbo.经费模版项目支出内容
   drop constraint PK_经费模版项目支出内容
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.经费模版项目支出内容')
            and   type = 'U')
   drop table dbo.经费模版项目支出内容
go

alter table dbo.经费模版项目支出类型
   drop constraint PK_经费模版支出科目
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.经费模版项目支出类型')
            and   type = 'U')
   drop table dbo.经费模版项目支出类型
go

alter table dbo.角色
   drop constraint PK_角色
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.角色')
            and   type = 'U')
   drop table dbo.角色
go

alter table dbo.角色权限
   drop constraint PK_角色权限
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.角色权限')
            and   type = 'U')
   drop table dbo.角色权限
go

alter table dbo.部门
   drop constraint PK_部门
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.部门')
            and   type = 'U')
   drop table dbo.部门
go

alter table dbo.项目分类
   drop constraint PK_项目分类
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.项目分类')
            and   type = 'U')
   drop table dbo.项目分类
go

execute sp_revokedbaccess dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
execute sp_grantdbaccess dbo
go

/*==============================================================*/
/* Table: 人员                                                    */
/*==============================================================*/
create table dbo.人员 (
   编号                   int                  identity(1, 1),
   工号                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   密码                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   姓名                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   部门编号                 int                  not null,
   英文名                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   性别                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   身份证                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   出生日期                 date                 null,
   入职日期                 date                 null,
   手机                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   QQ                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   邮箱                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   籍贯                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   毕业日期                 date                 null,
   合同开始日期               date                 null,
   合同结束日期               date                 null,
   参加工作日期               date                 null,
   专业技术获得日期             date                 null,
   职务任职日期               date                 null,
   学位                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   学历                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   政治面貌                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   技术职称类别               nvarchar(100)        collate Chinese_PRC_CI_AS null,
   技术职称                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   第二技术职称类别             nvarchar(100)        collate Chinese_PRC_CI_AS null,
   第二技术职称               nvarchar(100)        collate Chinese_PRC_CI_AS null,
   婚姻情况                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   学制                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   学历性质                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   学习形式                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   人员类别                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   个人身份                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   民族                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   专业技术级别               nvarchar(50)         collate Chinese_PRC_CI_AS null,
   所学专业名称               nvarchar(50)         collate Chinese_PRC_CI_AS null,
   岗位性质                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   职务名称                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   职务级别                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   岗位名称                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   岗位类型                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   学科门类                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   一级学科                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   二级学科                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   三级学科                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   人员类型                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   获得最高学历的院校            nvarchar(100)        collate Chinese_PRC_CI_AS null,
   获得最高学位的院校            nvarchar(100)        collate Chinese_PRC_CI_AS null,
   住宅地址                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   学术特长                 nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   研究方向                 nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   个人获得的荣誉和奖项           nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   是否启用                 bit                  not null constraint DF_人员_是否启用 default (1)
)
on "PRIMARY"
go

alter table dbo.人员
   add constraint PK_人员 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 人员角色                                                  */
/*==============================================================*/
create table dbo.人员角色 (
   编号                   int                  identity(1, 1),
   角色编号                 int                  not null,
   人员编号                 int                  not null
)
on "PRIMARY"
go

alter table dbo.人员角色
   add constraint PK_人员角色 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 任职                                                    */
/*==============================================================*/
create table dbo.任职 (
   编号                   int                  identity(1, 1),
   任职开始时间               datetime             not null,
   任职截止时间               datetime             null,
   任职人员编号               int                  not null,
   任职团体名称               nvarchar(200)        collate Chinese_PRC_CI_AS not null,
   所任职务                 nvarchar(200)        collate Chinese_PRC_CI_AS not null,
   建立时间                 datetime             not null constraint DF_任职_建立时间 default getdate(),
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.任职
   add constraint PK_任职 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 区域                                                    */
/*==============================================================*/
create table dbo.区域 (
   编号                   int                  identity(10000, 1),
   名称                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   级别                   int                  null,
   上级编号                 int                  null,
   排序                   int                  null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: 合同买方性质                                                */
/*==============================================================*/
create table dbo.合同买方性质 (
   编号                   int                  null,
   上级编号                 int                  null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   级别                   int                  not null,
   排序                   int                  not null,
   备注                   int                  null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: 国民行业代码                                                */
/*==============================================================*/
create table dbo.国民行业代码 (
   编号                   int                  null,
   上级编号                 int                  null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   代码                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   级别                   int                  not null,
   排序                   int                  not null,
   备注                   int                  null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: 字典                                                    */
/*==============================================================*/
create table dbo.字典 (
   编号                   int                  not null,
   分类                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   值                    nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   上级编号                 int                  not null,
   级别                   int                  not null constraint DF_字典_级别 default (1),
   排序                   int                  not null constraint DF_字典_排序 default (0),
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.字典
   add constraint PK_字典 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 学科                                                    */
/*==============================================================*/
create table dbo.学科 (
   编号                   int                  null,
   上级编号                 int                  null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   级别                   int                  not null,
   排序                   int                  not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: 技术领域                                                  */
/*==============================================================*/
create table dbo.技术领域 (
   编号                   int                  null,
   上级编号                 int                  null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   级别                   int                  not null,
   排序                   int                  not null,
   备注                   int                  null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: 期刊                                                    */
/*==============================================================*/
create table dbo.期刊 (
   编号                   int                  identity(10000, 1),
   代码                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   名称                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   英文刊名                 nvarchar(500)        collate Chinese_PRC_CI_AS null,
   主办单位                 nvarchar(500)        collate Chinese_PRC_CI_AS null,
   期刊系列                 nvarchar(500)        collate Chinese_PRC_CI_AS null,
   收录情况                 nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   语种                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   JCR分区                nvarchar(50)         collate Chinese_PRC_CI_AS null,
   编目名称                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   编目类别                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   年度                   int                  null,
   创刊日期                 date                 null,
   被引用次数                int                  null,
   影响因子                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   特征因子分值               nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ISSN号                nvarchar(50)         collate Chinese_PRC_CI_AS null,
   CN号                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   出版周期                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   出版地                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   开本                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   ',分割的收录数据库的字串',
   'user', 'dbo', 'table', '期刊', 'column', '收录情况'
go

alter table dbo.期刊
   add constraint PK_期刊 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 权限                                                    */
/*==============================================================*/
create table dbo.权限 (
   编号                   int                  identity(1, 1),
   上级编号                 int                  not null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   路径                   nvarchar(500)        collate Chinese_PRC_CI_AS not null,
   类型                   bit                  not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '0 菜单 1-各种input',
   'user', 'dbo', 'table', '权限', 'column', '类型'
go

alter table dbo.权限
   add constraint PK_权限 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 登录日志                                                  */
/*==============================================================*/
create table 登录日志 (
   编号                   int                  identity,
   工号                   nvarchar(50)         not null,
   姓名                   nvarchar(50)         not null,
   登录时间                 datetime             null,
   IP                   nvarchar(50)         null
)
go

alter table 登录日志
   add constraint PK_登录日志 primary key (编号)
go

/*==============================================================*/
/* Table: 经费模版                                                  */
/*==============================================================*/
create table dbo.经费模版 (
   编号                   int                  identity(1, 1),
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.经费模版
   add constraint PK_经费模版 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 经费模版项目支出内容                                            */
/*==============================================================*/
create table dbo.经费模版项目支出内容 (
   编号                   int                  identity(1, 1),
   所属经费模版项目支出类型编号       int                  not null,
   项目支出内容               nvarchar(100)        collate Chinese_PRC_CI_AS not null,
   财务科目                 nvarchar(100)        collate Chinese_PRC_CI_AS not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.经费模版项目支出内容
   add constraint PK_经费模版项目支出内容 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 经费模版项目支出类型                                            */
/*==============================================================*/
create table dbo.经费模版项目支出类型 (
   编号                   int                  identity(1, 1),
   所属经费模版编号             int                  not null,
   项目支出类型               nvarchar(100)        collate Chinese_PRC_CI_AS not null,
   经费占比                 int                  not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '0-100 %',
   'user', 'dbo', 'table', '经费模版项目支出类型', 'column', '经费占比'
go

alter table dbo.经费模版项目支出类型
   add constraint PK_经费模版支出科目 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 角色                                                    */
/*==============================================================*/
create table dbo.角色 (
   编号                   int                  identity(1, 1),
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.角色
   add constraint PK_角色 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 角色权限                                                  */
/*==============================================================*/
create table dbo.角色权限 (
   编号                   int                  identity(1, 1),
   角色编号                 int                  not null,
   权限编号                 int                  not null
)
on "PRIMARY"
go

alter table dbo.角色权限
   add constraint PK_角色权限 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 部门                                                    */
/*==============================================================*/
create table dbo.部门 (
   编号                   int                  identity(20000, 1),
   上级部门编号               int                  not null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   负责人编号                int                  null,
   排序值                  int                  not null constraint DF_部门_排序值 default (0),
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   是否启用                 bit                  not null constraint DF_部门_是否启用 default (1)
)
on "PRIMARY"
go

alter table dbo.部门
   add constraint PK_部门 primary key (编号)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: 项目分类                                                  */
/*==============================================================*/
create table dbo.项目分类 (
   编号                   int                  not null,
   上级编号                 int                  not null,
   名称                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   级别                   int                  not null,
   排序                   int                  not null,
   备注                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.项目分类
   add constraint PK_项目分类 primary key (编号)
      on "PRIMARY"
go

