/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2018/4/25 9:17:36                            */
/*==============================================================*/


alter table dbo.��Ա
   drop constraint PK_��Ա
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��Ա')
            and   type = 'U')
   drop table dbo.��Ա
go

alter table dbo.��Ա��ɫ
   drop constraint PK_��Ա��ɫ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��Ա��ɫ')
            and   type = 'U')
   drop table dbo.��Ա��ɫ
go

alter table dbo.��ְ
   drop constraint PK_��ְ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��ְ')
            and   type = 'U')
   drop table dbo.��ְ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.����')
            and   type = 'U')
   drop table dbo.����
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��ͬ������')
            and   type = 'U')
   drop table dbo.��ͬ������
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.������ҵ����')
            and   type = 'U')
   drop table dbo.������ҵ����
go

alter table dbo.�ֵ�
   drop constraint PK_�ֵ�
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.�ֵ�')
            and   type = 'U')
   drop table dbo.�ֵ�
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.ѧ��')
            and   type = 'U')
   drop table dbo.ѧ��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��������')
            and   type = 'U')
   drop table dbo.��������
go

alter table dbo.�ڿ�
   drop constraint PK_�ڿ�
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.�ڿ�')
            and   type = 'U')
   drop table dbo.�ڿ�
go

alter table dbo.Ȩ��
   drop constraint PK_Ȩ��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.Ȩ��')
            and   type = 'U')
   drop table dbo.Ȩ��
go

alter table ��¼��־
   drop constraint PK_��¼��־
go

if exists (select 1
            from  sysobjects
           where  id = object_id('��¼��־')
            and   type = 'U')
   drop table ��¼��־
go

alter table dbo.����ģ��
   drop constraint PK_����ģ��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.����ģ��')
            and   type = 'U')
   drop table dbo.����ģ��
go

alter table dbo.����ģ����Ŀ֧������
   drop constraint PK_����ģ����Ŀ֧������
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.����ģ����Ŀ֧������')
            and   type = 'U')
   drop table dbo.����ģ����Ŀ֧������
go

alter table dbo.����ģ����Ŀ֧������
   drop constraint PK_����ģ��֧����Ŀ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.����ģ����Ŀ֧������')
            and   type = 'U')
   drop table dbo.����ģ����Ŀ֧������
go

alter table dbo.��ɫ
   drop constraint PK_��ɫ
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��ɫ')
            and   type = 'U')
   drop table dbo.��ɫ
go

alter table dbo.��ɫȨ��
   drop constraint PK_��ɫȨ��
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��ɫȨ��')
            and   type = 'U')
   drop table dbo.��ɫȨ��
go

alter table dbo.����
   drop constraint PK_����
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.����')
            and   type = 'U')
   drop table dbo.����
go

alter table dbo.��Ŀ����
   drop constraint PK_��Ŀ����
go

if exists (select 1
            from  sysobjects
           where  id = object_id('dbo.��Ŀ����')
            and   type = 'U')
   drop table dbo.��Ŀ����
go

execute sp_revokedbaccess dbo
go

/*==============================================================*/
/* User: dbo                                                    */
/*==============================================================*/
execute sp_grantdbaccess dbo
go

/*==============================================================*/
/* Table: ��Ա                                                    */
/*==============================================================*/
create table dbo.��Ա (
   ���                   int                  identity(1, 1),
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ���ű��                 int                  not null,
   Ӣ����                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   �Ա�                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ���֤                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��������                 date                 null,
   ��ְ����                 date                 null,
   �ֻ�                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   QQ                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��ҵ����                 date                 null,
   ��ͬ��ʼ����               date                 null,
   ��ͬ��������               date                 null,
   �μӹ�������               date                 null,
   רҵ�����������             date                 null,
   ְ����ְ����               date                 null,
   ѧλ                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ѧ��                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ������ò                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����ְ�����               nvarchar(100)        collate Chinese_PRC_CI_AS null,
   ����ְ��                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   �ڶ�����ְ�����             nvarchar(100)        collate Chinese_PRC_CI_AS null,
   �ڶ�����ְ��               nvarchar(100)        collate Chinese_PRC_CI_AS null,
   �������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ѧ��                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ѧ������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ѧϰ��ʽ                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��Ա���                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   �������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   רҵ��������               nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��ѧרҵ����               nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��λ����                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ְ������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ְ�񼶱�                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��λ����                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��λ����                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ѧ������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   һ��ѧ��                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����ѧ��                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����ѧ��                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��Ա����                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ������ѧ����ԺУ            nvarchar(100)        collate Chinese_PRC_CI_AS null,
   ������ѧλ��ԺУ            nvarchar(100)        collate Chinese_PRC_CI_AS null,
   סլ��ַ                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   ѧ���س�                 nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   �о�����                 nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   ���˻�õ������ͽ���           nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   �Ƿ�����                 bit                  not null constraint DF_��Ա_�Ƿ����� default (1)
)
on "PRIMARY"
go

