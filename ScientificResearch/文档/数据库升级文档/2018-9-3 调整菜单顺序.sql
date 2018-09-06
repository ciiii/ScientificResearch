ALTER TABLE 权限 ADD 排序 INT NOT NULL DEFAULT(0);
GO
UPDATE  dbo.权限
SET     排序 = 编号;
UPDATE  权限
SET     排序 = 1
WHERE   编号 = 1;
UPDATE  权限
SET     排序 = 5
WHERE   编号 = 2;
UPDATE  权限
SET     排序 = 4
WHERE   编号 = 3;
UPDATE  权限
SET     排序 = 6
WHERE   编号 = 4;
UPDATE  权限
SET     排序 = 3
WHERE   编号 = 5;
UPDATE  权限
SET     排序 = 2
WHERE   编号 = 6;
GO
EXEC dbo.sp_Rebuild;
GO


ALTER PROC [dbo].[sp_登录]
    (
      @工号 NVARCHAR(50) ,
      @密码 NVARCHAR(50)
    )
AS
    DECLARE @编号 INT;
    DECLARE @姓名 NVARCHAR(50);

    SELECT  @编号 = 编号 ,
            @姓名 = 姓名
    FROM    dbo.人员
    WHERE   工号 = @工号
            AND 密码 = @密码;

    IF ( @编号 IS NOT NULL )
        BEGIN
            --DECLARE @tt_登录日志 tt_登录日志;
            --INSERT  @tt_登录日志
            --        ( 工号, 姓名, 登录时间 )
            --VALUES  ( @工号, @姓名, GETDATE() );
            --        --SELECT  工号 ,
            --        --        姓名 ,
            --        --        GETDATE()
            --        --FROM    @tt_v1_人员_带部门名;
            
            --EXEC dbo.sp_登录日志_增 @tt_登录日志; 
			
            SELECT  *
            FROM    v1_人员_带部门名
            WHERE   编号 = @编号;

            SELECT  *
            FROM    dbo.tfn_人员的权限(@工号)
            ORDER BY 排序;
        END;

    ELSE
        THROW 50001,N'登录信息错误',1;
GO


SELECT  *
FROM    权限;
