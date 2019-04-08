
ALTER PROCEDURE [dbo].[sp_GetList]
    @tbName NVARCHAR(200) ,        --表名
    @tbFields NVARCHAR(1000) = '*' ,      --返回字段
    @keyFields NVARCHAR(1000) = '' ,      --主键字段
    @OrderType BIT = 0 ,  --排序类型,1是升序,0是降序
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(500) = ''     --查询条件
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
    @strWhere NVARCHAR(500) = ''     --查询条件
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







