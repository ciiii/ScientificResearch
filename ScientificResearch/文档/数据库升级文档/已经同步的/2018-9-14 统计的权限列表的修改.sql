SELECT * FROM dbo.权限 WHERE 上级编号 = 7
SELECT * FROM dbo.权限 WHERE 上级编号 = 701

DELETE 权限 WHERE 编号 IN (704,705);

UPDATE dbo.权限 SET 名称 = '著作成果统计',路径='科研统计/成果统计/著作成果统计.html' WHERE 编号 = 70103
UPDATE dbo.权限 SET 名称 = '专利成果统计',路径='科研统计/成果统计/专利成果统计.html' WHERE 编号 = 70104
UPDATE dbo.权限 SET 名称 = '按部门统计所有成果',路径='科研统计/成果统计/按部门统计所有成果.html' WHERE 编号 = 70105
UPDATE dbo.权限 SET 名称 = '按职务统计所有成果',路径='科研统计/成果统计/按职务统计所有成果.html' WHERE 编号 = 70106
UPDATE dbo.权限 SET 名称 = '按专业技术级别统计所有成果',路径='科研统计/成果统计/按专业技术级别统计所有成果.html' WHERE 编号 = 70107
UPDATE dbo.权限 SET 名称 = '按岗位类型统计所有成果',路径='科研统计/成果统计/按岗位类型统计所有成果.html' WHERE 编号 = 70108
INSERT dbo.权限
        ( 编号, 上级编号, 名称, 路径, 类型, 排序, 图标, 备注 )
VALUES  ( 70109, -- 编号 - int
          701, -- 上级编号 - int
          N'按学历统计所有成果', -- 名称 - nvarchar(50)
          N'科研统计/成果统计/按学历统计所有成果.html', -- 路径 - nvarchar(500)
          1, -- 类型 - bit
          70109, -- 排序 - int
          N'', -- 图标 - nvarchar(50)
          N''  -- 备注 - nvarchar(500)
          )

SELECT * FROM dbo.权限 WHERE 上级编号 = 702
SELECT * FROM dbo.权限 WHERE 上级编号 = 703
UPDATE dbo.权限 SET 名称 = '纵向项目汇总',路径='科研统计/纵向项目统计/纵向项目汇总.html' WHERE 编号 = 70302
DELETE 权限 WHERE 编号 IN (70303,70304)

SELECT * FROM dbo.权限 WHERE 上级编号 = 706
UPDATE dbo.权限 SET 名称 = '人员学位统计',路径='科研统计/人员统计/人员学位统计.html' WHERE 编号 = 70601
UPDATE dbo.权限 SET 名称 = '人员学科门类统计',路径='科研统计/人员统计/人员学科门类统计.html' WHERE 编号 = 70602
UPDATE dbo.权限 SET 名称 = '人员专业技术级别统计',路径='科研统计/人员统计/人员专业技术级别统计.html' WHERE 编号 = 70603
INSERT dbo.权限
        ( 编号, 上级编号, 名称, 路径, 类型, 排序, 图标, 备注 )
VALUES  ( 70604, -- 编号 - int
          706, -- 上级编号 - int
          N'人员岗位类型统计', -- 名称 - nvarchar(50)
          N'科研统计/人员统计/人员岗位类型统计.html', -- 路径 - nvarchar(500)
          1, -- 类型 - bit
          70604, -- 排序 - int
          N'', -- 图标 - nvarchar(50)
          N''  -- 备注 - nvarchar(500)
          )

		  SELECT * FROM 权限 WHERE 名称 = '经费报销统计';
		  DELETE 权限 WHERE 编号 = 40104;