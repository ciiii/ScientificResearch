ALTER VIEW [dbo].[v2_纵向项目立项_详情] AS
SELECT  a.* ,
        --b.名称 AS 成果归属部门名称 ,
        c.工号 AS 负责人工号 ,
        c.姓名 AS 负责人姓名 ,
        c.部门编号 AS 负责人部门编号 ,
        c.部门名称 AS 负责人部门名称 ,
        d.姓名 AS 登记人姓名 ,
        d.部门编号 AS 登记人部门编号 ,
        d.部门名称 AS 登记人部门名称
FROM    dbo.纵向项目立项 a
        --LEFT JOIN 部门 b ON a.成果归属部门编号 = b.编号
        LEFT JOIN dbo.v1_人员_带部门名 c ON a.负责人编号 = c.编号
        LEFT JOIN dbo.v1_人员_带部门名 d ON a.登记人编号 = d.编号;
		
GO


