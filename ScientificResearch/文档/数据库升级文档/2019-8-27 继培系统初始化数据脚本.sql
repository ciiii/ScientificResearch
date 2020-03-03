
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
VALUES  ( 1,0,1,0,N'ѧϰ',N'ForClass', 1,N'',N'' ),
( 101,1,2,1,N'ѧϰ�',N'ForClassActivity', 1,N'',N'' ),
( 102,1,2,2,N'ѧϰ��Դ',N'ForClassMaterial', 1,N'',N'' ),
( 103,1,2,3,N'�����Դ',N'ForClassQuestionBank', 1,N'',N'' ),

( 2,0,1,0,N'����',N'Test', 1,N'',N'' ),
( 201,2,2,1,N'���ۿ���',N'TestTheory', 1,N'',N'' ),
( 202,2,2,2,N'�Ծ�',N'TestExaminationPaper', 1,N'',N'' ),
( 203,2,2,3,N'���',N'TestQuestionBank', 1,N'',N'' ),
( 204,2,2,4,N'��������',N'TestOperation', 1,N'',N'' ),
( 205,2,2,5,N'���ֱ�',N'TestScoreTable', 1,N'',N'' ),
( 206,2,2,6,N'�Բ�',N'TestSelf', 1,N'',N'' ),

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
( 3,205),( 3,206),
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


ALTER VIEW [dbo].[v_�̽����ۿ��Բ������]
AS
    SELECT  b.���Ա��,
	a.�������α�� ,
            a.���������� ,
            a.�����˱�� ,
            dbo.FNGetPersonInfoByType(a.����������, a.�����˱��) AS �����˳�ν ,
            a.���⿪ʼʱ�� ,
			a.�������ʱ��,
            a.�÷� ,
            CAST(IIF(a.�÷� >= c.�������, 1, 0) AS BIT) AS �Ƿ�ͨ��
    FROM    dbo.�̽����ۿ��Բ������ a
            JOIN dbo.�̽̿������� b ON a.�������α�� = b.���
			JOIN �̽����ۿ��� c ON b.���Ա�� = c.���

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
                    SELECT  @result = '�����˻�����';
            END;

        IF ( @PersonType = '��Ա' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '����ҽԺԱ��';
                ELSE
                    SELECT  @result =CONCAT(��������,'/',����,'/', ����)
                    FROM    dbo.v1_��Ա_��������
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



ALTER PROCEDURE [dbo].[sp_GetList]
    @tbName NVARCHAR(200) ,        --����
    @tbFields NVARCHAR(1000) = '*' ,      --�����ֶ�
    @keyFields NVARCHAR(1000) = '' ,      --�����ֶ�
    @OrderType BIT = 0 ,  --��������,1������,0�ǽ���
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(4000) = ''     --��ѯ����
    --@Total INT OUTPUT ,         --�����ܼ�¼��
    --@SQLstr NVARCHAR(4000) OUTPUT
AS
    DECLARE @strSql VARCHAR(MAX);     --�����
    DECLARE @strOrder VARCHAR(200);    --����
    DECLARE @strSqlCount NVARCHAR(MAX);  --��ѯ��¼���������
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
--------------����-----------------1�ǽ���,0δ����
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
    @tbName NVARCHAR(200) ,        --����
    @tbFields NVARCHAR(1000) = '*' ,      --�����ֶ�
    @keyFields NVARCHAR(1000) = '' ,      --�����ֶ�
    @OrderType BIT = 0 ,  --��������,1������,0�ǽ���
    @PageSize INT = 10 ,                 --ҳ�ߴ�
    @PageIndex INT = 1 ,                --ҳ��
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(4000) = ''     --��ѯ����
    --@Total INT OUTPUT ,         --�����ܼ�¼��
    --@SQLstr NVARCHAR(4000) OUTPUT
AS
    DECLARE @strSql VARCHAR(MAX);     --�����
    DECLARE @strOrder VARCHAR(200);    --����
    DECLARE @strSqlCount NVARCHAR(MAX);  --��ѯ��¼���������
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
--------------�ܼ�¼��---------------
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
