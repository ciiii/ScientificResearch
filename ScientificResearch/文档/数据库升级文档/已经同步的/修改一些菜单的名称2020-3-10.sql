
TRUNCATE TABLE dbo.�̽�Ȩ��;

--��ҳ��˭���е�
INSERT dbo.�̽�Ȩ��
        ( ���, �ϼ����, ���, ����ֵ, ����, �����, �Ƿ�˵�, ͼ��, ��ע )
VALUES  ( 1,0,1,0,N'ѧϰ',N'ForClass', 1,N'',N'' ),
( 101,1,2,1,N'ѧϰ�',N'ForClassActivity', 1,N'',N'' ),
( 102,1,2,2,N'ѧϰ��Դ',N'ForClassMaterial', 1,N'',N'' ),
( 103,1,2,3,N'�����Դ',N'ForClassQuestionBank', 1,N'',N'' ),

( 2,0,1,0,N'����',N'Test', 1,N'',N'' ),
( 201,2,2,1,N'���ۿ���',N'TestTheory', 1,N'',N'' ),
( 202,2,2,2,N'�Ծ�����',N'TestExaminationPaper', 1,N'',N'' ),
( 203,2,2,3,N'�����Դ',N'TestQuestionBank', 1,N'',N'' ),
( 204,2,2,4,N'��������',N'TestOperation', 1,N'',N'' ),
( 205,2,2,5,N'���ֱ�',N'TestScoreTable', 1,N'',N'' ),
( 206,2,2,6,N'������ҵ',N'TestSelf', 1,N'',N'' ),

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

