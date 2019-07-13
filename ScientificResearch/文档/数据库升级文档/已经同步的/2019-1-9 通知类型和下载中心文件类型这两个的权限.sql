INSERT dbo.权限
        ( 编号, 上级编号, 名称, 路径, 类型, 排序 )
VALUES  ( 100145, -- 编号 - int
          1001, -- 上级编号 - int
          N'通知类型', -- 名称 - nvarchar(50)
          N'基础信息维护/字典.html?name=通知类型&type=1', -- 路径 - nvarchar(500)
          1, -- 类型 - bit
          100145 -- 排序 - int
          );

INSERT dbo.权限
        ( 编号, 上级编号, 名称, 路径, 类型, 排序 )
VALUES  ( 100146, -- 编号 - int
          1001, -- 上级编号 - int
          N'下载中心文件类型', -- 名称 - nvarchar(50)
          N'基础信息维护/字典.html?name=下载中心文件类型&type=1', -- 路径 - nvarchar(500)
          1, -- 类型 - bit
          100146 -- 排序 - int
          );


		  INSERT dbo.角色权限
		          ( 角色编号, 权限编号 )
		  VALUES  ( 1, -- 角色编号 - int
		            100145  -- 权限编号 - int
		            ),(1,100146)