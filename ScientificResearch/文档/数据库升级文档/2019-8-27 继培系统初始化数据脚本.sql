
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
                    SELECT  @result = '�����˻�����';
            END;

        IF ( @PersonType = '��Ա' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '����ҽԺԱ��';
                ELSE
                    SELECT  @result = ����
                    FROM    dbo.��Ա
                    WHERE   ��� = @PersonId;
            END;
            
        IF ( @PersonType = '��ѧѧԱ' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '���н�ѧѧԱ';
                ELSE
                    SELECT  @result = ����
                    FROM    dbo.��ѧѧԱ
                    WHERE   ��� = @PersonId;
            END;

        IF ( @PersonType = '��ѧ��ɫ' )
            SELECT  @result = ����
            FROM    dbo.��ѧ��ɫ
            WHERE   ��� = @PersonId;

		IF ( @PersonType = '�̽̽�ɫ' )
            SELECT  @result = ����
            FROM    dbo.�̽̽�ɫ
            WHERE   ��� = @PersonId;

        IF ( @PersonType = '����'
             OR @PersonType = '��ѧ����'
           )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '���в���';
                ELSE
                    SELECT  @result = ����
                    FROM    dbo.����
                    WHERE   ��� = @PersonId;
            END;
            
        RETURN @result;

    END;
GO


TRUNCATE TABLE dbo.�̽��ܼ�;
INSERT dbo.�̽��ܼ�
        ( ����, ��ע )
VALUES  ( N'N0',N''),( N'N1',N''),( N'N2',N''),( N'N3',N''),( N'N4',N'')

GO

TRUNCATE TABLE dbo.�̽�Ȩ��;

--��ҳ��˭���е�
INSERT dbo.�̽�Ȩ��
        ( ���, �ϼ����, ���, ����ֵ, ����, �����, �Ƿ�˵�, ͼ��, ��ע )
VALUES  ( 1,0,1,0,N'Ľ��',N'ForClass', 1,N'',N'' ),
( 101,1,2,1,N'Ľ�λ',N'ForClassActivity', 1,N'',N'' ),
( 102,1,2,2,N'�زĿ�',N'ForClassMaterial', 1,N'',N'' ),
( 103,1,2,3,N'���',N'ForClassQuestionBank', 1,N'',N'' ),

( 2,0,1,0,N'����',N'Test', 1,N'',N'' ),
( 201,2,2,1,N'���ۿ���',N'TestTheory', 1,N'',N'' ),
( 202,2,2,2,N'�Ծ�',N'TestExaminationPaper', 1,N'',N'' ),
( 203,2,2,3,N'���',N'TestQuestionBank', 1,N'',N'' ),
( 204,2,2,4,N'��������',N'TestOperation', 1,N'',N'' ),
( 205,2,2,5,N'���ֱ�',N'TestScoreTable', 1,N'',N'' ),

( 3,0,1,0,N'ǩ��',N'SignIn', 1,N'',N'' ),

( 4,0,1,0,N'��֯����',N'Organization', 1,N'',N'' ),
( 401,4,2,1,N'������Ա��Ϣ',N'OrganizationPersonnelInformation', 1,N'',N'' ),

( 5,0,1,0,N'ϵͳ����',N'SystemSettings', 1,N'',N'' ),
( 501,5,2,1,N'��¼��־',N'SystemSettingsLoginLog', 1,N'',N'' ),
( 502,5,2,2,N'Ȩ�޹���',N'SystemSettingsRightsManagement', 1,N'',N'' ),
 ( 50201,502,3,1,N'��ɫ��Ȩ��',N'SystemSettingsRightsManagementRole', 1,N'',N'' ),
( 503,5,2,3,N'ҵ������',N'SystemSettingsBusiness', 1,N'',N'' ),
 ( 50301,503,3,1,N'��������',N'SystemSettingsBasicRules', 1,N'',N'' ),
 ( 50302,503,3,2,N'��ѵ�ƻ�',N'SystemSettingStrainingPlan', 1,N'',N'' ),
 ( 50303,503,3,3,N'���Ŀ����',N'SystemSettingsSetUpActiveItemClass', 1,N'',N'' ),
( 504,5,2,4,N'������Ϣ',N'SystemSettingsBasicInformation', 1,N'',N'' ),
 ( 50401,504,3,1,N'ѧ��',N'SystemSettingsBasicInformationBasic?type=ѧ��', 1,N'',N'' ),
 ( 50402,504,3,2,N'ְ��',N'SystemSettingsBasicInformationBasic?type=ְ��', 1,N'',N'' ),
 ( 50403,504,3,3,N'ѧ��',N'SystemSettingsBasicInformationBasic?type=ѧ��', 1,N'',N'' ),
 ( 50404,504,3,4,N'����',N'SystemSettingsBasicInformationBasic?type=����', 1,N'',N'' ),
 ( 50405,504,3,5,N'�ܼ�',N'SystemSettingsBasicInformationLevels', 1,N'',N'' ),
 ( 50406,504,3,6,N'��ǩ',N'SystemSettingsBasicInformationLabel', 1,N'',N'' ),
 ( 50407,504,3,7,N'���׶�',N'SystemSettingsBasicInformationBasic?type=���׶�', 1,N'',N'' );

GO

--΢�Ŷ�,"��ҳ","�ҵĻ","��������"���ǹ̶�����
TRUNCATE TABLE dbo.�̽�΢��Ȩ��;

INSERT dbo.�̽�΢��Ȩ��
        ( ���, �ϼ����, ���, ����ֵ, ����, �����, �Ƿ�˵�, ͼ��, ��ע )
VALUES  ( 1,0,1,1,N'��������',N'',1,N'',N''),( 2,0,1,2,N'����Ա',N'',1,N'',N'')

GO

TRUNCATE TABLE �̽̽�ɫ;

INSERT dbo.�̽̽�ɫ
        ( ���, ����, �ܷ�ֱ��������Ա, ��ע )
VALUES  ( 1,N'ϵͳ����Ա', 1,N''),
 ( 2,N'ҽԺ����Ա', 1,N''),
( 3,N'���ҹ���Ա', 0,N''),
( 4,N'������ʦ', 1,N'')
GO

--0001����ϵͳ����Ա
TRUNCATE TABLE dbo.�̽���Ա��ɫ;
INSERT dbo.�̽���Ա��ɫ
        ( �̽̽�ɫ���, ��Ա��� )
VALUES  ( 1, -- �̽̽�ɫ��� - int
          2  -- ��Ա��� - int
          )

GO

TRUNCATE TABLE dbo.�̽̽�ɫȨ��;

--pc��
--ϵͳ����Աӵ������Ȩ��;
INSERT dbo.�̽̽�ɫȨ��
        ( �̽̽�ɫ���, �̽�Ȩ�ޱ�� )
		SELECT 1,��� FROM dbo.�̽�Ȩ��;

--ҽԺ����Աӵ������Ȩ��
INSERT dbo.�̽̽�ɫȨ��
        ( �̽̽�ɫ���, �̽�Ȩ�ޱ�� )
		SELECT 2,��� FROM dbo.�̽�Ȩ��;

--���ҹ���Աӵ��ҵ��Ȩ��
INSERT dbo.�̽̽�ɫȨ��
        ( �̽̽�ɫ���, �̽�Ȩ�ޱ�� )
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

--������ʦû��pc�˵�Ȩ��;
GO

TRUNCATE TABLE dbo.�̽�΢�Ž�ɫȨ��;

--΢�Ŷ�
--ϵͳ����Աӵ������Ȩ��
INSERT dbo.�̽�΢�Ž�ɫȨ��
        ( �̽̽�ɫ���, �̽�΢��Ȩ�ޱ�� )
SELECT 1,��� FROM dbo.�̽�΢��Ȩ��;

--ҽԺ����Ա�Ϳ��ҹ���Աӵ��"����Ա"�˵���Ȩ��
--������ʦ��"��������"��Ȩ��;
INSERT dbo.�̽�΢�Ž�ɫȨ��
        ( �̽̽�ɫ���, �̽�΢��Ȩ�ޱ�� )
VALUES  ( 2,2),(3,2),(4,1);

GO

TRUNCATE TABLE dbo.�̽�����;
INSERT dbo.�̽�����
        ( ��ʱ�μ�ͨ��ʱ���ٷֱ� ,
          ���ۿ��Լ���ְٷֱ� ,
          ��������뿪�������
        )
VALUES  ( 80 , -- ��ʱ�μ�ͨ��ʱ���ٷֱ� - int
          60 , -- ���ۿ��Լ���ְٷֱ� - int
          3  -- ��������뿪������� - int
        );
GO


DELETE  �ֵ�
WHERE   ���� = '�������׶�';

INSERT  dbo.�ֵ�
        ( ����, ֵ, �ϼ����, ����, ����, ��ע )
VALUES  ( N'�������׶�', N'��', 0, 0, 0, N'' ),
        ( N'�������׶�', N'��', 0, 0, 0, N'' );

		GO
        
TRUNCATE TABLE �̽���������;		
INSERT dbo.�̽���������
        ( ���, ����, ��С����, ������, ��ֵ, ��ע )
VALUES  ( 1, N'����ѡ����',1,1,1,N''),
( 2, N'����ѡ����',2,10,1,N''),
( 3, N'��������ѡ����',1,10,1,N''),
( 4, N'�ж���',1,1,1,N'�ж���ı���Ϊ�Դ�,������ABCD')

GO
