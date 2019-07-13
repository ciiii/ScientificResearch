
CREATE PROC [dbo].[sp_���ĳɹ�ͳ��] 
AS
DECLARE @��¼��� NVARCHAR(1000);
SET @��¼��� = 'δָ��,����ʡ��,�л�ҽѧ���л�ϵ���ڿ���,�Ƽ�ͳ��Դ�ڿ���'
    DECLARE @sql NVARCHAR(2000);
--DECLARE @�ϼ� NVARCHAR(1000) = N'δָ�� + ����ʡ�� + �л�ҽѧ���л�ϵ���ڿ��� + �Ƽ�ͳ��Դ�ڿ���';
    DECLARE @�ϼ� NVARCHAR(1000);
    SELECT  @�ϼ� = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@��¼���, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');

--DECLARE @sqlIn  NVARCHAR(1000)= N'[δָ��],[����ʡ��],[�л�ҽѧ���л�ϵ���ڿ���],[�Ƽ�ͳ��Դ�ڿ���]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@��¼���, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(δָ��) ,SUM(����ʡ��) ,SUM(�л�ҽѧ���л�ϵ���ڿ���) ,SUM(�Ƽ�ͳ��Դ�ڿ���)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@��¼���, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.�������� ,
                        c.��¼���
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ����� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 1
						JOIN ���� b1 ON b1.����ģ���� = 300 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        LEFT JOIN �ڿ� c ON b.������ = c.���
             ),
        cteSplit
          AS ( SELECT   cte.�������� as ����,
                        ISNULL(Split.�ֽ�����¼���, ''δָ��'') AS �ֽ�����¼���
               FROM     cte
                        OUTER APPLY ( SELECT    ID AS �ֽ�����¼���
                                      FROM      dbo.SplitStringToTable(cte.��¼���,
                                                              '','')
                                    ) AS Split
             ),
        ctePivot
          AS ( SELECT   * ,
                        ', @�ϼ�, ' AS �ϼ�
               FROM     cteSplit PIVOT ( COUNT(�ֽ�����¼���) FOR �ֽ�����¼��� IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''�ܼ�'' ,
            ', @sqlSelect, ' ,
            SUM(�ϼ�)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;
GO



CREATE PROC sp_�񽱳ɹ�ͳ��
AS
    DECLARE @�񽱼��� NVARCHAR(1000);

    SELECT  @�񽱼��� = STUFF(( SELECT  ',' + ֵ
                            FROM    �ֵ�
                            WHERE   ���� = '�񽱼���'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');

    DECLARE @sql NVARCHAR(2000);

    DECLARE @�ϼ� NVARCHAR(1000);
    SELECT  @�ϼ� = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@�񽱼���, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');


    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@�񽱼���, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@�񽱼���, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.�������� as ���� ,
                        b.�񽱼���
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ��� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 4
						JOIN ���� b1 ON b1.����ģ���� = 303 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @�ϼ�, ' AS �ϼ�
               FROM     cte PIVOT ( COUNT(�񽱼���) FOR �񽱼��� IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''�ܼ�'' ,
            ', @sqlSelect, ' ,
            SUM(�ϼ�)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

GO


CREATE PROC sp_�����ɹ�ͳ��
AS
    DECLARE @�������� NVARCHAR(1000);

    SELECT  @�������� = STUFF(( SELECT  ',' + ֵ
                            FROM    �ֵ�
                            WHERE   ���� = '��������'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');
						  --SELECT @��������;
    DECLARE @sql NVARCHAR(2000);

    DECLARE @�ϼ� NVARCHAR(1000);
    SELECT  @�ϼ� = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@��������, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
		
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@��������, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@��������, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.�������� as ����,
                        b.��������
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ����� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 2
						JOIN ���� b1 ON b1.����ģ���� = 301 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @�ϼ�, ' AS �ϼ�
               FROM     cte PIVOT ( COUNT(��������) FOR �������� IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''�ܼ�'' ,
            ', @sqlSelect, ' ,
            SUM(�ϼ�)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

	GO
    
	
CREATE PROC sp_ר���ɹ�ͳ��
AS
    DECLARE @ר������ NVARCHAR(1000);

    SELECT  @ר������ = STUFF(( SELECT  ',' + ֵ
                            FROM    �ֵ�
                            WHERE   ���� = 'ר������'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');
						  --SELECT @ר������;
    DECLARE @sql NVARCHAR(2000);

    DECLARE @�ϼ� NVARCHAR(1000);
    SELECT  @�ϼ� = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@ר������, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
		
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@ר������, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@ר������, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.�������� as ����,
                        b.ר������
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ�ר�� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 3
						JOIN ���� b1 ON b1.����ģ���� = 302 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @�ϼ�, ' AS �ϼ�
               FROM     cte PIVOT ( COUNT(ר������) FOR ר������ IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''�ܼ�'' ,
            ', @sqlSelect, ' ,
            SUM(�ϼ�)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

	GO
    

--sp_������ͳ�Ƴɹ� '��������','����'
--sp_������ͳ�Ƴɹ� 'ְ������','ְ��'
--sp_������ͳ�Ƴɹ� 'רҵ��������','רҵ��������'
--sp_������ͳ�Ƴɹ� '��λ����','��λ����'
--sp_������ͳ�Ƴɹ� 'ѧ��','ѧ��'
--sp_������ͳ�Ƴɹ� 'ѧ������','ѧ������'

CREATE PROC [dbo].[sp_��ָ���ֶ�ͳ�Ƴɹ�] (@�ֶ��� NVARCHAR(100),@�ֶ���ʾ�� NVARCHAR(50))
AS

DECLARE @��¼��� NVARCHAR(1000);
SET @��¼��� = 'δָ��,����ʡ��,�л�ҽѧ���л�ϵ���ڿ���,�Ƽ�ͳ��Դ�ڿ���'

--DECLARE @�񽱼��� NVARCHAR(1000);

--    SELECT  @�񽱼��� = STUFF(( SELECT  ',' + ֵ
--                            FROM    �ֵ�
--                            WHERE   ���� = '�񽱼���'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');

-- DECLARE @�������� NVARCHAR(1000);

--    SELECT  @�������� = STUFF(( SELECT  ',' + ֵ
--                            FROM    �ֵ�
--                            WHERE   ���� = '��������'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');
--						  --SELECT @��������;

-- DECLARE @ר������ NVARCHAR(1000);

--    SELECT  @ר������ = STUFF(( SELECT  ',' + ֵ
--                            FROM    �ֵ�
--                            WHERE   ���� = 'ר������'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');
--						  --SELECT @ר������;

DECLARE @�� NVARCHAR(2000);
--SET @�� = CONCAT(@��¼���,',',@�񽱼���,',',@��������,',',@ר������);
SET @�� = CONCAT('��',',','����',',','ר��',',',@��¼���);

    DECLARE @sql NVARCHAR(MAX);
--DECLARE @�ϼ� NVARCHAR(1000) = N'δָ�� + ����ʡ�� + �л�ҽѧ���л�ϵ���ڿ��� + �Ƽ�ͳ��Դ�ڿ���';
    DECLARE @�ϼ� NVARCHAR(1000);
    SELECT  @�ϼ� = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@��, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');

--DECLARE @sqlIn  NVARCHAR(1000)= N'[δָ��],[����ʡ��],[�л�ҽѧ���л�ϵ���ڿ���],[�Ƽ�ͳ��Դ�ڿ���]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@��, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(δָ��) ,SUM(����ʡ��) ,SUM(�л�ҽѧ���л�ϵ���ڿ���) ,SUM(�Ƽ�ͳ��Դ�ڿ���)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum(' + ID + ')'
                                 FROM   dbo.SplitStringToTable(@��, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.',@�ֶ���,' ,
                        c.��¼��� 
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ����� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 1
						JOIN ���� b1 ON b1.����ģ���� = 300 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        LEFT JOIN �ڿ� c ON b.������ = c.���
             ),

        cteSplit
          AS ( SELECT   cte.',@�ֶ���,' as ',@�ֶ���ʾ��,',
                        ISNULL(Split.�ֽ�����¼���, ''δָ��'') as ��
               FROM     cte
                        OUTER APPLY ( SELECT    ID AS �ֽ�����¼���
                                      FROM      dbo.SplitStringToTable(cte.��¼���,
                                                              '','')
                                    ) AS Split
             ),

		cte��
          AS ( SELECT   a1.',@�ֶ���,' as ',@�ֶ���ʾ��,' ,
                        ''��''   as ��
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ��� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 4
						JOIN ���� b1 ON b1.����ģ���� = 303 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
             ),

		cte����
          AS ( SELECT   a1.',@�ֶ���,' as ',@�ֶ���ʾ��,',
                        ''����''   as ��
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ����� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 2
						JOIN ���� b1 ON b1.����ģ���� = 301 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        
             ),

		cteר��
          AS ( SELECT   a1.',@�ֶ���,' as ',@�ֶ���ʾ��,',
                        ''ר��''   as ��
               FROM     dbo.�ɹ����� a
                        JOIN dbo.v1_��Ա_�������� a1 ON a.���߱�� = a1.���
                        JOIN �ɹ�ר�� b ON a.�ɹ���� = b.���
                                       AND �ɹ����� = 3
						JOIN ���� b1 ON b1.����ģ���� = 302 AND b.��� = b1.��Ŀ��� AND b1.״̬ = 1
                        
             ),
		cteAll as(
			select  IIF(',@�ֶ���ʾ��,' IS NULL OR ',@�ֶ���ʾ��,' = '''',''δָ��'',',@�ֶ���ʾ��,') as ',@�ֶ���ʾ��,',�� from cte�� union all
			select  IIF(',@�ֶ���ʾ��,' IS NULL OR ',@�ֶ���ʾ��,' = '''',''δָ��'',',@�ֶ���ʾ��,') as ',@�ֶ���ʾ��,',�� from cte���� union all
			select  IIF(',@�ֶ���ʾ��,' IS NULL OR ',@�ֶ���ʾ��,' = '''',''δָ��'',',@�ֶ���ʾ��,') as ',@�ֶ���ʾ��,',�� from cteר�� union all
			select  IIF(',@�ֶ���ʾ��,' IS NULL OR ',@�ֶ���ʾ��,' = '''',''δָ��'',',@�ֶ���ʾ��,') as ',@�ֶ���ʾ��,',�� from cteSplit
		),
        ctePivot
          AS ( SELECT   * ,
                        ', @�ϼ�, ' AS �ϼ�
               FROM     cteAll PIVOT ( COUNT(��) FOR �� IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''�ܼ�'' ,
            ', @sqlSelect, ' ,
            SUM(�ϼ�)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;
GO
