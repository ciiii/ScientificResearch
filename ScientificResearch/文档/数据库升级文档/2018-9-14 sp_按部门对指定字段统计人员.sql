
--sp_�����Ŷ�ָ���ֶ�ͳ����Ա 'ѧ��'
CREATE PROC [dbo].[sp_�����Ŷ�ָ���ֶ�ͳ����Ա]
    (
      @�ֶ��� NVARCHAR(100) 
    )
AS
    
    DECLARE @�� NVARCHAR(2000);

    SELECT  @�� = STUFF(( SELECT ',' + ֵ
                         FROM   �ֵ�
                         WHERE  ���� = @�ֶ���
                       FOR
                         XML PATH('')
                       ), 1, 0, 'δָ��');

    --SELECT  @��;
    DECLARE @sql NVARCHAR(MAX);

	--DECLARE @�ϼ� NVARCHAR(1000) = N'δָ�� + ����ʡ�� + �л�ҽѧ���л�ϵ���ڿ��� + �Ƽ�ͳ��Դ�ڿ���';
    DECLARE @�ϼ� NVARCHAR(1000);
    SELECT  @�ϼ� = STUFF(( SELECT    '+[' + ID+']'
                          FROM      dbo.SplitStringToTable(@��, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
    --SELECT  @�ϼ�;

	--DECLARE @sqlIn  NVARCHAR(1000)= N'[δָ��],[����ʡ��],[�л�ҽѧ���л�ϵ���ڿ���],[�Ƽ�ͳ��Դ�ڿ���]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@��, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');
    --SELECT  @sqlIn;

	--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(δָ��) ,SUM(����ʡ��) ,SUM(�л�ҽѧ���л�ϵ���ڿ���) ,SUM(�Ƽ�ͳ��Դ�ڿ���)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum([' + ID + '])'
                                 FROM   dbo.SplitStringToTable(@��, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');
    --SELECT  @sqlSelect;

    SET @sql = CONCAT(N'
	WITH cte AS (SELECT a.��������,iif(', @�ֶ���, ' IS NULL OR ', @�ֶ���, '='''',''δָ��'',', @�ֶ���, ')AS �� FROM dbo.v1_��Ա_�������� a),
         ctePivot AS ( SELECT   * ,', @�ϼ�, ' AS �ϼ�
			FROM cte PIVOT ( COUNT(��) FOR �� IN ( ', @sqlIn, ' ) )  AS t)
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''�ܼ�'' ,
            ', @sqlSelect, ' ,
            SUM(�ϼ�)
    FROM    ctePivot');

    --SELECT  @sql;

    EXEC sys.sp_executesql @sql;
GO
