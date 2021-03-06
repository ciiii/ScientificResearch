
/****** Object:  UserDefinedFunction [dbo].[fn_获取项目名称]    Script Date: 2018/9/5 9:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER FUNCTION [dbo].[fn_获取项目名称] ( @流程模板编号 INT, @项目编号 INT )
RETURNS NVARCHAR(100)
AS
    BEGIN
        DECLARE @项目名称 NVARCHAR(50);
        SELECT  @项目名称 = CASE @流程模板编号
                          WHEN 100
                          THEN ( SELECT CONCAT(姓名, '在[', 任职团体名称, ']任职申请')
                                 FROM   dbo.v2_任职
                                 WHERE  编号 = @项目编号
                               )
                          WHEN 200 THEN ( SELECT    活动名称
                                          FROM      dbo.主办讲座
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 201 THEN ( SELECT    活动名称
                                          FROM      dbo.v3_讲座反馈
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 210 THEN ( SELECT    会议名称
                                          FROM      dbo.参加会议
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 211 THEN ( SELECT    会议名称
                                          FROM      dbo.v3_参加会议反馈
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 300 THEN ( SELECT    论文标题
                                          FROM      dbo.成果论文
                                          WHERE     编号 = @项目编号
                                        )
	--WHEN 310 THEN '认领论文'
                          WHEN 301 THEN ( SELECT    著作名称
                                          FROM      dbo.成果著作
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 302 THEN ( SELECT    专利名称
                                          FROM      dbo.成果专利
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 303 THEN ( SELECT    获奖名称
                                          FROM      dbo.成果获奖
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 400 THEN ( SELECT    项目名称
                                          FROM      dbo.纵向项目申报
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 410 THEN ( SELECT    CONCAT(项目中文名称,'[',项目编号,']')
                                          FROM      dbo.纵向项目立项
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 420
                          THEN ( SELECT  CONCAT(b420.项目中文名称,'[',b420.项目编号,']')
                                 FROM   dbo.纵向项目中检 a420
                                        JOIN dbo.纵向项目立项 b420 ON a420.纵向项目编号 = b420.编号
                                 WHERE  a420.编号 = @项目编号
                               )
                          WHEN 430 THEN ( SELECT    CONCAT(项目中文名称,'[',项目编号,']') 
                                          FROM      dbo.v2_纵向项目变更_详情
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 440
                          THEN ( SELECT  CONCAT(b440.项目中文名称,'[',b440.项目编号,']')
                                 FROM   dbo.纵向项目结题 a440
                                        JOIN dbo.纵向项目立项 b440 ON a440.纵向项目编号 = b440.编号
                                 WHERE  a440.编号 = @项目编号
                               )
                          WHEN 450 THEN ( SELECT      CONCAT(合同名称,'[', 合同编号,']')
                                          FROM      dbo.横向项目
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 460 THEN ( SELECT     CONCAT(合同名称,'[', 合同编号,']')
                                          FROM      dbo.v2_横向项目变更_详情
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 470
                          THEN ( SELECT   CONCAT(b470.合同名称,'[', b470.合同编号,']')
                                 FROM   dbo.横向项目结题 a470
                                        JOIN dbo.横向项目 b470 ON a470.横向项目编号 = b470.编号
                                 WHERE  a470.编号 = @项目编号
                               )
                          WHEN 500 THEN ( SELECT    项目名称
                                          FROM      dbo.v2_项目经费到账_纵向
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 510 THEN ( SELECT    项目名称
                                          FROM      dbo.v2_项目经费到账_横向
                                          WHERE     编号 = @项目编号
                                        )
                          WHEN 600 THEN ( SELECT    项目名称
                                          FROM      dbo.v2_报销
                                          WHERE     编号 = @项目编号
                                        )
                        END;

        RETURN @项目名称;
    END;
              