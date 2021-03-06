
CREATE VIEW [dbo].[v3_主办讲座报销]
AS
    SELECT  a.* ,
            ISNULL(b.待审核报销, 0) AS 待审核报销 ,
            ISNULL(b.已审核报销, 0) AS 已审核报销
    FROM    dbo.v2_主办讲座 a
            OUTER APPLY ( SELECT    SUM(CASE b2.状态
                                          WHEN 0 THEN b1.报销金额
                                          ELSE 0
                                        END) AS 待审核报销 ,
                                    SUM(CASE b2.状态
                                          WHEN 1 THEN b1.报销金额
                                          ELSE 0
                                        END) AS 已审核报销
                          FROM      dbo.报销 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 600
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 200
                                    AND b1.项目编号 = a.编号
                        ) b;
GO

ALTER PROC [dbo].[sp_主办讲座_增改]
    (
      @tt tt_主办讲座 READONLY ,
      @tt_项目经费预算 tt_项目经费预算 READONLY

    )
AS
    DECLARE @流程模板编号 INT = 200;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 

    MERGE dbo.主办讲座 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[活动名称] = s.[活动名称] ,
               t.[所属部门编号] = s.[所属部门编号] ,
               t.[活动经费] = s.[活动经费] ,
               t.[会议类型] = s.[会议类型] ,
               t.[活动对象] = s.[活动对象] ,
               t.[开始时间] = s.[开始时间] ,
               t.[结束时间] = s.[结束时间] ,
               t.[主办人编号] = s.[主办人编号] ,
               t.[主讲人姓名] = s.[主讲人姓名] ,
               t.[主讲人国别] = s.[主讲人国别] ,
               t.[主讲人单位] = s.[主讲人单位] ,
               t.[主讲人学位] = s.[主讲人学位] ,
               t.[主讲人职称] = s.[主讲人职称] ,
               t.[主讲人简历路径] = s.[主讲人简历路径] ,
               t.[讲座地点] = s.[讲座地点] ,
               t.[内容概述] = s.[内容概述]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [活动名称] ,
                 [所属部门编号] ,
                 [活动经费] ,
                 [会议类型] ,
                 [活动对象] ,
                 [开始时间] ,
                 [结束时间] ,
                 [主办人编号] ,
                 [主讲人姓名] ,
                 [主讲人国别] ,
                 [主讲人单位] ,
                 [主讲人学位] ,
                 [主讲人职称] ,
                 [主讲人简历路径] ,
                 [讲座地点] ,
                 [内容概述] 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;


    DECLARE @项目编号 INT;
    SELECT  @项目编号 = 编号
    FROM    @编号;

	
	--项目经费预算
    MERGE dbo.项目经费预算 t
    USING @tt_项目经费预算 s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号
        AND t.项目支出类型 = s.项目支出类型
        AND t.项目支出内容 = s.项目支出内容
    WHEN MATCHED THEN
        UPDATE SET
               t.财务科目 = s.财务科目 ,
               t.批准经费 = s.批准经费 ,
               t.配套经费 = s.配套经费 ,
               t.编制依据 = s.编制依据
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @项目编号 ,
                 s.项目支出类型 ,
                 s.项目支出内容 ,
                 s.财务科目 ,
                 s.批准经费 ,
                 s.配套经费 ,
                 s.编制依据
               )
    WHEN NOT MATCHED BY SOURCE AND  t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号 THEN
        DELETE;

    COMMIT TRAN;

    SELECT  *
    FROM    @编号;

	GO
    
INSERT  dbo.权限
        ( 编号 ,
          上级编号 ,
          名称 ,
          路径 ,
          类型 ,
          排序 ,
          图标 ,
          备注
        )
VALUES  ( 60103 , -- 编号 - int
          601 , -- 上级编号 - int
          N'主办讲座报销管理' , -- 名称 - nvarchar(50)
          N'学术活动/申请学术讲座/主办讲座报销管理.html' , -- 路径 - nvarchar(500)
          1 , -- 类型 - bit
          60103 , -- 排序 - int
          N'' , -- 图标 - nvarchar(50)
          N''  -- 备注 - nvarchar(500)
        );

INSERT  角色权限
        ( 角色编号 ,
          权限编号
        )
        SELECT  角色编号 ,
                60103
        FROM    角色权限
        WHERE   权限编号 = 60203;


UPDATE  角色
SET     名称 = '科研人员'
WHERE   编号 = 3;



UPDATE  步骤模板
SET     名称 = '财务初审'
WHERE   编号 = 60002;
INSERT  dbo.步骤模板
        ( 编号, 流程模板编号, 步骤类型编号, 名称, 上级编号, 备注 )
VALUES  ( 60003, -- 编号 - int
          600, -- 流程模板编号 - int
          1, -- 步骤类型编号 - int
          N'科研管理员复审', -- 名称 - nvarchar(100)
          60002, -- 上级编号 - int
          N''  -- 备注 - nvarchar(1000)
          );

UPDATE  步骤角色
SET     角色编号 = 0
WHERE   步骤模板编号 = 60001;
UPDATE  步骤角色
SET     角色编号 = 13
WHERE   步骤模板编号 = 60002;
INSERT  dbo.步骤角色
        ( 步骤模板编号, 角色编号 )
VALUES  ( 60003, -- 步骤模板编号 - int
          5  -- 角色编号 - int
          );


INSERT dbo.角色权限
        ( 角色编号, 权限编号 )
VALUES  ( 13,6),(13,601),(13,60103),(13,602),(13,60203)

GO
