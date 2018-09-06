
/****** Object:  StoredProcedure [dbo].[sp_专家评分_增改]    Script Date: 2018/9/3 16:30:41 ******/
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO


ALTER PROC [dbo].[sp_专家评分_增改]
    (
      --@流程模板编号 INT ,
      @步骤编号 INT ,
      @tt tt_专家评分 READONLY
    )
AS
    DECLARE @编号 tt_编号; 
    DECLARE @项目编号 INT;
    DECLARE @流程模板编号 INT;

    SELECT  @项目编号 = b.项目编号 ,
            @流程模板编号 = b.流程模板编号
    FROM    步骤 a
            JOIN 流程 b ON a.流程编号 = b.编号
    WHERE   a.编号 = @步骤编号;

    MERGE dbo.专家评分 t
    USING @tt s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号
        AND s.评分项 = t.评分项
    WHEN MATCHED THEN
        UPDATE SET
               t.专家编号 = s.专家编号 ,
               t.[评分] = s.[评分] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @项目编号 ,
                 s.专家编号 ,
                 s.评分项 ,
                 s.评分 ,
                 s.备注 ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号 THEN
        DELETE
    OUTPUT
        Inserted.编号
        INTO @编号;
    SELECT  *
    FROM    @编号;
;