alter table dbo.��Ա
   add constraint PK_��Ա primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ��Ա��ɫ                                                  */
/*==============================================================*/
create table dbo.��Ա��ɫ (
   ���                   int                  identity(1, 1),
   ��ɫ���                 int                  not null,
   ��Ա���                 int                  not null
)
on "PRIMARY"
go

alter table dbo.��Ա��ɫ
   add constraint PK_��Ա��ɫ primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ��ְ                                                    */
/*==============================================================*/
create table dbo.��ְ (
   ���                   int                  identity(1, 1),
   ��ְ��ʼʱ��               datetime             not null,
   ��ְ��ֹʱ��               datetime             null,
   ��ְ��Ա���               int                  not null,
   ��ְ��������               nvarchar(200)        collate Chinese_PRC_CI_AS not null,
   ����ְ��                 nvarchar(200)        collate Chinese_PRC_CI_AS not null,
   ����ʱ��                 datetime             not null constraint DF_��ְ_����ʱ�� default getdate(),
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.��ְ
   add constraint PK_��ְ primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ����                                                    */
/*==============================================================*/
create table dbo.���� (
   ���                   int                  identity(10000, 1),
   ����                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   ����                   int                  null,
   �ϼ����                 int                  null,
   ����                   int                  null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ��ͬ������                                                */
/*==============================================================*/
create table dbo.��ͬ������ (
   ���                   int                  null,
   �ϼ����                 int                  null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   int                  not null,
   ����                   int                  not null,
   ��ע                   int                  null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ������ҵ����                                                */
/*==============================================================*/
create table dbo.������ҵ���� (
   ���                   int                  null,
   �ϼ����                 int                  null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   ����                   int                  not null,
   ����                   int                  not null,
   ��ע                   int                  null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: �ֵ�                                                    */
/*==============================================================*/
create table dbo.�ֵ� (
   ���                   int                  not null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ֵ                    nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   �ϼ����                 int                  not null,
   ����                   int                  not null constraint DF_�ֵ�_���� default (1),
   ����                   int                  not null constraint DF_�ֵ�_���� default (0),
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.�ֵ�
   add constraint PK_�ֵ� primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ѧ��                                                    */
/*==============================================================*/
create table dbo.ѧ�� (
   ���                   int                  null,
   �ϼ����                 int                  null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   int                  not null,
   ����                   int                  not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: ��������                                                  */
/*==============================================================*/
create table dbo.�������� (
   ���                   int                  null,
   �ϼ����                 int                  null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   int                  not null,
   ����                   int                  not null,
   ��ע                   int                  null
)
on "PRIMARY"
go

/*==============================================================*/
/* Table: �ڿ�                                                    */
/*==============================================================*/
create table dbo.�ڿ� (
   ���                   int                  identity(10000, 1),
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   Ӣ�Ŀ���                 nvarchar(500)        collate Chinese_PRC_CI_AS null,
   ���쵥λ                 nvarchar(500)        collate Chinese_PRC_CI_AS null,
   �ڿ�ϵ��                 nvarchar(500)        collate Chinese_PRC_CI_AS null,
   ��¼���                 nvarchar(1000)       collate Chinese_PRC_CI_AS null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   JCR����                nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��Ŀ����                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   ��Ŀ���                 nvarchar(100)        collate Chinese_PRC_CI_AS null,
   ���                   int                  null,
   ��������                 date                 null,
   �����ô���                int                  null,
   Ӱ������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   �������ӷ�ֵ               nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ISSN��                nvarchar(50)         collate Chinese_PRC_CI_AS null,
   CN��                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��������                 nvarchar(50)         collate Chinese_PRC_CI_AS null,
   �����                  nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   ',�ָ����¼���ݿ���ִ�',
   'user', 'dbo', 'table', '�ڿ�', 'column', '��¼���'
go

alter table dbo.�ڿ�
   add constraint PK_�ڿ� primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: Ȩ��                                                    */
/*==============================================================*/
create table dbo.Ȩ�� (
   ���                   int                  identity(1, 1),
   �ϼ����                 int                  not null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ·��                   nvarchar(500)        collate Chinese_PRC_CI_AS not null,
   ����                   bit                  not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '0 �˵� 1-����input',
   'user', 'dbo', 'table', 'Ȩ��', 'column', '����'
go

alter table dbo.Ȩ��
   add constraint PK_Ȩ�� primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ��¼��־                                                  */
/*==============================================================*/
create table ��¼��־ (
   ���                   int                  identity,
   ����                   nvarchar(50)         not null,
   ����                   nvarchar(50)         not null,
   ��¼ʱ��                 datetime             null,
   IP                   nvarchar(50)         null
)
go

alter table ��¼��־
   add constraint PK_��¼��־ primary key (���)
go

/*==============================================================*/
/* Table: ����ģ��                                                  */
/*==============================================================*/
create table dbo.����ģ�� (
   ���                   int                  identity(1, 1),
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.����ģ��
   add constraint PK_����ģ�� primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ����ģ����Ŀ֧������                                            */
/*==============================================================*/
create table dbo.����ģ����Ŀ֧������ (
   ���                   int                  identity(1, 1),
   ��������ģ����Ŀ֧�����ͱ��       int                  not null,
   ��Ŀ֧������               nvarchar(100)        collate Chinese_PRC_CI_AS not null,
   �����Ŀ                 nvarchar(100)        collate Chinese_PRC_CI_AS not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.����ģ����Ŀ֧������
   add constraint PK_����ģ����Ŀ֧������ primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ����ģ����Ŀ֧������                                            */
/*==============================================================*/
create table dbo.����ģ����Ŀ֧������ (
   ���                   int                  identity(1, 1),
   ��������ģ����             int                  not null,
   ��Ŀ֧������               nvarchar(100)        collate Chinese_PRC_CI_AS not null,
   ����ռ��                 int                  not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

execute sp_addextendedproperty 'MS_Description', 
   '0-100 %',
   'user', 'dbo', 'table', '����ģ����Ŀ֧������', 'column', '����ռ��'
go

alter table dbo.����ģ����Ŀ֧������
   add constraint PK_����ģ��֧����Ŀ primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ��ɫ                                                    */
/*==============================================================*/
create table dbo.��ɫ (
   ���                   int                  identity(1, 1),
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.��ɫ
   add constraint PK_��ɫ primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ��ɫȨ��                                                  */
/*==============================================================*/
create table dbo.��ɫȨ�� (
   ���                   int                  identity(1, 1),
   ��ɫ���                 int                  not null,
   Ȩ�ޱ��                 int                  not null
)
on "PRIMARY"
go

alter table dbo.��ɫȨ��
   add constraint PK_��ɫȨ�� primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ����                                                    */
/*==============================================================*/
create table dbo.���� (
   ���                   int                  identity(20000, 1),
   �ϼ����ű��               int                  not null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   �����˱��                int                  null,
   ����ֵ                  int                  not null constraint DF_����_����ֵ default (0),
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null,
   �Ƿ�����                 bit                  not null constraint DF_����_�Ƿ����� default (1)
)
on "PRIMARY"
go

alter table dbo.����
   add constraint PK_���� primary key (���)
      on "PRIMARY"
go

/*==============================================================*/
/* Table: ��Ŀ����                                                  */
/*==============================================================*/
create table dbo.��Ŀ���� (
   ���                   int                  not null,
   �ϼ����                 int                  not null,
   ����                   nvarchar(50)         collate Chinese_PRC_CI_AS not null,
   ����                   int                  not null,
   ����                   int                  not null,
   ��ע                   nvarchar(500)        collate Chinese_PRC_CI_AS null
)
on "PRIMARY"
go

alter table dbo.��Ŀ����
   add constraint PK_��Ŀ���� primary key (���)
      on "PRIMARY"
go

