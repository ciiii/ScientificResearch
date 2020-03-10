SET IDENTITY_INSERT 继教文件夹 ON;

INSERT  继教文件夹
        ( 编号 ,
          父编号 ,
          类型 ,
          名称 ,
          完整路径名 ,
          排序值 ,
          层级 ,
          归属人类型 ,
          归属人编号 ,
          建立时间 ,
          备注
        )
        SELECT  *
        FROM    ScientificResearch_Test.dbo.继教文件夹
        WHERE 类型 = '继教慕课素材' AND ( 编号 <> 161 and 父编号<> 161);

SET IDENTITY_INSERT 继教文件夹 OFF;

GO

SET IDENTITY_INSERT 继教慕课素材 ON;

INSERT  继教慕课素材
        ( 编号 ,
          文件夹编号 ,
          名称 ,
          路径 ,
          大小 ,
          时长 ,
          建立时间 ,
          备注
        )
        SELECT  *
        FROM    ScientificResearch_Test.dbo.继教慕课素材 WHERE 文件夹编号 NOT IN (161,162,173,283); 

SET IDENTITY_INSERT 继教慕课素材 OFF;

GO 