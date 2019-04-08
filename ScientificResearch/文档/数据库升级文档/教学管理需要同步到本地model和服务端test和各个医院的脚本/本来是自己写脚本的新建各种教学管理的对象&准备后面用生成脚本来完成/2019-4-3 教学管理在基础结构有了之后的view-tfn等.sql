
IF ( OBJECT_ID('V��ѧ����') IS NOT NULL )
    DROP VIEW V��ѧ����;
GO

CREATE VIEW V��ѧ����
AS
    SELECT  a.��� ,
            a.�ϼ����ű�� ,
            a.���� ,
            a.�����˱�� ,
            b.���� AS ���������� ,
            a.����ֵ ,
            a.��ע ,
            a.�Ƿ����� ,
            IIF(EXISTS ( SELECT 1
                         FROM   ���� b
                         WHERE  b.�ϼ����ű�� = a.��� ), 1, 0) AS �Ƿ�����¼� ,
            a1.���ҹ���Ա��� ,
            b1.���� AS ���ҹ���Ա���� ,
            x.������ʦ����
    FROM    dbo.���� a
            JOIN dbo.��ѧ���� a1 ON a.��� = a1.���
            LEFT JOIN dbo.��Ա b ON a.�����˱�� = b.���
            LEFT JOIN dbo.��Ա b1 ON a1.���ҹ���Ա��� = b1.���
            OUTER APPLY ( SELECT    COUNT(1) AS ������ʦ����
                          FROM      ��ѧ������ʦ
                          WHERE     ��ѧ���ұ�� = a.���
                        ) x;
GO

IF ( OBJECT_ID('V��ѧ������ʦ') IS NOT NULL )
    DROP VIEW V��ѧ������ʦ;
GO

CREATE VIEW V��ѧ������ʦ
AS
    SELECT  a.��ѧ���ұ�� ,
            a.������ʦ��� ,
            a.��ע ,
            b.���� ,
            b.���ű�� ,
            b.Ӣ���� ,
            b.�Ա� ,
            b.�ֻ� ,
            b.�Ƿ�����
    FROM    ��ѧ������ʦ a
            JOIN dbo.��Ա b ON a.������ʦ��� = b.���;
GO


ALTER PROCEDURE [dbo].[sp_GetList]
    @tbName NVARCHAR(200) ,        --����
    @tbFields NVARCHAR(1000) = '*' ,      --�����ֶ�
    @keyFields NVARCHAR(1000) = '' ,      --�����ֶ�
    @OrderType BIT = 0 ,  --��������,1������,0�ǽ���
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(500) = ''     --��ѯ����
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
    @strWhere NVARCHAR(500) = ''     --��ѯ����
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







