

ALTER PROC [dbo].[sp_人员_导入] ( @tt tt_人员导入 READONLY )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @t tt_部门;

	--传入的人员列表中,不为空或''的唯一部门名称;
    WITH    cte
              AS ( SELECT DISTINCT
                            部门名称
                   FROM     @tt
                   WHERE    部门名称 IS NOT NULL
                            AND LTRIM(RTRIM(部门名称)) <> ''
                 )
	--此部门名称不存在于现有的部门名称中时,插入到临时表
	INSERT  @t
        ( 编号 ,
          上级部门编号 ,
          名称 ,
          负责人编号 ,
          排序值 ,
          备注 ,
          是否启用
        )
        SELECT  0 ,
                0 ,
                a.部门名称 ,
                NULL ,
                0 ,
                N'' ,
                1
        FROM    cte a
                LEFT JOIN 部门 b ON a.部门名称 = b.名称
        WHERE   b.名称 IS NULL;

	EXEC dbo.sp_部门_增改 @tt_部门 = @t

    INSERT  dbo.人员
            ( 工号 ,
              密码 ,
              姓名 ,
              部门编号 ,
              英文名 ,
              性别 ,
              身份证 ,
              出生日期 ,
              入职日期 ,
              手机 ,
              QQ ,
              邮箱 ,
              籍贯 ,
              毕业日期 ,
              合同开始日期 ,
              合同结束日期 ,
              参加工作日期 ,
              专业技术获得日期 ,
              职务任职日期 ,
              学位 ,
              学历 ,
              政治面貌 ,
              技术职称类别 ,
              技术职称 ,
              第二技术职称类别 ,
              第二技术职称 ,
              婚姻情况 ,
              学制 ,
              学历性质 ,
              学习形式 ,
              人员类别 ,
              个人身份 ,
              民族 ,
              专业技术级别 ,
              所学专业名称 ,
              岗位性质 ,
              职务名称 ,
              职务级别 ,
              岗位名称 ,
              岗位类型 ,
              学科门类 ,
              一级学科 ,
              二级学科 ,
              三级学科 ,
              人员类型 ,
              获得最高学历的院校 ,
              获得最高学位的院校 ,
              住宅地址 ,
              学术特长 ,
              研究方向 ,
              个人获得的荣誉和奖项 ,
              备注 ,
              是否启用
            )
            SELECT  a.工号 ,
                    a.密码 ,
                    a.姓名 ,
                    b.编号 ,
                    a.英文名 ,
                    a.性别 ,
                    a.身份证 ,
                    a.出生日期 ,
                    a.入职日期 ,
                    a.手机 ,
                    a.QQ ,
                    a.邮箱 ,
                    a.籍贯 ,
                    a.毕业日期 ,
                    a.合同开始日期 ,
                    a.合同结束日期 ,
                    a.参加工作日期 ,
                    a.专业技术获得日期 ,
                    a.职务任职日期 ,
                    a.学位 ,
                    a.学历 ,
                    a.政治面貌 ,
                    a.技术职称类别 ,
                    a.技术职称 ,
                    a.第二技术职称类别 ,
                    a.第二技术职称 ,
                    a.婚姻情况 ,
                    a.学制 ,
                    a.学历性质 ,
                    a.学习形式 ,
                    a.人员类别 ,
                    a.个人身份 ,
                    a.民族 ,
                    a.专业技术级别 ,
                    a.所学专业名称 ,
                    a.岗位性质 ,
                    a.职务名称 ,
                    a.职务级别 ,
                    a.岗位名称 ,
                    a.岗位类型 ,
                    a.学科门类 ,
                    a.一级学科 ,
                    a.二级学科 ,
                    a.三级学科 ,
                    a.人员类型 ,
                    a.获得最高学历的院校 ,
                    a.获得最高学位的院校 ,
                    a.住宅地址 ,
                    a.学术特长 ,
                    a.研究方向 ,
                    a.个人获得的荣誉和奖项 ,
                    a.备注 ,
                    1
            FROM    @tt a
                    LEFT JOIN 部门 b ON a.部门名称 = b.名称;

    COMMIT TRAN;