/****** Object:  UserDefinedTableType [dbo].[tt_v1_人员_带部门名_作废]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_v1_人员_带部门名_作废] AS TABLE(
	[编号] [int] NULL,
	[工号] [nvarchar](50) NULL,
	[密码] [nvarchar](50) NULL,
	[姓名] [nvarchar](50) NULL,
	[部门编号] [int] NULL,
	[英文名] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[身份证] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[入职日期] [date] NULL,
	[手机] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[邮箱] [nvarchar](50) NULL,
	[籍贯] [nvarchar](50) NULL,
	[毕业日期] [date] NULL,
	[合同开始日期] [date] NULL,
	[合同结束日期] [date] NULL,
	[参加工作日期] [date] NULL,
	[专业技术获得日期] [date] NULL,
	[职务任职日期] [date] NULL,
	[学位] [nvarchar](50) NULL,
	[学历] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[技术职称类别] [nvarchar](100) NULL,
	[技术职称] [nvarchar](100) NULL,
	[第二技术职称类别] [nvarchar](100) NULL,
	[第二技术职称] [nvarchar](100) NULL,
	[婚姻情况] [nvarchar](50) NULL,
	[学制] [nvarchar](50) NULL,
	[学历性质] [nvarchar](50) NULL,
	[学习形式] [nvarchar](50) NULL,
	[人员类别] [nvarchar](50) NULL,
	[个人身份] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[专业技术级别] [nvarchar](50) NULL,
	[所学专业名称] [nvarchar](50) NULL,
	[岗位性质] [nvarchar](50) NULL,
	[职务名称] [nvarchar](50) NULL,
	[职务级别] [nvarchar](50) NULL,
	[岗位名称] [nvarchar](50) NULL,
	[岗位类型] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[人员类型] [nvarchar](50) NULL,
	[获得最高学历的院校] [nvarchar](100) NULL,
	[获得最高学位的院校] [nvarchar](100) NULL,
	[住宅地址] [nvarchar](100) NULL,
	[学术特长] [nvarchar](1000) NULL,
	[研究方向] [nvarchar](1000) NULL,
	[个人获得的荣誉和奖项] [nvarchar](1000) NULL,
	[备注] [nvarchar](500) NULL,
	[是否启用] [bit] NULL,
	[部门名称] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_报销]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_报销] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[报销编号] [nvarchar](50) NULL,
	[报销金额] [numeric](18, 2) NULL,
	[报销方式] [nvarchar](50) NULL,
	[公务卡号] [nvarchar](50) NULL,
	[公务卡所属人姓名] [nvarchar](50) NULL,
	[报销人编号] [int] NULL,
	[报销时间] [datetime] NULL,
	[相关文件路径] [ntext] NULL,
	[申请时间] [datetime] NULL,
	[建立时间] [datetime] NULL,
	[报销经费用途] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_报销详情]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_报销详情] AS TABLE(
	[编号] [int] NULL,
	[报销编号] [int] NULL,
	[项目支出类型] [nvarchar](100) NULL,
	[项目支出内容] [nvarchar](100) NULL,
	[财务科目] [nvarchar](50) NULL,
	[报销金额] [numeric](18, 2) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_编号]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_编号] AS TABLE(
	[编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_部门]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_部门] AS TABLE(
	[编号] [int] NULL,
	[上级部门编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[负责人编号] [int] NULL,
	[排序值] [int] NULL,
	[备注] [nvarchar](500) NULL,
	[是否启用] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_参加会议]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_参加会议] AS TABLE(
	[编号] [int] NULL,
	[会议名称] [nvarchar](100) NULL,
	[会议主办单位] [nvarchar](100) NULL,
	[会议承办单位] [nvarchar](100) NULL,
	[研讨领域] [nvarchar](100) NULL,
	[学科类型] [nvarchar](50) NULL,
	[会议地址] [nvarchar](500) NULL,
	[会议开始时间] [datetime] NULL,
	[会议结束时间] [datetime] NULL,
	[往返时间] [int] NULL,
	[会议网址] [nvarchar](500) NULL,
	[会议简介及申请理由] [nvarchar](500) NULL,
	[申请人编号] [int] NULL,
	[参会相关文件路径] [ntext] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_参加会议反馈]    Script Date: 2020/3/9 9:00:31 ******/
CREATE TYPE [dbo].[tt_参加会议反馈] AS TABLE(
	[编号] [int] NULL,
	[参加会议编号] [int] NULL,
	[活动持续分钟] [int] NULL,
	[参会人数] [int] NULL,
	[参会总结] [nvarchar](500) NULL,
	[会议反馈文件路径] [ntext] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_成果获奖]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_成果获奖] AS TABLE(
	[编号] [int] NULL,
	[获奖名称] [nvarchar](200) NULL,
	[获奖级别] [nvarchar](50) NULL,
	[获奖日期] [date] NULL,
	[获奖类别] [nvarchar](50) NULL,
	[获奖等级] [nvarchar](50) NULL,
	[奖励情况] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[联系人手机] [nvarchar](50) NULL,
	[项目开始时间] [datetime] NULL,
	[项目结束时间] [datetime] NULL,
	[应用开始时间] [datetime] NULL,
	[应用结束时间] [datetime] NULL,
	[年度] [int] NULL,
	[批文时间] [datetime] NULL,
	[颁奖单位] [nvarchar](50) NULL,
	[完成人数] [int] NULL,
	[获奖证书编号] [nvarchar](50) NULL,
	[完成单位数量] [int] NULL,
	[获奖摘要] [nvarchar](500) NULL,
	[备注] [nvarchar](500) NULL,
	[相关文件路径] [ntext] NULL,
	[获奖单位文件路径] [ntext] NULL,
	[获奖批文] [ntext] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_成果论文]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_成果论文] AS TABLE(
	[编号] [int] NULL,
	[认领人编号] [int] NULL,
	[论文标题] [nvarchar](200) NULL,
	[论文标题类型] [nvarchar](50) NULL,
	[论文Online日期] [date] NULL,
	[论文正式出版日期] [date] NULL,
	[他引次数] [int] NULL,
	[年度] [int] NULL,
	[收稿日期] [date] NULL,
	[论文所属栏目] [nvarchar](50) NULL,
	[版面费] [numeric](18, 2) NULL,
	[超额版面费] [numeric](18, 2) NULL,
	[超额费用来源] [nvarchar](50) NULL,
	[奖励情况] [nvarchar](50) NULL,
	[论文字数] [numeric](18, 2) NULL,
	[计划来源] [nvarchar](50) NULL,
	[论文版面] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[作者人数] [int] NULL,
	[关键字] [nvarchar](500) NULL,
	[论文摘要] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
	[刊物编号] [int] NULL,
	[卷号] [int] NULL,
	[期号] [int] NULL,
	[页码范围起] [int] NULL,
	[页码范围止] [int] NULL,
	[论文类型] [nvarchar](50) NULL,
	[是否与行业联合发表] [bit] NULL,
	[是否与地方联合发表] [bit] NULL,
	[是否与国际联合发表] [bit] NULL,
	[是否跨学科] [bit] NULL,
	[是否与本专业相关] [bit] NULL,
	[检索信息页相关文件路径] [ntext] NULL,
	[论文正文路径] [ntext] NULL,
	[其他相关文件路径] [ntext] NULL,
	[通讯作者] [nvarchar](50) NULL,
	[文献类型] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_成果项目]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_成果项目] AS TABLE(
	[编号] [int] NULL,
	[项目类型] [int] NULL,
	[项目编号] [int] NULL,
	[成果类型] [int] NULL,
	[成果编号] [int] NULL,
	[是否项目带来成果] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_成果著作]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_成果著作] AS TABLE(
	[编号] [int] NULL,
	[著作名称] [nvarchar](100) NULL,
	[出版社名称] [nvarchar](100) NULL,
	[著作形式] [nvarchar](50) NULL,
	[年度] [int] NULL,
	[著作出版日期] [date] NULL,
	[ISBN号] [nvarchar](50) NULL,
	[著作字数] [int] NULL,
	[奖励情况] [nvarchar](50) NULL,
	[出版地] [nvarchar](50) NULL,
	[出版社级别] [nvarchar](50) NULL,
	[著作类型] [nvarchar](50) NULL,
	[是否译为外文] [bit] NULL,
	[语种] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[作者人数] [int] NULL,
	[发行价] [numeric](18, 2) NULL,
	[备注] [nvarchar](500) NULL,
	[封面相关文件路径] [ntext] NULL,
	[版权页相关文件路径] [ntext] NULL,
	[前言页相关文件路径] [ntext] NULL,
	[完整目录页相关文件路径] [ntext] NULL,
	[其他相关文件路径] [ntext] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_成果专利]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_成果专利] AS TABLE(
	[编号] [int] NULL,
	[专利名称] [nvarchar](100) NULL,
	[专利国别] [nvarchar](50) NULL,
	[专利类型] [nvarchar](50) NULL,
	[专利范围] [nvarchar](50) NULL,
	[是否授权] [bit] NULL,
	[代理机构] [nvarchar](500) NULL,
	[年度] [int] NULL,
	[专利权人名称] [nvarchar](50) NULL,
	[申请号] [nvarchar](50) NULL,
	[申请日期] [date] NULL,
	[公开号] [nvarchar](50) NULL,
	[公开日期] [date] NULL,
	[授权机构] [nvarchar](100) NULL,
	[专利号] [nvarchar](100) NULL,
	[国际专利主分类号] [nvarchar](100) NULL,
	[授权公告日] [date] NULL,
	[证书号] [nvarchar](100) NULL,
	[是否职务发明] [bit] NULL,
	[是否生效] [bit] NULL,
	[发明人数] [int] NULL,
	[奖励金额] [numeric](18, 2) NULL,
	[超额费用] [numeric](18, 2) NULL,
	[超额费用来源] [nvarchar](100) NULL,
	[专利摘要] [nvarchar](500) NULL,
	[备注] [nvarchar](500) NULL,
	[相关文件路径] [ntext] NULL,
	[代理费金额] [numeric](18, 2) NULL,
	[代理费发票号] [nvarchar](100) NULL,
	[代理费付款日期] [date] NULL,
	[代理资助金额] [numeric](18, 2) NULL,
	[代理办理资助日期] [date] NULL,
	[代理费到账日期] [date] NULL,
	[申请费是否减缓] [bit] NULL,
	[申请费金额] [numeric](18, 2) NULL,
	[申请费收据号] [nvarchar](100) NULL,
	[申请费支付日期] [date] NULL,
	[申请费资助金额] [numeric](18, 2) NULL,
	[申请费办理资助日期] [date] NULL,
	[申请费到账日期] [date] NULL,
	[申请审查费是否延缓] [bit] NULL,
	[申请审查费用] [numeric](18, 2) NULL,
	[申请审查费收据编号] [nvarchar](100) NULL,
	[申请审查费付款日期] [date] NULL,
	[申请审查费资助金额] [numeric](18, 2) NULL,
	[申请审查费资助日期] [date] NULL,
	[申请审查费到账日期] [date] NULL,
	[授权费是否减缓] [bit] NULL,
	[授权费用金额] [numeric](18, 2) NULL,
	[授权费收据号] [nvarchar](100) NULL,
	[授权费付款日期] [date] NULL,
	[授权费资助金额] [numeric](18, 2) NULL,
	[授权费办理资助日期] [date] NULL,
	[授权费到账日期] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_成果作者]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_成果作者] AS TABLE(
	[编号] [int] NULL,
	[成果类型] [int] NULL,
	[成果编号] [int] NULL,
	[作者级别] [nvarchar](50) NULL,
	[作者编号] [int] NULL,
	[工作量占比] [int] NULL,
	[完成字数] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_导入论文]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_导入论文] AS TABLE(
	[论文标题] [nvarchar](200) NULL,
	[作者] [nvarchar](50) NULL,
	[作者人数] [int] NULL,
	[年度] [int] NULL,
	[关键字] [nvarchar](500) NULL,
	[论文摘要] [nvarchar](max) NULL,
	[卷号] [int] NULL,
	[期号] [int] NULL,
	[页码范围] [nvarchar](100) NULL,
	[页码范围起] [int] NULL,
	[页码范围止] [int] NULL,
	[刊物名称] [nvarchar](200) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_导入自定义论文]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_导入自定义论文] AS TABLE(
	[论文标题] [nvarchar](200) NULL,
	[论文标题类型] [nvarchar](50) NULL,
	[论文Online日期] [date] NULL,
	[论文正式出版日期] [date] NULL,
	[作者] [nvarchar](50) NULL,
	[作者人数] [int] NULL,
	[他引次数] [int] NULL,
	[年度] [int] NULL,
	[收稿日期] [date] NULL,
	[论文所属栏目] [nvarchar](50) NULL,
	[论文字数] [numeric](18, 2) NULL,
	[计划来源] [nvarchar](50) NULL,
	[论文版面] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[关键字] [nvarchar](500) NULL,
	[论文摘要] [nvarchar](1000) NULL,
	[论文类型] [nvarchar](50) NULL,
	[卷号] [int] NULL,
	[期号] [int] NULL,
	[页码范围] [nvarchar](50) NULL,
	[页码范围起] [int] NULL,
	[页码范围止] [int] NULL,
	[刊物名称] [nvarchar](50) NULL,
	[通讯作者] [nvarchar](50) NULL,
	[文献类型] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_登录日志]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_登录日志] AS TABLE(
	[编号] [int] NULL,
	[工号] [nvarchar](50) NULL,
	[姓名] [nvarchar](50) NULL,
	[登录时间] [datetime] NULL,
	[IP] [nvarchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_国民行业代码]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_国民行业代码] AS TABLE(
	[编号] [int] NULL,
	[上级编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[代码] [nvarchar](500) NULL,
	[级别] [int] NULL,
	[排序] [int] NULL,
	[备注] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_合同买方性质]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_合同买方性质] AS TABLE(
	[编号] [int] NULL,
	[上级编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[级别] [int] NULL,
	[排序] [int] NULL,
	[备注] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_横向项目]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_横向项目] AS TABLE(
	[编号] [int] NULL,
	[项目分类] [nvarchar](50) NULL,
	[项目类型] [nvarchar](50) NULL,
	[合同编号] [nvarchar](50) NULL,
	[合同名称] [nvarchar](100) NULL,
	[是否为第一承建单位] [bit] NULL,
	[项目负责人编号] [int] NULL,
	[项目归属部门] [nvarchar](500) NULL,
	[单位名称] [nvarchar](100) NULL,
	[邮政编码] [nvarchar](50) NULL,
	[法定代表人] [nvarchar](50) NULL,
	[经费本编号] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[联系人电话] [nvarchar](50) NULL,
	[通讯地址] [nvarchar](200) NULL,
	[是否需要伦理评审] [bit] NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](50) NULL,
	[课题来源] [nvarchar](50) NULL,
	[合作方关系] [nvarchar](50) NULL,
	[合作方契约关系] [nvarchar](50) NULL,
	[合作方单位名称] [nvarchar](200) NULL,
	[合作方法人或组织机构代码] [nvarchar](50) NULL,
	[合作方法定代表人] [nvarchar](50) NULL,
	[合作方单位联系人] [nvarchar](50) NULL,
	[合作方联系电话] [nvarchar](50) NULL,
	[合作方邮箱] [nvarchar](50) NULL,
	[合作方邮政编码] [nvarchar](50) NULL,
	[合作方所在省] [nvarchar](50) NULL,
	[合作方所在市] [nvarchar](50) NULL,
	[合作方所在地区] [nvarchar](50) NULL,
	[合同金额] [numeric](18, 2) NULL,
	[签订时间] [datetime] NULL,
	[付款方式] [nvarchar](50) NULL,
	[合同开始时间] [datetime] NULL,
	[合同结束时间] [datetime] NULL,
	[合作方式] [nvarchar](50) NULL,
	[研究类型] [nvarchar](50) NULL,
	[技术领域] [nvarchar](50) NULL,
	[合同类型] [nvarchar](50) NULL,
	[技术合同类型] [nvarchar](50) NULL,
	[是否申请技术合同认定] [bit] NULL,
	[合同技术交易额] [numeric](18, 2) NULL,
	[知识产权] [nvarchar](50) NULL,
	[计划来源] [nvarchar](50) NULL,
	[合作方所属国民经济行业] [nvarchar](50) NULL,
	[技术服务的国民经济行业] [nvarchar](50) NULL,
	[合同的社会经济目标] [nvarchar](50) NULL,
	[合作方性质] [nvarchar](50) NULL,
	[是否高新性质] [bit] NULL,
	[合同认定登记承诺书路径] [ntext] NULL,
	[合同文件路径] [ntext] NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_横向项目变更]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_横向项目变更] AS TABLE(
	[编号] [int] NULL,
	[变更内容简介] [nvarchar](1000) NULL,
	[变更事由] [nvarchar](1000) NULL,
	[变更备注] [nvarchar](1000) NULL,
	[变更时间] [datetime] NULL,
	[横向项目编号] [int] NULL,
	[项目分类] [nvarchar](50) NULL,
	[项目类型] [nvarchar](50) NULL,
	[合同编号] [nvarchar](50) NULL,
	[合同名称] [nvarchar](100) NULL,
	[是否为第一承建单位] [bit] NULL,
	[项目负责人编号] [int] NULL,
	[项目归属部门] [nvarchar](500) NULL,
	[单位名称] [nvarchar](100) NULL,
	[邮政编码] [nvarchar](50) NULL,
	[法定代表人] [nvarchar](50) NULL,
	[经费本编号] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[联系人电话] [nvarchar](50) NULL,
	[通讯地址] [nvarchar](200) NULL,
	[是否需要伦理评审] [bit] NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](50) NULL,
	[课题来源] [nvarchar](50) NULL,
	[合作方关系] [nvarchar](50) NULL,
	[合作方契约关系] [nvarchar](50) NULL,
	[合作方单位名称] [nvarchar](200) NULL,
	[合作方法人或组织机构代码] [nvarchar](50) NULL,
	[合作方法定代表人] [nvarchar](50) NULL,
	[合作方单位联系人] [nvarchar](50) NULL,
	[合作方联系电话] [nvarchar](50) NULL,
	[合作方邮箱] [nvarchar](50) NULL,
	[合作方邮政编码] [nvarchar](50) NULL,
	[合作方所在省] [nvarchar](50) NULL,
	[合作方所在市] [nvarchar](50) NULL,
	[合作方所在地区] [nvarchar](50) NULL,
	[合同金额] [numeric](18, 2) NULL,
	[签订时间] [datetime] NULL,
	[付款方式] [nvarchar](50) NULL,
	[合同开始时间] [datetime] NULL,
	[合同结束时间] [datetime] NULL,
	[合作方式] [nvarchar](50) NULL,
	[研究类型] [nvarchar](50) NULL,
	[技术领域] [nvarchar](50) NULL,
	[合同类型] [nvarchar](50) NULL,
	[技术合同类型] [nvarchar](50) NULL,
	[是否申请技术合同认定] [bit] NULL,
	[合同技术交易额] [numeric](18, 2) NULL,
	[知识产权] [nvarchar](50) NULL,
	[计划来源] [nvarchar](50) NULL,
	[合作方所属国民经济行业] [nvarchar](50) NULL,
	[技术服务的国民经济行业] [nvarchar](50) NULL,
	[合同的社会经济目标] [nvarchar](50) NULL,
	[合作方性质] [nvarchar](50) NULL,
	[是否高新性质] [bit] NULL,
	[合同认定登记承诺书路径] [ntext] NULL,
	[合同文件路径] [ntext] NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_横向项目结题]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_横向项目结题] AS TABLE(
	[编号] [int] NULL,
	[横向项目编号] [int] NULL,
	[结题验收编号] [nvarchar](100) NULL,
	[结题验收时间] [datetime] NULL,
	[结题验收是否合格] [bit] NULL,
	[结题验收参与人数] [int] NULL,
	[结题资料路径] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_技术领域]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_技术领域] AS TABLE(
	[编号] [int] NULL,
	[上级编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[级别] [int] NULL,
	[排序] [int] NULL,
	[备注] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教标签]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教标签] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[首字母] [nvarchar](10) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教操作考试]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教操作考试] AS TABLE(
	[编号] [int] NULL,
	[及格分数] [int] NULL,
	[描述] [nvarchar](1000) NULL,
	[是否允许考生查看成绩] [bit] NULL,
	[是否允许考生查看评分] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教操作考试参与情况]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教操作考试参与情况] AS TABLE(
	[编号] [int] NULL,
	[考试批次编号] [int] NULL,
	[助教老师编号] [int] NULL,
	[参与人类型] [nvarchar](50) NULL,
	[参与人编号] [int] NULL,
	[开始操作时间] [datetime] NULL,
	[结束操作时间] [datetime] NULL,
	[得分] [numeric](8, 1) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教操作考试打分情况]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教操作考试打分情况] AS TABLE(
	[编号] [int] NULL,
	[操作考试参与情况编号] [int] NULL,
	[操作考试评分项目要求编号] [int] NULL,
	[打分] [numeric](8, 1) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教操作考试评分表]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教操作考试评分表] AS TABLE(
	[操作考试编号] [int] NULL,
	[评分表编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教操作考试助教老师]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教操作考试助教老师] AS TABLE(
	[操作考试编号] [int] NULL,
	[助教老师编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教活动]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教活动] AS TABLE(
	[编号] [int] NULL,
	[文件夹编号] [int] NULL,
	[培训计划编号] [int] NULL,
	[项目分类编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[开始时间] [datetime] NULL,
	[结束时间] [datetime] NULL,
	[学分] [int] NULL,
	[封面] [nvarchar](1000) NULL,
	[简介] [nvarchar](1000) NULL,
	[必须按顺序学习] [bit] NULL,
	[建立时间] [datetime] NULL,
	[建立人] [int] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教活动可参与人]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教活动可参与人] AS TABLE(
	[活动编号] [int] NULL,
	[可参与人类型] [nvarchar](50) NULL,
	[可参与人编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教活动内容]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教活动内容] AS TABLE(
	[编号] [int] NULL,
	[活动编号] [int] NULL,
	[类型] [nvarchar](100) NULL,
	[名称] [nvarchar](100) NULL,
	[排序值] [int] NULL,
	[开始时间] [datetime] NULL,
	[结束时间] [datetime] NULL,
	[地点] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教活动项目分类]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教活动项目分类] AS TABLE(
	[编号] [int] NULL,
	[父编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教角色权限]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教角色权限] AS TABLE(
	[继教角色编号] [int] NULL,
	[继教权限编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教考试批次]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教考试批次] AS TABLE(
	[编号] [int] NULL,
	[考试编号] [int] NULL,
	[排序值] [int] NULL,
	[考试开始时间] [datetime] NULL,
	[考试结束时间] [datetime] NULL,
	[考试地点] [nvarchar](1000) NULL,
	[人数上限] [int] NULL,
	[二维码] [nvarchar](1000) NULL,
	[口令] [nvarchar](50) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教考试批次可参与人]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教考试批次可参与人] AS TABLE(
	[考试批次编号] [int] NULL,
	[可参与人类型] [nvarchar](50) NULL,
	[可参与人编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教科室]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教科室] AS TABLE(
	[编号] [int] NULL,
	[科室管理员编号] [int] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教课后练习]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教课后练习] AS TABLE(
	[编号] [int] NULL,
	[及格分数] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教课后练习试题]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教课后练习试题] AS TABLE(
	[课后练习编号] [int] NULL,
	[试题编号] [int] NULL,
	[分值] [int] NULL,
	[排序值] [int] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教理论考试]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教理论考试] AS TABLE(
	[编号] [int] NULL,
	[是否允许任何人参与] [bit] NULL,
	[试卷编号] [int] NULL,
	[时长] [int] NULL,
	[及格分数] [int] NULL,
	[是否试题乱序] [bit] NULL,
	[是否允许考生查看成绩] [bit] NULL,
	[是否允许考生查看答案] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教理论考试参与情况]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教理论考试参与情况] AS TABLE(
	[编号] [int] NULL,
	[考试批次编号] [int] NULL,
	[参与人类型] [nvarchar](50) NULL,
	[参与人编号] [int] NULL,
	[答题开始时间] [datetime] NULL,
	[答题结束时间] [datetime] NULL,
	[得分] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教理论考试答题答案]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教理论考试答题答案] AS TABLE(
	[理论考试答题情况编号] [int] NULL,
	[答题答案编码] [varchar](1) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教理论考试答题情况]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教理论考试答题情况] AS TABLE(
	[编号] [int] NULL,
	[理论考试参与情况编号] [int] NULL,
	[试题编号] [int] NULL,
	[显示排序值] [int] NULL,
	[纠错] [nvarchar](1000) NULL,
	[答题时间] [datetime] NULL,
	[是否正确] [bit] NULL,
	[得分] [int] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教慕课]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教慕课] AS TABLE(
	[编号] [int] NULL,
	[慕课素材编号] [int] NULL,
	[是否允许下载] [bit] NULL,
	[通过时长] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教慕课参与情况]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教慕课参与情况] AS TABLE(
	[慕课编号] [int] NULL,
	[参与人类型] [nvarchar](50) NULL,
	[参与人编号] [int] NULL,
	[学习时长] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教慕课素材]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教慕课素材] AS TABLE(
	[编号] [int] NULL,
	[文件夹编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[路径] [nvarchar](500) NULL,
	[大小] [int] NULL,
	[时长] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教能级]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教能级] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教培训计划]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教培训计划] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[年份] [int] NULL,
	[所属部门编号] [int] NULL,
	[简介] [nvarchar](1000) NULL,
	[附件] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教评分表]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教评分表] AS TABLE(
	[编号] [int] NULL,
	[文件夹编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教评分表项目]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教评分表项目] AS TABLE(
	[编号] [int] NULL,
	[评分表编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教评分表项目要求]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教评分表项目要求] AS TABLE(
	[编号] [int] NULL,
	[评分表项目编号] [int] NULL,
	[要求] [nvarchar](1000) NULL,
	[标准分] [numeric](8, 1) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教签到]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教签到] AS TABLE(
	[编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教签到参与情况]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教签到参与情况] AS TABLE(
	[签到规定编号] [int] NULL,
	[参与人类型] [nvarchar](50) NULL,
	[参与人编号] [int] NULL,
	[签到时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教签到规定]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教签到规定] AS TABLE(
	[编号] [int] NULL,
	[签到编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[签到开始时间] [datetime] NULL,
	[签到结束时间] [datetime] NULL,
	[二维码变化秒数] [int] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教人员]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教人员] AS TABLE(
	[编号] [int] NULL,
	[能级编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教人员导入]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教人员导入] AS TABLE(
	[工号] [nvarchar](50) NULL,
	[密码] [nvarchar](50) NULL,
	[姓名] [nvarchar](50) NULL,
	[能级] [nvarchar](50) NULL,
	[部门名称] [nvarchar](50) NULL,
	[英文名] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[身份证] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[入职日期] [date] NULL,
	[手机] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[邮箱] [nvarchar](50) NULL,
	[籍贯] [nvarchar](50) NULL,
	[毕业日期] [date] NULL,
	[合同开始日期] [date] NULL,
	[合同结束日期] [date] NULL,
	[参加工作日期] [date] NULL,
	[专业技术获得日期] [date] NULL,
	[职务任职日期] [date] NULL,
	[学位] [nvarchar](50) NULL,
	[学历] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[技术职称类别] [nvarchar](100) NULL,
	[技术职称] [nvarchar](100) NULL,
	[第二技术职称类别] [nvarchar](100) NULL,
	[第二技术职称] [nvarchar](100) NULL,
	[婚姻情况] [nvarchar](50) NULL,
	[学制] [nvarchar](50) NULL,
	[学历性质] [nvarchar](50) NULL,
	[学习形式] [nvarchar](50) NULL,
	[人员类别] [nvarchar](50) NULL,
	[个人身份] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[专业技术级别] [nvarchar](50) NULL,
	[所学专业名称] [nvarchar](50) NULL,
	[岗位性质] [nvarchar](50) NULL,
	[职务名称] [nvarchar](50) NULL,
	[职务级别] [nvarchar](50) NULL,
	[岗位名称] [nvarchar](50) NULL,
	[岗位类型] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[人员类型] [nvarchar](50) NULL,
	[获得最高学历的院校] [nvarchar](100) NULL,
	[获得最高学位的院校] [nvarchar](100) NULL,
	[住宅地址] [nvarchar](100) NULL,
	[学术特长] [nvarchar](1000) NULL,
	[研究方向] [nvarchar](1000) NULL,
	[个人获得的荣誉和奖项] [nvarchar](1000) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教人员角色]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教人员角色] AS TABLE(
	[继教角色编号] [int] NULL,
	[人员编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教设置]    Script Date: 2020/3/9 9:00:32 ******/
CREATE TYPE [dbo].[tt_继教设置] AS TABLE(
	[编号] [int] NULL,
	[课时课件通过时长百分比] [int] NULL,
	[理论考试及格分百分比] [int] NULL,
	[最大允许离开界面次数] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试卷]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试卷] AS TABLE(
	[编号] [int] NULL,
	[文件夹编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[描述] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试卷结构]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试卷结构] AS TABLE(
	[编号] [int] NULL,
	[试卷编号] [int] NULL,
	[类型编号] [int] NULL,
	[名称] [nvarchar](100) NULL,
	[排序值] [int] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试卷试题]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试卷试题] AS TABLE(
	[试卷结构编号] [int] NULL,
	[试题编号] [int] NULL,
	[分值] [int] NULL,
	[排序值] [int] NULL,
	[备注] [nchar](10) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试题]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试题] AS TABLE(
	[编号] [int] NULL,
	[文件夹编号] [int] NULL,
	[类型编号] [int] NULL,
	[题干] [nvarchar](1000) NULL,
	[题目解析] [nvarchar](1000) NULL,
	[难易度] [nvarchar](50) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试题备选答案]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试题备选答案] AS TABLE(
	[试题编号] [int] NULL,
	[备选答案编码] [varchar](1) NULL,
	[备选答案内容] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试题标签]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试题标签] AS TABLE(
	[标签编号] [int] NULL,
	[试题编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教试题正确答案]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教试题正确答案] AS TABLE(
	[试题编号] [int] NULL,
	[正确答案编码] [varchar](1) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教微信角色权限]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教微信角色权限] AS TABLE(
	[继教角色编号] [int] NULL,
	[继教微信权限编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教文件夹]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教文件夹] AS TABLE(
	[编号] [int] NULL,
	[父编号] [int] NULL,
	[类型] [nvarchar](100) NULL,
	[名称] [nvarchar](100) NULL,
	[完整路径名] [nvarchar](1000) NULL,
	[排序值] [int] NULL,
	[层级] [int] NULL,
	[归属人类型] [nvarchar](100) NULL,
	[归属人编号] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教文件夹可使用人]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教文件夹可使用人] AS TABLE(
	[文件夹编号] [int] NULL,
	[可使用人类型] [nvarchar](100) NULL,
	[可使用人编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_继教助教老师]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_继教助教老师] AS TABLE(
	[科室编号] [int] NULL,
	[助教老师编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_讲座反馈]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_讲座反馈] AS TABLE(
	[编号] [int] NULL,
	[讲座编号] [int] NULL,
	[专家姓名] [nvarchar](50) NULL,
	[专家身份证号码] [nvarchar](50) NULL,
	[专家护照号] [nvarchar](50) NULL,
	[专家联系方式] [nvarchar](50) NULL,
	[专家讲课费金额] [numeric](18, 2) NULL,
	[结算方式] [nvarchar](50) NULL,
	[活动持续分钟] [int] NULL,
	[参会人数] [int] NULL,
	[讲座附件路径] [nvarchar](max) NULL,
	[讲座效果] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_角色]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_角色] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学360评价]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学360评价] AS TABLE(
	[编号] [int] NULL,
	[来源类型] [int] NULL,
	[评价人编号] [int] NULL,
	[目标类型] [int] NULL,
	[被评价人编号] [int] NULL,
	[评价内容] [nvarchar](500) NULL,
	[评价时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学360评价评分]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学360评价评分] AS TABLE(
	[编号] [int] NULL,
	[教学360评价编号] [int] NULL,
	[教学360评价项目编号] [int] NULL,
	[评分] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学360评价项目]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学360评价项目] AS TABLE(
	[编号] [int] NULL,
	[教学360评价分类编号] [int] NULL,
	[名称] [nvarchar](200) NULL,
	[标准分] [int] NULL,
	[是否启用] [bit] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学本院策略]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学本院策略] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[教学专业编号] [int] NULL,
	[专业基地管理员编号] [int] NULL,
	[是否启用] [bit] NULL,
	[建立日期] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学本院科室]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学本院科室] AS TABLE(
	[编号] [int] NULL,
	[教学本院策略编号] [int] NULL,
	[排序值] [int] NULL,
	[教学专业科室编号] [int] NULL,
	[本院科室编号] [int] NULL,
	[是否必选] [bit] NULL,
	[培训时长] [int] NULL,
	[最低管床数量] [int] NULL,
	[最低全程管理数量] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学本院科室任务]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学本院科室任务] AS TABLE(
	[编号] [int] NULL,
	[教学本院科室编号] [int] NULL,
	[项目名称] [nvarchar](50) NULL,
	[任务类型编号] [int] NULL,
	[是否门诊] [bit] NULL,
	[是否病房] [bit] NULL,
	[是否医技] [bit] NULL,
	[最低评分要求] [int] NULL,
	[数量要求] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学病人]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学病人] AS TABLE(
	[编号] [int] NULL,
	[姓名] [nvarchar](50) NULL,
	[性别] [nvarchar](10) NULL,
	[出生日期] [date] NULL,
	[住院号] [nvarchar](50) NULL,
	[住院床号] [nvarchar](50) NULL,
	[主要诊断] [nvarchar](500) NULL,
	[次要诊断] [nvarchar](500) NULL,
	[入院日期] [date] NULL,
	[出院日期] [date] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学补轮转]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学补轮转] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[说明] [nvarchar](500) NULL,
	[开始日期] [date] NULL,
	[结束日期] [date] NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学出科申请]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学出科申请] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[申请出科日期] [date] NULL,
	[出科小结] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学出勤类型]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学出勤类型] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学出勤情况]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学出勤情况] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[考勤日期] [date] NULL,
	[教学出勤类型编号] [int] NULL,
	[说明] [nvarchar](500) NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学带教老师]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学带教老师] AS TABLE(
	[教学科室编号] [int] NULL,
	[带教老师编号] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学更换带教老师]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学更换带教老师] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[原带教老师编号] [int] NULL,
	[新带教老师编号] [int] NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学管床病人]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学管床病人] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[病人编号] [int] NULL,
	[是否全程陪护] [bit] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学活动]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学活动] AS TABLE(
	[编号] [int] NULL,
	[活动主题] [nvarchar](200) NULL,
	[活动开始时间] [datetime] NULL,
	[活动结束时间] [datetime] NULL,
	[活动地点] [nvarchar](200) NULL,
	[教学活动类型编号] [int] NULL,
	[主讲人编号] [int] NULL,
	[主讲人姓名] [nvarchar](50) NULL,
	[主讲人职称] [nvarchar](50) NULL,
	[活动内容] [nvarchar](2000) NULL,
	[教学病例] [nvarchar](200) NULL,
	[病人编号] [int] NULL,
	[附件] [ntext] NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学活动反馈]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学活动反馈] AS TABLE(
	[编号] [int] NULL,
	[教学活动编号] [int] NULL,
	[学员编号] [int] NULL,
	[反馈内容] [nvarchar](2000) NULL,
	[附件] [nvarchar](200) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学活动可参与者]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学活动可参与者] AS TABLE(
	[编号] [int] NULL,
	[教学活动编号] [int] NULL,
	[学员编号] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学活动类型]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学活动类型] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[活动内容模板] [nvarchar](2000) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学活动评价]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学活动评价] AS TABLE(
	[编号] [int] NULL,
	[评价人类型] [nvarchar](50) NULL,
	[评价人编号] [int] NULL,
	[教学活动编号] [int] NULL,
	[教学活动评价项目编号] [int] NULL,
	[评分] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学活动评价项目]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学活动评价项目] AS TABLE(
	[编号] [int] NULL,
	[教学活动类型编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[标准分] [int] NULL,
	[是否启用] [bit] NULL,
	[说明] [nvarchar](500) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学角色]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学角色] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[能否直接配置人员] [bit] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学角色权限]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学角色权限] AS TABLE(
	[教学角色编号] [int] NULL,
	[教学权限编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学结业申请]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学结业申请] AS TABLE(
	[编号] [int] NULL,
	[学员编号] [int] NULL,
	[说明] [nvarchar](500) NULL,
	[申请结业日期] [date] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学考勤情况]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学考勤情况] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[考勤日期] [date] NULL,
	[教学考勤类型编号] [int] NULL,
	[说明] [nvarchar](500) NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学考试成绩]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学考试成绩] AS TABLE(
	[编号] [int] NULL,
	[理论考试成绩] [int] NULL,
	[技能考试成绩] [int] NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学科室]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学科室] AS TABLE(
	[编号] [int] NULL,
	[科室管理员编号] [int] NULL,
	[最大学员人数] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学轮转]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学轮转] AS TABLE(
	[编号] [int] NULL,
	[学员编号] [int] NULL,
	[计划入科日期] [date] NULL,
	[计划出科日期] [date] NULL,
	[实际入科日期] [date] NULL,
	[实际出科日期] [date] NULL,
	[教学本院科室编号] [int] NULL,
	[带教老师编号] [int] NULL,
	[最低管床数量] [int] NULL,
	[最低全程管理数量] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学轮转任务]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学轮转任务] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[项目名称] [nvarchar](50) NULL,
	[任务类型编号] [int] NULL,
	[是否门诊] [bit] NULL,
	[是否病房] [bit] NULL,
	[是否医技] [bit] NULL,
	[最低评分要求] [int] NULL,
	[数量要求] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学轮转手册]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学轮转手册] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[教学轮转手册类型编号] [int] NULL,
	[教学专业科室任务类型编号] [int] NULL,
	[操作时间] [datetime] NULL,
	[病人编号] [int] NULL,
	[概要] [nvarchar](200) NULL,
	[内容] [ntext] NULL,
	[附件] [nvarchar](200) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学轮转手册类型]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学轮转手册类型] AS TABLE(
	[编号] [int] NULL,
	[分类] [nvarchar](50) NULL,
	[名称] [nvarchar](50) NULL,
	[是否门诊] [bit] NULL,
	[是否病床] [bit] NULL,
	[是否医技] [bit] NULL,
	[内容模板] [ntext] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学轮转手册完成任务]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学轮转手册完成任务] AS TABLE(
	[教学轮转手册编号] [int] NULL,
	[教学轮转任务编号] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学评分等级]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学评分等级] AS TABLE(
	[编号] [int] NULL,
	[等级名称] [nvarchar](50) NULL,
	[最小分值] [int] NULL,
	[最大分值] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学请假申请]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学请假申请] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[请假开始日期] [date] NULL,
	[请假天数] [int] NULL,
	[请假事由] [nvarchar](500) NULL,
	[建立人] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学人员角色]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学人员角色] AS TABLE(
	[教学角色编号] [int] NULL,
	[人员编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学通知公告]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学通知公告] AS TABLE(
	[编号] [int] NULL,
	[通知类型] [nvarchar](50) NULL,
	[发送人编号] [int] NULL,
	[通知名称] [nvarchar](100) NULL,
	[关闭时间] [datetime] NULL,
	[相关文件路径] [nvarchar](500) NULL,
	[通知内容] [ntext] NULL,
	[已接收人数] [int] NULL,
	[是否启用] [bit] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL,
	[是否必读] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学通知公告接收条件]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学通知公告接收条件] AS TABLE(
	[编号] [int] NULL,
	[教学通知公告编号] [int] NULL,
	[接收者类型] [nvarchar](50) NULL,
	[接收者编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学退培申请]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学退培申请] AS TABLE(
	[编号] [int] NULL,
	[学员编号] [int] NULL,
	[说明] [nvarchar](500) NULL,
	[申请退培日期] [date] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学宿舍楼]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学宿舍楼] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[层数] [int] NULL,
	[单元数] [int] NULL,
	[每单元每层户数] [int] NULL,
	[每户床数] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学学员]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学学员] AS TABLE(
	[编号] [int] NULL,
	[来源学校编号] [int] NULL,
	[来源学生编号] [int] NULL,
	[学员类型编号] [int] NULL,
	[工号] [nvarchar](50) NULL,
	[密码] [nvarchar](50) NULL,
	[头像路径] [nvarchar](100) NULL,
	[姓名] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[证件类型] [nvarchar](50) NULL,
	[证件号码] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[手机号码] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[电子邮箱] [nvarchar](50) NULL,
	[QQ号码] [nvarchar](50) NULL,
	[微信号] [nvarchar](50) NULL,
	[家庭住址] [nvarchar](50) NULL,
	[取得执业证书日期] [date] NULL,
	[执业证书编号] [nvarchar](50) NULL,
	[取得医师资格证书日期] [date] NULL,
	[医师资格证书编号] [nvarchar](50) NULL,
	[最高学历] [nvarchar](50) NULL,
	[毕业年份] [int] NULL,
	[毕业学校] [nvarchar](100) NULL,
	[毕业专业] [nvarchar](100) NULL,
	[毕业证编码] [nvarchar](100) NULL,
	[学位证编码] [nvarchar](100) NULL,
	[学员培训年界] [int] NULL,
	[学员培训年限] [int] NULL,
	[往届应届] [nvarchar](50) NULL,
	[专业编号] [int] NULL,
	[送培方式] [nvarchar](50) NULL,
	[工作单位] [nvarchar](100) NULL,
	[医疗卫生机构] [nvarchar](100) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学学员类型]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学学员类型] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学学员培训]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学学员培训] AS TABLE(
	[编号] [int] NULL,
	[报到时间] [datetime] NULL,
	[教学本院策略编号] [int] NULL,
	[实际开始培训日期] [date] NULL,
	[实际结束培训日期] [date] NULL,
	[退培日期] [date] NULL,
	[结业日期] [date] NULL,
	[证书] [nvarchar](200) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学学员宿舍安排]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学学员宿舍安排] AS TABLE(
	[编号] [int] NULL,
	[宿舍楼编号] [int] NULL,
	[门禁卡卡号] [nvarchar](50) NULL,
	[门牌号及床号] [nvarchar](50) NULL,
	[职位] [nvarchar](50) NULL,
	[水起数] [numeric](18, 2) NULL,
	[电起数] [numeric](18, 2) NULL,
	[气起数] [numeric](18, 2) NULL,
	[滞纳金比例] [numeric](18, 2) NULL,
	[入住日期] [date] NULL,
	[退出日期] [date] NULL,
	[退出原因] [nvarchar](500) NULL,
	[宿舍安排说明] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学医疗差错及事故记录]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学医疗差错及事故记录] AS TABLE(
	[编号] [int] NULL,
	[教学轮转编号] [int] NULL,
	[处理日期] [date] NULL,
	[处理类别] [nvarchar](50) NULL,
	[处理原因] [nvarchar](500) NULL,
	[处理意见] [nvarchar](500) NULL,
	[附件] [nvarchar](200) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学专业]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学专业] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[年份] [int] NULL,
	[是否国家标准] [bit] NULL,
	[标准代码] [nvarchar](50) NULL,
	[最低培训时长] [int] NULL,
	[学习要求及目标] [ntext] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学专业科室]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学专业科室] AS TABLE(
	[编号] [int] NULL,
	[教学专业编号] [int] NULL,
	[排序值] [int] NULL,
	[科室名称] [nvarchar](50) NULL,
	[最低培训时长] [int] NULL,
	[最低管床数量] [int] NULL,
	[最低全程管理数量] [int] NULL,
	[科室要求] [ntext] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学专业科室任务]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学专业科室任务] AS TABLE(
	[编号] [int] NULL,
	[教学专业科室编号] [int] NULL,
	[项目名称] [nvarchar](50) NULL,
	[任务类型编号] [int] NULL,
	[是否门诊] [bit] NULL,
	[是否病房] [bit] NULL,
	[是否医技] [bit] NULL,
	[最低评分要求] [int] NULL,
	[数量要求] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学专业科室任务类型]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学专业科室任务类型] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_教学专业科室要求]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_教学专业科室要求] AS TABLE(
	[编号] [int] NULL,
	[教学专业科室编号] [int] NULL,
	[项目名称] [nvarchar](500) NULL,
	[说明] [nvarchar](200) NULL,
	[最低评分要求] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_经费模版]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_经费模版] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_经费模版项目支出类型]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_经费模版项目支出类型] AS TABLE(
	[编号] [int] NULL,
	[所属经费模版编号] [int] NULL,
	[项目支出类型] [nvarchar](100) NULL,
	[经费占比] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_经费模版项目支出内容]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_经费模版项目支出内容] AS TABLE(
	[编号] [int] NULL,
	[所属经费模版项目支出类型编号] [int] NULL,
	[项目支出内容] [nvarchar](100) NULL,
	[财务科目] [nvarchar](100) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_期刊]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_期刊] AS TABLE(
	[编号] [int] NULL,
	[代码] [nvarchar](50) NULL,
	[名称] [nvarchar](500) NULL,
	[英文刊名] [nvarchar](500) NULL,
	[主办单位] [nvarchar](500) NULL,
	[期刊系列] [nvarchar](500) NULL,
	[收录情况] [nvarchar](1000) NULL,
	[语种] [nvarchar](50) NULL,
	[JCR分区] [nvarchar](50) NULL,
	[编目名称] [nvarchar](100) NULL,
	[编目类别] [nvarchar](100) NULL,
	[年度] [int] NULL,
	[创刊日期] [date] NULL,
	[被引用次数] [int] NULL,
	[影响因子] [numeric](18, 3) NULL,
	[特征因子分值] [numeric](18, 3) NULL,
	[ISSN号] [nvarchar](50) NULL,
	[CN号] [nvarchar](50) NULL,
	[出版周期] [nvarchar](50) NULL,
	[出版地] [nvarchar](50) NULL,
	[开本] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
	[PMID] [int] NULL,
	[DOI] [nvarchar](100) NULL,
	[UT] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_区域]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_区域] AS TABLE(
	[编号] [int] NULL,
	[名称] [nvarchar](500) NULL,
	[级别] [int] NULL,
	[上级编号] [int] NULL,
	[排序] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_人员]    Script Date: 2020/3/9 9:00:33 ******/
CREATE TYPE [dbo].[tt_人员] AS TABLE(
	[编号] [int] NULL,
	[工号] [nvarchar](50) NULL,
	[密码] [nvarchar](50) NULL,
	[姓名] [nvarchar](50) NULL,
	[部门编号] [int] NULL,
	[英文名] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[身份证] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[入职日期] [date] NULL,
	[手机] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[邮箱] [nvarchar](50) NULL,
	[籍贯] [nvarchar](50) NULL,
	[毕业日期] [date] NULL,
	[合同开始日期] [date] NULL,
	[合同结束日期] [date] NULL,
	[参加工作日期] [date] NULL,
	[专业技术获得日期] [date] NULL,
	[职务任职日期] [date] NULL,
	[学位] [nvarchar](50) NULL,
	[学历] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[技术职称类别] [nvarchar](100) NULL,
	[技术职称] [nvarchar](100) NULL,
	[第二技术职称类别] [nvarchar](100) NULL,
	[第二技术职称] [nvarchar](100) NULL,
	[婚姻情况] [nvarchar](50) NULL,
	[学制] [nvarchar](50) NULL,
	[学历性质] [nvarchar](50) NULL,
	[学习形式] [nvarchar](50) NULL,
	[人员类别] [nvarchar](50) NULL,
	[个人身份] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[专业技术级别] [nvarchar](50) NULL,
	[所学专业名称] [nvarchar](50) NULL,
	[岗位性质] [nvarchar](50) NULL,
	[职务名称] [nvarchar](50) NULL,
	[职务级别] [nvarchar](50) NULL,
	[岗位名称] [nvarchar](50) NULL,
	[岗位类型] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[人员类型] [nvarchar](50) NULL,
	[获得最高学历的院校] [nvarchar](100) NULL,
	[获得最高学位的院校] [nvarchar](100) NULL,
	[住宅地址] [nvarchar](100) NULL,
	[学术特长] [nvarchar](1000) NULL,
	[研究方向] [nvarchar](1000) NULL,
	[个人获得的荣誉和奖项] [nvarchar](1000) NULL,
	[备注] [nvarchar](500) NULL,
	[是否启用] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_人员导入]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_人员导入] AS TABLE(
	[工号] [nvarchar](50) NULL,
	[密码] [nvarchar](50) NULL,
	[姓名] [nvarchar](50) NULL,
	[部门名称] [nvarchar](50) NULL,
	[英文名] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[身份证] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[入职日期] [date] NULL,
	[手机] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[邮箱] [nvarchar](50) NULL,
	[籍贯] [nvarchar](50) NULL,
	[毕业日期] [date] NULL,
	[合同开始日期] [date] NULL,
	[合同结束日期] [date] NULL,
	[参加工作日期] [date] NULL,
	[专业技术获得日期] [date] NULL,
	[职务任职日期] [date] NULL,
	[学位] [nvarchar](50) NULL,
	[学历] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[技术职称类别] [nvarchar](100) NULL,
	[技术职称] [nvarchar](100) NULL,
	[第二技术职称类别] [nvarchar](100) NULL,
	[第二技术职称] [nvarchar](100) NULL,
	[婚姻情况] [nvarchar](50) NULL,
	[学制] [nvarchar](50) NULL,
	[学历性质] [nvarchar](50) NULL,
	[学习形式] [nvarchar](50) NULL,
	[人员类别] [nvarchar](50) NULL,
	[个人身份] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[专业技术级别] [nvarchar](50) NULL,
	[所学专业名称] [nvarchar](50) NULL,
	[岗位性质] [nvarchar](50) NULL,
	[职务名称] [nvarchar](50) NULL,
	[职务级别] [nvarchar](50) NULL,
	[岗位名称] [nvarchar](50) NULL,
	[岗位类型] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[人员类型] [nvarchar](50) NULL,
	[获得最高学历的院校] [nvarchar](100) NULL,
	[获得最高学位的院校] [nvarchar](100) NULL,
	[住宅地址] [nvarchar](100) NULL,
	[学术特长] [nvarchar](1000) NULL,
	[研究方向] [nvarchar](1000) NULL,
	[个人获得的荣誉和奖项] [nvarchar](1000) NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_任职]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_任职] AS TABLE(
	[编号] [int] NULL,
	[任职开始时间] [datetime] NULL,
	[任职截止时间] [datetime] NULL,
	[任职人员编号] [int] NULL,
	[任职团体名称] [nvarchar](200) NULL,
	[所任职务] [nvarchar](200) NULL,
	[相关文件路径] [nvarchar](max) NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_通知公告]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_通知公告] AS TABLE(
	[编号] [int] NULL,
	[通知类型] [nvarchar](50) NULL,
	[通知标识] [nvarchar](50) NULL,
	[发送人编号] [int] NULL,
	[通知名称] [nvarchar](100) NULL,
	[关闭时间] [datetime] NULL,
	[相关文件路径] [nvarchar](500) NULL,
	[通知内容] [ntext] NULL,
	[接收人数] [int] NULL,
	[已接收人数] [int] NULL,
	[是否启用] [bit] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL,
	[是否必读] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_通知公告接收条件]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_通知公告接收条件] AS TABLE(
	[编号] [int] NULL,
	[通知公告编号] [int] NULL,
	[接收者类型] [int] NULL,
	[接收者编号] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_下载中心]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_下载中心] AS TABLE(
	[编号] [int] NULL,
	[文件名称] [nvarchar](200) NULL,
	[文件类型] [nvarchar](50) NULL,
	[文件路径] [nvarchar](500) NULL,
	[是否启用] [bit] NULL,
	[上传人编号] [int] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_项目参与人]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_项目参与人] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[参与人编号] [int] NULL,
	[工作量占比] [int] NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_项目分类]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_项目分类] AS TABLE(
	[编号] [int] NULL,
	[上级编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[级别] [int] NULL,
	[排序] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_项目计划]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_项目计划] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[开始日期] [date] NULL,
	[结束日期] [date] NULL,
	[计划内容] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_项目经费到账]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_项目经费到账] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[拨款单位] [nvarchar](100) NULL,
	[到账日期] [date] NULL,
	[到账金额] [numeric](18, 2) NULL,
	[技术交易额] [numeric](18, 2) NULL,
	[管理费用] [numeric](18, 2) NULL,
	[技术合同认定服务费] [numeric](18, 2) NULL,
	[增值税] [numeric](18, 2) NULL,
	[到账单位] [nvarchar](100) NULL,
	[经办人编号] [int] NULL,
	[到账凭证路径] [ntext] NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_项目经费预算]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_项目经费预算] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[项目支出类型] [nvarchar](100) NULL,
	[项目支出内容] [nvarchar](100) NULL,
	[财务科目] [nvarchar](100) NULL,
	[批准经费] [numeric](18, 2) NULL,
	[配套经费] [numeric](18, 2) NULL,
	[编制依据] [nvarchar](100) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_项目预期成果]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_项目预期成果] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[预期成果] [nvarchar](1000) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_学科]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_学科] AS TABLE(
	[编号] [int] NULL,
	[上级编号] [int] NULL,
	[名称] [nvarchar](50) NULL,
	[级别] [int] NULL,
	[排序] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_主办讲座]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_主办讲座] AS TABLE(
	[编号] [int] NULL,
	[活动名称] [nvarchar](500) NULL,
	[所属部门编号] [int] NULL,
	[活动经费] [numeric](18, 2) NULL,
	[会议类型] [nvarchar](50) NULL,
	[活动对象] [nvarchar](500) NULL,
	[开始时间] [datetime] NULL,
	[结束时间] [datetime] NULL,
	[主办人编号] [int] NULL,
	[主讲人姓名] [nvarchar](50) NULL,
	[主讲人国别] [nvarchar](50) NULL,
	[主讲人单位] [nvarchar](50) NULL,
	[主讲人学位] [nvarchar](50) NULL,
	[主讲人职称] [nvarchar](50) NULL,
	[主讲人简历路径] [nvarchar](max) NULL,
	[讲座地点] [nvarchar](500) NULL,
	[内容概述] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_专家评分]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_专家评分] AS TABLE(
	[编号] [int] NULL,
	[流程模板编号] [int] NULL,
	[项目编号] [int] NULL,
	[专家编号] [int] NULL,
	[评分项] [nvarchar](100) NULL,
	[评分] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_字典]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_字典] AS TABLE(
	[编号] [int] NULL,
	[分类] [nvarchar](50) NULL,
	[值] [nvarchar](50) NULL,
	[上级编号] [int] NULL,
	[级别] [int] NULL,
	[排序] [int] NULL,
	[备注] [nvarchar](500) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_纵向项目变更]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_纵向项目变更] AS TABLE(
	[编号] [int] NULL,
	[变更内容简介] [nvarchar](1000) NULL,
	[变更事由] [nvarchar](1000) NULL,
	[变更备注] [nvarchar](1000) NULL,
	[变更时间] [datetime] NULL,
	[纵向项目编号] [int] NULL,
	[分类] [int] NULL,
	[项目登记情况] [nvarchar](50) NULL,
	[项目编号] [nvarchar](50) NULL,
	[项目中文名称] [nvarchar](100) NULL,
	[项目英文名称] [nvarchar](100) NULL,
	[项目分类] [nvarchar](50) NULL,
	[成果归属部门] [nvarchar](500) NULL,
	[负责人编号] [int] NULL,
	[立项年度] [int] NULL,
	[登记日期] [date] NULL,
	[登记人编号] [int] NULL,
	[批准日期] [date] NULL,
	[批准经费] [numeric](18, 2) NULL,
	[配套经费] [numeric](18, 2) NULL,
	[经费卡号] [nvarchar](50) NULL,
	[项目等级] [nvarchar](50) NULL,
	[计划开始日期] [date] NULL,
	[计划完成日期] [date] NULL,
	[学科门类] [nvarchar](50) NULL,
	[学科类型] [nvarchar](50) NULL,
	[研究类型] [nvarchar](50) NULL,
	[项目类型] [nvarchar](50) NULL,
	[项目级别] [nvarchar](50) NULL,
	[项目来源单位] [nvarchar](50) NULL,
	[项目类别] [nvarchar](50) NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](100) NULL,
	[亚类说明] [nvarchar](500) NULL,
	[附注说明] [nvarchar](500) NULL,
	[纵向项目合同类型] [nvarchar](50) NULL,
	[国民经济行业] [nvarchar](1000) NULL,
	[合作形式] [nvarchar](1000) NULL,
	[社会经济目标] [nvarchar](1000) NULL,
	[是否需要伦理评审] [bit] NULL,
	[是否需要伦理批文] [bit] NULL,
	[伦理批文编号] [nvarchar](50) NULL,
	[伦理批文时间] [datetime] NULL,
	[伦理批文路径] [ntext] NULL,
	[立项文件路径] [ntext] NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_纵向项目结题]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_纵向项目结题] AS TABLE(
	[编号] [int] NULL,
	[纵向项目编号] [int] NULL,
	[结题验收编号] [nvarchar](100) NULL,
	[结题验收时间] [datetime] NULL,
	[结题验收是否合格] [bit] NULL,
	[结题验收参与人数] [int] NULL,
	[结题资料路径] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_纵向项目立项]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_纵向项目立项] AS TABLE(
	[编号] [int] NULL,
	[分类] [int] NULL,
	[项目登记情况] [nvarchar](50) NULL,
	[项目编号] [nvarchar](50) NULL,
	[项目中文名称] [nvarchar](100) NULL,
	[项目英文名称] [nvarchar](100) NULL,
	[项目分类] [nvarchar](50) NULL,
	[成果归属部门] [nvarchar](500) NULL,
	[负责人编号] [int] NULL,
	[立项年度] [int] NULL,
	[登记日期] [date] NULL,
	[登记人编号] [int] NULL,
	[批准日期] [date] NULL,
	[批准经费] [numeric](18, 2) NULL,
	[配套经费] [numeric](18, 2) NULL,
	[经费卡号] [nvarchar](50) NULL,
	[项目等级] [nvarchar](50) NULL,
	[计划开始日期] [date] NULL,
	[计划完成日期] [date] NULL,
	[学科门类] [nvarchar](50) NULL,
	[学科类型] [nvarchar](50) NULL,
	[研究类型] [nvarchar](50) NULL,
	[项目类型] [nvarchar](50) NULL,
	[项目级别] [nvarchar](50) NULL,
	[项目来源单位] [nvarchar](50) NULL,
	[项目类别] [nvarchar](50) NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](100) NULL,
	[亚类说明] [nvarchar](500) NULL,
	[附注说明] [nvarchar](500) NULL,
	[纵向项目合同类型] [nvarchar](50) NULL,
	[国民经济行业] [nvarchar](1000) NULL,
	[合作形式] [nvarchar](1000) NULL,
	[社会经济目标] [nvarchar](1000) NULL,
	[是否需要伦理评审] [bit] NULL,
	[是否需要伦理批文] [bit] NULL,
	[伦理批文编号] [nvarchar](50) NULL,
	[伦理批文时间] [datetime] NULL,
	[伦理批文路径] [ntext] NULL,
	[立项文件路径] [ntext] NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_纵向项目申报]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_纵向项目申报] AS TABLE(
	[编号] [int] NULL,
	[分类] [int] NULL,
	[项目名称] [nvarchar](100) NULL,
	[申报人编号] [int] NULL,
	[学科门类] [nvarchar](50) NULL,
	[学科类型] [nvarchar](50) NULL,
	[申报年度] [int] NULL,
	[项目类型] [nvarchar](50) NULL,
	[项目级别] [nvarchar](50) NULL,
	[项目来源单位] [nvarchar](50) NULL,
	[项目类别] [nvarchar](50) NULL,
	[申报时间] [datetime] NULL,
	[申请经费] [numeric](18, 2) NULL,
	[计划开始日期] [date] NULL,
	[计划完成日期] [date] NULL,
	[项目等级] [nvarchar](50) NULL,
	[是否委托外单位进行实验或实验分析] [bit] NULL,
	[实验委托检测内容] [nvarchar](1000) NULL,
	[项目摘要] [nvarchar](1000) NULL,
	[是否需要伦理评审] [bit] NULL,
	[是否需要伦理批文] [bit] NULL,
	[伦理批文编号] [nvarchar](50) NULL,
	[伦理批文路径] [ntext] NULL,
	[项目申报书路径] [ntext] NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
	[是否立项] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[tt_纵向项目中检]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[tt_纵向项目中检] AS TABLE(
	[编号] [int] NULL,
	[纵向项目编号] [int] NULL,
	[中检资料路径] [nvarchar](500) NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[TTPersonTypeAndId]    Script Date: 2020/3/9 9:00:34 ******/
CREATE TYPE [dbo].[TTPersonTypeAndId] AS TABLE(
	[PersonType] [nvarchar](50) NULL,
	[PersonId] [int] NULL
)
GO
/****** Object:  StoredProcedure [dbo].[sp_GetList]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetList]
    @tbName NVARCHAR(200) ,        --表名
    @tbFields NVARCHAR(1000) = '*' ,      --返回字段
    @keyFields NVARCHAR(1000) = '' ,      --主键字段
    @OrderType BIT = 0 ,  --排序类型,1是升序,0是降序
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(4000) = ''     --查询条件
    --@Total INT OUTPUT ,         --返回总记录数
    --@SQLstr NVARCHAR(4000) OUTPUT
AS
    DECLARE @strSql VARCHAR(MAX);     --主语句
    DECLARE @strOrder VARCHAR(200);    --排序
    DECLARE @strSqlCount NVARCHAR(MAX);  --查询记录总数主语句
    DECLARE @SQLstr NVARCHAR(4000);

    --SELECT  @keyFields = STUFF(( SELECT ',' + c.name
    --                             FROM   sysindexes i
    --                                    JOIN sysindexkeys k ON i.id = k.id
    --                                                          AND i.indid = k.indid
    --                                    JOIN sysobjects o ON i.id = o.id
    --                                    JOIN syscolumns c ON i.id = c.id
    --                                                         AND k.colid = c.colid
    --                                    JOIN systypes t ON c.xusertype = t.xusertype
    --                             WHERE  o.xtype = 'U'
    --                                    AND o.name = @tbName
    --                                    AND EXISTS ( SELECT 1
    --                                                 FROM   sysobjects
    --                                                 WHERE  xtype = 'PK'
    --                                                        AND parent_obj = i.id
    --                                                        AND name = i.name )
    --                           FOR
    --                             XML PATH('')
    --                           ), 1, 1, '');
				--			    SET @keyFields = ISNULL(@keyFields,'(select 1)');
--------------排序-----------------1是降序,0未升序
    IF @OrderStr = ''
        SET @OrderStr = '1';
		--SET @OrderStr = '(SELECT 1)';

    SET @strOrder = ' order by ' + @OrderStr
        + IIF(@OrderType = 0, ' desc ', ' asc ');

    IF @tbFields = ''
        SET @tbFields = '*';

    IF @strWhere != ''
        BEGIN
            SET @strSql = 'select ' + @tbFields + ' from ' + @tbName
                + ' where ' + @strWhere + ' ' + @strOrder;
        END;
    ELSE
        BEGIN
            SET @strSql = 'select ' + @tbFields + ' from ' + @tbName
                + @strOrder;
        END;
    --BEGIN TRY
        
    SET @SQLstr = @strSql;
    PRINT @strSql;
    EXEC(@strSql);

    --    RETURN 1;
    --END TRY  
    --BEGIN CATCH 
		
    --    DECLARE @ErrorMessage NVARCHAR(4000);
    --    DECLARE @ErrorSeverity INT;
    --    DECLARE @ErrorState INT;

    --    SELECT  @ErrorMessage = ERROR_MESSAGE() + ' sql:' + @SQLstr ,
    --            @ErrorSeverity = ERROR_SEVERITY() ,
    --            @ErrorState = ERROR_STATE();

    --    RAISERROR (@ErrorMessage,  -- Message text.
				--   @ErrorSeverity, -- Severity.
				--   @ErrorState     -- State.
				--   );
		
    --END CATCH;
    --SET ANSI_NULLS ON; 






GO
/****** Object:  StoredProcedure [dbo].[sp_GetPagingList]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetPagingList]
    @tbName NVARCHAR(200) ,        --表名
    @tbFields NVARCHAR(1000) = '*' ,      --返回字段
    @keyFields NVARCHAR(1000) = '' ,      --主键字段
    @OrderType BIT = 0 ,  --排序类型,1是升序,0是降序
    @PageSize INT = 10 ,                 --页尺寸
    @PageIndex INT = 1 ,                --页码
    @OrderStr NVARCHAR(200) = '' ,
    @strWhere NVARCHAR(4000) = ''     --查询条件
    --@Total INT OUTPUT ,         --返回总记录数
    --@SQLstr NVARCHAR(4000) OUTPUT
AS
    DECLARE @strSql VARCHAR(MAX);     --主语句
    DECLARE @strOrder VARCHAR(200);    --排序
    DECLARE @strSqlCount NVARCHAR(MAX);  --查询记录总数主语句
    DECLARE @SQLstr NVARCHAR(4000);

    --SELECT  @keyFields = STUFF(( SELECT ',' + c.name
    --                             FROM   sysindexes i
    --                                    JOIN sysindexkeys k ON i.id = k.id
    --                                                          AND i.indid = k.indid
    --                                    JOIN sysobjects o ON i.id = o.id
    --                                    JOIN syscolumns c ON i.id = c.id
    --                                                         AND k.colid = c.colid
    --                                    JOIN systypes t ON c.xusertype = t.xusertype
    --                             WHERE  o.xtype = 'U'
    --                                    AND o.name = @tbName
    --                                    AND EXISTS ( SELECT 1
    --                                                 FROM   sysobjects
    --                                                 WHERE  xtype = 'PK'
    --                                                        AND parent_obj = i.id
    --                                                        AND name = i.name )
    --                           FOR
    --                             XML PATH('')
    --                           ), 1, 1, '');
				--			    SET @keyFields = ISNULL(@keyFields,'(select 1)');
    --IF @OrderStr != ''
    --    BEGIN
    --        IF @OrderType != 0
    --            SET @OrderStr = @OrderStr + ' asc ,';
    --        ELSE
    --            SET @OrderStr = @OrderStr + ' desc ,';
            
    --    END; 
    --IF @OrderType != 0
    --    SET @strOrder = ' order by ' + @OrderStr + ' ' + @keyFields + ' asc ';
    --ELSE
    --    SET @strOrder = ' order by ' + @OrderStr + ' ' + @keyFields + ' desc ';

    IF @OrderStr = ''
        SET @OrderStr = '1';
		--SET @OrderStr = '(SELECT 1)';

    SET @strOrder = ' order by ' + @OrderStr
        + IIF(@OrderType = 0, ' desc ', ' asc ');
--------------总记录数---------------
    IF @strWhere != ''
        BEGIN
            SET @strSqlCount = 'Select count(1) from  ' + @tbName + ' where  '
                + @strWhere;
        END;
    ELSE
        BEGIN
            SET @strSqlCount = 'Select count(1) from  ' + @tbName;
        END;
    IF @tbFields = ''
        SET @tbFields = '*';
    --IF @strWhere != ''
    --    BEGIN
            --SET @strSql = 'select top ' + STR(@PageSize) + ' ' + @tbFields
            --    + ' from ' + @tbName + ' where ' + @keyFields
            --    + ' not in (select top ' + STR(( @PageIndex - 1 ) * @PageSize)
            --    + ' ' + @keyFields + ' from ' + @tbName + ' where '
            --    + @strWhere + ' ' + @strOrder + '  ) and ' + @strWhere + ' '
            --    + @strOrder;

    SET @strSql = 'select ' + @tbFields + ' from ' + @tbName
        + IIF(@strWhere = '', '', ' where ' + @strWhere) + @strOrder
        + ' OFFSET ' + STR(( @PageIndex - 1 ) * @PageSize)
        + ' ROW FETCH NEXT ' + STR(@PageSize) + ' ROWS only; ';
    --    END;
    --ELSE
    --    BEGIN
    --        SET @strSql = 'select top ' + STR(@PageSize) + ' ' + @tbFields
    --            + ' from ' + @tbName + ' where ' + @keyFields
    --            + ' not in (select top ' + STR(( @PageIndex - 1 ) * @PageSize)
    --            + ' ' + @keyFields + ' from ' + @tbName + ' ' + @strOrder
    --            + ') ' + @strOrder;
    --    END;
   -- BEGIN TRY
    SET @SQLstr = @strSql;
        --PRINT @strSqlCount;
    EXEC sp_executesql @strSqlCount;
        PRINT @strSql;
    EXEC(@strSql);

    --    RETURN 1;
    --END TRY  
    --BEGIN CATCH 
		
    --    DECLARE @ErrorMessage NVARCHAR(4000);
    --    DECLARE @ErrorSeverity INT;
    --    DECLARE @ErrorState INT;

    --    SELECT  @ErrorMessage = ERROR_MESSAGE() + ' sql:' + @SQLstr ,
    --            @ErrorSeverity = ERROR_SEVERITY() ,
    --            @ErrorState = ERROR_STATE();

    --    RAISERROR (@ErrorMessage,  -- Message text.
				--   @ErrorSeverity, -- Severity.
				--   @ErrorState     -- State.
				--   );
		
    --END CATCH;
    --SET ANSI_NULLS ON; 






GO
/****** Object:  StoredProcedure [dbo].[sp_Rebuild]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Rebuild]
AS --视图、存储过程、函数名称
    DECLARE @NAME NVARCHAR(255);
--局部游标
    DECLARE @CUR CURSOR;
--自动修改未上状态为旷课
    SET @CUR=CURSOR SCROLL DYNAMIC FOR
SELECT name FROM dbo.sysobjects
    WHERE name NOT IN ('SYSCONSTRAINTS','SYSSEGMENTS')
        AND
        (
            OBJECTPROPERTY(id, N'IsView') = 1               --视图
            --OR OBJECTPROPERTY(id,N'IsProcedure') = 1        --存储过程
            OR OBJECTPROPERTY(id,N'IsScalarFunction') = 1   --标量函数
            OR OBJECTPROPERTY(id,N'IsTableFunction') = 1    --标题函数
            OR OBJECTPROPERTY(id,N'IsInlineFunction') = 1   --内联函数
        );

    OPEN @CUR;
    FETCH NEXT FROM @CUR INTO @NAME;

    WHILE ( @@FETCH_STATUS = 0 )
        BEGIN

            DECLARE @OldText NVARCHAR(MAX)= '';
            DECLARE @NewText NVARCHAR(MAX)= '';

    --读取创建脚本，当脚本超长时分成多条记录时合并
            SELECT  @OldText = @OldText + CHAR(10) + CHAR(13) + RTRIM(text)
            FROM    syscomments
            WHERE   id = OBJECT_ID(@NAME);
       
    --将创建脚本替换为更新脚本
            SET @NewText = REPLACE(@OldText, N'CREATE VIEW', N'ALTER VIEW');

            SET @NewText = REPLACE(@NewText, N'CREATE PROCEDURE',
                                   N'ALTER PROCEDURE');
                                         
            SET @NewText = REPLACE(@NewText, N'CREATE FUNCTION',
                                   N'ALTER FUNCTION');
            PRINT @NewText;
            BEGIN TRY
                EXEC(@NewText);
            END TRY
            BEGIN CATCH
                PRINT N'---------------------------------------------------------------------------';
                PRINT @NAME + N' : ' + ERROR_MESSAGE();
        --PRINT @OldText;
                PRINT N'---------------------------------------------------------------------------';
            END CATCH;

            FETCH NEXT FROM @CUR INTO @NAME;

        END;

    CLOSE @CUR;
    DEALLOCATE @CUR;
GO
/****** Object:  StoredProcedure [dbo].[sp_按部门对指定字段统计人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--sp_按部门对指定字段统计人员 '学历'

CREATE PROC [dbo].[sp_按部门对指定字段统计人员]
    (
      @字段名 NVARCHAR(100) 
    )
AS
   
    DECLARE @列 NVARCHAR(2000);

    SELECT  @列 = STUFF(( SELECT ',' + 值
                         FROM   字典
                         WHERE  分类 = @字段名
                       FOR
                         XML PATH('')
                       ), 1, 0, '未指定');

    --SELECT  @列;
    DECLARE @sql NVARCHAR(MAX);

	--DECLARE @合计 NVARCHAR(1000) = N'未指定 + 北大省级 + 中华医学会中华系列期刊库 + 科技统计源期刊库';
    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+[' + ID+']'
                          FROM      dbo.SplitStringToTable(@列, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
    --SELECT  @合计;

	--DECLARE @sqlIn  NVARCHAR(1000)= N'[未指定],[北大省级],[中华医学会中华系列期刊库],[科技统计源期刊库]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@列, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');
    --SELECT  @sqlIn;

	--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(未指定) ,SUM(北大省级) ,SUM(中华医学会中华系列期刊库) ,SUM(科技统计源期刊库)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',sum([' + ID + '])'
                                 FROM   dbo.SplitStringToTable(@列, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');
    --SELECT  @sqlSelect;

    SET @sql = CONCAT(N'
	WITH cte AS (SELECT a.部门名称,iif(', @字段名, ' IS NULL OR ', @字段名, '='''',''未指定'',', @字段名, ')AS 列 FROM dbo.v1_人员_带部门名 a),
         ctePivot AS ( SELECT   * ,', @合计, ' AS 合计
			FROM cte PIVOT ( COUNT(列) FOR 列 IN ( ', @sqlIn, ' ) )  AS t)
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            SUM(合计)
    FROM    ctePivot');

    --SELECT  @sql;

    EXEC sys.sp_executesql @sql;

GO
/****** Object:  StoredProcedure [dbo].[sp_按指定字段统计成果]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
	
CREATE PROC [dbo].[sp_按指定字段统计成果] (@字段名 NVARCHAR(100),@字段显示名 NVARCHAR(50),@where NVARCHAR(100))
AS
--sp_按部门统计成果 '部门名称','部门'
--sp_按部门统计成果 '职务名称','职务'
DECLARE @收录情况 NVARCHAR(1000);
SET @收录情况 = '未指定,北大省级,中华医学会中华系列期刊库,科技统计源期刊库'

--DECLARE @获奖级别 NVARCHAR(1000);

--    SELECT  @获奖级别 = STUFF(( SELECT  ',' + 值
--                            FROM    字典
--                            WHERE   分类 = '获奖级别'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');

-- DECLARE @著作类型 NVARCHAR(1000);

--    SELECT  @著作类型 = STUFF(( SELECT  ',' + 值
--                            FROM    字典
--                            WHERE   分类 = '著作类型'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');
--						  --SELECT @著作类型;

-- DECLARE @专利类型 NVARCHAR(1000);

--    SELECT  @专利类型 = STUFF(( SELECT  ',' + 值
--                            FROM    字典
--                            WHERE   分类 = '专利类型'
--                          FOR
--                            XML PATH('')
--                          ), 1, 1, '');
--						  --SELECT @专利类型;

DECLARE @列 NVARCHAR(2000);
--SET @列 = CONCAT(@收录情况,',',@获奖级别,',',@著作类型,',',@专利类型);
SET @列 = CONCAT('获奖',',','著作',',','专利',',',@收录情况);

    DECLARE @sql NVARCHAR(MAX);
--DECLARE @合计 NVARCHAR(1000) = N'未指定 + 北大省级 + 中华医学会中华系列期刊库 + 科技统计源期刊库';
    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@列, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');

--DECLARE @sqlIn  NVARCHAR(1000)= N'[未指定],[北大省级],[中华医学会中华系列期刊库],[科技统计源期刊库]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@列, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(未指定) ,SUM(北大省级) ,SUM(中华医学会中华系列期刊库) ,SUM(科技统计源期刊库)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',isnull(sum(' + ID + '),0)'
                                 FROM   dbo.SplitStringToTable(@列, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.',@字段名,' ,
                        c.收录情况 
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果论文 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 1 and ',@where,'
						JOIN 流程 b1 ON b1.流程模板编号 = 300 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        LEFT JOIN 期刊 c ON b.刊物编号 = c.编号 
             ),

        cteSplit
          AS ( SELECT   cte.',@字段名,' as ',@字段显示名,',
                        ISNULL(Split.分解后的收录情况, ''未指定'') as 列
               FROM     cte
                        OUTER APPLY ( SELECT    ID AS 分解后的收录情况
                                      FROM      dbo.SplitStringToTable(cte.收录情况,
                                                              '','')
                                    ) AS Split
             ),

		cte获奖
          AS ( SELECT   a1.',@字段名,' as ',@字段显示名,' ,
                        ''获奖''   as 列
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果获奖 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 4
						JOIN 流程 b1 ON b1.流程模板编号 = 303 AND b.编号 = b1.项目编号 AND b1.状态 = 1 where ',@where,'
             ),

		cte著作
          AS ( SELECT   a1.',@字段名,' as ',@字段显示名,',
                        ''著作''   as 列
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果著作 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 2
						JOIN 流程 b1 ON b1.流程模板编号 = 301 AND b.编号 = b1.项目编号 AND b1.状态 = 1 where ',@where,'
                        
             ),

		cte专利
          AS ( SELECT   a1.',@字段名,' as ',@字段显示名,',
                        ''专利''   as 列
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果专利 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 3
						JOIN 流程 b1 ON b1.流程模板编号 = 302 AND b.编号 = b1.项目编号 AND b1.状态 = 1 where ',@where,'
                        
             ),
		cteAll as(
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cte获奖 union all
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cte著作 union all
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cte专利 union all
			select  IIF(',@字段显示名,' IS NULL OR ',@字段显示名,' = '''',''未指定'',',@字段显示名,') as ',@字段显示名,',列 from cteSplit
		),
        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cteAll PIVOT ( COUNT(列) FOR 列 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            isnull(SUM(合计),0)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;


GO
/****** Object:  StoredProcedure [dbo].[sp_报销_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_报销_增改]
    (
      @tt tt_报销 READONLY ,
      @tt_报销详情 tt_报销详情 READONLY
    )
AS
    DECLARE @编号 tt_编号; 
    DECLARE @报销编号 INT;

    SET XACT_ABORT ON;
    BEGIN TRAN;

    MERGE dbo.报销 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[流程模板编号] = s.[流程模板编号] ,
               t.[项目编号] = s.[项目编号] ,
               t.[报销编号] = s.[报销编号] ,
               t.[报销金额] = s.[报销金额] ,
               t.[报销方式] = s.[报销方式] ,
               t.[公务卡号] = s.[公务卡号] ,
               t.[公务卡所属人姓名] = s.[公务卡所属人姓名] ,
               t.[报销人编号] = s.[报销人编号] ,
               t.[报销时间] = s.[报销时间] ,
               t.[相关文件路径] = s.[相关文件路径] ,
               t.[申请时间] = s.[申请时间] ,
               t.[报销经费用途] = s.[报销经费用途]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.流程模板编号 ,
                 s.项目编号 ,
                 s.报销编号 ,
                 s.报销金额 ,
                 s.报销方式 ,
                 s.公务卡号 ,
                 s.公务卡所属人姓名 ,
                 s.报销人编号 ,
                 s.报销时间 ,
                 s.相关文件路径 ,
                 s.申请时间 ,
                 GETDATE() ,
                 s.报销经费用途 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;

    SELECT  @报销编号 = 编号
    FROM    @编号;

    MERGE 报销详情 t
    USING @tt_报销详情 s
    ON t.报销编号 = @报销编号
        AND s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               --t.报销编号 = @报销编号 ,
               t.项目支出类型 = s.项目支出类型 ,
               t.项目支出内容 = s.项目支出内容 ,
               t.财务科目 = s.财务科目 ,
               t.报销金额 = s.报销金额 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 报销编号 ,
                 项目支出类型 ,
                 项目支出内容 ,
                 财务科目 ,
                 报销金额 ,
                 备注
               )
        VALUES ( @报销编号 ,
                 s.项目支出类型 ,
                 s.项目支出内容 ,
                 s.财务科目 ,
                 s.报销金额 ,
                 s.备注
               )
    WHEN NOT MATCHED BY SOURCE AND  t.报销编号 = @报销编号 THEN
        DELETE;

    COMMIT TRAN;

    SELECT  *
    FROM    @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_报销详情_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_报销详情_增改](@tt tt_报销详情 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.报销详情 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[报销编号]  = s.[报销编号] ,
			t.[项目支出类型]  = s.[项目支出类型] ,
			t.[项目支出内容]  = s.[项目支出内容] ,
			t.[财务科目]  = s.[财务科目] ,
			t.[报销金额]  = s.[报销金额] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT Values( 
			s.报销编号 ,
			s.项目支出类型 ,
			s.项目支出内容 ,
			s.财务科目 ,
			s.报销金额 ,
			s.备注 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_步骤指定人_增]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_步骤指定人_增]
    (
      @下一步骤编号 INT ,
      @tt tt_编号 READONLY
    )
AS
    DECLARE @编号 tt_编号; 

    INSERT  dbo.步骤指定人
            ( 步骤编号, 指定人编号 )
    OUTPUT  Inserted.编号
            INTO @编号
            SELECT  @下一步骤编号 ,
                    编号
            FROM    @tt;

    SELECT  *
    FROM    @编号;

GO
/****** Object:  StoredProcedure [dbo].[sp_部门_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_部门_启禁] ( @编号 INT, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.部门 a
    WHERE   a.编号 = @编号; 
GO
/****** Object:  StoredProcedure [dbo].[sp_部门_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_部门_增改](@tt_部门 tt_部门 READONLY) 
	AS 
MERGE dbo.部门 t
		USING @tt_部门 s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[上级部门编号]  = s.[上级部门编号] ,
			t.[名称]  = s.[名称] ,
			t.[负责人编号]  = s.[负责人编号] ,
			t.[排序值]  = s.[排序值] ,
			t.[备注]  = s.[备注] ,
			t.[是否启用]  = s.[是否启用] 
 WHEN NOT MATCHED THEN INSERT Values( 
			[上级部门编号] ,
			[名称] ,
			[负责人编号] ,
			[排序值] ,
			[备注] ,
			[是否启用] 
)
;
GO
/****** Object:  StoredProcedure [dbo].[sp_参加会议_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_参加会议_增改]
    (
      @tt tt_参加会议 READONLY ,
      @tt_项目经费预算 tt_项目经费预算 READONLY
    )
AS
    DECLARE @流程模板编号 INT = 210;
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 
    MERGE dbo.参加会议 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[会议名称] = s.[会议名称] ,
               t.[会议主办单位] = s.[会议主办单位] ,
               t.[会议承办单位] = s.[会议承办单位] ,
               t.[研讨领域] = s.[研讨领域] ,
               t.[学科类型] = s.[学科类型] ,
               t.[会议地址] = s.[会议地址] ,
               t.[会议开始时间] = s.[会议开始时间] ,
               t.[会议结束时间] = s.[会议结束时间] ,
               t.[往返时间] = s.[往返时间] ,
               t.[会议网址] = s.[会议网址] ,
               t.[会议简介及申请理由] = s.[会议简介及申请理由] ,
               t.[申请人编号] = s.[申请人编号] ,
               t.[参会相关文件路径] = s.[参会相关文件路径]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [会议名称] ,
                 [会议主办单位] ,
                 [会议承办单位] ,
                 [研讨领域] ,
                 [学科类型] ,
                 [会议地址] ,
                 [会议开始时间] ,
                 [会议结束时间] ,
                 [往返时间] ,
                 [会议网址] ,
                 [会议简介及申请理由] ,
                 [申请人编号] ,
                 [参会相关文件路径] 
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
;
GO
/****** Object:  StoredProcedure [dbo].[sp_参加会议反馈_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_参加会议反馈_增改](@tt tt_参加会议反馈 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.参加会议反馈 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[参加会议编号]  = s.[参加会议编号] ,
			t.[活动持续分钟]  = s.[活动持续分钟] ,
			t.[参会人数]  = s.[参会人数] ,
			t.[参会总结]  = s.[参会总结] ,
			t.[会议反馈文件路径]  = s.[会议反馈文件路径] 
 WHEN NOT MATCHED THEN INSERT Values( 
			[参加会议编号] ,
			[活动持续分钟] ,
			[参会人数] ,
			[参会总结] ,
			[会议反馈文件路径] 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_成果获奖_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[sp_成果获奖_增改]    Script Date: 2018/9/12 14:32:23 ******/
CREATE PROC [dbo].[sp_成果获奖_增改]
    (
      @tt tt_成果获奖 READONLY ,
      @tt_成果项目 tt_成果项目 READONLY ,
      @tt_成果作者 tt_成果作者 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;
    DECLARE @编号 tt_编号; 
    MERGE dbo.成果获奖 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[获奖名称] = s.[获奖名称] ,
               t.[获奖级别] = s.[获奖级别] ,
               t.[获奖日期] = s.[获奖日期] ,
               t.[获奖类别] = s.[获奖类别] ,
			   t.获奖等级 = s.获奖等级,
               t.[奖励情况] = s.[奖励情况] ,
               t.[联系人] = s.[联系人] ,
               t.[联系人手机] = s.[联系人手机] ,
               t.[项目开始时间] = s.[项目开始时间] ,
               t.[项目结束时间] = s.[项目结束时间] ,
               t.[应用开始时间] = s.[应用开始时间] ,
               t.[应用结束时间] = s.[应用结束时间] ,
               t.[年度] = s.[年度] ,
               t.[批文时间] = s.[批文时间] ,
               t.[颁奖单位] = s.[颁奖单位] ,
               t.[完成人数] = s.[完成人数] ,
               t.[获奖证书编号] = s.[获奖证书编号] ,
               t.[完成单位数量] = s.[完成单位数量] ,
               t.[获奖摘要] = s.[获奖摘要] ,
               t.[备注] = s.[备注] ,
               t.[相关文件路径] = s.[相关文件路径] ,
               t.[获奖单位文件路径] = s.[获奖单位文件路径] ,
               t.[获奖批文] = s.[获奖批文]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [获奖名称] ,
                 [获奖级别] ,
                 [获奖日期] ,
                 [获奖类别] ,
				 获奖等级,
                 [奖励情况] ,
                 [联系人] ,
                 [联系人手机] ,
                 [项目开始时间] ,
                 [项目结束时间] ,
                 [应用开始时间] ,
                 [应用结束时间] ,
                 [年度] ,
                 [批文时间] ,
                 [颁奖单位] ,
                 [完成人数] ,
                 [获奖证书编号] ,
                 [完成单位数量] ,
                 [获奖摘要] ,
                 [备注] ,
                 [相关文件路径] ,
                 [获奖单位文件路径] ,
                 [获奖批文] 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;
        SELECT  *
        FROM    @编号;


    DECLARE @成果类型 INT = 4; --获奖是定死4
    DECLARE @成果编号 INT;
    SELECT  @成果编号 = 编号
    FROM    @编号;

	--该著作的多条项目的维护
    MERGE dbo.成果项目 t
    USING @tt_成果项目 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.项目类型 = t.项目类型
        AND s.项目编号 = t.项目编号
    WHEN MATCHED THEN
        UPDATE SET
               t.是否项目带来成果 = s.是否项目带来成果
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 项目类型 ,
                 项目编号 ,
                 是否项目带来成果
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.项目类型 ,
                 s.项目编号 ,
                 s.是否项目带来成果
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

	--该论文的多条作者的维护
    MERGE 成果作者 t
    USING @tt_成果作者 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.作者编号 = t.作者编号
    WHEN MATCHED THEN
        UPDATE SET
               t.作者级别 = s.作者级别 ,
               t.工作量占比 = s.工作量占比 ,
               t.完成字数 = s.完成字数
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 作者级别 ,
                 作者编号 ,
                 工作量占比 ,
                 完成字数
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.作者级别 ,
                 s.作者编号 ,
                 s.工作量占比 ,
                 s.完成字数
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

    COMMIT TRAN;


    SELECT  *
    FROM    @编号;
;

GO
/****** Object:  StoredProcedure [dbo].[sp_成果论文_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_成果论文_增改]
    (
      @tt tt_成果论文 READONLY ,
      @tt_成果项目 tt_成果项目 READONLY ,
      @tt_成果作者 tt_成果作者 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 

    MERGE dbo.成果论文 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[认领人编号] = s.[认领人编号] ,
               t.[论文标题] = s.[论文标题] ,
               t.[论文标题类型] = s.[论文标题类型] ,
               t.[论文Online日期] = s.[论文Online日期] ,
               t.[论文正式出版日期] = s.[论文正式出版日期] ,
               t.[他引次数] = s.[他引次数] ,
               t.[年度] = s.[年度] ,
               t.[收稿日期] = s.[收稿日期] ,
               t.[论文所属栏目] = s.[论文所属栏目] ,
               t.[版面费] = s.[版面费] ,
               t.[超额版面费] = s.[超额版面费] ,
               t.[超额费用来源] = s.[超额费用来源] ,
               t.[奖励情况] = s.[奖励情况] ,
               t.[论文字数] = s.[论文字数] ,
               t.[计划来源] = s.[计划来源] ,
               t.[论文版面] = s.[论文版面] ,
               t.[学科门类] = s.[学科门类] ,
               t.[一级学科] = s.[一级学科] ,
               t.[二级学科] = s.[二级学科] ,
               t.[三级学科] = s.[三级学科] ,
               t.[作者人数] = s.[作者人数] ,
               t.[关键字] = s.[关键字] ,
               t.[论文摘要] = s.[论文摘要] ,
               t.[备注] = s.[备注] ,
               t.[刊物编号] = s.[刊物编号] ,
               t.[卷号] = s.[卷号] ,
               t.[期号] = s.[期号] ,
               t.[页码范围起] = s.[页码范围起] ,
               t.[页码范围止] = s.[页码范围止] ,
               t.[论文类型] = s.[论文类型] ,
               t.[是否与行业联合发表] = s.[是否与行业联合发表] ,
               t.[是否与地方联合发表] = s.[是否与地方联合发表] ,
               t.[是否与国际联合发表] = s.[是否与国际联合发表] ,
               t.[是否跨学科] = s.[是否跨学科] ,
               t.[是否与本专业相关] = s.[是否与本专业相关] ,
               t.[检索信息页相关文件路径] = s.[检索信息页相关文件路径] ,
               t.[论文正文路径] = s.[论文正文路径] ,
               t.[其他相关文件路径] = s.[其他相关文件路径],
			   t.通讯作者 = s.通讯作者,
			   t.文献类型 = s.文献类型
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [认领人编号] ,
                 [论文标题] ,
                 [论文标题类型] ,
                 [论文Online日期] ,
                 [论文正式出版日期] ,
                 [他引次数] ,
                 [年度] ,
                 [收稿日期] ,
                 [论文所属栏目] ,
                 [版面费] ,
                 [超额版面费] ,
                 [超额费用来源] ,
                 [奖励情况] ,
                 [论文字数] ,
                 [计划来源] ,
                 [论文版面] ,
                 [学科门类] ,
                 [一级学科] ,
                 [二级学科] ,
                 [三级学科] ,
                 [作者人数] ,
                 [关键字] ,
                 [论文摘要] ,
                 [备注] ,
                 [刊物编号] ,
                 [卷号] ,
                 [期号] ,
                 [页码范围起] ,
                 [页码范围止] ,
                 [论文类型] ,
                 [是否与行业联合发表] ,
                 [是否与地方联合发表] ,
                 [是否与国际联合发表] ,
                 [是否跨学科] ,
                 [是否与本专业相关] ,
                 [检索信息页相关文件路径] ,
                 [论文正文路径] ,
                 [其他相关文件路径] ,
				 通讯作者,
				 文献类型
               )
    OUTPUT
        Inserted.编号
        INTO @编号; 

    DECLARE @成果类型 INT = 1; --论文是定死1
    DECLARE @成果编号 INT;
    SELECT  @成果编号 = 编号
    FROM    @编号;

	--该论文的多条项目的维护
    MERGE dbo.成果项目 t
    USING @tt_成果项目 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.项目类型 = t.项目类型
        AND s.项目编号 = t.项目编号
    WHEN MATCHED THEN
        UPDATE SET
               t.是否项目带来成果 = s.是否项目带来成果
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 项目类型 ,
                 项目编号 ,
                 是否项目带来成果
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.项目类型 ,
                 s.项目编号 ,
                 s.是否项目带来成果
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

	--该论文的多条作者的维护
    MERGE 成果作者 t
    USING @tt_成果作者 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.作者编号 = t.作者编号
    WHEN MATCHED THEN
        UPDATE SET
               t.作者级别 = s.作者级别 ,
               t.工作量占比 = s.工作量占比 ,
               t.完成字数 = s.完成字数
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 作者级别 ,
                 作者编号 ,
                 工作量占比 ,
                 完成字数
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.作者级别 ,
                 s.作者编号 ,
                 s.工作量占比 ,
                 s.完成字数
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

    COMMIT TRAN;

	--返回一下论文编号
    SELECT  *
    FROM    @编号;



;

GO
/****** Object:  StoredProcedure [dbo].[sp_成果著作_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_成果著作_增改]
    (
      @tt tt_成果著作 READONLY ,
      @tt_成果项目 tt_成果项目 READONLY ,
      @tt_成果作者 tt_成果作者 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;
		
    DECLARE @编号 tt_编号; 
    MERGE dbo.成果著作 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[著作名称] = s.[著作名称] ,
               t.[出版社名称] = s.[出版社名称] ,
               t.[著作形式] = s.[著作形式] ,
               t.[年度] = s.[年度] ,
               t.[著作出版日期] = s.[著作出版日期] ,
               t.[ISBN号] = s.[ISBN号] ,
               t.[著作字数] = s.[著作字数] ,
               t.[奖励情况] = s.[奖励情况] ,
               t.[出版地] = s.[出版地] ,
               t.[出版社级别] = s.[出版社级别] ,
               t.[著作类型] = s.[著作类型] ,
               t.[是否译为外文] = s.[是否译为外文] ,
               t.[语种] = s.[语种] ,
               t.[学科门类] = s.[学科门类] ,
               t.[一级学科] = s.[一级学科] ,
               t.[二级学科] = s.[二级学科] ,
               t.[三级学科] = s.[三级学科] ,
               t.[作者人数] = s.[作者人数] ,
               t.[发行价] = s.[发行价] ,
               t.[备注] = s.[备注] ,
               t.[封面相关文件路径] = s.[封面相关文件路径] ,
               t.[版权页相关文件路径] = s.[版权页相关文件路径] ,
               t.[前言页相关文件路径] = s.[前言页相关文件路径] ,
               t.[完整目录页相关文件路径] = s.[完整目录页相关文件路径] ,
               t.[其他相关文件路径] = s.[其他相关文件路径]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [著作名称] ,
                 [出版社名称] ,
                 [著作形式] ,
                 [年度] ,
                 [著作出版日期] ,
                 [ISBN号] ,
                 [著作字数] ,
                 [奖励情况] ,
                 [出版地] ,
                 [出版社级别] ,
                 [著作类型] ,
                 [是否译为外文] ,
                 [语种] ,
                 [学科门类] ,
                 [一级学科] ,
                 [二级学科] ,
                 [三级学科] ,
                 [作者人数] ,
                 [发行价] ,
                 [备注] ,
                 [封面相关文件路径] ,
                 [版权页相关文件路径] ,
                 [前言页相关文件路径] ,
                 [完整目录页相关文件路径] ,
                 [其他相关文件路径] 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;


    DECLARE @成果类型 INT = 2; --著作是定死2
    DECLARE @成果编号 INT;
    SELECT  @成果编号 = 编号
    FROM    @编号;

	--该著作的多条项目的维护
    MERGE dbo.成果项目 t
    USING @tt_成果项目 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.项目类型 = t.项目类型
        AND s.项目编号 = t.项目编号
    WHEN MATCHED THEN
        UPDATE SET
               t.是否项目带来成果 = s.是否项目带来成果
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 项目类型 ,
                 项目编号 ,
                 是否项目带来成果
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.项目类型 ,
                 s.项目编号 ,
                 s.是否项目带来成果
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

	--该论文的多条作者的维护
    MERGE 成果作者 t
    USING @tt_成果作者 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.作者编号 = t.作者编号
    WHEN MATCHED THEN
        UPDATE SET
               t.作者级别 = s.作者级别 ,
               t.工作量占比 = s.工作量占比 ,
               t.完成字数 = s.完成字数
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 作者级别 ,
                 作者编号 ,
                 工作量占比 ,
                 完成字数
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.作者级别 ,
                 s.作者编号 ,
                 s.工作量占比 ,
                 s.完成字数
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

    COMMIT TRAN;


    SELECT  *
    FROM    @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_成果专利_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_成果专利_增改]
    (
      @tt tt_成果专利 READONLY ,
      @tt_成果项目 tt_成果项目 READONLY ,
      @tt_成果作者 tt_成果作者 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;
    DECLARE @编号 tt_编号; 
    MERGE dbo.成果专利 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[专利名称] = s.[专利名称] ,
               t.[专利国别] = s.[专利国别] ,
               t.[专利类型] = s.[专利类型] ,
               t.[专利范围] = s.[专利范围] ,
               t.[是否授权] = s.[是否授权] ,
               t.[代理机构] = s.[代理机构] ,
               t.[年度] = s.[年度] ,
               t.[专利权人名称] = s.[专利权人名称] ,
               t.[申请号] = s.[申请号] ,
               t.[申请日期] = s.[申请日期] ,
               t.[公开号] = s.[公开号] ,
               t.[公开日期] = s.[公开日期] ,
               t.[授权机构] = s.[授权机构] ,
               t.[专利号] = s.[专利号] ,
               t.[国际专利主分类号] = s.[国际专利主分类号] ,
               t.[授权公告日] = s.[授权公告日] ,
               t.[证书号] = s.[证书号] ,
               t.[是否职务发明] = s.[是否职务发明] ,
               t.[是否生效] = s.[是否生效] ,
               t.[发明人数] = s.[发明人数] ,
               t.[奖励金额] = s.[奖励金额] ,
               t.[超额费用] = s.[超额费用] ,
               t.[超额费用来源] = s.[超额费用来源] ,
               t.[专利摘要] = s.[专利摘要] ,
               t.[备注] = s.[备注] ,
               t.[相关文件路径] = s.[相关文件路径] ,
               t.[代理费金额] = s.[代理费金额] ,
               t.[代理费发票号] = s.[代理费发票号] ,
               t.[代理费付款日期] = s.[代理费付款日期] ,
               t.[代理资助金额] = s.[代理资助金额] ,
               t.[代理办理资助日期] = s.[代理办理资助日期] ,
               t.[代理费到账日期] = s.[代理费到账日期] ,
               t.[申请费是否减缓] = s.[申请费是否减缓] ,
               t.[申请费金额] = s.[申请费金额] ,
               t.[申请费收据号] = s.[申请费收据号] ,
               t.[申请费支付日期] = s.[申请费支付日期] ,
               t.[申请费资助金额] = s.[申请费资助金额] ,
               t.[申请费办理资助日期] = s.[申请费办理资助日期] ,
               t.[申请费到账日期] = s.[申请费到账日期] ,
               t.[申请审查费是否延缓] = s.[申请审查费是否延缓] ,
               t.[申请审查费用] = s.[申请审查费用] ,
               t.[申请审查费收据编号] = s.[申请审查费收据编号] ,
               t.[申请审查费付款日期] = s.[申请审查费付款日期] ,
               t.[申请审查费资助金额] = s.[申请审查费资助金额] ,
               t.[申请审查费资助日期] = s.[申请审查费资助日期] ,
               t.[申请审查费到账日期] = s.[申请审查费到账日期] ,
               t.[授权费是否减缓] = s.[授权费是否减缓] ,
               t.[授权费用金额] = s.[授权费用金额] ,
               t.[授权费收据号] = s.[授权费收据号] ,
               t.[授权费付款日期] = s.[授权费付款日期] ,
               t.[授权费资助金额] = s.[授权费资助金额] ,
               t.[授权费办理资助日期] = s.[授权费办理资助日期] ,
               t.[授权费到账日期] = s.[授权费到账日期]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( [专利名称] ,
                 [专利国别] ,
                 [专利类型] ,
                 [专利范围] ,
                 [是否授权] ,
                 [代理机构] ,
                 [年度] ,
                 [专利权人名称] ,
                 [申请号] ,
                 [申请日期] ,
                 [公开号] ,
                 [公开日期] ,
                 [授权机构] ,
                 [专利号] ,
                 [国际专利主分类号] ,
                 [授权公告日] ,
                 [证书号] ,
                 [是否职务发明] ,
                 [是否生效] ,
                 [发明人数] ,
                 [奖励金额] ,
                 [超额费用] ,
                 [超额费用来源] ,
                 [专利摘要] ,
                 [备注] ,
                 [相关文件路径] ,
                 [代理费金额] ,
                 [代理费发票号] ,
                 [代理费付款日期] ,
                 [代理资助金额] ,
                 [代理办理资助日期] ,
                 [代理费到账日期] ,
                 [申请费是否减缓] ,
                 [申请费金额] ,
                 [申请费收据号] ,
                 [申请费支付日期] ,
                 [申请费资助金额] ,
                 [申请费办理资助日期] ,
                 [申请费到账日期] ,
                 [申请审查费是否延缓] ,
                 [申请审查费用] ,
                 [申请审查费收据编号] ,
                 [申请审查费付款日期] ,
                 [申请审查费资助金额] ,
                 [申请审查费资助日期] ,
                 [申请审查费到账日期] ,
                 [授权费是否减缓] ,
                 [授权费用金额] ,
                 [授权费收据号] ,
                 [授权费付款日期] ,
                 [授权费资助金额] ,
                 [授权费办理资助日期] ,
                 [授权费到账日期] 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;
        SELECT  *
        FROM    @编号;


    DECLARE @成果类型 INT = 3; 
    DECLARE @成果编号 INT;
    SELECT  @成果编号 = 编号
    FROM    @编号;

	--该著作的多条项目的维护
    MERGE dbo.成果项目 t
    USING @tt_成果项目 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.项目类型 = t.项目类型
        AND s.项目编号 = t.项目编号
    WHEN MATCHED THEN
        UPDATE SET
               t.是否项目带来成果 = s.是否项目带来成果
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 项目类型 ,
                 项目编号 ,
                 是否项目带来成果
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.项目类型 ,
                 s.项目编号 ,
                 s.是否项目带来成果
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

	--该论文的多条作者的维护
    MERGE 成果作者 t
    USING @tt_成果作者 s
    ON t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号
        AND s.作者编号 = t.作者编号
    WHEN MATCHED THEN
        UPDATE SET
               t.作者级别 = s.作者级别 ,
               t.工作量占比 = s.工作量占比 ,
               t.完成字数 = s.完成字数
    WHEN NOT MATCHED THEN
        INSERT ( 成果类型 ,
                 成果编号 ,
                 作者级别 ,
                 作者编号 ,
                 工作量占比 ,
                 完成字数
               )
        VALUES ( @成果类型 ,
                 @成果编号 ,
                 s.作者级别 ,
                 s.作者编号 ,
                 s.工作量占比 ,
                 s.完成字数
               )
    WHEN NOT MATCHED BY SOURCE AND t.成果类型 = @成果类型
        AND t.成果编号 = @成果编号 THEN
        DELETE;

    COMMIT TRAN;


    SELECT  *
    FROM    @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_导入论文]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[sp_导入论文] ( @tt tt_导入论文 READONLY )
AS

    DECLARE @t TABLE
        (
          论文编号 INT ,
          论文标题 NVARCHAR(200)
        );

    SET XACT_ABORT ON;
    BEGIN TRAN;
    INSERT  dbo.成果论文
            ( 论文标题 ,
              年度 ,
              作者人数 ,
              关键字 ,
              论文摘要 ,
              刊物编号 ,
              卷号 ,
              期号 ,
              页码范围起 ,
              页码范围止 
          
            )
    OUTPUT  Inserted.编号 ,
            Inserted.论文标题
            INTO @t
            SELECT  a.论文标题 ,
                    a.年度 ,
                    a.作者人数 ,
                    a.关键字 ,
                    a.论文摘要 ,
                    c1.编号 ,
                    a.卷号 ,
                    a.期号 ,
                    a.页码范围起 ,
                    a.页码范围止
            FROM    @tt a 
                    OUTER APPLY ( SELECT TOP 1
                                            编号
                                  FROM      期刊 c
                                  WHERE     a.刊物名称 = c.名称
                                            OR a.刊物名称 = c.英文刊名
                                ) c1 
								WHERE NOT EXISTS(SELECT 1 FROM 成果论文 b WHERE a.论文标题 = b.论文标题);

    INSERT  dbo.成果作者
            ( 成果类型 ,
              成果编号 ,
              作者级别 ,
              作者编号
            )
            SELECT  1 ,
                    a.论文编号 ,
                    '第一作者' ,
                    c1.编号
            FROM    @t a
                    JOIN @tt b ON a.论文标题 = b.论文标题
                    CROSS APPLY ( SELECT TOP 1
                                            编号
                                  FROM      人员 c
                                  WHERE     b.作者 = c.姓名
                                ) c1;
								
        
    COMMIT TRAN;



GO
/****** Object:  StoredProcedure [dbo].[sp_导入自定义论文]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_导入自定义论文]
    (
      @tt tt_导入自定义论文 READONLY
    )
AS
    DECLARE @t TABLE
        (
          论文编号 INT ,
          论文标题 NVARCHAR(200)
        );

    SET XACT_ABORT ON;
    BEGIN TRAN;

    INSERT  dbo.成果论文
            ( 论文标题 ,
              论文标题类型 ,
              论文Online日期 ,
              论文正式出版日期 ,
              他引次数 ,
              年度 ,
              收稿日期 ,
              论文所属栏目 ,
              论文字数 ,
              计划来源 ,
              论文版面 ,
              学科门类 ,
              一级学科 ,
              二级学科 ,
              三级学科 ,
              作者人数 ,
              关键字 ,
              论文摘要 ,
              刊物编号 ,
              卷号 ,
              期号 ,
              页码范围起 ,
              页码范围止 ,
              论文类型 ,通讯作者,文献类型
	        )
    OUTPUT  Inserted.编号 ,
            Inserted.论文标题
            INTO @t
            SELECT  a.论文标题 ,
                    a.论文标题类型 ,
                    a.论文Online日期 ,
                    a.论文正式出版日期 ,
                    a.他引次数 ,
                    a.年度 ,
                    a.收稿日期 ,
                    a.论文所属栏目 ,
                    a.论文字数 ,
                    a.计划来源 ,
                    a.论文版面 ,
                    a.学科门类 ,
                    a.一级学科 ,
                    a.二级学科 ,
                    a.三级学科 ,
                    a.作者人数 ,
                    a.关键字 ,
                    a.论文摘要 ,
                    c1.编号 ,
                    a.卷号 ,
                    a.期号 ,
                    a.页码范围起 ,
                    a.页码范围止 ,
                    a.论文类型,a.通讯作者,a.文献类型
            FROM    @tt a
                    OUTER APPLY ( SELECT TOP 1
                                            编号
                                  FROM      期刊 c
                                  WHERE     a.刊物名称 = c.名称
                                            OR a.刊物名称 = c.英文刊名
                                ) c1;

    INSERT  dbo.成果作者
            ( 成果类型 ,
              成果编号 ,
              作者级别 ,
              作者编号
            )
            SELECT  1 ,
                    a.论文编号 ,
                    '第一作者' ,
                    c1.编号
            FROM    @t a
                    JOIN @tt b ON a.论文标题 = b.论文标题
                    CROSS APPLY ( SELECT TOP 1
                                            编号
                                  FROM      人员 c
                                  WHERE     b.作者 = c.姓名
                                ) c1;
								
        
    COMMIT TRAN;



GO
/****** Object:  StoredProcedure [dbo].[sp_登录]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*这个就不应该让tt_v1_人员_带部门名来做model,用tt_编号即可,
人员权限也应该用编号来对应,以便tfn_人员的权限(编号),而不是tfn_人员的权限(工号)
得到的姓名就用一个变量放置即可,不用tt_v1_人员_带部门名这么复杂*/
CREATE PROC [dbo].[sp_登录]
    (
      @工号 NVARCHAR(50) ,
      @密码 NVARCHAR(50)
    )
AS --DECLARE @tt_v1_人员_带部门名 tt_v1_人员_带部门名;
    DECLARE @编号 INT;
    DECLARE @姓名 NVARCHAR(50);

    --INSERT  @tt_v1_人员_带部门名
    SELECT  @编号 = 编号 ,
            @姓名 = 姓名
    FROM    dbo.人员
    WHERE   工号 = @工号
            AND 密码 = @密码;

    --IF ( EXISTS ( SELECT    1
    --              FROM      @tt_v1_人员_带部门名 ) )
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
            FROM    dbo.tfn_人员的权限(@工号)  ORDER BY 排序;
        END;

    ELSE
        THROW 50001,N'登录信息错误',1;

GO
/****** Object:  StoredProcedure [dbo].[sp_登录日志_增]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_登录日志_增]
    (
      @tt_登录日志 tt_登录日志 READONLY
    )
AS
    INSERT  dbo.登录日志
            ( 工号, 姓名, 登录时间, IP )
            SELECT  工号 ,
                    姓名 ,
                    GETDATE() ,
                    IP
            FROM    @tt_登录日志;
GO
/****** Object:  StoredProcedure [dbo].[sp_分类统计数量]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_分类统计数量]
    (
      @structureName NVARCHAR(50) = N'dbo' ,
      @tableName NVARCHAR(50) ,
      @whereStr NVARCHAR(500) ,
      @groupStr NVARCHAR(500)
    )
AS
    DECLARE @sqlStr NVARCHAR(2000);
	
	SET @structureName = IIF(@structureName IS NULL OR @structureName = '',N'dbo',@structureName);

    SET @sqlStr = CONCAT('SELECT isnull(CAST(', ISNULL(@groupStr, 'Null'),
                         ' AS NVARCHAR(50)),''未指定'') as 分类 ,COUNT(1) AS 数量 FROM ',
                         @structureName, '.', @tableName, ' WHERE ', @whereStr,
                         IIF(@groupStr IS NULL, '', ' GROUP BY '), @groupStr,
                         '');
    --SET @sqlStr = CONCAT('SELECT isnull(', @groupStr, ',''未指定'') as ',
    --                     @groupStr, ',COUNT(1) AS 数量 FROM ', @structureName,
    --                     '.', @tableName, ' WHERE ', @whereStr, ' GROUP BY ',
    --                     @groupStr, '');

    PRINT @sqlStr;
    EXECUTE sys.sp_executesql @sqlStr;
GO
/****** Object:  StoredProcedure [dbo].[sp_国民行业代码_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_国民行业代码_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    国民行业代码 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
GO
/****** Object:  StoredProcedure [dbo].[sp_国民行业代码_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_国民行业代码_增改]
    (
      @tt_国民行业代码 tt_国民行业代码 READONLY
    )
AS
    MERGE dbo.国民行业代码 t
    USING @tt_国民行业代码 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.上级编号 = s.上级编号 ,
               t.名称 = s.名称 ,
               t.代码 = s.代码 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 上级编号, 名称, 代码, 级别, 排序, 备注 )
        VALUES ( s.上级编号 ,
                 s.名称 ,
                 s.代码 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );
GO
/****** Object:  StoredProcedure [dbo].[sp_合同买方性质_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_合同买方性质_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    合同买方性质 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_合同买方性质_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_合同买方性质_增改]
    (
      @tt_合同买方性质 tt_合同买方性质 READONLY
    )
AS
    MERGE dbo.合同买方性质 t
    USING @tt_合同买方性质 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.上级编号 = s.上级编号 ,
               t.名称 = s.名称 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 上级编号, 名称, 级别, 排序, 备注 )
        VALUES ( s.上级编号 ,
                 s.名称 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );
GO
/****** Object:  StoredProcedure [dbo].[sp_横向项目_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_横向项目_增改]
    (
      @流程模板编号 INT = 450 , --横向项目申请为450
      @tt tt_横向项目 READONLY ,
      @tt_项目参与人 tt_项目参与人 READONLY ,
      @tt_项目经费预算 tt_项目经费预算 READONLY 
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 
    MERGE dbo.横向项目 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[项目分类] = s.[项目分类] ,
               t.[项目类型] = s.[项目类型] ,
               t.[合同编号] = s.[合同编号] ,
               t.[合同名称] = s.[合同名称] ,
               t.[是否为第一承建单位] = s.[是否为第一承建单位] ,
               t.[项目负责人编号] = s.[项目负责人编号] ,
               t.[项目归属部门] = s.[项目归属部门] ,
               t.[单位名称] = s.[单位名称] ,
               t.[邮政编码] = s.[邮政编码] ,
               t.[法定代表人] = s.[法定代表人] ,
               t.[经费本编号] = s.[经费本编号] ,
               t.[联系人] = s.[联系人] ,
               t.[联系人电话] = s.[联系人电话] ,
               t.[通讯地址] = s.[通讯地址] ,
               t.[是否需要伦理评审] = s.[是否需要伦理评审] ,
               t.[档案编号] = s.[档案编号] ,
               t.[财务简称] = s.[财务简称] ,
               t.[课题来源] = s.[课题来源] ,
               t.[合作方关系] = s.[合作方关系] ,
               t.[合作方契约关系] = s.[合作方契约关系] ,
               t.[合作方单位名称] = s.[合作方单位名称] ,
               t.[合作方法人或组织机构代码] = s.[合作方法人或组织机构代码] ,
               t.[合作方法定代表人] = s.[合作方法定代表人] ,
               t.[合作方单位联系人] = s.[合作方单位联系人] ,
               t.[合作方联系电话] = s.[合作方联系电话] ,
               t.[合作方邮箱] = s.[合作方邮箱] ,
               t.[合作方邮政编码] = s.[合作方邮政编码] ,
               t.[合作方所在省] = s.[合作方所在省] ,
               t.[合作方所在市] = s.[合作方所在市] ,
               t.[合作方所在地区] = s.[合作方所在地区] ,
               t.[合同金额] = s.[合同金额] ,
               t.[签订时间] = s.[签订时间] ,
               t.[付款方式] = s.[付款方式] ,
               t.[合同开始时间] = s.[合同开始时间] ,
               t.[合同结束时间] = s.[合同结束时间] ,
               t.[合作方式] = s.[合作方式] ,
               t.[研究类型] = s.[研究类型] ,
               t.[技术领域] = s.[技术领域] ,
               t.[合同类型] = s.[合同类型] ,
               t.[技术合同类型] = s.[技术合同类型] ,
               t.[是否申请技术合同认定] = s.[是否申请技术合同认定] ,
               t.[合同技术交易额] = s.[合同技术交易额] ,
               t.[知识产权] = s.[知识产权] ,
               t.[计划来源] = s.[计划来源] ,
               t.[合作方所属国民经济行业] = s.[合作方所属国民经济行业] ,
               t.[技术服务的国民经济行业] = s.[技术服务的国民经济行业] ,
               t.[合同的社会经济目标] = s.[合同的社会经济目标] ,
               t.[合作方性质] = s.[合作方性质] ,
               t.[是否高新性质] = s.[是否高新性质] ,
               t.[合同认定登记承诺书路径] = s.[合同认定登记承诺书路径] ,
               t.[合同文件路径] = s.[合同文件路径] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.项目分类 ,
                 s.项目类型 ,
                 s.合同编号 ,
                 s.合同名称 ,
                 s.是否为第一承建单位 ,
                 s.项目负责人编号 ,
                 s.项目归属部门 ,
                 s.单位名称 ,
                 s.邮政编码 ,
                 s.法定代表人 ,
                 s.经费本编号 ,
                 s.联系人 ,
                 s.联系人电话 ,
                 s.通讯地址 ,
                 s.是否需要伦理评审 ,
                 s.档案编号 ,
                 s.财务简称 ,
                 s.课题来源 ,
                 s.合作方关系 ,
                 s.合作方契约关系 ,
                 s.合作方单位名称 ,
                 s.合作方法人或组织机构代码 ,
                 s.合作方法定代表人 ,
                 s.合作方单位联系人 ,
                 s.合作方联系电话 ,
                 s.合作方邮箱 ,
                 s.合作方邮政编码 ,
                 s.合作方所在省 ,
                 s.合作方所在市 ,
                 s.合作方所在地区 ,
                 s.合同金额 ,
                 s.签订时间 ,
                 s.付款方式 ,
                 s.合同开始时间 ,
                 s.合同结束时间 ,
                 s.合作方式 ,
                 s.研究类型 ,
                 s.技术领域 ,
                 s.合同类型 ,
                 s.技术合同类型 ,
                 s.是否申请技术合同认定 ,
                 s.合同技术交易额 ,
                 s.知识产权 ,
                 s.计划来源 ,
                 s.合作方所属国民经济行业 ,
                 s.技术服务的国民经济行业 ,
                 s.合同的社会经济目标 ,
                 s.合作方性质 ,
                 s.是否高新性质 ,
                 s.合同认定登记承诺书路径 ,
                 s.合同文件路径 ,
                 s.备注 ,
                 GETDATE()
               )
    OUTPUT
        Inserted.编号
        INTO @编号;
        
    DECLARE @项目编号 INT;
    SELECT  @项目编号 = 编号
    FROM    @编号;

    MERGE dbo.项目参与人 t
    USING @tt_项目参与人 s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号
        AND s.参与人编号 = t.参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[工作量占比] = s.[工作量占比] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @项目编号 ,
                 s.参与人编号 ,
                 s.工作量占比 ,
                 s.备注 ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号 THEN
        DELETE;

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

	--返回一下编号
    SELECT  *
    FROM    @编号;
;

GO
/****** Object:  StoredProcedure [dbo].[sp_横向项目变更_应用变更]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_横向项目变更_应用变更] ( @横向项目变更编号 INT )
AS
    DECLARE @旧的横向项目 tt_横向项目;

    SET XACT_ABORT ON;
    
    BEGIN TRAN;
	--暂存就的立项信息
    INSERT  @旧的横向项目
            ( 编号 ,
              项目分类 ,
              项目类型 ,
              合同编号 ,
              合同名称 ,
              是否为第一承建单位 ,
              项目负责人编号 ,
              项目归属部门 ,
              单位名称 ,
              邮政编码 ,
              法定代表人 ,
              经费本编号 ,
              联系人 ,
              联系人电话 ,
              通讯地址 ,
              是否需要伦理评审 ,
              档案编号 ,
              财务简称 ,
              课题来源 ,
              合作方关系 ,
              合作方契约关系 ,
              合作方单位名称 ,
              合作方法人或组织机构代码 ,
              合作方法定代表人 ,
              合作方单位联系人 ,
              合作方联系电话 ,
              合作方邮箱 ,
              合作方邮政编码 ,
              合作方所在省 ,
              合作方所在市 ,
              合作方所在地区 ,
              合同金额 ,
              签订时间 ,
              付款方式 ,
              合同开始时间 ,
              合同结束时间 ,
              合作方式 ,
              研究类型 ,
              技术领域 ,
              合同类型 ,
              技术合同类型 ,
              是否申请技术合同认定 ,
              合同技术交易额 ,
              知识产权 ,
              计划来源 ,
              合作方所属国民经济行业 ,
              技术服务的国民经济行业 ,
              合同的社会经济目标 ,
              合作方性质 ,
              是否高新性质 ,
              合同认定登记承诺书路径 ,
              合同文件路径 ,
              备注 ,
              建立时间
            )
            SELECT  a.编号 ,
                    a.项目分类 ,
                    a.项目类型 ,
                    a.合同编号 ,
                    a.合同名称 ,
                    a.是否为第一承建单位 ,
                    a.项目负责人编号 ,
                    a.项目归属部门 ,
                    a.单位名称 ,
                    a.邮政编码 ,
                    a.法定代表人 ,
                    a.经费本编号 ,
                    a.联系人 ,
                    a.联系人电话 ,
                    a.通讯地址 ,
                    a.是否需要伦理评审 ,
                    a.档案编号 ,
                    a.财务简称 ,
                    a.课题来源 ,
                    a.合作方关系 ,
                    a.合作方契约关系 ,
                    a.合作方单位名称 ,
                    a.合作方法人或组织机构代码 ,
                    a.合作方法定代表人 ,
                    a.合作方单位联系人 ,
                    a.合作方联系电话 ,
                    a.合作方邮箱 ,
                    a.合作方邮政编码 ,
                    a.合作方所在省 ,
                    a.合作方所在市 ,
                    a.合作方所在地区 ,
                    a.合同金额 ,
                    a.签订时间 ,
                    a.付款方式 ,
                    a.合同开始时间 ,
                    a.合同结束时间 ,
                    a.合作方式 ,
                    a.研究类型 ,
                    a.技术领域 ,
                    a.合同类型 ,
                    a.技术合同类型 ,
                    a.是否申请技术合同认定 ,
                    a.合同技术交易额 ,
                    a.知识产权 ,
                    a.计划来源 ,
                    a.合作方所属国民经济行业 ,
                    a.技术服务的国民经济行业 ,
                    a.合同的社会经济目标 ,
                    a.合作方性质 ,
                    a.是否高新性质 ,
                    a.合同认定登记承诺书路径 ,
                    a.合同文件路径 ,
                    a.备注 ,
                    a.建立时间
            FROM    dbo.横向项目 a
                    JOIN dbo.横向项目变更 b ON a.编号 = b.横向项目编号
                                         AND b.编号 = @横向项目变更编号;
	-- 更新变更目标;
    UPDATE  a
    SET     a.项目分类 = b.项目分类 ,
            a.项目类型 = b.项目类型 ,
            a.合同编号 = b.合同编号 ,
            a.合同名称 = b.合同名称 ,
            a.是否为第一承建单位 = b.是否为第一承建单位 ,
            a.项目负责人编号 = b.项目负责人编号 ,
            a.项目归属部门 = b.项目归属部门 ,
            a.单位名称 = b.单位名称 ,
            a.邮政编码 = b.邮政编码 ,
            a.法定代表人 = b.法定代表人 ,
            a.经费本编号 = b.经费本编号 ,
            a.联系人 = b.联系人 ,
            a.联系人电话 = b.联系人电话 ,
            a.通讯地址 = b.通讯地址 ,
            a.是否需要伦理评审 = b.是否需要伦理评审 ,
            a.档案编号 = b.档案编号 ,
            a.财务简称 = b.财务简称 ,
            a.课题来源 = b.课题来源 ,
            a.合作方关系 = b.合作方关系 ,
            a.合作方契约关系 = b.合作方契约关系 ,
            a.合作方单位名称 = b.合作方单位名称 ,
            a.合作方法人或组织机构代码 = b.合作方法人或组织机构代码 ,
            a.合作方法定代表人 = b.合作方法定代表人 ,
            a.合作方单位联系人 = b.合作方单位联系人 ,
            a.合作方联系电话 = b.合作方联系电话 ,
            a.合作方邮箱 = b.合作方邮箱 ,
            a.合作方邮政编码 = b.合作方邮政编码 ,
            a.合作方所在省 = b.合作方所在省 ,
            a.合作方所在市 = b.合作方所在市 ,
            a.合作方所在地区 = b.合作方所在地区 ,
            a.合同金额 = b.合同金额 ,
            a.签订时间 = b.签订时间 ,
            a.付款方式 = b.付款方式 ,
            a.合同开始时间 = b.合同开始时间 ,
            a.合同结束时间 = b.合同结束时间 ,
            a.合作方式 = b.合作方式 ,
            a.研究类型 = b.研究类型 ,
            a.技术领域 = b.技术领域 ,
            a.合同类型 = b.合同类型 ,
            a.技术合同类型 = b.技术合同类型 ,
            a.是否申请技术合同认定 = b.是否申请技术合同认定 ,
            a.合同技术交易额 = b.合同技术交易额 ,
            a.知识产权 = b.知识产权 ,
            a.计划来源 = b.计划来源 ,
            a.合作方所属国民经济行业 = b.合作方所属国民经济行业 ,
            a.技术服务的国民经济行业 = b.技术服务的国民经济行业 ,
            a.合同的社会经济目标 = b.合同的社会经济目标 ,
            a.合作方性质 = b.合作方性质 ,
            a.是否高新性质 = b.是否高新性质 ,
            a.合同认定登记承诺书路径 = b.合同认定登记承诺书路径 ,
            a.合同文件路径 = b.合同文件路径 ,
            a.备注 = b.备注 ,
            a.建立时间 = b.建立时间
    FROM    dbo.横向项目 a
            JOIN dbo.横向项目变更 b ON a.编号 = b.横向项目编号
                                 AND b.编号 = @横向项目变更编号;

	-- 保存旧的记录;
    UPDATE  b
    SET     b.项目分类 = a.项目分类 ,
            b.项目类型 = a.项目类型 ,
            b.合同编号 = a.合同编号 ,
            b.合同名称 = a.合同名称 ,
            b.是否为第一承建单位 = a.是否为第一承建单位 ,
            b.项目负责人编号 = a.项目负责人编号 ,
            b.项目归属部门 = a.项目归属部门 ,
            b.单位名称 = a.单位名称 ,
            b.邮政编码 = a.邮政编码 ,
            b.法定代表人 = a.法定代表人 ,
            b.经费本编号 = a.经费本编号 ,
            b.联系人 = a.联系人 ,
            b.联系人电话 = a.联系人电话 ,
            b.通讯地址 = a.通讯地址 ,
            b.是否需要伦理评审 = a.是否需要伦理评审 ,
            b.档案编号 = a.档案编号 ,
            b.财务简称 = a.财务简称 ,
            b.课题来源 = a.课题来源 ,
            b.合作方关系 = a.合作方关系 ,
            b.合作方契约关系 = a.合作方契约关系 ,
            b.合作方单位名称 = a.合作方单位名称 ,
            b.合作方法人或组织机构代码 = a.合作方法人或组织机构代码 ,
            b.合作方法定代表人 = a.合作方法定代表人 ,
            b.合作方单位联系人 = a.合作方单位联系人 ,
            b.合作方联系电话 = a.合作方联系电话 ,
            b.合作方邮箱 = a.合作方邮箱 ,
            b.合作方邮政编码 = a.合作方邮政编码 ,
            b.合作方所在省 = a.合作方所在省 ,
            b.合作方所在市 = a.合作方所在市 ,
            b.合作方所在地区 = a.合作方所在地区 ,
            b.合同金额 = a.合同金额 ,
            b.签订时间 = a.签订时间 ,
            b.付款方式 = a.付款方式 ,
            b.合同开始时间 = a.合同开始时间 ,
            b.合同结束时间 = a.合同结束时间 ,
            b.合作方式 = a.合作方式 ,
            b.研究类型 = a.研究类型 ,
            b.技术领域 = a.技术领域 ,
            b.合同类型 = a.合同类型 ,
            b.技术合同类型 = a.技术合同类型 ,
            b.是否申请技术合同认定 = a.是否申请技术合同认定 ,
            b.合同技术交易额 = a.合同技术交易额 ,
            b.知识产权 = a.知识产权 ,
            b.计划来源 = a.计划来源 ,
            b.合作方所属国民经济行业 = a.合作方所属国民经济行业 ,
            b.技术服务的国民经济行业 = a.技术服务的国民经济行业 ,
            b.合同的社会经济目标 = a.合同的社会经济目标 ,
            b.合作方性质 = a.合作方性质 ,
            b.是否高新性质 = a.是否高新性质 ,
            b.合同认定登记承诺书路径 = a.合同认定登记承诺书路径 ,
            b.合同文件路径 = a.合同文件路径 ,
            b.备注 = a.备注 ,
            b.建立时间 = a.建立时间
    FROM    @旧的横向项目 a
            JOIN dbo.横向项目变更 b ON a.编号 = b.横向项目编号
                                 AND b.编号 = @横向项目变更编号;

    COMMIT TRAN;

GO
/****** Object:  StoredProcedure [dbo].[sp_横向项目变更_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_横向项目变更_增改]
    (
      @tt tt_横向项目变更 READONLY
    )
AS
    DECLARE @编号 tt_编号; 
    MERGE dbo.横向项目变更 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[变更内容简介] = s.[变更内容简介] ,
               t.[变更事由] = s.[变更事由] ,
               t.[变更备注] = s.[变更备注] ,
               t.[变更时间] = GETDATE() ,
               t.[横向项目编号] = s.[横向项目编号] ,
               t.[项目分类] = s.[项目分类] ,
               t.[项目类型] = s.[项目类型] ,
               t.[合同编号] = s.[合同编号] ,
               t.[合同名称] = s.[合同名称] ,
               t.[是否为第一承建单位] = s.[是否为第一承建单位] ,
               t.[项目负责人编号] = s.[项目负责人编号] ,
               t.[项目归属部门] = s.[项目归属部门] ,
               t.[单位名称] = s.[单位名称] ,
               t.[邮政编码] = s.[邮政编码] ,
               t.[法定代表人] = s.[法定代表人] ,
               t.[经费本编号] = s.[经费本编号] ,
               t.[联系人] = s.[联系人] ,
               t.[联系人电话] = s.[联系人电话] ,
               t.[通讯地址] = s.[通讯地址] ,
               t.[是否需要伦理评审] = s.[是否需要伦理评审] ,
               t.[档案编号] = s.[档案编号] ,
               t.[财务简称] = s.[财务简称] ,
               t.[课题来源] = s.[课题来源] ,
               t.[合作方关系] = s.[合作方关系] ,
               t.[合作方契约关系] = s.[合作方契约关系] ,
               t.[合作方单位名称] = s.[合作方单位名称] ,
               t.[合作方法人或组织机构代码] = s.[合作方法人或组织机构代码] ,
               t.[合作方法定代表人] = s.[合作方法定代表人] ,
               t.[合作方单位联系人] = s.[合作方单位联系人] ,
               t.[合作方联系电话] = s.[合作方联系电话] ,
               t.[合作方邮箱] = s.[合作方邮箱] ,
               t.[合作方邮政编码] = s.[合作方邮政编码] ,
               t.[合作方所在省] = s.[合作方所在省] ,
               t.[合作方所在市] = s.[合作方所在市] ,
               t.[合作方所在地区] = s.[合作方所在地区] ,
               t.[合同金额] = s.[合同金额] ,
               t.[签订时间] = s.[签订时间] ,
               t.[付款方式] = s.[付款方式] ,
               t.[合同开始时间] = s.[合同开始时间] ,
               t.[合同结束时间] = s.[合同结束时间] ,
               t.[合作方式] = s.[合作方式] ,
               t.[研究类型] = s.[研究类型] ,
               t.[技术领域] = s.[技术领域] ,
               t.[合同类型] = s.[合同类型] ,
               t.[技术合同类型] = s.[技术合同类型] ,
               t.[是否申请技术合同认定] = s.[是否申请技术合同认定] ,
               t.[合同技术交易额] = s.[合同技术交易额] ,
               t.[知识产权] = s.[知识产权] ,
               t.[计划来源] = s.[计划来源] ,
               t.[合作方所属国民经济行业] = s.[合作方所属国民经济行业] ,
               t.[技术服务的国民经济行业] = s.[技术服务的国民经济行业] ,
               t.[合同的社会经济目标] = s.[合同的社会经济目标] ,
               t.[合作方性质] = s.[合作方性质] ,
               t.[是否高新性质] = s.[是否高新性质] ,
               t.[合同认定登记承诺书路径] = s.[合同认定登记承诺书路径] ,
               t.[合同文件路径] = s.[合同文件路径] ,
               t.建立时间 = s.建立时间 ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.变更内容简介 ,
                 s.变更事由 ,
                 s.变更备注 ,
                 GETDATE() ,
                 s.横向项目编号 ,
                 s.项目分类 ,
                 s.项目类型 ,
                 s.合同编号 ,
                 s.合同名称 ,
                 s.是否为第一承建单位 ,
                 s.项目负责人编号 ,
                 s.项目归属部门 ,
                 s.单位名称 ,
                 s.邮政编码 ,
                 s.法定代表人 ,
                 s.经费本编号 ,
                 s.联系人 ,
                 s.联系人电话 ,
                 s.通讯地址 ,
                 s.是否需要伦理评审 ,
                 s.档案编号 ,
                 s.财务简称 ,
                 s.课题来源 ,
                 s.合作方关系 ,
                 s.合作方契约关系 ,
                 s.合作方单位名称 ,
                 s.合作方法人或组织机构代码 ,
                 s.合作方法定代表人 ,
                 s.合作方单位联系人 ,
                 s.合作方联系电话 ,
                 s.合作方邮箱 ,
                 s.合作方邮政编码 ,
                 s.合作方所在省 ,
                 s.合作方所在市 ,
                 s.合作方所在地区 ,
                 s.合同金额 ,
                 s.签订时间 ,
                 s.付款方式 ,
                 s.合同开始时间 ,
                 s.合同结束时间 ,
                 s.合作方式 ,
                 s.研究类型 ,
                 s.技术领域 ,
                 s.合同类型 ,
                 s.技术合同类型 ,
                 s.是否申请技术合同认定 ,
                 s.合同技术交易额 ,
                 s.知识产权 ,
                 s.计划来源 ,
                 s.合作方所属国民经济行业 ,
                 s.技术服务的国民经济行业 ,
                 s.合同的社会经济目标 ,
                 s.合作方性质 ,
                 s.是否高新性质 ,
                 s.合同认定登记承诺书路径 ,
                 s.合同文件路径 ,
                 s.备注 ,
                 s.建立时间
               )
    OUTPUT
        Inserted.编号
        INTO @编号;
        SELECT  *
        FROM    @编号;
;

GO
/****** Object:  StoredProcedure [dbo].[sp_横向项目结题_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_横向项目结题_增改]
    (
      @tt tt_横向项目结题 READONLY ,
      @tt_项目参与人 tt_项目参与人 READONLY 
    )
AS
    DECLARE @流程模板编号 INT = 470; --横向项目结题为470
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 

    MERGE dbo.横向项目结题 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[横向项目编号] = s.[横向项目编号] ,
               t.[结题验收编号] = s.[结题验收编号] ,
               t.[结题验收时间] = s.[结题验收时间] ,
               t.[结题验收是否合格] = s.[结题验收是否合格] ,
               t.[结题验收参与人数] = s.[结题验收参与人数] ,
               t.[结题资料路径] = s.[结题资料路径] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.横向项目编号 ,
                 s.结题验收编号 ,
                 s.结题验收时间 ,
                 s.结题验收是否合格 ,
                 s.结题验收参与人数 ,
                 s.结题资料路径 ,
                 s.备注 ,
                 GETDATE()
               )
    OUTPUT
        Inserted.编号
        INTO @编号;

    DECLARE @结题编号 INT;
    SELECT  @结题编号 = 编号
    FROM    @编号;

	--项目参与人
    MERGE dbo.项目参与人 t
    USING @tt_项目参与人 s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @结题编号
        AND s.参与人编号 = t.参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[工作量占比] = s.[工作量占比] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @结题编号 ,
                 s.参与人编号 ,
                 s.工作量占比 ,
                 s.备注 ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @结题编号 THEN
        DELETE;
		
    COMMIT TRAN;

    SELECT  *
    FROM    @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_获奖成果统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
	
CREATE PROC [dbo].[sp_获奖成果统计](@where NVARCHAR(100))
AS
    DECLARE @获奖级别 NVARCHAR(1000);

    SELECT  @获奖级别 = STUFF(( SELECT  ',' + 值
                            FROM    字典
                            WHERE   分类 = '获奖级别'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');

    DECLARE @sql NVARCHAR(2000);

    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@获奖级别, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');


    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@获奖级别, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',isnull(sum(' + ID + '),0)'
                                 FROM   dbo.SplitStringToTable(@获奖级别, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 as 部门,
                        b.获奖级别
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果获奖 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 4
						JOIN 流程 b1 ON b1.流程模板编号 = 303 AND b.编号 = b1.项目编号 AND b1.状态 = 1 where ',@where,'
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cte PIVOT ( COUNT(获奖级别) FOR 获奖级别 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            isnull(SUM(合计),0)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

GO
/****** Object:  StoredProcedure [dbo].[sp_技术领域_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_技术领域_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    技术领域 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_技术领域_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_技术领域_增改]
    (
      @tt_技术领域 tt_技术领域 READONLY
    )
AS
    MERGE dbo.技术领域 t
    USING @tt_技术领域 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.上级编号 = s.上级编号 ,
               t.名称 = s.名称 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 上级编号, 名称, 级别, 排序, 备注 )
        VALUES ( s.上级编号 ,
                 s.名称 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );
GO
/****** Object:  StoredProcedure [dbo].[sp_继教标签_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教标签_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教标签 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教标签_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教标签_增改] ( @tt tt_继教标签 READONLY )
AS
    DECLARE @output tt_继教标签;
    MERGE dbo.继教标签 t
    USING @tt s
    ON s.名称 = t.名称
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[首字母] = s.[首字母] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 名称, 首字母, 备注 )
        VALUES ( s.[名称], s.[首字母], s.[备注] )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教操作考试_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教操作考试_增改](@tt tt_继教操作考试 READONLY) 
	AS  DECLARE @output tt_继教操作考试;
MERGE dbo.继教操作考试 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[及格分数]  =s.[及格分数] ,
			t.[描述]  =s.[描述] ,
			t.[是否允许考生查看成绩]  =s.[是否允许考生查看成绩] ,
			t.[是否允许考生查看评分]  =s.[是否允许考生查看评分] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			及格分数 ,
			描述 ,
			是否允许考生查看成绩 ,
			是否允许考生查看评分 ) Values( 
			s.[编号]  ,
			s.[及格分数]  ,
			s.[描述]  ,
			s.[是否允许考生查看成绩]  ,
			s.[是否允许考生查看评分]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教操作考试参与情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教操作考试参与情况_增改](@tt tt_继教操作考试参与情况 READONLY) 
	AS  DECLARE @output tt_继教操作考试参与情况;
MERGE dbo.继教操作考试参与情况 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[考试批次编号]  =s.[考试批次编号] ,
			t.[助教老师编号]  =s.[助教老师编号] ,
			t.[参与人类型]  =s.[参与人类型] ,
			t.[参与人编号]  =s.[参与人编号] ,
			t.[开始操作时间]  =s.[开始操作时间] ,
			t.[结束操作时间]  =s.[结束操作时间] ,
			t.[得分]  =s.[得分] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			考试批次编号 ,
			助教老师编号 ,
			参与人类型 ,
			参与人编号 ,
			开始操作时间 ,
			结束操作时间 ,
			得分 ,
			备注 ) Values( 
			s.[考试批次编号]  ,
			s.[助教老师编号]  ,
			s.[参与人类型]  ,
			s.[参与人编号]  ,
			s.[开始操作时间]  ,
			s.[结束操作时间]  ,
			s.[得分]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教操作考试打分情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教操作考试打分情况_增改]
    (
      @fId INT ,
      @tt tt_继教操作考试打分情况 READONLY
    )
AS
    DECLARE @output tt_继教操作考试打分情况;
    MERGE dbo.继教操作考试打分情况 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[操作考试参与情况编号] = @fId ,
               t.[操作考试评分项目要求编号] = s.[操作考试评分项目要求编号] ,
               t.[打分] = s.[打分] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 操作考试参与情况编号 ,
                 操作考试评分项目要求编号 ,
                 打分 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[操作考试评分项目要求编号] ,
                 s.[打分] ,
                 s.[备注]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.操作考试参与情况编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教操作考试评分表_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教操作考试评分表_增改]
    (
      @fId INT ,
      @tt tt_继教操作考试评分表 READONLY
    )
AS
    DECLARE @output tt_继教操作考试评分表;
    MERGE dbo.继教操作考试评分表 t
    USING @tt s
    ON @fId = t.操作考试编号
        AND s.评分表编号 = t.评分表编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[操作考试编号] = @fId ,
               t.[评分表编号] = s.[评分表编号]
    WHEN NOT MATCHED THEN
        INSERT ( 操作考试编号, 评分表编号 )
        VALUES ( @fId, s.[评分表编号] )
    WHEN NOT MATCHED BY SOURCE AND t.操作考试编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教操作考试助教老师_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教操作考试助教老师_增改](@fId INT ,@tt tt_继教操作考试助教老师 READONLY) 
	AS  DECLARE @output tt_继教操作考试助教老师;
MERGE dbo.继教操作考试助教老师 t
		USING @tt s
		ON @fid = t.操作考试编号 and s.助教老师编号 = t.助教老师编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[操作考试编号]  =@fid,
			t.[助教老师编号]  =s.[助教老师编号] 
 WHEN NOT MATCHED THEN INSERT (			操作考试编号 ,
			助教老师编号 ) Values( 
			@fid ,
			s.[助教老师编号]  
)WHEN NOT MATCHED BY SOURCE AND t.操作考试编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教活动_增改](@tt tt_继教活动 READONLY) 
	AS  DECLARE @output tt_继教活动;
MERGE dbo.继教活动 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[文件夹编号]  =s.[文件夹编号] ,
			t.[培训计划编号]  =s.[培训计划编号] ,
			t.[项目分类编号]  =s.[项目分类编号] ,
			t.[名称]  =s.[名称] ,
			t.[开始时间]  =s.[开始时间] ,
			t.[结束时间]  =s.[结束时间] ,
			t.[学分]  =s.[学分] ,
			t.[封面]  =s.[封面] ,
			t.[简介]  =s.[简介] ,
			t.[必须按顺序学习]  =s.[必须按顺序学习] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			文件夹编号 ,
			培训计划编号 ,
			项目分类编号 ,
			名称 ,
			开始时间 ,
			结束时间 ,
			学分 ,
			封面 ,
			简介 ,
			必须按顺序学习 ,
			建立时间 ,
			建立人 ,
			备注 ) Values( 
			s.[文件夹编号]  ,
			s.[培训计划编号]  ,
			s.[项目分类编号]  ,
			s.[名称]  ,
			s.[开始时间]  ,
			s.[结束时间]  ,
			s.[学分]  ,
			s.[封面]  ,
			s.[简介]  ,
			s.[必须按顺序学习]  ,
			getdate() ,
			s.[建立人]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动可参与人_普通增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教活动可参与人_普通增改]
    (
      @tt tt_继教活动可参与人 READONLY
    )
AS
    DECLARE @output tt_继教活动可参与人;
    MERGE dbo.继教活动可参与人 t
    USING @tt s
    ON s.活动编号 = t.活动编号
        AND s.可参与人类型 = t.可参与人类型
        AND s.可参与人编号 = t.可参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[活动编号] = s.活动编号 ,
               t.[可参与人类型] = s.[可参与人类型] ,
               t.[可参与人编号] = s.[可参与人编号]
    WHEN NOT MATCHED THEN
        INSERT ( 活动编号, 可参与人类型, 可参与人编号 )
        VALUES ( s.活动编号 ,
                 s.[可参与人类型] ,
                 s.[可参与人编号]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动可参与人_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教活动可参与人_增改](@fId INT ,@tt tt_继教活动可参与人 READONLY) 
	AS  DECLARE @output tt_继教活动可参与人;
MERGE dbo.继教活动可参与人 t
		USING @tt s
		ON @fid = t.活动编号 and s.可参与人类型 = t.可参与人类型 and s.可参与人编号 = t.可参与人编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[活动编号]  =@fid,
			t.[可参与人类型]  =s.[可参与人类型] ,
			t.[可参与人编号]  =s.[可参与人编号] 
 WHEN NOT MATCHED THEN INSERT (			活动编号 ,
			可参与人类型 ,
			可参与人编号 ) Values( 
			@fid ,
			s.[可参与人类型]  ,
			s.[可参与人编号]  
)WHEN NOT MATCHED BY SOURCE AND t.活动编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动内容_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教活动内容_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教活动内容 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动内容_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教活动内容_增改](@tt tt_继教活动内容 READONLY) 
	AS  DECLARE @output tt_继教活动内容;
MERGE dbo.继教活动内容 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[活动编号]  =s.[活动编号] ,
			t.[类型]  =s.[类型] ,
			t.[名称]  =s.[名称] ,
			t.[排序值]  =s.[排序值] ,
			t.[开始时间]  =s.[开始时间] ,
			t.[结束时间]  =s.[结束时间] ,
			t.[地点]  =s.[地点] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			活动编号 ,
			类型 ,
			名称 ,
			排序值 ,
			开始时间 ,
			结束时间 ,
			地点 ,
			备注 ) Values( 
			s.[活动编号]  ,
			s.[类型]  ,
			s.[名称]  ,
			s.[排序值]  ,
			s.[开始时间]  ,
			s.[结束时间]  ,
			s.[地点]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动项目分类_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教活动项目分类_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教活动项目分类 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教活动项目分类_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教活动项目分类_增改]
    (
      @tt tt_继教活动项目分类 READONLY
    )
AS
    DECLARE @output tt_继教活动项目分类;
    MERGE dbo.继教活动项目分类 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[父编号] = s.[父编号] ,
               t.[名称] = s.[名称] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 父编号, 名称, 备注 )
        VALUES ( s.[父编号], s.[名称], s.[备注] )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教角色权限_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教角色权限_增改](@fId INT ,@tt tt_继教角色权限 READONLY) 
	AS  DECLARE @output tt_继教角色权限;
MERGE dbo.继教角色权限 t
		USING @tt s
		ON @fid = t.继教角色编号 and s.继教权限编号 = t.继教权限编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[继教角色编号]  =@fid,
			t.[继教权限编号]  =s.[继教权限编号] 
 WHEN NOT MATCHED THEN INSERT (			继教角色编号 ,
			继教权限编号 ) Values( 
			@fid ,
			s.[继教权限编号]  
)WHEN NOT MATCHED BY SOURCE AND t.继教角色编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教考试批次_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教考试批次_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教考试批次 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教考试批次_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教考试批次_增改]
    (
      @tt tt_继教考试批次 READONLY
    )
AS
    DECLARE @output tt_继教考试批次;
    MERGE dbo.继教考试批次 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[考试编号] = s.[考试编号] ,
               t.[排序值] = s.[排序值] ,
               t.[考试开始时间] = s.[考试开始时间] ,
               t.[考试结束时间] = s.[考试结束时间] ,
               t.[考试地点] = s.[考试地点] ,
               t.[人数上限] = s.[人数上限] ,
               t.[二维码] = s.[二维码] ,
               t.[口令] = s.[口令] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 考试编号 ,
                 排序值 ,
                 考试开始时间 ,
                 考试结束时间 ,
                 考试地点 ,
                 人数上限 ,
                 二维码 ,
                 口令 ,
                 备注
               )
        VALUES ( s.[考试编号] ,
                 s.[排序值] ,
                 s.[考试开始时间] ,
                 s.[考试结束时间] ,
                 s.[考试地点] ,
                 s.[人数上限] ,
                 s.[二维码] ,
                 s.[口令] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教考试批次可参与人_普通增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教考试批次可参与人_普通增改]
    (
      @tt tt_继教考试批次可参与人 READONLY
    )
AS
    DECLARE @output tt_继教考试批次可参与人;
    MERGE dbo.继教考试批次可参与人 t
    USING @tt s
    ON s.考试批次编号 = t.考试批次编号
        AND s.可参与人类型 = t.可参与人类型
        AND s.可参与人编号 = t.可参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[考试批次编号] = s.考试批次编号 ,
               t.[可参与人类型] = s.[可参与人类型] ,
               t.[可参与人编号] = s.[可参与人编号]
    WHEN NOT MATCHED THEN
        INSERT ( 考试批次编号, 可参与人类型, 可参与人编号 )
        VALUES ( s.考试批次编号 ,
                 s.[可参与人类型] ,
                 s.[可参与人编号]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教考试批次可参与人_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教考试批次可参与人_增改]
    (
      @fId INT ,
      @tt tt_继教考试批次可参与人 READONLY
    )
AS
    DECLARE @output tt_继教考试批次可参与人;
    MERGE dbo.继教考试批次可参与人 t
    USING @tt s
    ON @fId = t.考试批次编号
        AND s.可参与人类型 = t.可参与人类型
        AND s.可参与人编号 = t.可参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[考试批次编号] = @fId ,
               t.[可参与人类型] = s.[可参与人类型] ,
               t.[可参与人编号] = s.[可参与人编号]
    WHEN NOT MATCHED THEN
        INSERT ( 考试批次编号, 可参与人类型, 可参与人编号 )
        VALUES ( @fId ,
                 s.[可参与人类型] ,
                 s.[可参与人编号]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.考试批次编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教科室_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教科室_增改] ( @tt tt_继教科室 READONLY )
AS
    DECLARE @output tt_继教科室;
    MERGE dbo.继教科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[科室管理员编号] = s.[科室管理员编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 科室管理员编号, 备注 )
        VALUES ( s.[编号] ,
                 s.[科室管理员编号] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教课后练习_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教课后练习_增改]
    (
      @tt tt_继教课后练习 READONLY
    )
AS
    DECLARE @output tt_继教课后练习;
    MERGE dbo.继教课后练习 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[及格分数] = s.[及格分数]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 及格分数 )
        VALUES ( s.[编号], s.[及格分数] )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教课后练习试题_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教课后练习试题_增改]
    (
      @fId INT ,
      @tt tt_继教课后练习试题 READONLY
    )
AS
    DECLARE @output tt_继教课后练习试题;
    MERGE dbo.继教课后练习试题 t
    USING @tt s
    ON @fId = t.课后练习编号
        AND s.试题编号 = t.试题编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[课后练习编号] = @fId ,
               t.[试题编号] = s.[试题编号] ,
               t.[分值] = s.[分值] ,
               t.[排序值] = s.[排序值] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 课后练习编号, 试题编号, 分值, 排序值, 备注 )
        VALUES ( @fId ,
                 s.[试题编号] ,
                 s.[分值] ,
                 s.[排序值] ,
                 s.[备注]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.课后练习编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教理论考试_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教理论考试_增改](@tt tt_继教理论考试 READONLY) 
	AS  DECLARE @output tt_继教理论考试;
MERGE dbo.继教理论考试 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[是否允许任何人参与]  =s.[是否允许任何人参与] ,
			t.[试卷编号]  =s.[试卷编号] ,
			t.[时长]  =s.[时长] ,
			t.[及格分数]  =s.[及格分数] ,
			t.[是否试题乱序]  =s.[是否试题乱序] ,
			t.[是否允许考生查看成绩]  =s.[是否允许考生查看成绩] ,
			t.[是否允许考生查看答案]  =s.[是否允许考生查看答案] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			是否允许任何人参与 ,
			试卷编号 ,
			时长 ,
			及格分数 ,
			是否试题乱序 ,
			是否允许考生查看成绩 ,
			是否允许考生查看答案 ) Values( 
			s.[编号]  ,
			s.[是否允许任何人参与]  ,
			s.[试卷编号]  ,
			s.[时长]  ,
			s.[及格分数]  ,
			s.[是否试题乱序]  ,
			s.[是否允许考生查看成绩]  ,
			s.[是否允许考生查看答案]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教理论考试参与情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教理论考试参与情况_增改](@tt tt_继教理论考试参与情况 READONLY) 
	AS  DECLARE @output tt_继教理论考试参与情况;
MERGE dbo.继教理论考试参与情况 t
		USING @tt s
		ON s.考试批次编号 = t.考试批次编号 and s.参与人类型 = t.参与人类型 and s.参与人编号 = t.参与人编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[考试批次编号]  =s.[考试批次编号] ,
			t.[参与人类型]  =s.[参与人类型] ,
			t.[参与人编号]  =s.[参与人编号] ,
			t.[答题开始时间]  =s.[答题开始时间] ,
			t.[答题结束时间]  =s.[答题结束时间] ,
			t.[得分]  =s.[得分] 
 WHEN NOT MATCHED THEN INSERT (			考试批次编号 ,
			参与人类型 ,
			参与人编号 ,
			答题开始时间 ,
			答题结束时间 ,
			得分 ) Values( 
			s.[考试批次编号]  ,
			s.[参与人类型]  ,
			s.[参与人编号]  ,
			s.[答题开始时间]  ,
			s.[答题结束时间]  ,
			s.[得分]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教理论考试答题答案_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_继教理论考试答题答案_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教理论考试答题答案 a
    WHERE   a.理论考试答题情况编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教理论考试答题答案_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教理论考试答题答案_增改](@tt tt_继教理论考试答题答案 READONLY) 
	AS  DECLARE @output tt_继教理论考试答题答案;
MERGE dbo.继教理论考试答题答案 t
		USING @tt s
		ON s.理论考试答题情况编号 = t.理论考试答题情况编号 and s.答题答案编码 = t.答题答案编码
		WHEN MATCHED THEN
			UPDATE SET
			t.[理论考试答题情况编号]  =s.[理论考试答题情况编号] ,
			t.[答题答案编码]  =s.[答题答案编码] 
 WHEN NOT MATCHED THEN INSERT (			理论考试答题情况编号 ,
			答题答案编码 ) Values( 
			s.[理论考试答题情况编号]  ,
			s.[答题答案编码]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教理论考试答题情况_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教理论考试答题情况_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教理论考试答题情况 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教理论考试答题情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教理论考试答题情况_增改](@tt tt_继教理论考试答题情况 READONLY) 
	AS  DECLARE @output tt_继教理论考试答题情况;
MERGE dbo.继教理论考试答题情况 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[理论考试参与情况编号]  =s.[理论考试参与情况编号] ,
			t.[试题编号]  =s.[试题编号] ,
			t.[显示排序值]  =s.[显示排序值] ,
			t.[纠错]  =s.[纠错] ,
			t.[答题时间]  =s.[答题时间] ,
			t.[是否正确]  =s.[是否正确] ,
			t.[得分]  =s.[得分] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			理论考试参与情况编号 ,
			试题编号 ,
			显示排序值 ,
			纠错 ,
			答题时间 ,
			是否正确 ,
			得分 ,
			备注 ) Values( 
			s.[理论考试参与情况编号]  ,
			s.[试题编号]  ,
			s.[显示排序值]  ,
			s.[纠错]  ,
			s.[答题时间]  ,
			s.[是否正确]  ,
			s.[得分]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教慕课_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教慕课_增改](@tt tt_继教慕课 READONLY) 
	AS  DECLARE @output tt_继教慕课;
MERGE dbo.继教慕课 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[慕课素材编号]  =s.[慕课素材编号] ,
			t.[是否允许下载]  =s.[是否允许下载] ,
			t.[通过时长]  =s.[通过时长] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			慕课素材编号 ,
			是否允许下载 ,
			通过时长 ) Values( 
			s.[编号]  ,
			s.[慕课素材编号]  ,
			s.[是否允许下载]  ,
			s.[通过时长]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教慕课参与情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教慕课参与情况_增改](@tt tt_继教慕课参与情况 READONLY) 
	AS  DECLARE @output tt_继教慕课参与情况;
MERGE dbo.继教慕课参与情况 t
		USING @tt s
		ON s.慕课编号 = t.慕课编号 and s.参与人类型 = t.参与人类型 and s.参与人编号 = t.参与人编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[慕课编号]  =s.[慕课编号] ,
			t.[参与人类型]  =s.[参与人类型] ,
			t.[参与人编号]  =s.[参与人编号] ,
			t.[学习时长]  =s.[学习时长] 
 WHEN NOT MATCHED THEN INSERT (			慕课编号 ,
			参与人类型 ,
			参与人编号 ,
			学习时长 ) Values( 
			s.[慕课编号]  ,
			s.[参与人类型]  ,
			s.[参与人编号]  ,
			s.[学习时长]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教慕课素材_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教慕课素材_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教慕课素材 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教慕课素材_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教慕课素材_增改]
    (
      @tt tt_继教慕课素材 READONLY
    )
AS
    DECLARE @output tt_继教慕课素材;
    MERGE dbo.继教慕课素材 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[文件夹编号] = s.[文件夹编号] ,
               t.[名称] = s.[名称] ,
               t.[路径] = s.[路径] ,
               t.[大小] = s.[大小] ,
               t.[时长] = s.[时长] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 文件夹编号, 名称, 路径, 大小, 时长, 建立时间, 备注 )
        VALUES ( s.[文件夹编号] ,
                 s.[名称] ,
                 s.[路径] ,
                 s.[大小] ,
                 s.[时长] ,
                 GETDATE() ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教能级_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教能级_增改] ( @tt tt_继教能级 READONLY )
AS
    DECLARE @output tt_继教能级;
    MERGE dbo.继教能级 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 名称, 备注 )
        VALUES ( s.[名称], s.[备注] )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教培训计划_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教培训计划_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教培训计划 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教培训计划_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教培训计划_增改](@tt tt_继教培训计划 READONLY) 
	AS  DECLARE @output tt_继教培训计划;
MERGE dbo.继教培训计划 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[名称]  =s.[名称] ,
			t.[年份]  =s.[年份] ,
			t.[所属部门编号]  =s.[所属部门编号] ,
			t.[简介]  =s.[简介] ,
			t.[附件]  =s.[附件] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			名称 ,
			年份 ,
			所属部门编号 ,
			简介 ,
			附件 ,
			备注 ) Values( 
			s.[名称]  ,
			s.[年份]  ,
			s.[所属部门编号]  ,
			s.[简介]  ,
			s.[附件]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教评分表_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教评分表_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教评分表 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教评分表_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教评分表_增改](@tt tt_继教评分表 READONLY) 
	AS  DECLARE @output tt_继教评分表;
MERGE dbo.继教评分表 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[文件夹编号]  =s.[文件夹编号] ,
			t.[名称]  =s.[名称] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			文件夹编号 ,
			名称 ,
			建立时间 ,
			备注 ) Values( 
			s.[文件夹编号]  ,
			s.[名称]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教评分表项目_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教评分表项目_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教评分表项目 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教评分表项目_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教评分表项目_增改](@tt tt_继教评分表项目 READONLY) 
	AS  DECLARE @output tt_继教评分表项目;
MERGE dbo.继教评分表项目 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[评分表编号]  =s.[评分表编号] ,
			t.[名称]  =s.[名称] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			评分表编号 ,
			名称 ,
			备注 ) Values( 
			s.[评分表编号]  ,
			s.[名称]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教评分表项目要求_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教评分表项目要求_增改](@fId INT ,@tt tt_继教评分表项目要求 READONLY) 
	AS  DECLARE @output tt_继教评分表项目要求;
MERGE dbo.继教评分表项目要求 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[评分表项目编号]  =@fid,
			t.[要求]  =s.[要求] ,
			t.[标准分]  =s.[标准分] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			评分表项目编号 ,
			要求 ,
			标准分 ,
			备注 ) Values( 
			@fid ,
			s.[要求]  ,
			s.[标准分]  ,
			s.[备注]  
)WHEN NOT MATCHED BY SOURCE AND t.评分表项目编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教签到_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教签到_增改](@tt tt_继教签到 READONLY) 
	AS  DECLARE @output tt_继教签到;
MERGE dbo.继教签到 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] 
 WHEN NOT MATCHED THEN INSERT (			编号 ) Values( 
			s.[编号]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教签到参与情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教签到参与情况_增改](@tt tt_继教签到参与情况 READONLY) 
	AS  DECLARE @output tt_继教签到参与情况;
MERGE dbo.继教签到参与情况 t
		USING @tt s
		ON s.签到规定编号 = t.签到规定编号 and s.参与人类型 = t.参与人类型 and s.参与人编号 = t.参与人编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[签到规定编号]  =s.[签到规定编号] ,
			t.[参与人类型]  =s.[参与人类型] ,
			t.[参与人编号]  =s.[参与人编号] ,
			t.[签到时间]  =s.[签到时间] 
 WHEN NOT MATCHED THEN INSERT (			签到规定编号 ,
			参与人类型 ,
			参与人编号 ,
			签到时间 ) Values( 
			s.[签到规定编号]  ,
			s.[参与人类型]  ,
			s.[参与人编号]  ,
			s.[签到时间]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教签到规定_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教签到规定_增改]
    (
      @fId INT ,
      @tt tt_继教签到规定 READONLY
    )
AS
    DECLARE @output tt_继教签到规定;
    MERGE dbo.继教签到规定 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[签到编号] = @fId ,
               t.[名称] = s.[名称] ,
               t.[签到开始时间] = s.[签到开始时间] ,
               t.[签到结束时间] = s.[签到结束时间] ,
               t.[二维码变化秒数] = s.[二维码变化秒数] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 签到编号 ,
                 名称 ,
                 签到开始时间 ,
                 签到结束时间 ,
                 二维码变化秒数 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[名称] ,
                 s.[签到开始时间] ,
                 s.[签到结束时间] ,
                 s.[二维码变化秒数] ,
                 s.[备注]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.签到编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教人员_导入]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教人员_导入] ( @tt tt_继教人员导入 READONLY )
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

		--插入继教人员
		INSERT dbo.继教人员
		        ( 编号, 能级编号 )
		SELECT b.编号,c.编号 FROM @tt a JOIN 人员 b ON a.工号 = b.工号 JOIN 继教能级 c ON a.能级 = c.名称

    COMMIT TRAN;
GO
/****** Object:  StoredProcedure [dbo].[sp_继教人员_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教人员_增改](@tt tt_继教人员 READONLY) 
	AS  DECLARE @output tt_继教人员;
MERGE dbo.继教人员 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[能级编号]  =s.[能级编号] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			能级编号 ) Values( 
			s.[编号]  ,
			s.[能级编号]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教人员角色_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教人员角色_增改]
    (
      @fId INT ,
      @tt tt_继教人员角色 READONLY
    )
AS
    DECLARE @output tt_继教人员角色;
    MERGE dbo.继教人员角色 t
    USING @tt s
    ON @fId = t.继教角色编号
        AND s.人员编号 = t.人员编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[继教角色编号] = @fId ,
               t.[人员编号] = s.[人员编号]
    WHEN NOT MATCHED THEN
        INSERT ( 继教角色编号, 人员编号 )
        VALUES ( @fId, s.[人员编号] )
    WHEN NOT MATCHED BY SOURCE AND t.继教角色编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教设置_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教设置_增改](@tt tt_继教设置 READONLY) 
	AS  DECLARE @output tt_继教设置;
MERGE dbo.继教设置 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[课时课件通过时长百分比]  =s.[课时课件通过时长百分比] ,
			t.[理论考试及格分百分比]  =s.[理论考试及格分百分比] ,
			t.[最大允许离开界面次数]  =s.[最大允许离开界面次数] 
 WHEN NOT MATCHED THEN INSERT (			课时课件通过时长百分比 ,
			理论考试及格分百分比 ,
			最大允许离开界面次数 ) Values( 
			s.[课时课件通过时长百分比]  ,
			s.[理论考试及格分百分比]  ,
			s.[最大允许离开界面次数]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试卷_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试卷_增改](@tt tt_继教试卷 READONLY) 
	AS  DECLARE @output tt_继教试卷;
MERGE dbo.继教试卷 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[文件夹编号]  =s.[文件夹编号] ,
			t.[名称]  =s.[名称] ,
			t.[描述]  =s.[描述] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			文件夹编号 ,
			名称 ,
			描述 ,
			建立时间 ,
			备注 ) Values( 
			s.[文件夹编号]  ,
			s.[名称]  ,
			s.[描述]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试卷结构_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教试卷结构_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教试卷结构 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教试卷结构_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试卷结构_增改](@tt tt_继教试卷结构 READONLY) 
	AS  DECLARE @output tt_继教试卷结构;
MERGE dbo.继教试卷结构 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[试卷编号]  =s.[试卷编号] ,
			t.[类型编号]  =s.[类型编号] ,
			t.[名称]  =s.[名称] ,
			t.[排序值]  =s.[排序值] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			试卷编号 ,
			类型编号 ,
			名称 ,
			排序值 ,
			备注 ) Values( 
			s.[试卷编号]  ,
			s.[类型编号]  ,
			s.[名称]  ,
			s.[排序值]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试卷试题_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试卷试题_增改](@fId INT ,@tt tt_继教试卷试题 READONLY) 
	AS  DECLARE @output tt_继教试卷试题;
MERGE dbo.继教试卷试题 t
		USING @tt s
		ON @fid = t.试卷结构编号 and s.试题编号 = t.试题编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[试卷结构编号]  =@fid,
			t.[试题编号]  =s.[试题编号] ,
			t.[分值]  =s.[分值] ,
			t.[排序值]  =s.[排序值] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			试卷结构编号 ,
			试题编号 ,
			分值 ,
			排序值 ,
			备注 ) Values( 
			@fid ,
			s.[试题编号]  ,
			s.[分值]  ,
			s.[排序值]  ,
			s.[备注]  
)WHEN NOT MATCHED BY SOURCE AND t.试卷结构编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试题_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_继教试题_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    继教试题 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_继教试题_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试题_增改](@tt tt_继教试题 READONLY) 
	AS  DECLARE @output tt_继教试题;
MERGE dbo.继教试题 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[文件夹编号]  =s.[文件夹编号] ,
			t.[类型编号]  =s.[类型编号] ,
			t.[题干]  =s.[题干] ,
			t.[题目解析]  =s.[题目解析] ,
			t.[难易度]  =s.[难易度] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			文件夹编号 ,
			类型编号 ,
			题干 ,
			题目解析 ,
			难易度 ,
			建立时间 ,
			备注 ) Values( 
			s.[文件夹编号]  ,
			s.[类型编号]  ,
			s.[题干]  ,
			s.[题目解析]  ,
			s.[难易度]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试题备选答案_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试题备选答案_增改](@fId INT ,@tt tt_继教试题备选答案 READONLY) 
	AS  DECLARE @output tt_继教试题备选答案;
MERGE dbo.继教试题备选答案 t
		USING @tt s
		ON @fid = t.试题编号 and s.备选答案编码 = t.备选答案编码
		WHEN MATCHED THEN
			UPDATE SET
			t.[试题编号]  =@fid,
			t.[备选答案编码]  =s.[备选答案编码] ,
			t.[备选答案内容]  =s.[备选答案内容] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			试题编号 ,
			备选答案编码 ,
			备选答案内容 ,
			备注 ) Values( 
			@fid ,
			s.[备选答案编码]  ,
			s.[备选答案内容]  ,
			s.[备注]  
)WHEN NOT MATCHED BY SOURCE AND t.试题编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试题标签_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试题标签_增改](@fId INT ,@tt tt_继教试题标签 READONLY) 
	AS  DECLARE @output tt_继教试题标签;
MERGE dbo.继教试题标签 t
		USING @tt s
		ON s.标签编号 = t.标签编号 and @fid = t.试题编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[标签编号]  =s.[标签编号] ,
			t.[试题编号]  =@fid
 WHEN NOT MATCHED THEN INSERT (			标签编号 ,
			试题编号 ) Values( 
			s.[标签编号]  ,
			@fid 
)WHEN NOT MATCHED BY SOURCE AND t.试题编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教试题正确答案_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教试题正确答案_增改](@fId INT ,@tt tt_继教试题正确答案 READONLY) 
	AS  DECLARE @output tt_继教试题正确答案;
MERGE dbo.继教试题正确答案 t
		USING @tt s
		ON @fid = t.试题编号 and s.正确答案编码 = t.正确答案编码
		WHEN MATCHED THEN
			UPDATE SET
			t.[试题编号]  =@fid,
			t.[正确答案编码]  =s.[正确答案编码] 
 WHEN NOT MATCHED THEN INSERT (			试题编号 ,
			正确答案编码 ) Values( 
			@fid ,
			s.[正确答案编码]  
)WHEN NOT MATCHED BY SOURCE AND t.试题编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教微信角色权限_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教微信角色权限_增改](@fId INT ,@tt tt_继教微信角色权限 READONLY) 
	AS  DECLARE @output tt_继教微信角色权限;
MERGE dbo.继教微信角色权限 t
		USING @tt s
		ON @fid = t.继教角色编号 and s.继教微信权限编号 = t.继教微信权限编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[继教角色编号]  =@fid,
			t.[继教微信权限编号]  =s.[继教微信权限编号] 
 WHEN NOT MATCHED THEN INSERT (			继教角色编号 ,
			继教微信权限编号 ) Values( 
			@fid ,
			s.[继教微信权限编号]  
)WHEN NOT MATCHED BY SOURCE AND t.继教角色编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教文件夹_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教文件夹_增改] ( @tt tt_继教文件夹 READONLY )
AS
    DECLARE @output tt_继教文件夹;
    MERGE dbo.继教文件夹 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[父编号] = s.[父编号] ,
               t.[类型] = s.[类型] ,
               t.[名称] = s.[名称] ,
               t.[完整路径名] = s.[完整路径名] ,
               t.[排序值] = s.[排序值] ,
               t.[层级] = s.[层级] ,
               t.[归属人类型] = s.[归属人类型] ,
               t.[归属人编号] = s.[归属人编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 父编号 ,
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
        VALUES ( s.[父编号] ,
                 s.[类型] ,
                 s.[名称] ,
                 s.[完整路径名] ,
                 s.[排序值] ,
                 s.[层级] ,
                 s.[归属人类型] ,
                 s.[归属人编号] ,
                 GETDATE() ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教文件夹可使用人_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教文件夹可使用人_增改]
    (
      @fId INT ,
      @tt tt_继教文件夹可使用人 READONLY
    )
AS
    DECLARE @output tt_继教文件夹可使用人;
    MERGE dbo.继教文件夹可使用人 t
    USING @tt s
    ON @fId = t.文件夹编号
        AND s.可使用人类型 = t.可使用人类型
        AND s.可使用人编号 = t.可使用人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[文件夹编号] = @fId ,
               t.[可使用人类型] = s.[可使用人类型] ,
               t.[可使用人编号] = s.[可使用人编号]
    WHEN NOT MATCHED THEN
        INSERT ( 文件夹编号, 可使用人类型, 可使用人编号 )
        VALUES ( @fId ,
                 s.[可使用人类型] ,
                 s.[可使用人编号]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.文件夹编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_继教助教老师_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_继教助教老师_增改](@fId INT ,@tt tt_继教助教老师 READONLY) 
	AS  DECLARE @output tt_继教助教老师;
MERGE dbo.继教助教老师 t
		USING @tt s
		ON @fid = t.科室编号 and s.助教老师编号 = t.助教老师编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[科室编号]  =@fid,
			t.[助教老师编号]  =s.[助教老师编号] 
 WHEN NOT MATCHED THEN INSERT (			科室编号 ,
			助教老师编号 ) Values( 
			@fid ,
			s.[助教老师编号]  
)WHEN NOT MATCHED BY SOURCE AND t.科室编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_讲座反馈_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_讲座反馈_增改](@tt tt_讲座反馈 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.讲座反馈 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[讲座编号]  = s.[讲座编号] ,
			t.[专家姓名]  = s.[专家姓名] ,
			t.[专家身份证号码]  = s.[专家身份证号码] ,
			t.[专家护照号]  = s.[专家护照号] ,
			t.[专家联系方式]  = s.[专家联系方式] ,
			t.[专家讲课费金额]  = s.[专家讲课费金额] ,
			t.[结算方式]  = s.[结算方式] ,
			t.[活动持续分钟]  = s.[活动持续分钟] ,
			t.[参会人数]  = s.[参会人数] ,
			t.[讲座附件路径]  = s.[讲座附件路径] ,
			t.[讲座效果]  = s.[讲座效果] 
 WHEN NOT MATCHED THEN INSERT VALUES( 
			[讲座编号] ,
			[专家姓名] ,
			[专家身份证号码] ,
			[专家护照号] ,
			[专家联系方式] ,
			[专家讲课费金额] ,
			[结算方式] ,
			[活动持续分钟] ,
			[参会人数] ,
			[讲座附件路径] ,
			[讲座效果] 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;

GO
/****** Object:  StoredProcedure [dbo].[sp_角色_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色_增改] ( @tt_角色 tt_角色 READONLY )
AS
    MERGE 角色 t
    USING @tt_角色 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.名称 = s.名称 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 名称, 备注 )
        VALUES ( s.名称, s.备注 );

GO
/****** Object:  StoredProcedure [dbo].[sp_角色的权限_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色的权限_删]
    (
      @角色编号 INT ,
      @权限编号 tt_编号 READONLY
    )
AS
    DELETE  a
    FROM    dbo.角色权限 a
    WHERE   a.角色编号 = @角色编号
            AND a.权限编号 IN ( SELECT  b.编号
                            FROM    @权限编号 b ); 
GO
/****** Object:  StoredProcedure [dbo].[sp_角色的权限_增改删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色的权限_增改删]
    (
      @角色编号 INT ,
      @权限编号 tt_编号 READONLY
    )
AS
    MERGE dbo.角色权限 t
    USING @权限编号 s
    ON t.角色编号 = @角色编号
        AND t.权限编号 = s.编号
    WHEN NOT MATCHED THEN
        INSERT ( 角色编号, 权限编号 )
        VALUES ( @角色编号, s.编号 )
    WHEN NOT MATCHED BY SOURCE AND t.角色编号 = @角色编号 THEN
        DELETE;
GO
/****** Object:  StoredProcedure [dbo].[sp_角色中的人员_获取]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色中的人员_获取](@角色编号 int)
as
SELECT * FROM dbo.tfn_角色中的人员(@角色编号);
SELECT * FROM dbo.tfn_角色中没有的人员(@角色编号);
GO
/****** Object:  StoredProcedure [dbo].[sp_角色中的人员_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色中的人员_删]
    (
      @角色编号 INT ,
      @人员编号 tt_编号 READONLY
    )
AS
    DELETE  a
    FROM    dbo.人员角色 a
    WHERE   a.角色编号 = @角色编号
            AND a.人员编号 IN ( SELECT  b.编号
                            FROM    @人员编号 b ); 
GO
/****** Object:  StoredProcedure [dbo].[sp_角色中的人员_新增人员同时到角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色中的人员_新增人员同时到角色]
    (
      @角色编号 INT ,
      @tt tt_人员 READONLY
    )
AS
    DECLARE @编号 tt_编号;

    INSERT  @编号
            ( 编号 )
            EXEC dbo.sp_人员_增改 @tt = @tt;
	

--    MERGE dbo.人员 t
--    USING @tt s
--    ON s.编号 = t.编号
--    WHEN MATCHED THEN
--        UPDATE SET
--               t.工号 = s.工号 ,
----t.密码 = s.密码 , --密码不在这里改
--               t.姓名 = s.姓名 ,
--               t.部门编号 = s.部门编号 ,
--               t.英文名 = s.英文名 ,
--               t.性别 = s.性别 ,
--               t.身份证 = s.身份证 ,
--               t.出生日期 = s.出生日期 ,
--               t.入职日期 = s.入职日期 ,
--               t.手机 = s.手机 ,
--               t.QQ = s.QQ ,
--               t.邮箱 = s.邮箱 ,
--               t.籍贯 = s.籍贯 ,
--               t.毕业日期 = s.毕业日期 ,
--               t.合同开始日期 = s.合同开始日期 ,
--               t.合同结束日期 = s.合同结束日期 ,
--               t.参加工作日期 = s.参加工作日期 ,
--               t.专业技术获得日期 = s.专业技术获得日期 ,
--               t.职务任职日期 = s.职务任职日期 ,
--               t.学位 = s.学位 ,
--               t.学历 = s.学历 ,
--               t.政治面貌 = s.政治面貌 ,
--               t.技术职称类别 = s.技术职称类别 ,
--               t.技术职称 = s.技术职称 ,
--               t.第二技术职称类别 = s.第二技术职称类别 ,
--               t.第二技术职称 = s.第二技术职称 ,
--               t.婚姻情况 = s.婚姻情况 ,
--               t.学制 = s.学制 ,
--               t.学历性质 = s.学历性质 ,
--               t.学习形式 = s.学习形式 ,
--               t.人员类别 = s.人员类别 ,
--               t.个人身份 = s.个人身份 ,
--               t.民族 = s.民族 ,
--               t.专业技术级别 = s.专业技术级别 ,
--               t.所学专业名称 = s.所学专业名称 ,
--               t.岗位性质 = s.岗位性质 ,
--               t.职务名称 = s.职务名称 ,
--               t.职务级别 = s.职务级别 ,
--               t.岗位名称 = s.岗位名称 ,
--               t.岗位类型 = s.岗位类型 ,
--               t.学科门类 = s.学科门类 ,
--               t.一级学科 = s.一级学科 ,
--               t.二级学科 = s.二级学科 ,
--               t.三级学科 = s.三级学科 ,
--               t.人员类型 = s.人员类型 ,
--               t.获得最高学历的院校 = s.获得最高学历的院校 ,
--               t.获得最高学位的院校 = s.获得最高学位的院校 ,
--               t.住宅地址 = s.住宅地址 ,
--               t.学术特长 = s.学术特长 ,
--               t.研究方向 = s.研究方向 ,
--               t.个人获得的荣誉和奖项 = s.个人获得的荣誉和奖项 ,
--               t.备注 = s.备注 ,
--               t.是否启用 = s.是否启用
--    WHEN NOT MATCHED THEN
--        INSERT ( 工号 ,
--                 密码 ,
--                 姓名 ,
--                 部门编号 ,
--                 英文名 ,
--                 性别 ,
--                 身份证 ,
--                 出生日期 ,
--                 入职日期 ,
--                 手机 ,
--                 QQ ,
--                 邮箱 ,
--                 籍贯 ,
--                 毕业日期 ,
--                 合同开始日期 ,
--                 合同结束日期 ,
--                 参加工作日期 ,
--                 专业技术获得日期 ,
--                 职务任职日期 ,
--                 学位 ,
--                 学历 ,
--                 政治面貌 ,
--                 技术职称类别 ,
--                 技术职称 ,
--                 第二技术职称类别 ,
--                 第二技术职称 ,
--                 婚姻情况 ,
--                 学制 ,
--                 学历性质 ,
--                 学习形式 ,
--                 人员类别 ,
--                 个人身份 ,
--                 民族 ,
--                 专业技术级别 ,
--                 所学专业名称 ,
--                 岗位性质 ,
--                 职务名称 ,
--                 职务级别 ,
--                 岗位名称 ,
--                 岗位类型 ,
--                 学科门类 ,
--                 一级学科 ,
--                 二级学科 ,
--                 三级学科 ,
--                 人员类型 ,
--                 获得最高学历的院校 ,
--                 获得最高学位的院校 ,
--                 住宅地址 ,
--                 学术特长 ,
--                 研究方向 ,
--                 个人获得的荣誉和奖项 ,
--                 备注 ,
--                 是否启用
--               )
--        VALUES ( s.工号 ,
--                 s.密码 ,
--                 s.姓名 ,
--                 s.部门编号 ,
--                 s.英文名 ,
--                 s.性别 ,
--                 s.身份证 ,
--                 s.出生日期 ,
--                 s.入职日期 ,
--                 s.手机 ,
--                 s.QQ ,
--                 s.邮箱 ,
--                 s.籍贯 ,
--                 s.毕业日期 ,
--                 s.合同开始日期 ,
--                 s.合同结束日期 ,
--                 s.参加工作日期 ,
--                 s.专业技术获得日期 ,
--                 s.职务任职日期 ,
--                 s.学位 ,
--                 s.学历 ,
--                 s.政治面貌 ,
--                 s.技术职称类别 ,
--                 s.技术职称 ,
--                 s.第二技术职称类别 ,
--                 s.第二技术职称 ,
--                 s.婚姻情况 ,
--                 s.学制 ,
--                 s.学历性质 ,
--                 s.学习形式 ,
--                 s.人员类别 ,
--                 s.个人身份 ,
--                 s.民族 ,
--                 s.专业技术级别 ,
--                 s.所学专业名称 ,
--                 s.岗位性质 ,
--                 s.职务名称 ,
--                 s.职务级别 ,
--                 s.岗位名称 ,
--                 s.岗位类型 ,
--                 s.学科门类 ,
--                 s.一级学科 ,
--                 s.二级学科 ,
--                 s.三级学科 ,
--                 s.人员类型 ,
--                 s.获得最高学历的院校 ,
--                 s.获得最高学位的院校 ,
--                 s.住宅地址 ,
--                 s.学术特长 ,
--                 s.研究方向 ,
--                 s.个人获得的荣誉和奖项 ,
--                 s.备注 ,
--                 s.是否启用
--               )
--    OUTPUT
--        Inserted.编号
--        INTO @编号;

    EXECUTE dbo.sp_角色中的人员_增 @角色编号 = @角色编号, @人员编号 = @编号;
    
GO
/****** Object:  StoredProcedure [dbo].[sp_角色中的人员_增]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色中的人员_增]
    (
      @角色编号 INT ,
      @人员编号 tt_编号 READONLY
    )
AS
    MERGE dbo.人员角色 t
    USING @人员编号 s
    ON t.角色编号 = @角色编号
        AND t.人员编号 = s.编号
    WHEN NOT MATCHED THEN
        INSERT ( 角色编号, 人员编号 )
        VALUES ( @角色编号, s.编号 );

GO
/****** Object:  StoredProcedure [dbo].[sp_角色中的人员_增改删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_角色中的人员_增改删]
    (
      @角色编号 INT ,
      @人员编号 tt_编号 READONLY
    )
AS
    MERGE dbo.人员角色 t
    USING @人员编号 s
    ON t.角色编号 = @角色编号
        AND t.人员编号 = s.编号
    WHEN NOT MATCHED THEN
        INSERT ( 角色编号, 人员编号 )
        VALUES ( @角色编号, s.编号 )
    WHEN NOT MATCHED BY SOURCE AND t.角色编号 = @角色编号 THEN
        DELETE;
GO
/****** Object:  StoredProcedure [dbo].[sp_教学360评价_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学360评价_增改](@tt tt_教学360评价 READONLY) 
	AS  DECLARE @output tt_教学360评价;
MERGE dbo.教学360评价 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[来源类型]  =s.[来源类型] ,
			t.[评价人编号]  =s.[评价人编号] ,
			t.[目标类型]  =s.[目标类型] ,
			t.[被评价人编号]  =s.[被评价人编号] ,
			t.[评价内容]  =s.[评价内容] ,
			t.[评价时间]  =s.[评价时间] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			来源类型 ,
			评价人编号 ,
			目标类型 ,
			被评价人编号 ,
			评价内容 ,
			评价时间 ,
			备注 ) Values( 
			s.[来源类型]  ,
			s.[评价人编号]  ,
			s.[目标类型]  ,
			s.[被评价人编号]  ,
			s.[评价内容]  ,
			s.[评价时间]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学360评价评分_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学360评价评分_增改](@fId INT ,@tt tt_教学360评价评分 READONLY) 
	AS  DECLARE @output tt_教学360评价评分;
MERGE dbo.教学360评价评分 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学360评价编号]  =@fid,
			t.[教学360评价项目编号]  =s.[教学360评价项目编号] ,
			t.[评分]  =s.[评分] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学360评价编号 ,
			教学360评价项目编号 ,
			评分 ,
			备注 ) Values( 
			@fid ,
			s.[教学360评价项目编号]  ,
			s.[评分]  ,
			s.[备注]  
)WHEN NOT MATCHED BY SOURCE AND t.教学360评价编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学360评价项目_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_教学360评价项目_启禁]
    (
      @tt_编号 tt_编号 READONLY ,
      @是否启用 BIT
    )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.教学360评价项目 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学360评价项目_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学360评价项目_增改]
    (
      @fId INT ,
      @tt tt_教学360评价项目 READONLY
    )
AS
    DECLARE @output tt_教学360评价项目;
    MERGE dbo.教学360评价项目 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学360评价分类编号] = @fId ,
               t.[名称] = s.[名称] ,
               t.[标准分] = s.[标准分] ,
               t.[是否启用] = s.[是否启用] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学360评价分类编号 ,
                 名称 ,
                 标准分 ,
                 是否启用 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[名称] ,
                 s.[标准分] ,
                 s.[是否启用] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学按科室统计轮转]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_教学按科室统计轮转]
    (
      @beginDate DATE ,
      @endDate DATE
    )
AS 

--DECLARE @beginDate DATE = '2019-5-30';
--DECLARE @endDate DATE = '2020-4-20';

    IF ( DATEDIFF(DAY, @beginDate, @endDate) > 365 )
        THROW 50001,N'按科室查看轮转统计时起止日期间隔不能大于一年',1;

	--2019-5-29 按pivot生成的
	----DECLARE @date TABLE ( d DATE );
 --   DECLARE @tempDate DATE;
 --   DECLARE @sqlIn NVARCHAR(MAX) = '';
 --   DECLARE @sqlSelect NVARCHAR(MAX) = '';

 --   SELECT  @tempDate = @beginDate;
 --   WHILE ( @tempDate <= @endDate )
 --       BEGIN
 --           SET @sqlIn += CONCAT(N',[', @tempDate, ']');
 --           SET @sqlSelect += CONCAT(N',', @tempDate);
 --       --INSERT  @date
 --       --        ( d )
 --       --VALUES  ( @tempDate );
 --           SET @tempDate = DATEADD(DAY, 1, @tempDate);
 --       END;

 --   SET @sqlIn = STUFF(@sqlIn, 1, 1, '');
 --   SET @sqlSelect = STUFF(@sqlSelect, 1, 1, '');

 --   DECLARE @sql NVARCHAR(MAX);

 --   SET @sql = CONCAT(N'WITH cte AS(
	--			SELECT  a.本院科室编号,a.本院科室名称,b.id, a.状态 FROM dbo.v_教学轮转 a JOIN dbo.SplitStringToTable(''',
 --               @sqlSelect,
 --               ''', '','') b ON b.id BETWEEN a.计划入科日期 AND a.计划出科日期)SELECT * FROM cte PIVOT (count(id) FOR id IN (',
 --               @sqlIn, N')) t');

 --   SELECT  @sql;

 --   EXEC sys.sp_executesql @sql;

	DECLARE @date TABLE ( d DATE );
    DECLARE @tempDate DATE;
    --DECLARE @sqlIn NVARCHAR(MAX) = '';
    --DECLARE @sqlSelect NVARCHAR(MAX) = '';

    SELECT  @tempDate = @beginDate;
    WHILE ( @tempDate <= @endDate )
        BEGIN
            --SET @sqlIn += CONCAT(N',[', @tempDate, ']');
            --SET @sqlSelect += CONCAT(N',', @tempDate);
        INSERT  @date
                ( d )
        VALUES  ( @tempDate );
            SET @tempDate = DATEADD(DAY, 1, @tempDate);
        END;

    --SET @sqlIn = STUFF(@sqlIn, 1, 1, '');
    --SET @sqlSelect = STUFF(@sqlSelect, 1, 1, '');

    DECLARE @sql NVARCHAR(MAX);

    --SET @sql = CONCAT(N'WITH cte AS(
				--SELECT  a.本院科室编号,a.本院科室名称,b.id, a.状态 FROM dbo.v_教学轮转 a JOIN dbo.SplitStringToTable(''',
    --            @sqlSelect,
    --            ''', '','') b ON b.id BETWEEN a.计划入科日期 AND a.计划出科日期)SELECT * FROM cte PIVOT (count(id) FOR id IN (',
    --            @sqlIn, N')) t');

    --SELECT  @sql;

    --EXEC sys.sp_executesql @sql;

	SELECT   a.本院科室编号 ,
                        a.状态,b.d AS 日期,
                        COUNT(1) AS 人数
               FROM     dbo.v_教学轮转 a
                        JOIN @date b ON b.d BETWEEN a.计划入科日期 AND a.计划出科日期
													GROUP BY a.本院科室编号,b.d,a.状态
GO
/****** Object:  StoredProcedure [dbo].[sp_教学本院策略_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_教学本院策略_启禁] ( @tt_编号 tt_编号 READONLY, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.教学本院策略 a
	WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学本院策略_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学本院策略_增改]
    (
      @tt tt_教学本院策略 READONLY
    )
AS
    DECLARE @output tt_教学本院策略;
    MERGE dbo.教学本院策略 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[名称] = s.[名称] ,
               t.[教学专业编号] = s.[教学专业编号] ,
               t.[专业基地管理员编号] = s.[专业基地管理员编号] ,
               t.[是否启用] = s.[是否启用] ,
               t.[建立日期] = s.[建立日期] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 名称 ,
                 教学专业编号 ,
                 专业基地管理员编号 ,
                 是否启用 ,
                 建立日期 ,
                 备注
               )
        VALUES ( s.[名称] ,
                 s.[教学专业编号] ,
                 s.[专业基地管理员编号] ,
                 s.[是否启用] ,
                 s.[建立日期] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学本院科室_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_教学本院科室_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    教学本院科室 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学本院科室_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学本院科室_增改]
    (
      @fId INT ,
      @tt tt_教学本院科室 READONLY
    )
AS
    DECLARE @output tt_教学本院科室;
    MERGE dbo.教学本院科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学本院策略编号] = @fId ,
               t.[排序值] = s.[排序值] ,
               t.[教学专业科室编号] = s.[教学专业科室编号] ,
               t.[本院科室编号] = s.[本院科室编号] ,
               t.[是否必选] = s.[是否必选] ,
               t.[培训时长] = s.[培训时长] ,
               t.[最低管床数量] = s.[最低管床数量] ,
               t.[最低全程管理数量] = s.[最低全程管理数量] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学本院策略编号 ,
                 排序值 ,
                 教学专业科室编号 ,
                 本院科室编号 ,
                 是否必选 ,
                 培训时长 ,
                 最低管床数量 ,
                 最低全程管理数量 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[排序值] ,
                 s.[教学专业科室编号] ,
                 s.[本院科室编号] ,
                 s.[是否必选] ,
                 s.[培训时长] ,
                 s.[最低管床数量] ,
                 s.[最低全程管理数量] ,
                 s.[备注]  
               )
    --WHEN NOT MATCHED BY SOURCE AND t.教学本院策略编号 = @fId THEN
    --    DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学本院科室任务_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_教学本院科室任务_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    教学本院科室任务 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学本院科室任务_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学本院科室任务_增改](@fId INT ,@tt tt_教学本院科室任务 READONLY) 
	AS  DECLARE @output tt_教学本院科室任务;
MERGE dbo.教学本院科室任务 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学本院科室编号]  =@fid,
			t.[项目名称]  =s.[项目名称] ,
			t.[任务类型编号]  =s.[任务类型编号] ,
			t.[是否门诊]  =s.[是否门诊] ,
			t.[是否病房]  =s.[是否病房] ,
			t.[是否医技]  =s.[是否医技] ,
			t.[最低评分要求]  =s.[最低评分要求] ,
			t.[数量要求]  =s.[数量要求] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学本院科室编号 ,
			项目名称 ,
			任务类型编号 ,
			是否门诊 ,
			是否病房 ,
			是否医技 ,
			最低评分要求 ,
			数量要求 ,
			备注 ) Values( 
			@fid ,
			s.[项目名称]  ,
			s.[任务类型编号]  ,
			s.[是否门诊]  ,
			s.[是否病房]  ,
			s.[是否医技]  ,
			s.[最低评分要求]  ,
			s.[数量要求]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学病人_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学病人_增改](@tt tt_教学病人 READONLY) 
	AS  DECLARE @output tt_教学病人;
MERGE dbo.教学病人 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[姓名]  = s.[姓名] ,
			t.[性别]  = s.[性别] ,
			t.[出生日期]  = s.[出生日期] ,
			t.[住院号]  = s.[住院号] ,
			t.[住院床号]  = s.[住院床号] ,
			t.[主要诊断]  = s.[主要诊断] ,
			t.[次要诊断]  = s.[次要诊断] ,
			t.[入院日期]  = s.[入院日期] ,
			t.[出院日期]  = s.[出院日期] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			姓名 ,
			性别 ,
			出生日期 ,
			住院号 ,
			住院床号 ,
			主要诊断 ,
			次要诊断 ,
			入院日期 ,
			出院日期 ,
			备注 ) Values( 
			s.姓名 ,
			s.性别 ,
			s.出生日期 ,
			s.住院号 ,
			s.住院床号 ,
			s.主要诊断 ,
			s.次要诊断 ,
			s.入院日期 ,
			s.出院日期 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学补轮转_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学补轮转_增改](@tt tt_教学补轮转 READONLY) 
	AS  DECLARE @output tt_教学补轮转;
MERGE dbo.教学补轮转 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  = s.[教学轮转编号] ,
			t.[说明]  = s.[说明] ,
			t.[开始日期]  = s.[开始日期] ,
			t.[结束日期]  = s.[结束日期] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			说明 ,
			开始日期 ,
			结束日期 ,
			建立人 ,
			建立时间 ,
			备注 ) Values( 
			s.教学轮转编号 ,
			s.说明 ,
			s.开始日期 ,
			s.结束日期 ,
			s.建立人 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学出科申请_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学出科申请_增改](@tt tt_教学出科申请 READONLY) 
	AS  DECLARE @output tt_教学出科申请;
MERGE dbo.教学出科申请 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  = s.[教学轮转编号] ,
			t.[申请出科日期]  = s.[申请出科日期] ,
			t.[出科小结]  = s.[出科小结] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			申请出科日期 ,
			出科小结 ,
			建立时间 ,
			备注 ) Values( 
			s.教学轮转编号 ,
			s.申请出科日期 ,
			s.出科小结 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学带教老师_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学带教老师_增改]
    (
      @fId INT ,
      @tt tt_教学带教老师 READONLY
    )
AS
    DECLARE @output tt_教学带教老师;
  
    SET XACT_ABORT ON;
  
    BEGIN TRAN;
    MERGE dbo.教学带教老师 t
    USING @tt s
    ON @fId = t.教学科室编号
        AND s.带教老师编号 = t.带教老师编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学科室编号] = @fId ,
               t.[带教老师编号] = s.[带教老师编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学科室编号, 带教老师编号, 备注 )
        VALUES ( @fId ,
                 s.[带教老师编号] ,
                 s.[备注]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.教学科室编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;

    SELECT  *
    FROM    @output;

	--替换人员角色中的带教老师
    DECLARE @带教老师编号 INT  = 4;
    DECLARE @最新的带教老师们 tt_教学人员角色;
    INSERT  @最新的带教老师们
            ( 教学角色编号, 人员编号 )
            SELECT DISTINCT @带教老师编号 ,
                    带教老师编号
            FROM    教学带教老师;
	
    EXEC dbo.sp_教学人员角色_增改 @fId = @带教老师编号, -- int
        @tt = @最新的带教老师们; -- tt_教学人员角色

    COMMIT TRAN;


GO
/****** Object:  StoredProcedure [dbo].[sp_教学更换带教老师_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学更换带教老师_增改](@tt tt_教学更换带教老师 READONLY) 
	AS  DECLARE @output tt_教学更换带教老师;
MERGE dbo.教学更换带教老师 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  = s.[教学轮转编号] ,
			t.[原带教老师编号]  = s.[原带教老师编号] ,
			t.[新带教老师编号]  = s.[新带教老师编号] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			原带教老师编号 ,
			新带教老师编号 ,
			建立人 ,
			建立时间 ,
			备注 ) Values( 
			s.教学轮转编号 ,
			s.原带教老师编号 ,
			s.新带教老师编号 ,
			s.建立人 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学管床病人_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学管床病人_增改](@tt tt_教学管床病人 READONLY) 
	AS  DECLARE @output tt_教学管床病人;
MERGE dbo.教学管床病人 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  = s.[教学轮转编号] ,
			t.[病人编号]  = s.[病人编号] ,
			t.[是否全程陪护]  = s.[是否全程陪护] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			病人编号 ,
			是否全程陪护 ,
			备注 ) Values( 
			s.教学轮转编号 ,
			s.病人编号 ,
			s.是否全程陪护 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学活动_增改](@tt tt_教学活动 READONLY) 
	AS  DECLARE @output tt_教学活动;
MERGE dbo.教学活动 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[活动主题]  =s.[活动主题] ,
			t.[活动开始时间]  =s.[活动开始时间] ,
			t.[活动结束时间]  =s.[活动结束时间] ,
			t.[活动地点]  =s.[活动地点] ,
			t.[教学活动类型编号]  =s.[教学活动类型编号] ,
			t.[主讲人编号]  =s.[主讲人编号] ,
			t.[主讲人姓名]  =s.[主讲人姓名] ,
			t.[主讲人职称]  =s.[主讲人职称] ,
			t.[活动内容]  =s.[活动内容] ,
			t.[教学病例]  =s.[教学病例] ,
			t.[病人编号]  =s.[病人编号] ,
			t.[附件]  =s.[附件] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			活动主题 ,
			活动开始时间 ,
			活动结束时间 ,
			活动地点 ,
			教学活动类型编号 ,
			主讲人编号 ,
			主讲人姓名 ,
			主讲人职称 ,
			活动内容 ,
			教学病例 ,
			病人编号 ,
			附件 ,
			建立人 ,
			建立时间 ,
			备注 ) Values( 
			s.[活动主题]  ,
			s.[活动开始时间]  ,
			s.[活动结束时间]  ,
			s.[活动地点]  ,
			s.[教学活动类型编号]  ,
			s.[主讲人编号]  ,
			s.[主讲人姓名]  ,
			s.[主讲人职称]  ,
			s.[活动内容]  ,
			s.[教学病例]  ,
			s.[病人编号]  ,
			s.[附件]  ,
			s.[建立人]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动反馈_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学活动反馈_增改](@tt tt_教学活动反馈 READONLY) 
	AS  DECLARE @output tt_教学活动反馈;
MERGE dbo.教学活动反馈 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学活动编号]  = s.[教学活动编号] ,
			t.[学员编号]  = s.[学员编号] ,
			t.[反馈内容]  = s.[反馈内容] ,
			t.[附件]  = s.[附件] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学活动编号 ,
			学员编号 ,
			反馈内容 ,
			附件 ,
			建立时间 ,
			备注 ) Values( 
			s.教学活动编号 ,
			s.学员编号 ,
			s.反馈内容 ,
			s.附件 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动可参与者_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学活动可参与者_增改]
    (
      @fId INT ,
      @tt tt_教学活动可参与者 READONLY
    )
AS
    DECLARE @output tt_教学活动可参与者;
    MERGE dbo.教学活动可参与者 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学活动编号] = @fId ,
               t.[学员编号] = s.[学员编号] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学活动编号, 学员编号, 备注 )
        VALUES ( @fId, s.[学员编号], s.[备注] )
    WHEN NOT MATCHED BY SOURCE AND t.教学活动编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动类型_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学活动类型_增改]
    (
      @tt tt_教学活动类型 READONLY
    )
AS
    DECLARE @output tt_教学活动类型;
    MERGE dbo.教学活动类型 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[名称] = s.[名称] ,
               t.[活动内容模板] = s.[活动内容模板] ,
               t.[备注] = s.[备注]
    --WHEN NOT MATCHED THEN
    --    INSERT ( 编号, 名称, 活动内容模板, 备注 )
    --    VALUES ( s.编号 ,
    --             s.名称 ,
    --             s.活动内容模板 ,
    --             s.备注 
    --           )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动评价_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学活动评价_增改](@tt tt_教学活动评价 READONLY) 
	AS  DECLARE @output tt_教学活动评价;
MERGE dbo.教学活动评价 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[评价人类型]  = s.[评价人类型] ,
			t.[评价人编号]  = s.[评价人编号] ,
			t.[教学活动编号]  = s.[教学活动编号] ,
			t.[教学活动评价项目编号]  = s.[教学活动评价项目编号] ,
			t.[评分]  = s.[评分] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			评价人类型 ,
			评价人编号 ,
			教学活动编号 ,
			教学活动评价项目编号 ,
			评分 ,
			备注 ) Values( 
			s.评价人类型 ,
			s.评价人编号 ,
			s.教学活动编号 ,
			s.教学活动评价项目编号 ,
			s.评分 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动评价项目_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_教学活动评价项目_启禁] ( @tt_编号 tt_编号 READONLY, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.教学活动评价项目 a
	WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学活动评价项目_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学活动评价项目_增改](@fId INT ,@tt tt_教学活动评价项目 READONLY) 
	AS  DECLARE @output tt_教学活动评价项目;
MERGE dbo.教学活动评价项目 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学活动类型编号]  =@fid,
			t.[名称]  =s.[名称] ,
			t.[标准分]  =s.[标准分] ,
			t.[是否启用]  =s.[是否启用] ,
			t.[说明]  =s.[说明] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学活动类型编号 ,
			名称 ,
			标准分 ,
			是否启用 ,
			说明 ,
			备注 ) Values( 
			@fid ,
			s.[名称]  ,
			s.[标准分]  ,
			s.[是否启用]  ,
			s.[说明]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学角色_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学角色_增改] ( @tt tt_教学角色 READONLY )
AS
    DECLARE @output tt_教学角色;
    MERGE dbo.教学角色 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[名称] = s.[名称] ,
               t.[能否直接配置人员] = s.[能否直接配置人员] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 名称, 能否直接配置人员, 备注 )
        VALUES ( s.[编号] ,
                 s.[名称] ,
                 s.[能否直接配置人员] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学角色权限_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学角色权限_增改](@fId INT ,@tt tt_教学角色权限 READONLY) 
	AS  DECLARE @output tt_教学角色权限;
MERGE dbo.教学角色权限 t
		USING @tt s
		ON @fid = t.教学角色编号 and s.教学权限编号 = t.教学权限编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学角色编号]  =@fid,
			t.[教学权限编号]  =s.[教学权限编号] 
 WHEN NOT MATCHED THEN INSERT (			教学角色编号 ,
			教学权限编号 ) Values( 
			@fid ,
			s.[教学权限编号]  
)WHEN NOT MATCHED BY SOURCE AND t.教学角色编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学结业申请_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学结业申请_增改](@tt tt_教学结业申请 READONLY) 
	AS  DECLARE @output tt_教学结业申请;
MERGE dbo.教学结业申请 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[学员编号]  = s.[学员编号] ,
			t.[说明]  = s.[说明] ,
			t.[申请结业日期]  = s.[申请结业日期] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			学员编号 ,
			说明 ,
			申请结业日期 ,
			建立时间 ,
			备注 ) Values( 
			s.学员编号 ,
			s.说明 ,
			s.申请结业日期 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学考勤情况_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学考勤情况_增改](@fId INT ,@tt tt_教学考勤情况 READONLY) 
	AS  DECLARE @output tt_教学考勤情况;
MERGE dbo.教学考勤情况 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  =@fid,
			t.[考勤日期]  =s.[考勤日期] ,
			t.[教学考勤类型编号]  =s.[教学考勤类型编号] ,
			t.[说明]  =s.[说明] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			考勤日期 ,
			教学考勤类型编号 ,
			说明 ,
			建立人 ,
			建立时间 ,
			备注 ) Values( 
			@fid ,
			s.[考勤日期]  ,
			s.[教学考勤类型编号]  ,
			s.[说明]  ,
			s.[建立人]  ,
			getdate() ,
			s.[备注]  
)WHEN NOT MATCHED BY SOURCE AND t.教学轮转编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学考勤统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_教学考勤统计]
    (
      @学员编号列表 tt_编号 READONLY ,
      @开始日期 DATE ,
      @结束日期 DATE
    )
AS 
--
--DECLARE @学员编号列表 tt_编号; 
--DECLARE @开始日期 DATE = '1900-1-1';
--DECLARE @结束日期 DATE = '2019-12-12';

--INSERT  @学员编号列表
--        ( 编号 )
--VALUES  ( 1 ),
--        ( 2 ),
--        ( 3 );
--EXEC sp_教学考勤统计 @学员编号列表,@开始日期,@结束日期

--DECLARE @学员编号列表 tt_编号; 
--EXEC sp_教学考勤统计 @学员编号列表,NULL,NULL

    DECLARE @whereIn NVARCHAR(1000);
    SET @whereIn = STUFF(( SELECT   ',[' + 名称 + ']'
                           FROM     dbo.教学考勤类型
                         FOR
                           XML PATH('')
                         ), 1, 1, '');

    DECLARE @sql NVARCHAR(MAX);
    SET @sql = N'WITH    cte
          AS ( SELECT   a.编号 ,
                        d.名称 AS 考勤类型名称
               FROM     @学员编号列表 a
                         JOIN 教学轮转 b ON b.学员编号 = a.编号
                         JOIN dbo.教学考勤情况 c ON b.编号 = c.教学轮转编号
                         JOIN dbo.教学考勤类型 d ON c.教学考勤类型编号 = d.编号 WHERE c.考勤日期 BETWEEN @开始日期 AND @结束日期
             )
    SELECT  *
    FROM    cte PIVOT ( COUNT(cte.考勤类型名称) FOR cte.考勤类型名称 IN (' + @whereIn
        + ') ) AS t;';

    EXEC sys.sp_executesql @sql,
        N'@学员编号列表 tt_编号 readonly,@开始日期 DATE,@结束日期 DATE', @学员编号列表 = @学员编号列表,
        @开始日期 = @开始日期, @结束日期 = @结束日期;


		
GO
/****** Object:  StoredProcedure [dbo].[sp_教学考试成绩_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学考试成绩_增改](@tt tt_教学考试成绩 READONLY) 
	AS  DECLARE @output tt_教学考试成绩;
MERGE dbo.教学考试成绩 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[理论考试成绩]  =s.[理论考试成绩] ,
			t.[技能考试成绩]  =s.[技能考试成绩] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			理论考试成绩 ,
			技能考试成绩 ,
			建立人 ,
			建立时间 ,
			备注 ) Values( 
			s.[编号]  ,
			s.[理论考试成绩]  ,
			s.[技能考试成绩]  ,
			s.[建立人]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学科室_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学科室_增改] ( @tt tt_教学科室 READONLY )
AS
    DECLARE @output tt_教学科室;

    SET XACT_ABORT ON;
    
    BEGIN TRAN;

	--增改科室
    MERGE dbo.教学科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[科室管理员编号] = s.[科室管理员编号] ,
               t.[最大学员人数] = s.[最大学员人数] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号, 科室管理员编号, 最大学员人数, 备注 )
        VALUES ( s.编号 ,
                 s.科室管理员编号 ,
                 s.最大学员人数 ,
                 s.备注 
               )
    OUTPUT
        Inserted.*
        INTO @output;

	--输出
    SELECT  *
    FROM    @output;

	--替换人员角色中的科室管理员
    DECLARE @科室管理员编号 INT  = 3;
    DECLARE @最新的科室管理员们 tt_教学人员角色;
    INSERT  @最新的科室管理员们
            ( 教学角色编号 ,
              人员编号
            )
            SELECT DISTINCT
                    @科室管理员编号 ,
                    科室管理员编号
            FROM    教学科室;
	--SELECT * FROM @最新的科室管理员们;
    EXEC dbo.sp_教学人员角色_增改 @fId = @科室管理员编号, -- int
        @tt = @最新的科室管理员们; -- tt_教学人员角色

    COMMIT TRAN;



GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_教学轮转_删] ( @tt_编号 tt_编号 READONLY )
AS
    --IF ( EXISTS ( SELECT    1
    --              FROM      教学轮转 a
    --              WHERE     a.实际入科日期 IS NOT NULL
    --                        AND a.编号 IN ( SELECT    b.编号
    --                                      FROM      @tt_编号 b ) ) )
    --    THROW 50001,N'已入科轮转不能删除',1;
    DELETE  a
    FROM    教学轮转 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学轮转_增改] ( @tt tt_教学轮转 READONLY )
AS
    DECLARE @output tt_教学轮转;
    MERGE dbo.教学轮转 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[学员编号] = s.[学员编号] ,
               t.[计划入科日期] = s.[计划入科日期] ,
               t.[计划出科日期] = s.[计划出科日期] ,
               t.[实际入科日期] = s.[实际入科日期] ,
               t.[实际出科日期] = s.[实际出科日期] ,
               t.[教学本院科室编号] = s.[教学本院科室编号] ,
               t.[带教老师编号] = s.[带教老师编号] ,
               t.[最低管床数量] = s.[最低管床数量] ,
               t.[最低全程管理数量] = s.[最低全程管理数量] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 学员编号 ,
                 计划入科日期 ,
                 计划出科日期 ,
                 实际入科日期 ,
                 实际出科日期 ,
                 教学本院科室编号 ,
                 带教老师编号 ,
                 最低管床数量 ,
                 最低全程管理数量 ,
                 备注
               )
        VALUES ( s.[学员编号] ,
                 s.[计划入科日期] ,
                 s.[计划出科日期] ,
                 s.[实际入科日期] ,
                 s.[实际出科日期] ,
                 s.[教学本院科室编号] ,
                 s.[带教老师编号] ,
                 s.[最低管床数量] ,
                 s.[最低全程管理数量] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转任务_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_教学轮转任务_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    教学轮转任务 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转任务_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学轮转任务_增改](@tt tt_教学轮转任务 READONLY) 
	AS  DECLARE @output tt_教学轮转任务;
MERGE dbo.教学轮转任务 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  = s.[教学轮转编号] ,
			t.[项目名称]  = s.[项目名称] ,
			t.[任务类型编号]  = s.[任务类型编号] ,
			t.[是否门诊]  = s.[是否门诊] ,
			t.[是否病房]  = s.[是否病房] ,
			t.[是否医技]  = s.[是否医技] ,
			t.[最低评分要求]  = s.[最低评分要求] ,
			t.[数量要求]  = s.[数量要求] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			项目名称 ,
			任务类型编号 ,
			是否门诊 ,
			是否病房 ,
			是否医技 ,
			最低评分要求 ,
			数量要求 ,
			备注 ) Values( 
			s.教学轮转编号 ,
			s.项目名称 ,
			s.任务类型编号 ,
			s.是否门诊 ,
			s.是否病房 ,
			s.是否医技 ,
			s.最低评分要求 ,
			s.数量要求 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转手册_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学轮转手册_增改](@tt tt_教学轮转手册 READONLY) 
	AS  DECLARE @output tt_教学轮转手册;
MERGE dbo.教学轮转手册 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  =s.[教学轮转编号] ,
			t.[教学轮转手册类型编号]  =s.[教学轮转手册类型编号] ,
			t.[教学专业科室任务类型编号]  =s.[教学专业科室任务类型编号] ,
			t.[操作时间]  =s.[操作时间] ,
			t.[病人编号]  =s.[病人编号] ,
			t.[概要]  =s.[概要] ,
			t.[内容]  =s.[内容] ,
			t.[附件]  =s.[附件] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			教学轮转手册类型编号 ,
			教学专业科室任务类型编号 ,
			操作时间 ,
			病人编号 ,
			概要 ,
			内容 ,
			附件 ,
			建立时间 ,
			备注 ) Values( 
			s.[教学轮转编号]  ,
			s.[教学轮转手册类型编号]  ,
			s.[教学专业科室任务类型编号]  ,
			s.[操作时间]  ,
			s.[病人编号]  ,
			s.[概要]  ,
			s.[内容]  ,
			s.[附件]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转手册类型_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学轮转手册类型_增改](@tt tt_教学轮转手册类型 READONLY) 
	AS  DECLARE @output tt_教学轮转手册类型;
MERGE dbo.教学轮转手册类型 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[分类]  =s.[分类] ,
			t.[名称]  =s.[名称] ,
			t.[是否门诊]  =s.[是否门诊] ,
			t.[是否病床]  =s.[是否病床] ,
			t.[是否医技]  =s.[是否医技] ,
			t.[内容模板]  =s.[内容模板] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			分类 ,
			名称 ,
			是否门诊 ,
			是否病床 ,
			是否医技 ,
			内容模板 ,
			备注 ) Values( 
			s.[编号]  ,
			s.[分类]  ,
			s.[名称]  ,
			s.[是否门诊]  ,
			s.[是否病床]  ,
			s.[是否医技]  ,
			s.[内容模板]  ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学轮转手册完成任务_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学轮转手册完成任务_增改](@fId INT ,@tt tt_教学轮转手册完成任务 READONLY) 
	AS  DECLARE @output tt_教学轮转手册完成任务;
MERGE dbo.教学轮转手册完成任务 t
		USING @tt s
		ON @fid = t.教学轮转手册编号 and s.教学轮转任务编号 = t.教学轮转任务编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转手册编号]  =@fid,
			t.[教学轮转任务编号]  =s.[教学轮转任务编号] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转手册编号 ,
			教学轮转任务编号 ,
			备注 ) Values( 
			@fid ,
			s.[教学轮转任务编号]  ,
			s.[备注]  
)WHEN NOT MATCHED BY SOURCE AND t.教学轮转手册编号 = @fId THEN DELETE  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学评分等级_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学评分等级_增改](@tt tt_教学评分等级 READONLY) 
	AS  DECLARE @output tt_教学评分等级;
MERGE dbo.教学评分等级 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[等级名称]  = s.[等级名称] ,
			t.[最小分值]  = s.[最小分值] ,
			t.[最大分值]  = s.[最大分值] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			等级名称 ,
			最小分值 ,
			最大分值 ,
			备注 ) Values( 
			s.等级名称 ,
			s.最小分值 ,
			s.最大分值 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学请假申请_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学请假申请_增改](@tt tt_教学请假申请 READONLY) 
	AS  DECLARE @output tt_教学请假申请;
MERGE dbo.教学请假申请 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  =s.[教学轮转编号] ,
			t.[请假开始日期]  =s.[请假开始日期] ,
			t.[请假天数]  =s.[请假天数] ,
			t.[请假事由]  =s.[请假事由] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			请假开始日期 ,
			请假天数 ,
			请假事由 ,
			建立人 ,
			建立时间 ,
			备注 ) Values( 
			s.[教学轮转编号]  ,
			s.[请假开始日期]  ,
			s.[请假天数]  ,
			s.[请假事由]  ,
			s.[建立人]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学人员角色_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学人员角色_增改]
    (
      @fId INT ,
      @tt tt_教学人员角色 READONLY
    )
AS
    DECLARE @output tt_教学人员角色;
    MERGE dbo.教学人员角色 t
    USING @tt s
    ON @fId = t.教学角色编号
        AND s.人员编号 = t.人员编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学角色编号] = @fId ,
               t.[人员编号] = s.[人员编号]
    WHEN NOT MATCHED THEN
        INSERT ( 教学角色编号, 人员编号 )
        VALUES ( @fId, s.[人员编号] )
    WHEN NOT MATCHED BY SOURCE AND t.教学角色编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学通知公告_接收]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学通知公告_接收]
    (
      @通知公告编号 INT ,
      @接收人类型 NVARCHAR(50) ,
      @接收人编号 INT
    )
AS
    IF ( EXISTS ( SELECT    1
                  FROM      dbo.教学通知公告已接收人
                  WHERE     教学通知公告编号 = @通知公告编号
                            AND 接收人类型 = @接收人类型
                            AND 接收人编号 = @接收人编号 ) )
        RETURN;

    SET XACT_ABORT ON;

    BEGIN TRAN;


    INSERT  dbo.教学通知公告已接收人
            ( 教学通知公告编号, 接收人类型, 接收人编号 )
    VALUES  ( @通知公告编号, -- 通知公告编号 - int
              @接收人类型, @接收人编号  -- 接收人编号 - int
              );

    UPDATE  教学通知公告
    SET     已接收人数 = 已接收人数 + 1
    WHERE   编号 = @通知公告编号;

	--IF(EXISTS(SELECT 1 FROM 通知公告 WHERE 编号 = @通知公告编号 AND 接收人数 < 已接收人数))
	--THROW 50001,N'人员变动会导致应接收人数少于已接收人数',1

    COMMIT TRAN;
GO
/****** Object:  StoredProcedure [dbo].[sp_教学通知公告_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_教学通知公告_启禁] ( @tt_编号 tt_编号 READONLY, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.教学通知公告 a
	WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学通知公告_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学通知公告_增改]
    (
      @tt tt_教学通知公告 READONLY
    )
AS
    DECLARE @output tt_教学通知公告;
    MERGE dbo.教学通知公告 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[通知类型] = s.[通知类型] ,
               t.[发送人编号] = s.[发送人编号] ,
               t.[通知名称] = s.[通知名称] ,
               t.[关闭时间] = s.[关闭时间] ,
               t.[相关文件路径] = s.[相关文件路径] ,
               t.[通知内容] = s.[通知内容] ,
               --t.[已接收人数] = s.[已接收人数] ,
               t.[是否启用] = s.[是否启用] ,
               t.[备注] = s.[备注] ,
               t.[是否必读] = s.[是否必读]
    WHEN NOT MATCHED THEN
        INSERT ( 通知类型 ,
                 发送人编号 ,
                 通知名称 ,
                 关闭时间 ,
                 相关文件路径 ,
                 通知内容 ,
                 --已接收人数 ,
                 是否启用 ,
                 建立时间 ,
                 备注 ,
                 是否必读
               )
        VALUES ( s.通知类型 ,
                 s.发送人编号 ,
                 s.通知名称 ,
                 s.关闭时间 ,
                 s.相关文件路径 ,
                 s.通知内容 ,
                 --s.已接收人数 ,
                 s.是否启用 ,
                 GETDATE() ,
                 s.备注 ,
                 s.是否必读 
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学通知公告接收条件_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学通知公告接收条件_增改]
    (
      @fId INT ,
      @tt tt_教学通知公告接收条件 READONLY
    )
AS
    DECLARE @output tt_教学通知公告接收条件;
    MERGE dbo.教学通知公告接收条件 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学通知公告编号] =@fId ,
               t.[接收者类型] = s.[接收者类型] ,
               t.[接收者编号] = s.[接收者编号]
    WHEN NOT MATCHED THEN
        INSERT ( 教学通知公告编号, 接收者类型, 接收者编号 )
        VALUES ( @fId ,
                 s.接收者类型 ,
                 s.接收者编号 
               )
    WHEN NOT MATCHED BY SOURCE AND t.教学通知公告编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学统计轮转任务数量]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_教学统计轮转任务数量]
    (
      @strWnere NVARCHAR(200)
    )
AS
    DECLARE @strSql NVARCHAR(1000);

    DECLARE @教学轮转编号列表 tt_编号;

    SET @strSql = 'select 编号 from v_教学轮转 where ' + @strWnere;

    INSERT  @教学轮转编号列表
            ( 编号 )
            EXEC sys.sp_executesql @strSql;

   
    DECLARE @轮转总数 INT;
    SELECT  @轮转总数 = COUNT(1)
    FROM    @教学轮转编号列表;

    DECLARE @规定技能类任务数量 INT;
    DECLARE @规定疾病类任务数量 INT;
    DECLARE @规定门诊类任务数量 INT;
    DECLARE @规定病房类任务数量 INT;
    DECLARE @规定医技类任务数量 INT;

    DECLARE @已完成技能类任务数量 INT;
    DECLARE @已完成疾病类任务数量 INT;
    DECLARE @已完成门诊类任务数量 INT;
    DECLARE @已完成病房类任务数量 INT;
    DECLARE @已完成医技类任务数量 INT;

	--whereStr只是针对v_教学轮转来说的;
	--一般来说,where条件里面要加上"已出科"的条件
--WITH    cte
--          AS ( SELECT   *
--               FROM     v_教学轮转
--               WHERE    1 = 1
--             )
    --已出科的轮转中,技能/疾病/门诊/病房/医技等的任务数量要求;
    SELECT  @规定技能类任务数量 =ISNULL(SUM(CASE WHEN b.任务类型名称 = '技能' THEN b.数量要求
                                  ELSE 0
                             END),0) ,
            @规定疾病类任务数量 = ISNULL(SUM(CASE WHEN b.任务类型名称 = '疾病' THEN b.数量要求
                                  ELSE 0
                             END),0) ,
            @规定门诊类任务数量 = ISNULL(SUM(CASE WHEN b.是否门诊 = 1 THEN b.数量要求
                                  ELSE 0
                             END) ,0),
            @规定病房类任务数量 = ISNULL(SUM(CASE WHEN b.是否病房 = 1 THEN b.数量要求
                                  ELSE 0
                             END) ,0),
            @规定医技类任务数量 = ISNULL(SUM(CASE WHEN b.是否医技 = 1 THEN b.数量要求
                                  ELSE 0
                             END),0)
    FROM    @教学轮转编号列表 a
            JOIN dbo.v_教学轮转任务 b ON a.编号 = b.教学轮转编号;

--WITH    cte
--          AS ( SELECT   *
--               FROM     v_教学轮转
--               WHERE    1 = 1
--             )
    SELECT  @已完成技能类任务数量 = ISNULL(SUM(CASE WHEN b.任务类型名称 = '技能' THEN 1
                                          ELSE 0
                                     END), 0) ,
            @已完成疾病类任务数量 = ISNULL(SUM(CASE WHEN b.任务类型名称 = '疾病' THEN 1
                                          ELSE 0
                                     END), 0) ,
            @已完成门诊类任务数量 = ISNULL(SUM(CASE WHEN b.是否门诊 = 1 THEN 1
                                          ELSE 0
                                     END), 0) ,
            @已完成病房类任务数量 = ISNULL(SUM(CASE WHEN b.是否病房 = 1 THEN 1
                                          ELSE 0
                                     END), 0) ,
            @已完成医技类任务数量 = ISNULL(SUM(CASE WHEN b.是否医技 = 1 THEN 1
                                          ELSE 0
                                     END), 0)
    FROM    @教学轮转编号列表 a
            JOIN dbo.v_教学轮转任务 b ON a.编号 = b.教学轮转编号
            JOIN 教学轮转手册完成任务 c ON b.编号 = c.教学轮转任务编号
            JOIN 教学轮转手册 d ON c.教学轮转手册编号 = d.编号
            JOIN dbo.Flow e ON d.编号 = e.SourceId
                               AND e.FlowTemplateId = 300
                               AND e.State = 1;

    SELECT  @轮转总数 AS 轮转总数 ,
            @规定技能类任务数量 AS 规定技能类任务数量 ,
            @规定疾病类任务数量 AS 规定疾病类任务数量 ,
            @规定门诊类任务数量 AS 规定门诊类任务数量 ,
            @规定病房类任务数量 AS 规定病房类任务数量 ,
            @规定医技类任务数量 AS 规定医技类任务数量 ,
            @已完成技能类任务数量 AS 已完成技能类任务数量 ,
            @已完成疾病类任务数量 AS 已完成疾病类任务数量 ,
            @已完成门诊类任务数量 AS 已完成门诊类任务数量 ,
            @已完成病房类任务数量 AS 已完成病房类任务数量 ,
            @已完成医技类任务数量 AS 已完成医技类任务数量;
GO
/****** Object:  StoredProcedure [dbo].[sp_教学退培申请_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学退培申请_增改](@tt tt_教学退培申请 READONLY) 
	AS  DECLARE @output tt_教学退培申请;
MERGE dbo.教学退培申请 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[学员编号]  = s.[学员编号] ,
			t.[说明]  = s.[说明] ,
			t.[申请退培日期]  = s.[申请退培日期] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			学员编号 ,
			说明 ,
			申请退培日期 ,
			建立时间 ,
			备注 ) Values( 
			s.学员编号 ,
			s.说明 ,
			s.申请退培日期 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学宿舍楼_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学宿舍楼_增改](@tt tt_教学宿舍楼 READONLY) 
	AS  DECLARE @output tt_教学宿舍楼;
MERGE dbo.教学宿舍楼 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[名称]  = s.[名称] ,
			t.[层数]  = s.[层数] ,
			t.[单元数]  = s.[单元数] ,
			t.[每单元每层户数]  = s.[每单元每层户数] ,
			t.[每户床数]  = s.[每户床数] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			名称 ,
			层数 ,
			单元数 ,
			每单元每层户数 ,
			每户床数 ,
			备注 ) Values( 
			s.名称 ,
			s.层数 ,
			s.单元数 ,
			s.每单元每层户数 ,
			s.每户床数 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员_导入]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--相对于sp_教学学员_增改,这个的增改都会涉及密码;
CREATE PROC [dbo].[sp_教学学员_导入](@tt tt_教学学员 READONLY) 
	AS  DECLARE @output tt_教学学员;
MERGE dbo.教学学员 t
		USING @tt s
		ON s.工号 = t.工号
		WHEN MATCHED THEN
			UPDATE SET
			t.[来源学校编号]  =s.[来源学校编号] ,
			t.[来源学生编号]  =s.[来源学生编号] ,
			t.[学员类型编号]  =s.[学员类型编号] ,
			t.[工号]  =s.[工号] ,
			t.[密码]  =s.[密码] ,
			t.[头像路径]  =s.[头像路径] ,
			t.[姓名]  =s.[姓名] ,
			t.[性别]  =s.[性别] ,
			t.[民族]  =s.[民族] ,
			t.[证件类型]  =s.[证件类型] ,
			t.[证件号码]  =s.[证件号码] ,
			t.[出生日期]  =s.[出生日期] ,
			t.[手机号码]  =s.[手机号码] ,
			t.[政治面貌]  =s.[政治面貌] ,
			t.[电子邮箱]  =s.[电子邮箱] ,
			t.[QQ号码]  =s.[QQ号码] ,
			t.[微信号]  =s.[微信号] ,
			t.[家庭住址]  =s.[家庭住址] ,
			t.[取得执业证书日期]  =s.[取得执业证书日期] ,
			t.[执业证书编号]  =s.[执业证书编号] ,
			t.[取得医师资格证书日期]  =s.[取得医师资格证书日期] ,
			t.[医师资格证书编号]  =s.[医师资格证书编号] ,
			t.[最高学历]  =s.[最高学历] ,
			t.[毕业年份]  =s.[毕业年份] ,
			t.[毕业学校]  =s.[毕业学校] ,
			t.[毕业专业]  =s.[毕业专业] ,
			t.[毕业证编码]  =s.[毕业证编码] ,
			t.[学位证编码]  =s.[学位证编码] ,
			t.[学员培训年界]  =s.[学员培训年界] ,
			t.[学员培训年限]  =s.[学员培训年限] ,
			t.[往届应届]  =s.[往届应届] ,
			t.[专业编号]  =s.[专业编号] ,
			t.[送培方式]  =s.[送培方式] ,
			t.[工作单位]  =s.[工作单位] ,
			t.[医疗卫生机构]  =s.[医疗卫生机构] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			来源学校编号 ,
			来源学生编号 ,
			学员类型编号 ,
			工号 ,
			密码 ,
			头像路径 ,
			姓名 ,
			性别 ,
			民族 ,
			证件类型 ,
			证件号码 ,
			出生日期 ,
			手机号码 ,
			政治面貌 ,
			电子邮箱 ,
			QQ号码 ,
			微信号 ,
			家庭住址 ,
			取得执业证书日期 ,
			执业证书编号 ,
			取得医师资格证书日期 ,
			医师资格证书编号 ,
			最高学历 ,
			毕业年份 ,
			毕业学校 ,
			毕业专业 ,
			毕业证编码 ,
			学位证编码 ,
			学员培训年界 ,
			学员培训年限 ,
			往届应届 ,
			专业编号 ,
			送培方式 ,
			工作单位 ,
			医疗卫生机构 ,
			建立时间 ,
			备注 ) VALUES( 
			s.[来源学校编号]  ,
			s.[来源学生编号]  ,
			s.[学员类型编号]  ,
			s.[工号]  ,
			s.[密码]  ,
			s.[头像路径]  ,
			s.[姓名]  ,
			s.[性别]  ,
			s.[民族]  ,
			s.[证件类型]  ,
			s.[证件号码]  ,
			s.[出生日期]  ,
			s.[手机号码]  ,
			s.[政治面貌]  ,
			s.[电子邮箱]  ,
			s.[QQ号码]  ,
			s.[微信号]  ,
			s.[家庭住址]  ,
			s.[取得执业证书日期]  ,
			s.[执业证书编号]  ,
			s.[取得医师资格证书日期]  ,
			s.[医师资格证书编号]  ,
			s.[最高学历]  ,
			s.[毕业年份]  ,
			s.[毕业学校]  ,
			s.[毕业专业]  ,
			s.[毕业证编码]  ,
			s.[学位证编码]  ,
			s.[学员培训年界]  ,
			s.[学员培训年限]  ,
			s.[往届应届]  ,
			s.[专业编号]  ,
			s.[送培方式]  ,
			s.[工作单位]  ,
			s.[医疗卫生机构]  ,
			GETDATE() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;



GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_教学学员_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    教学学员 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员_修改密码]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_教学学员_修改密码]
    (
      @工号 NVARCHAR(50) ,
      @旧密码 NVARCHAR(50) ,
      @新密码 NVARCHAR(50)
    )
AS
    IF ( EXISTS ( SELECT    1
                  FROM      dbo.教学学员
                  WHERE     工号 = @工号
                            AND 密码 = @旧密码 ) )
        UPDATE  dbo.教学学员
        SET     密码 = @新密码
        WHERE   工号 = @工号;
    ELSE
        THROW 50001,N'旧密码错误',0;
        


GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_教学学员_增改] ( @tt tt_教学学员 READONLY )
AS
--学员的密码在单条添加时可以指定,修改学员时不能同时修改密码;
    DECLARE @output tt_教学学员;
    MERGE dbo.教学学员 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[来源学校编号] = s.[来源学校编号] ,
               t.[来源学生编号] = s.[来源学生编号] ,
               t.[学员类型编号] = s.[学员类型编号] ,
               t.[工号] = s.[工号] ,
			--t.[密码]  =s.[密码] ,
               t.[头像路径] = s.[头像路径] ,
               t.[姓名] = s.[姓名] ,
               t.[性别] = s.[性别] ,
               t.[民族] = s.[民族] ,
               t.[证件类型] = s.[证件类型] ,
               t.[证件号码] = s.[证件号码] ,
               t.[出生日期] = s.[出生日期] ,
               t.[手机号码] = s.[手机号码] ,
               t.[政治面貌] = s.[政治面貌] ,
               t.[电子邮箱] = s.[电子邮箱] ,
               t.[QQ号码] = s.[QQ号码] ,
               t.[微信号] = s.[微信号] ,
               t.[家庭住址] = s.[家庭住址] ,
               t.[取得执业证书日期] = s.[取得执业证书日期] ,
               t.[执业证书编号] = s.[执业证书编号] ,
               t.[取得医师资格证书日期] = s.[取得医师资格证书日期] ,
               t.[医师资格证书编号] = s.[医师资格证书编号] ,
               t.[最高学历] = s.[最高学历] ,
               t.[毕业年份] = s.[毕业年份] ,
               t.[毕业学校] = s.[毕业学校] ,
               t.[毕业专业] = s.[毕业专业] ,
               t.[毕业证编码] = s.[毕业证编码] ,
               t.[学位证编码] = s.[学位证编码] ,
               t.[学员培训年界] = s.[学员培训年界] ,
               t.[学员培训年限] = s.[学员培训年限] ,
               t.[往届应届] = s.[往届应届] ,
               t.[专业编号] = s.[专业编号] ,
               t.[送培方式] = s.[送培方式] ,
               t.[工作单位] = s.[工作单位] ,
               t.[医疗卫生机构] = s.[医疗卫生机构] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 来源学校编号 ,
                 来源学生编号 ,
                 学员类型编号 ,
                 工号 ,
			密码 ,
                 头像路径 ,
                 姓名 ,
                 性别 ,
                 民族 ,
                 证件类型 ,
                 证件号码 ,
                 出生日期 ,
                 手机号码 ,
                 政治面貌 ,
                 电子邮箱 ,
                 QQ号码 ,
                 微信号 ,
                 家庭住址 ,
                 取得执业证书日期 ,
                 执业证书编号 ,
                 取得医师资格证书日期 ,
                 医师资格证书编号 ,
                 最高学历 ,
                 毕业年份 ,
                 毕业学校 ,
                 毕业专业 ,
                 毕业证编码 ,
                 学位证编码 ,
                 学员培训年界 ,
                 学员培训年限 ,
                 往届应届 ,
                 专业编号 ,
                 送培方式 ,
                 工作单位 ,
                 医疗卫生机构 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.[来源学校编号] ,
                 s.[来源学生编号] ,
                 s.[学员类型编号] ,
                 s.[工号] ,
			s.[密码]  ,
                 s.[头像路径] ,
                 s.[姓名] ,
                 s.[性别] ,
                 s.[民族] ,
                 s.[证件类型] ,
                 s.[证件号码] ,
                 s.[出生日期] ,
                 s.[手机号码] ,
                 s.[政治面貌] ,
                 s.[电子邮箱] ,
                 s.[QQ号码] ,
                 s.[微信号] ,
                 s.[家庭住址] ,
                 s.[取得执业证书日期] ,
                 s.[执业证书编号] ,
                 s.[取得医师资格证书日期] ,
                 s.[医师资格证书编号] ,
                 s.[最高学历] ,
                 s.[毕业年份] ,
                 s.[毕业学校] ,
                 s.[毕业专业] ,
                 s.[毕业证编码] ,
                 s.[学位证编码] ,
                 s.[学员培训年界] ,
                 s.[学员培训年限] ,
                 s.[往届应届] ,
                 s.[专业编号] ,
                 s.[送培方式] ,
                 s.[工作单位] ,
                 s.[医疗卫生机构] ,
                 GETDATE() ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;


GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员类型_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学学员类型_增改](@tt tt_教学学员类型 READONLY) 
	AS  DECLARE @output tt_教学学员类型;
MERGE dbo.教学学员类型 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  = s.[编号] ,
			t.[名称]  = s.[名称] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			名称 ,
			备注 ) Values( 
			s.编号 ,
			s.名称 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员培训_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学学员培训_增改]
    (
      @tt tt_教学学员培训 READONLY
    )
AS
    DECLARE @output tt_教学学员培训;
    MERGE dbo.教学学员培训 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[编号] = s.[编号] ,
               t.[报到时间] = s.[报到时间] ,
               t.[教学本院策略编号] = s.[教学本院策略编号] ,
               t.[实际开始培训日期] = s.[实际开始培训日期] ,
               t.[实际结束培训日期] = s.[实际结束培训日期] ,
               t.[退培日期] = s.[退培日期] ,
               t.[结业日期] = s.[结业日期] ,
               t.[证书] = s.[证书] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 编号 ,
                 报到时间 ,
                 教学本院策略编号 ,
                 实际开始培训日期 ,
                 实际结束培训日期 ,
                 退培日期 ,
                 结业日期 ,
                 证书 ,
                 建立时间 ,
                 备注
               )
        VALUES ( s.[编号] ,
                 s.[报到时间] ,
                 s.[教学本院策略编号] ,
                 s.[实际开始培训日期] ,
                 s.[实际结束培训日期] ,
                 s.[退培日期] ,
                 s.[结业日期] ,
                 s.[证书] ,
                 GETDATE() ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学学员宿舍安排_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学学员宿舍安排_增改](@tt tt_教学学员宿舍安排 READONLY) 
	AS  DECLARE @output tt_教学学员宿舍安排;
MERGE dbo.教学学员宿舍安排 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  =s.[编号] ,
			t.[宿舍楼编号]  =s.[宿舍楼编号] ,
			t.[门禁卡卡号]  =s.[门禁卡卡号] ,
			t.[门牌号及床号]  =s.[门牌号及床号] ,
			t.[职位]  =s.[职位] ,
			t.[水起数]  =s.[水起数] ,
			t.[电起数]  =s.[电起数] ,
			t.[气起数]  =s.[气起数] ,
			t.[滞纳金比例]  =s.[滞纳金比例] ,
			t.[入住日期]  =s.[入住日期] ,
			t.[退出日期]  =s.[退出日期] ,
			t.[退出原因]  =s.[退出原因] ,
			t.[宿舍安排说明]  =s.[宿舍安排说明] ,
			t.[备注]  =s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			宿舍楼编号 ,
			门禁卡卡号 ,
			门牌号及床号 ,
			职位 ,
			水起数 ,
			电起数 ,
			气起数 ,
			滞纳金比例 ,
			入住日期 ,
			退出日期 ,
			退出原因 ,
			宿舍安排说明 ,
			建立时间 ,
			备注 ) Values( 
			s.[编号]  ,
			s.[宿舍楼编号]  ,
			s.[门禁卡卡号]  ,
			s.[门牌号及床号]  ,
			s.[职位]  ,
			s.[水起数]  ,
			s.[电起数]  ,
			s.[气起数]  ,
			s.[滞纳金比例]  ,
			s.[入住日期]  ,
			s.[退出日期]  ,
			s.[退出原因]  ,
			s.[宿舍安排说明]  ,
			getdate() ,
			s.[备注]  
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学医疗差错及事故记录_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学医疗差错及事故记录_增改](@tt tt_教学医疗差错及事故记录 READONLY) 
	AS  DECLARE @output tt_教学医疗差错及事故记录;
MERGE dbo.教学医疗差错及事故记录 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[教学轮转编号]  = s.[教学轮转编号] ,
			t.[处理日期]  = s.[处理日期] ,
			t.[处理类别]  = s.[处理类别] ,
			t.[处理原因]  = s.[处理原因] ,
			t.[处理意见]  = s.[处理意见] ,
			t.[附件]  = s.[附件] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			教学轮转编号 ,
			处理日期 ,
			处理类别 ,
			处理原因 ,
			处理意见 ,
			附件 ,
			备注 ) Values( 
			s.教学轮转编号 ,
			s.处理日期 ,
			s.处理类别 ,
			s.处理原因 ,
			s.处理意见 ,
			s.附件 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学专业_增改](@tt tt_教学专业 READONLY) 
	AS  DECLARE @output tt_教学专业;
MERGE dbo.教学专业 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[名称]  = s.[名称] ,
			t.[年份]  = s.[年份] ,
			t.[是否国家标准]  = s.[是否国家标准] ,
			t.[标准代码]  = s.[标准代码] ,
			t.[最低培训时长]  = s.[最低培训时长] ,
			t.[学习要求及目标]  = s.[学习要求及目标] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			名称 ,
			年份 ,
			是否国家标准 ,
			标准代码 ,
			最低培训时长 ,
			学习要求及目标 ,
			备注 ) Values( 
			s.名称 ,
			s.年份 ,
			s.是否国家标准 ,
			s.标准代码 ,
			s.最低培训时长 ,
			s.学习要求及目标 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业科室_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学专业科室_增改]
    (
      @fId INT ,
      @tt tt_教学专业科室 READONLY
    )
AS
    DECLARE @output tt_教学专业科室;
    MERGE dbo.教学专业科室 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业编号] = @fId ,
               t.[排序值] = s.[排序值] ,
               t.[科室名称] = s.[科室名称] ,
               t.[最低培训时长] = s.[最低培训时长] ,
               t.[最低管床数量] = s.[最低管床数量] ,
               t.[最低全程管理数量] = s.[最低全程管理数量] ,
               t.[科室要求] = s.[科室要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业编号 ,
                 排序值 ,
                 科室名称 ,
                 最低培训时长 ,
                 最低管床数量 ,
                 最低全程管理数量 ,
                 科室要求 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[排序值] ,
                 s.[科室名称] ,
                 s.[最低培训时长] ,
                 s.[最低管床数量] ,
                 s.[最低全程管理数量] ,
                 s.[科室要求] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业科室任务_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_教学专业科室任务_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    教学专业科室任务 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业科室任务_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学专业科室任务_增改]
    (
      @fId INT ,
      @tt tt_教学专业科室任务 READONLY
    )
AS
    DECLARE @output tt_教学专业科室任务;
    MERGE dbo.教学专业科室任务 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业科室编号] = @fId ,
               t.[项目名称] = s.[项目名称] ,
               t.[任务类型编号] = s.[任务类型编号] ,
               t.[是否门诊] = s.[是否门诊] ,
               t.[是否病房] = s.[是否病房] ,
               t.[是否医技] = s.[是否医技] ,
               t.[最低评分要求] = s.[最低评分要求] ,
               t.[数量要求] = s.[数量要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业科室编号 ,
                 项目名称 ,
                 任务类型编号 ,
                 是否门诊 ,
                 是否病房 ,
                 是否医技 ,
                 最低评分要求 ,
                 数量要求 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[项目名称] ,
                 s.[任务类型编号] ,
                 s.[是否门诊] ,
                 s.[是否病房] ,
                 s.[是否医技] ,
                 s.[最低评分要求] ,
                 s.[数量要求] ,
                 s.[备注]  
               )
    OUTPUT
        Inserted.*
        INTO @output;
        SELECT  *
        FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业科室任务类型_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学专业科室任务类型_增改](@tt tt_教学专业科室任务类型 READONLY) 
	AS  DECLARE @output tt_教学专业科室任务类型;
MERGE dbo.教学专业科室任务类型 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[编号]  = s.[编号] ,
			t.[名称]  = s.[名称] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT (			编号 ,
			名称 ,
			备注 ) Values( 
			s.编号 ,
			s.名称 ,
			s.备注 
)  OUTPUT Inserted.* INTO @output; SELECT * FROM @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业科室要求_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_教学专业科室要求_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    教学专业科室要求 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_教学专业科室要求_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_教学专业科室要求_增改]
    (
      @fId INT ,
      @tt tt_教学专业科室要求 READONLY
    )
AS
    DECLARE @output tt_教学专业科室要求;
    MERGE dbo.教学专业科室要求 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[教学专业科室编号] = @fId ,
               t.[项目名称] = s.[项目名称] ,
               t.[说明] = s.[说明] ,
               t.[最低评分要求] = s.[最低评分要求] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT ( 教学专业科室编号 ,
                 项目名称 ,
                 说明 ,
                 最低评分要求 ,
                 备注
               )
        VALUES ( @fId ,
                 s.[项目名称] ,
                 s.[说明] ,
                 s.[最低评分要求] ,
                 s.[备注]  
               )
    WHEN NOT MATCHED BY SOURCE AND t.教学专业科室编号 = @fId THEN
        DELETE
    OUTPUT
        Inserted.*
        INTO @output;
    SELECT  *
    FROM    @output;

GO
/****** Object:  StoredProcedure [dbo].[sp_经费模版_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_经费模版_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    dbo.经费模版 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_经费模版_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_经费模版_增改]
    (
      @tt tt_经费模版 READONLY
    )
AS
    MERGE dbo.经费模版 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.名称 = s.名称 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 名称, 备注 )
        VALUES ( s.名称, s.备注 );

GO
/****** Object:  StoredProcedure [dbo].[sp_经费模版项目支出类型_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_经费模版项目支出类型_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    dbo.经费模版项目支出类型 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_经费模版项目支出类型_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_经费模版项目支出类型_增改]
    (
      @tt_经费模版项目支出类型 tt_经费模版项目支出类型 READONLY ,
      @tt_经费模版项目支出内容 tt_经费模版项目支出内容 READONLY
    )
AS
    DECLARE @tt_编号 tt_编号; 
    DECLARE @编号 INT;

    MERGE dbo.经费模版项目支出类型 t
    USING @tt_经费模版项目支出类型 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.所属经费模版编号 = s.所属经费模版编号 ,
               t.项目支出类型 = s.项目支出类型 ,
               t.经费占比 = s.经费占比 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 所属经费模版编号 ,
                 项目支出类型 ,
                 经费占比 ,
                 备注
               )
        VALUES ( s.所属经费模版编号 ,
                 s.项目支出类型 ,
                 s.经费占比 ,
                 s.备注
               )
    OUTPUT
        Inserted.编号
        INTO @tt_编号;

    SELECT  @编号 = 编号
    FROM    @tt_编号;

    MERGE dbo.经费模版项目支出内容 t
    USING @tt_经费模版项目支出内容 s
    ON s.编号 = t.编号 AND t.所属经费模版项目支出类型编号 = @编号
    WHEN MATCHED THEN
        UPDATE SET
               t.所属经费模版项目支出类型编号 = @编号 ,
               t.项目支出内容 = s.项目支出内容 ,
               t.财务科目 = s.财务科目 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 所属经费模版项目支出类型编号 ,
                 项目支出内容 ,
                 财务科目 ,
                 备注
               )
        VALUES ( @编号 ,
                 s.项目支出内容 ,
                 s.财务科目 ,
                 s.备注
               )
    WHEN NOT MATCHED BY SOURCE AND t.所属经费模版项目支出类型编号 = @编号 THEN
        DELETE;

GO
/****** Object:  StoredProcedure [dbo].[sp_经费模版项目支出内容_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_经费模版项目支出内容_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    dbo.经费模版项目支出内容 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_经费模版项目支出内容_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_经费模版项目支出内容_增改]
    (
      @tt_经费模版项目支出内容 tt_经费模版项目支出内容 READONLY
    )
AS
    MERGE dbo.经费模版项目支出内容 t
    USING @tt_经费模版项目支出内容 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.所属经费模版项目支出类型编号 = s.所属经费模版项目支出类型编号 ,
               t.项目支出内容 = s.项目支出内容 ,
               t.财务科目 = s.财务科目 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 所属经费模版项目支出类型编号 ,
                 项目支出内容 ,
                 财务科目 ,
                 备注
               )
        VALUES ( s.所属经费模版项目支出类型编号 ,
                 s.项目支出内容 ,
                 s.财务科目 ,
                 s.备注
               );

GO
/****** Object:  StoredProcedure [dbo].[sp_流程_发起]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_流程_发起]
    (
      @流程模板编号 INT ,
      @项目编号 INT ,
      @发起人编号 INT
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;
--1 新建一个流程,状态为0;其中,状态>=0,项目编号相同的流程,只能有一个;触发器来保证
    INSERT  dbo.流程
            ( 流程模板编号, 项目编号, 发起人编号, 状态, 创建时间, 备注 )
    VALUES  ( @流程模板编号, @项目编号, @发起人编号, 0, GETDATE(), N'' );

--2 新建这个流程的第一个步骤,状态为0;操作人,执行时间这两个目前没得填
    INSERT  dbo.步骤
            ( 步骤模板编号 ,
              流程编号 ,
              状态 ,
              建立时间
            )
            SELECT  b.编号 ,
                    SCOPE_IDENTITY() ,
                    0 ,
                    GETDATE()
            FROM    dbo.流程模板 a
                    JOIN dbo.步骤模板 b ON a.编号 = b.流程模板编号
                                       AND a.编号 = @流程模板编号
                                       AND b.上级编号 = 0;
        
    SELECT  SCOPE_IDENTITY();
    COMMIT TRAN;

GO
/****** Object:  StoredProcedure [dbo].[sp_流程_完成步骤]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_流程_完成步骤]
    (
      @步骤编号 INT ,
      @状态 INT ,
      @操作人 INT ,
      @备注 NVARCHAR(1000)
    )
AS --当此步骤状态为0才能操作;
    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.步骤
                      WHERE     编号 = @步骤编号
                                AND 状态 = 0 )
       )
        THROW 50001,N'此步骤不存在或已完成',1;

	--不能在步骤完成这个动作里,将步骤状态设为0;
    IF ( @状态 = 0 )
        THROW 50001,N'操作状态错误',1;

    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.步骤 a
                                JOIN dbo.步骤模板 b ON a.编号 = @步骤编号
                                                   AND a.步骤模板编号 = b.编号
                                JOIN dbo.步骤类型状态 c ON b.步骤类型编号 = c.步骤类型编号
                                                     AND c.状态值 = @状态 )
       )
        THROW 50001,N'该步骤不存在指定的操作',1;

    DECLARE @步骤模板编号 INT;
    DECLARE @流程编号 INT;
    DECLARE @下一步骤编号 INT= 0;

    SELECT  @步骤模板编号 = 步骤模板编号 ,
            @流程编号 = 流程编号
    FROM    dbo.步骤
    WHERE   编号 = @步骤编号;

    SET XACT_ABORT ON;
    BEGIN TRAN;
--1 更新此步骤状态
    UPDATE  dbo.步骤
    SET     状态 = @状态 ,
            操作人编号 = @操作人 ,
            执行时间 = GETDATE() ,
            备注 = @备注
    WHERE   编号 = @步骤编号;

--如果状态为-1 则新生成一个第一步;同样操作人,时间不管
--流程状态不变
    IF ( @状态 = -1 )
        BEGIN
            INSERT  dbo.步骤
                    ( 步骤模板编号 ,
                      流程编号 ,
                      状态 ,
                      建立时间
                    )
                    SELECT  c.编号 ,
                            b.编号 ,
                            0 ,
                            GETDATE()
                    FROM    dbo.步骤 a
                            JOIN 流程 b ON a.编号 = @步骤编号
                                         AND a.流程编号 = b.编号
                            JOIN dbo.步骤模板 c ON b.流程模板编号 = c.流程模板编号
                                               AND c.上级编号 = 0;
            SET @下一步骤编号 = SCOPE_IDENTITY();
        END;
--如果状态为-2 则终止整个流程
--流程状态变为-2
    IF ( @状态 = -2 )
        UPDATE  流程
        SET     状态 = -2
        WHERE   编号 = @流程编号;

--如果状态为1 则找下一步
    IF ( @状态 = 1 )
        BEGIN
            DECLARE @下一个步骤模板编号 INT;
			--这里应该先判断准入条件,以便判断是哪个下一步.
            SELECT  @下一个步骤模板编号 = 编号
            FROM    dbo.步骤模板
            WHERE   上级编号 = @步骤模板编号;
			--如果有下一步
            IF ( @下一个步骤模板编号 IS NOT NULL )
                BEGIN
                    INSERT  dbo.步骤
                            ( 步骤模板编号, 流程编号, 状态, 建立时间 )
                    VALUES  ( @下一个步骤模板编号, @流程编号, 0, GETDATE() );
                    SET @下一步骤编号 = SCOPE_IDENTITY();
                END;
            ELSE --如果已经是最后一步
                BEGIN
                    UPDATE  流程
                    SET     状态 = 1
                    WHERE   编号 = @流程编号;
                END;

        END;
    COMMIT TRAN;

    SELECT  @下一步骤编号;  -- = 0表示没有下一步了
GO
/****** Object:  StoredProcedure [dbo].[sp_论文成果统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_论文成果统计] (@where NVARCHAR(100))
AS
DECLARE @收录情况 NVARCHAR(1000);
SET @收录情况 = '未指定,北大省级,中华医学会中华系列期刊库,科技统计源期刊库'
    DECLARE @sql NVARCHAR(2000);
--DECLARE @合计 NVARCHAR(1000) = N'未指定 + 北大省级 + 中华医学会中华系列期刊库 + 科技统计源期刊库';
    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@收录情况, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');

--DECLARE @sqlIn  NVARCHAR(1000)= N'[未指定],[北大省级],[中华医学会中华系列期刊库],[科技统计源期刊库]';
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@收录情况, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

--DECLARE @sqlSelect NVARCHAR(1000) = N'SUM(未指定) ,SUM(北大省级) ,SUM(中华医学会中华系列期刊库) ,SUM(科技统计源期刊库)';
    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',isnull(sum(' + ID + '),0)'
                                 FROM   dbo.SplitStringToTable(@收录情况, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
WITH    cte
          AS ( SELECT   a1.部门名称 ,
                        c.收录情况
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果论文 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 1
						JOIN 流程 b1 ON b1.流程模板编号 = 300 AND b.编号 = b1.项目编号 AND b1.状态 = 1
                        LEFT JOIN 期刊 c ON b.刊物编号 = c.编号 where ',@where,'
             ),
        cteSplit
          AS ( SELECT   cte.部门名称 as 部门,
                        ISNULL(Split.分解后的收录情况, ''未指定'') AS 分解后的收录情况
               FROM     cte
                        OUTER APPLY ( SELECT    ID AS 分解后的收录情况
                                      FROM      dbo.SplitStringToTable(cte.收录情况,
                                                              '','')
                                    ) AS Split
             ),
        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cteSplit PIVOT (  COUNT(分解后的收录情况) FOR 分解后的收录情况 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            isnull(SUM(合计),0)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;


GO
/****** Object:  StoredProcedure [dbo].[sp_期刊_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_期刊_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    dbo.期刊 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_期刊_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_期刊_增改] ( @tt_期刊 tt_期刊 READONLY )
AS
    MERGE dbo.期刊 t
    USING @tt_期刊 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.代码 = s.代码 ,
               t.名称 = s.名称 ,
               t.英文刊名 = s.英文刊名 ,
               t.主办单位 = s.主办单位 ,
               t.期刊系列 = s.期刊系列 ,
               t.收录情况 = s.收录情况 ,
               t.语种 = s.语种 ,
               t.JCR分区 = s.JCR分区 ,
               t.编目名称 = s.编目名称 ,
               t.编目类别 = s.编目类别 ,
               t.年度 = s.年度 ,
               t.创刊日期 = s.创刊日期 ,
               t.被引用次数 = s.被引用次数 ,
               t.影响因子 = s.影响因子 ,
               t.特征因子分值 = s.特征因子分值 ,
               t.ISSN号 = s.ISSN号 ,
               t.CN号 = s.CN号 ,
               t.出版周期 = s.出版周期 ,
               t.出版地 = s.出版地 ,
               t.开本 = s.开本 ,
               t.备注 = s.备注,
			   t.PMID = s.PMID,
			   t.DOI = s.DOI,
			   t.UT = s.UT
    WHEN NOT MATCHED THEN
        INSERT ( 代码 ,
                 名称 ,
                 英文刊名 ,
                 主办单位 ,
                 期刊系列 ,
                 收录情况 ,
                 语种 ,
                 JCR分区 ,
                 编目名称 ,
                 编目类别 ,
                 年度 ,
                 创刊日期 ,
                 被引用次数 ,
                 影响因子 ,
                 特征因子分值 ,
                 ISSN号 ,
                 CN号 ,
                 出版周期 ,
                 出版地 ,
                 开本 ,
                 备注,
				 PMID,
				 DOI,
				 UT
			   )
        VALUES ( s.代码 ,
                 s.名称 ,
                 s.英文刊名 ,
                 s.主办单位 ,
                 s.期刊系列 ,
                 s.收录情况 ,
                 s.语种 ,
                 s.JCR分区 ,
                 s.编目名称 ,
                 s.编目类别 ,
                 s.年度 ,
                 s.创刊日期 ,
                 s.被引用次数 ,
                 s.影响因子 ,
                 s.特征因子分值 ,
                 s.ISSN号 ,
                 s.CN号 ,
                 s.出版周期 ,
                 s.出版地 ,
                 s.开本 ,
                 s.备注,
				 s.PMID,
				 s.DOI,
				 s.UT
			   );



GO
/****** Object:  StoredProcedure [dbo].[sp_区域_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_区域_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    区域 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_区域_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_区域_增改]
    (
      @tt_区域 tt_区域 READONLY
    )
AS
    MERGE dbo.区域 t
    USING @tt_区域 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.上级编号 = s.上级编号 ,
               t.名称 = s.名称 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 上级编号, 名称, 级别, 排序, 备注 )
        VALUES ( s.上级编号 ,
                 s.名称 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );
GO
/****** Object:  StoredProcedure [dbo].[sp_人员_导入]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_人员_导入] ( @tt tt_人员导入 READONLY )
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
GO
/****** Object:  StoredProcedure [dbo].[sp_人员_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_人员_启禁] ( @编号 INT, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.人员 a
    WHERE   a.编号 = @编号; 


GO
/****** Object:  StoredProcedure [dbo].[sp_人员_修改密码]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_人员_修改密码]
    (
      @工号 NVARCHAR(50) ,
      @旧密码 NVARCHAR(50) ,
      @新密码 NVARCHAR(50)
    )
AS
    IF ( EXISTS ( SELECT    1
                  FROM      人员
                  WHERE     工号 = @工号
                            AND 密码 = @旧密码 ) )
        UPDATE  人员
        SET     密码 = @新密码
        WHERE   工号 = @工号;
    ELSE
        THROW 50001,N'旧密码错误',0;
        

GO
/****** Object:  StoredProcedure [dbo].[sp_人员_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_人员_增改] ( @tt tt_人员 READONLY )
AS
    DECLARE @编号 tt_编号;

    MERGE dbo.人员 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.工号 = s.工号 ,
--t.密码 = s.密码 , --密码不在这里改
               t.姓名 = s.姓名 ,
               t.部门编号 = s.部门编号 ,
               t.英文名 = s.英文名 ,
               t.性别 = s.性别 ,
               t.身份证 = s.身份证 ,
               t.出生日期 = s.出生日期 ,
               t.入职日期 = s.入职日期 ,
               t.手机 = s.手机 ,
               t.QQ = s.QQ ,
               t.邮箱 = s.邮箱 ,
               t.籍贯 = s.籍贯 ,
               t.毕业日期 = s.毕业日期 ,
               t.合同开始日期 = s.合同开始日期 ,
               t.合同结束日期 = s.合同结束日期 ,
               t.参加工作日期 = s.参加工作日期 ,
               t.专业技术获得日期 = s.专业技术获得日期 ,
               t.职务任职日期 = s.职务任职日期 ,
               t.学位 = s.学位 ,
               t.学历 = s.学历 ,
               t.政治面貌 = s.政治面貌 ,
               t.技术职称类别 = s.技术职称类别 ,
               t.技术职称 = s.技术职称 ,
               t.第二技术职称类别 = s.第二技术职称类别 ,
               t.第二技术职称 = s.第二技术职称 ,
               t.婚姻情况 = s.婚姻情况 ,
               t.学制 = s.学制 ,
               t.学历性质 = s.学历性质 ,
               t.学习形式 = s.学习形式 ,
               t.人员类别 = s.人员类别 ,
               t.个人身份 = s.个人身份 ,
               t.民族 = s.民族 ,
               t.专业技术级别 = s.专业技术级别 ,
               t.所学专业名称 = s.所学专业名称 ,
               t.岗位性质 = s.岗位性质 ,
               t.职务名称 = s.职务名称 ,
               t.职务级别 = s.职务级别 ,
               t.岗位名称 = s.岗位名称 ,
               t.岗位类型 = s.岗位类型 ,
               t.学科门类 = s.学科门类 ,
               t.一级学科 = s.一级学科 ,
               t.二级学科 = s.二级学科 ,
               t.三级学科 = s.三级学科 ,
               t.人员类型 = s.人员类型 ,
               t.获得最高学历的院校 = s.获得最高学历的院校 ,
               t.获得最高学位的院校 = s.获得最高学位的院校 ,
               t.住宅地址 = s.住宅地址 ,
               t.学术特长 = s.学术特长 ,
               t.研究方向 = s.研究方向 ,
               t.个人获得的荣誉和奖项 = s.个人获得的荣誉和奖项 ,
               t.备注 = s.备注 ,
               t.是否启用 = s.是否启用
    WHEN NOT MATCHED THEN
        INSERT ( 工号 ,
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
        VALUES ( s.工号 ,
                 s.密码 ,
                 s.姓名 ,
                 s.部门编号 ,
                 s.英文名 ,
                 s.性别 ,
                 s.身份证 ,
                 s.出生日期 ,
                 s.入职日期 ,
                 s.手机 ,
                 s.QQ ,
                 s.邮箱 ,
                 s.籍贯 ,
                 s.毕业日期 ,
                 s.合同开始日期 ,
                 s.合同结束日期 ,
                 s.参加工作日期 ,
                 s.专业技术获得日期 ,
                 s.职务任职日期 ,
                 s.学位 ,
                 s.学历 ,
                 s.政治面貌 ,
                 s.技术职称类别 ,
                 s.技术职称 ,
                 s.第二技术职称类别 ,
                 s.第二技术职称 ,
                 s.婚姻情况 ,
                 s.学制 ,
                 s.学历性质 ,
                 s.学习形式 ,
                 s.人员类别 ,
                 s.个人身份 ,
                 s.民族 ,
                 s.专业技术级别 ,
                 s.所学专业名称 ,
                 s.岗位性质 ,
                 s.职务名称 ,
                 s.职务级别 ,
                 s.岗位名称 ,
                 s.岗位类型 ,
                 s.学科门类 ,
                 s.一级学科 ,
                 s.二级学科 ,
                 s.三级学科 ,
                 s.人员类型 ,
                 s.获得最高学历的院校 ,
                 s.获得最高学位的院校 ,
                 s.住宅地址 ,
                 s.学术特长 ,
                 s.研究方向 ,
                 s.个人获得的荣誉和奖项 ,
                 s.备注 ,
                 s.是否启用
               )
    OUTPUT
        Inserted.编号
        INTO @编号;

    SELECT  *
    FROM    @编号;

GO
/****** Object:  StoredProcedure [dbo].[sp_任职_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_任职_增改] ( @tt tt_任职 READONLY )
AS
    DECLARE @编号 tt_编号; 
    MERGE dbo.任职 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[任职开始时间] = s.[任职开始时间] ,
               t.[任职截止时间] = s.[任职截止时间] ,
               t.[任职人员编号] = s.[任职人员编号] ,
               t.[任职团体名称] = s.[任职团体名称] ,
               t.[所任职务] = s.[所任职务] ,
               t.相关文件路径 = s.相关文件路径 ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.[任职开始时间] ,
                 s.[任职截止时间] ,
                 s.[任职人员编号] ,
                 s.[任职团体名称] ,
                 s.[所任职务] ,
                 s.相关文件路径 ,
                 GETDATE() ,
                 s.[备注] 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;
        SELECT  *
        FROM    @编号;
;

GO
/****** Object:  StoredProcedure [dbo].[sp_通知公告_接收]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_通知公告_接收] ( @通知公告编号 INT, @接收人编号 INT )
AS


	IF(EXISTS(SELECT 1 FROM dbo.通知公告已接收人 WHERE 通知公告编号 = @通知公告编号 AND 接收人编号 = @接收人编号))
		RETURN;

    SET XACT_ABORT ON;

    BEGIN TRAN;


    INSERT  dbo.通知公告已接收人
            ( 通知公告编号, 接收人编号 )
    VALUES  ( @通知公告编号, -- 通知公告编号 - int
              @接收人编号  -- 接收人编号 - int
              );

    UPDATE  通知公告
    SET     已接收人数 = 已接收人数+ 1
    WHERE   编号 = @通知公告编号;

	--IF(EXISTS(SELECT 1 FROM 通知公告 WHERE 编号 = @通知公告编号 AND 接收人数 < 已接收人数))
	--THROW 50001,N'人员变动会导致应接收人数少于已接收人数',1

    COMMIT TRAN;
GO
/****** Object:  StoredProcedure [dbo].[sp_通知公告_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_通知公告_启禁] ( @编号 INT, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.通知公告 a
    WHERE   a.编号 = @编号; 
GO
/****** Object:  StoredProcedure [dbo].[sp_通知公告_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_通知公告_增改]
    (
      @tt tt_通知公告 READONLY ,
      @tt_通知公告接收条件 tt_通知公告接收条件 READONLY
    )
AS
    DECLARE @编号 tt_编号; 

    SET XACT_ABORT ON;

    BEGIN TRAN;

    MERGE dbo.通知公告 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[通知类型] = s.[通知类型] ,
               t.[通知标识] = s.[通知标识] ,
				--t.发送人编号 = s.发送人编号,
               t.[通知名称] = s.[通知名称] ,
               t.[关闭时间] = s.[关闭时间] ,
               t.[相关文件路径] = s.[相关文件路径] ,
               t.[通知内容] = s.[通知内容] ,
               --t.[接收人数] = s.[接收人数] ,
               --t.[已接收人数] = s.[已接收人数] ,
               --t.[是否启用] = s.[是否启用] ,
               t.[备注] = s.[备注],
			   t.是否必读 = s.是否必读
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.通知类型 ,
                 s.通知标识 ,
                 s.发送人编号 ,
                 s.通知名称 ,
                 s.关闭时间 ,
                 s.相关文件路径 ,
                 s.通知内容 ,
                 dbo.fn_满足通知公告接收条件人数(@tt_通知公告接收条件) ,
                 0 ,
                 1 ,
                 GETDATE() ,
                 s.备注 ,
				 s.是否必读
               )
    OUTPUT
        Inserted.编号
        INTO @编号;

    DECLARE @通知公告编号 INT;
    SELECT  @通知公告编号 = 编号
    FROM    @编号;

    MERGE dbo.通知公告接收条件 AS t
    USING @tt_通知公告接收条件 AS s
    ON t.通知公告编号 = @通知公告编号
        AND t.接收者类型 = s.接收者类型
        AND t.接收者编号 = s.接收者编号
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @通知公告编号 ,
                 s.接收者类型 ,
                 s.接收者编号
               )
    WHEN NOT MATCHED BY SOURCE AND t.通知公告编号 = @通知公告编号 THEN
        DELETE;
    
    COMMIT TRAN;

    SELECT  *
    FROM    @编号;

GO
/****** Object:  StoredProcedure [dbo].[sp_下载中心_启禁]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROC [dbo].[sp_下载中心_启禁] ( @编号 INT, @是否启用 BIT )
AS
    UPDATE  a
    SET     a.是否启用 = @是否启用
    FROM    dbo.下载中心 a
    WHERE   a.编号 = @编号; 
GO
/****** Object:  StoredProcedure [dbo].[sp_下载中心_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_下载中心_增改](@tt tt_下载中心 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.下载中心 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[文件名称]  = s.[文件名称] ,
			t.[文件类型]  = s.[文件类型] ,
			t.[文件路径]  = s.[文件路径] ,
			t.[是否启用]  = s.[是否启用] ,
			t.[上传人编号]  = s.[上传人编号] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT Values( 
			s.文件名称 ,
			s.文件类型 ,
			s.文件路径 ,
			s.是否启用 ,
			s.上传人编号 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_项目分类_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_项目分类_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    项目分类 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_项目分类_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_项目分类_增改]
    (
      @tt_项目分类 tt_项目分类 READONLY
    )
AS
    MERGE dbo.项目分类 t
    USING @tt_项目分类 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.上级编号 = s.上级编号 ,
               t.名称 = s.名称 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 上级编号, 名称, 级别, 排序, 备注 )
        VALUES ( s.上级编号 ,
                 s.名称 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );
GO
/****** Object:  StoredProcedure [dbo].[sp_项目经费到账_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_项目经费到账_增改](@tt tt_项目经费到账 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.项目经费到账 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[流程模板编号]  = s.[流程模板编号] ,
			t.[项目编号]  = s.[项目编号] ,
			t.[拨款单位]  = s.[拨款单位] ,
			t.[到账日期]  = s.[到账日期] ,
			t.[到账金额]  = s.[到账金额] ,
			t.[技术交易额]  = s.[技术交易额] ,
			t.[管理费用]  = s.[管理费用] ,
			t.[技术合同认定服务费]  = s.[技术合同认定服务费] ,
			t.[增值税]  = s.[增值税] ,
			t.[到账单位]  = s.[到账单位] ,
			t.[经办人编号]  = s.[经办人编号] ,
			t.[到账凭证路径]  = s.[到账凭证路径] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT Values( 
			s.流程模板编号 ,
			s.项目编号 ,
			s.拨款单位 ,
			s.到账日期 ,
			s.到账金额 ,
			s.技术交易额 ,
			s.管理费用 ,
			s.技术合同认定服务费 ,
			s.增值税 ,
			s.到账单位 ,
			s.经办人编号 ,
			s.到账凭证路径 ,
			getdate() ,
			s.备注 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_学科_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_学科_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    学科 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 


GO
/****** Object:  StoredProcedure [dbo].[sp_学科_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_学科_增改]
    (
      @tt_学科 tt_学科 READONLY
    )
AS
    MERGE dbo.学科 t
    USING @tt_学科 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.上级编号 = s.上级编号 ,
               t.名称 = s.名称 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 上级编号, 名称, 级别, 排序, 备注 )
        VALUES ( s.上级编号 ,
                 s.名称 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );
GO
/****** Object:  StoredProcedure [dbo].[sp_主办讲座_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	Create PROC [dbo].[sp_主办讲座_删] ( @tt_编号 tt_编号 READONLY )
	AS
    DELETE  a
    FROM    主办讲座 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
	
GO
/****** Object:  StoredProcedure [dbo].[sp_主办讲座_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_主办讲座_增改]
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
/****** Object:  StoredProcedure [dbo].[sp_著作成果统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    
	
CREATE PROC [dbo].[sp_著作成果统计] (@where NVARCHAR(100))
AS
    DECLARE @著作类型 NVARCHAR(1000);

    SELECT  @著作类型 = STUFF(( SELECT  ',' + 值
                            FROM    字典
                            WHERE   分类 = '著作类型'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');
						  --SELECT @著作类型;
    DECLARE @sql NVARCHAR(2000);

    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@著作类型, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
		
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@著作类型, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',isnull(sum(' + ID + ') ,0)'
                                 FROM   dbo.SplitStringToTable(@著作类型, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 as 部门,
                        b.著作类型
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果著作 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 2
						JOIN 流程 b1 ON b1.流程模板编号 = 301 AND b.编号 = b1.项目编号 AND b1.状态 = 1 where ',@where,'
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cte PIVOT ( COUNT(著作类型) FOR 著作类型 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            isnull(SUM(合计),0)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;

GO
/****** Object:  StoredProcedure [dbo].[sp_专家评分_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_专家评分_增改]
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
GO
/****** Object:  StoredProcedure [dbo].[sp_专利成果统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    

	
CREATE PROC [dbo].[sp_专利成果统计](@where NVARCHAR(100))
AS
    DECLARE @专利类型 NVARCHAR(1000);

    SELECT  @专利类型 = STUFF(( SELECT  ',' + 值
                            FROM    字典
                            WHERE   分类 = '专利类型'
                          FOR
                            XML PATH('')
                          ), 1, 1, '');
						  --SELECT @专利类型;
    DECLARE @sql NVARCHAR(2000);

    DECLARE @合计 NVARCHAR(1000);
    SELECT  @合计 = STUFF(( SELECT    '+' + ID
                          FROM      dbo.SplitStringToTable(@专利类型, ',')
                        FOR
                          XML PATH('')
                        ), 1, 1, '');
		
    DECLARE @sqlIn NVARCHAR(1000);
    SELECT  @sqlIn = STUFF(( SELECT ',[' + ID + ']'
                             FROM   dbo.SplitStringToTable(@专利类型, ',')
                           FOR
                             XML PATH('')
                           ), 1, 1, '');

    DECLARE @sqlSelect NVARCHAR(1000);
    SELECT  @sqlSelect = STUFF(( SELECT ',isnull(sum(' + ID + '),0)'
                                 FROM   dbo.SplitStringToTable(@专利类型, ',')
                               FOR
                                 XML PATH('')
                               ), 1, 1, '');

    SET @sql = CONCAT(N'
	WITH    cte
          AS ( SELECT   a1.部门名称 as 部门,
                        b.专利类型
               FROM     dbo.成果作者 a
                        JOIN dbo.v1_人员_带部门名 a1 ON a.作者编号 = a1.编号
                        JOIN 成果专利 b ON a.成果编号 = b.编号
                                       AND 成果类型 = 3
						JOIN 流程 b1 ON b1.流程模板编号 = 302 AND b.编号 = b1.项目编号 AND b1.状态 = 1 where ',@where,'
                        
             ),

        ctePivot
          AS ( SELECT   * ,
                        ', @合计, ' AS 合计
               FROM     cte PIVOT ( COUNT(专利类型) FOR 专利类型 IN ( ',
                      @sqlIn, ' ) )  AS t
             )
    SELECT  *
    FROM    ctePivot
    UNION ALL
    SELECT  ''总计'' ,
            ', @sqlSelect, ' ,
            isnull(SUM(合计),0)
    FROM    ctePivot');

	--SELECT @sql

    EXEC sys.sp_executesql @sql;


GO
/****** Object:  StoredProcedure [dbo].[sp_字典_删]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_字典_删] ( @tt_编号 tt_编号 READONLY )
AS
    DELETE  a
    FROM    字典 a
    WHERE   a.编号 IN ( SELECT    b.编号
                      FROM      @tt_编号 b ); 
GO
/****** Object:  StoredProcedure [dbo].[sp_字典_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_字典_增改] ( @tt_字典 tt_字典 READONLY )
AS
    MERGE 字典 t
    USING @tt_字典 s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.分类 = s.分类 ,
               t.值 = s.值 ,
               t.上级编号 = s.上级编号 ,
               t.级别 = s.级别 ,
               t.排序 = s.排序 ,
               t.备注 = s.备注
    WHEN NOT MATCHED THEN
        INSERT ( 分类, 值, 上级编号, 级别, 排序, 备注 )
        VALUES ( s.分类 ,
                 s.值 ,
                 s.上级编号 ,
                 s.级别 ,
                 s.排序 ,
                 s.备注
               );

GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目变更_应用变更]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_纵向项目变更_应用变更] ( @纵向项目变更编号 INT )
AS
    DECLARE @旧的纵向项目立项 tt_纵向项目立项;

    SET XACT_ABORT ON;
    
    BEGIN TRAN;
	--暂存就的立项信息
    INSERT  @旧的纵向项目立项
            ( 编号 ,
              分类 ,
              项目登记情况 ,
              项目编号 ,
              项目中文名称 ,
              项目英文名称 ,
              项目分类 ,
              成果归属部门 ,
              负责人编号 ,
              立项年度 ,
              登记日期 ,
              登记人编号 ,
              批准日期 ,
              批准经费 ,
              配套经费 ,
              经费卡号 ,
              项目等级 ,
              计划开始日期 ,
              计划完成日期 ,
              学科门类 ,
              学科类型 ,
              研究类型 ,
              项目类型 ,
              项目级别 ,
              项目来源单位 ,
              项目类别 ,
              档案编号 ,
              财务简称 ,
              亚类说明 ,
              附注说明 ,
              纵向项目合同类型 ,
			  国民经济行业,
			  合作形式,
              社会经济目标 ,
              是否需要伦理评审 ,
              是否需要伦理批文 ,
              伦理批文编号 ,
              伦理批文时间 ,
              伦理批文路径 ,
              立项文件路径 ,
              备注 ,
              建立时间
            )
            SELECT  a.编号 ,
                    a.分类 ,
                    a.项目登记情况 ,
                    a.项目编号 ,
                    a.项目中文名称 ,
                    a.项目英文名称 ,
                    a.项目分类 ,
                    a.成果归属部门 ,
                    a.负责人编号 ,
                    a.立项年度 ,
                    a.登记日期 ,
                    a.登记人编号 ,
                    a.批准日期 ,
                    a.批准经费 ,
                    a.配套经费 ,
                    a.经费卡号 ,
                    a.项目等级 ,
                    a.计划开始日期 ,
                    a.计划完成日期 ,
                    a.学科门类 ,
                    a.学科类型 ,
                    a.研究类型 ,
                    a.项目类型 ,
                    a.项目级别 ,
                    a.项目来源单位 ,
                    a.项目类别 ,
                    a.档案编号 ,
                    a.财务简称 ,
                    a.亚类说明 ,
                    a.附注说明 ,
                    a.纵向项目合同类型 ,
					a.国民经济行业,
					a.合作形式,
                    a.社会经济目标 ,
                    a.是否需要伦理评审 ,
                    a.是否需要伦理批文 ,
                    a.伦理批文编号 ,
                    a.伦理批文时间 ,
                    a.伦理批文路径 ,
                    a.立项文件路径 ,
                    a.备注 ,
                    a.建立时间
            FROM    dbo.纵向项目立项 a
                    JOIN dbo.纵向项目变更 b ON a.编号 = b.纵向项目编号
                                         AND b.编号 = @纵向项目变更编号;
	-- 更新变更目标;
    UPDATE  a
    SET     a.分类 = b.分类 ,
            a.项目登记情况 = b.项目登记情况 ,
            a.项目编号 = b.项目编号 ,
            a.项目中文名称 = b.项目中文名称 ,
            a.项目英文名称 = b.项目英文名称 ,
            a.项目分类 = b.项目分类 ,
            a.成果归属部门 = b.成果归属部门 ,
            a.负责人编号 = b.负责人编号 ,
            a.立项年度 = b.立项年度 ,
            a.登记日期 = b.登记日期 ,
            a.登记人编号 = b.登记人编号 ,
            a.批准日期 = b.批准日期 ,
            a.批准经费 = b.批准经费 ,
            a.配套经费 = b.配套经费 ,
            a.经费卡号 = b.经费卡号 ,
            a.项目等级 = b.项目等级 ,
            a.计划开始日期 = b.计划开始日期 ,
            a.计划完成日期 = b.计划完成日期 ,
            a.学科门类 = b.学科门类 ,
            a.学科类型 = b.学科类型 ,
            a.研究类型 = b.研究类型 ,
            a.项目类型 = b.项目类型 ,
            a.项目级别 = b.项目级别 ,
            a.项目来源单位 = b.项目来源单位 ,
            a.项目类别 = b.项目类别 ,
            a.档案编号 = b.档案编号 ,
            a.财务简称 = b.财务简称 ,
            a.亚类说明 = b.亚类说明 ,
            a.附注说明 = b.附注说明 ,
            a.纵向项目合同类型 = b.纵向项目合同类型 ,
			a.国民经济行业=b.国民经济行业,
			a.合作形式=b.合作形式,
            a.社会经济目标 = b.社会经济目标 ,
            a.是否需要伦理评审 = b.是否需要伦理评审 ,
            a.是否需要伦理批文 = b.是否需要伦理批文 ,
            a.伦理批文编号 = b.伦理批文编号 ,
            a.伦理批文时间 = b.伦理批文时间 ,
            a.伦理批文路径 = b.伦理批文路径 ,
            a.立项文件路径 = b.立项文件路径 ,
            a.备注 = b.备注 ,
            a.建立时间 = b.建立时间
    FROM    dbo.纵向项目立项 a
            JOIN dbo.纵向项目变更 b ON a.编号 = b.纵向项目编号
                                 AND b.编号 = @纵向项目变更编号;

	-- 保存旧的记录;
    UPDATE  b
    SET     b.分类 = a.分类 ,
            b.项目登记情况 = a.项目登记情况 ,
            b.项目编号 = a.项目编号 ,
            b.项目中文名称 = a.项目中文名称 ,
            b.项目英文名称 = a.项目英文名称 ,
            b.项目分类 = a.项目分类 ,
            b.成果归属部门 = a.成果归属部门 ,
            b.负责人编号 = a.负责人编号 ,
            b.立项年度 = a.立项年度 ,
            b.登记日期 = a.登记日期 ,
            b.登记人编号 = a.登记人编号 ,
            b.批准日期 = a.批准日期 ,
            b.批准经费 = a.批准经费 ,
            b.配套经费 = a.配套经费 ,
            b.经费卡号 = a.经费卡号 ,
            b.项目等级 = a.项目等级 ,
            b.计划开始日期 = a.计划开始日期 ,
            b.计划完成日期 = a.计划完成日期 ,
            b.学科门类 = a.学科门类 ,
            b.学科类型 = a.学科类型 ,
            b.研究类型 = a.研究类型 ,
            b.项目类型 = a.项目类型 ,
            b.项目级别 = a.项目级别 ,
            b.项目来源单位 = a.项目来源单位 ,
            b.项目类别 = a.项目类别 ,
            b.档案编号 = a.档案编号 ,
            b.财务简称 = a.财务简称 ,
            b.亚类说明 = a.亚类说明 ,
            b.附注说明 = a.附注说明 ,
            b.纵向项目合同类型 = a.纵向项目合同类型 ,
			b.国民经济行业=a.国民经济行业,
			b.合作形式=a.合作形式,
            b.社会经济目标 = a.社会经济目标 ,
            b.是否需要伦理评审 = a.是否需要伦理评审 ,
            b.是否需要伦理批文 = a.是否需要伦理批文 ,
            b.伦理批文编号 = a.伦理批文编号 ,
            b.伦理批文时间 = a.伦理批文时间 ,
            b.伦理批文路径 = a.伦理批文路径 ,
            b.立项文件路径 = a.立项文件路径 ,
            b.备注 = a.备注 ,
            b.建立时间 = a.建立时间
    FROM    @旧的纵向项目立项 a
            JOIN dbo.纵向项目变更 b ON a.编号 = b.纵向项目编号
                                 AND b.编号 = @纵向项目变更编号;

    COMMIT TRAN;


GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目变更_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[sp_纵向项目变更_增改](@tt tt_纵向项目变更 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.纵向项目变更 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[变更内容简介]  = s.[变更内容简介] ,
			t.[变更事由]  = s.[变更事由] ,
			t.[变更备注]  = s.[变更备注] ,
			t.[变更时间]  = GETDATE() ,
			t.[纵向项目编号]  = s.[纵向项目编号] ,
			t.[分类]  = s.[分类] ,
			t.[项目登记情况]  = s.[项目登记情况] ,
			t.[项目编号]  = s.[项目编号] ,
			t.[项目中文名称]  = s.[项目中文名称] ,
			t.[项目英文名称]  = s.[项目英文名称] ,
			t.[项目分类]  = s.[项目分类] ,
			t.[成果归属部门]  = s.[成果归属部门] ,
			t.[负责人编号]  = s.[负责人编号] ,
			t.[立项年度]  = s.[立项年度] ,
			t.[登记日期]  = s.[登记日期] ,
			t.[登记人编号]  = s.[登记人编号] ,
			t.[批准日期]  = s.[批准日期] ,
			t.[批准经费]  = s.[批准经费] ,
			t.[配套经费]  = s.[配套经费] ,
			t.[经费卡号]  = s.[经费卡号] ,
			t.[项目等级]  = s.[项目等级] ,
			t.[计划开始日期]  = s.[计划开始日期] ,
			t.[计划完成日期]  = s.[计划完成日期] ,
			t.[学科门类]  = s.[学科门类] ,
			t.[学科类型]  = s.[学科类型] ,
			t.[研究类型]  = s.[研究类型] ,
			t.[项目类型]  = s.[项目类型] ,
			t.[项目级别]  = s.[项目级别] ,
			t.[项目来源单位]  = s.[项目来源单位] ,
			t.[项目类别]  = s.[项目类别] ,
			t.[档案编号]  = s.[档案编号] ,
			t.[财务简称]  = s.[财务简称] ,
			t.[亚类说明]  = s.[亚类说明] ,
			t.[附注说明]  = s.[附注说明] ,
			t.[纵向项目合同类型]  = s.[纵向项目合同类型] ,
			t.国民经济行业 =s.国民经济行业,
			   t.合作形式 = s.合作形式,
			t.[社会经济目标]  = s.[社会经济目标] ,
			t.[是否需要伦理评审]  = s.[是否需要伦理评审] ,
			t.[是否需要伦理批文]  = s.[是否需要伦理批文] ,
			t.[伦理批文编号]  = s.[伦理批文编号] ,
			t.[伦理批文时间]  = s.[伦理批文时间] ,
			t.[伦理批文路径]  = s.[伦理批文路径] ,
			t.[立项文件路径]  = s.[立项文件路径] ,
			t.建立时间 = s.建立时间,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT VALUES( 
			s.变更内容简介 ,
			s.变更事由 ,
			s.变更备注 ,
			GETDATE(),
			s.纵向项目编号 ,
			s.分类 ,
			s.项目登记情况 ,
			s.项目编号 ,
			s.项目中文名称 ,
			s.项目英文名称 ,
			s.项目分类 ,
			s.成果归属部门 ,
			s.负责人编号 ,
			s.立项年度 ,
			s.登记日期 ,
			s.登记人编号 ,
			s.批准日期 ,
			s.批准经费 ,
			s.配套经费 ,
			s.经费卡号 ,
			s.项目等级 ,
			s.计划开始日期 ,
			s.计划完成日期 ,
			s.学科门类 ,
			s.学科类型 ,
			s.研究类型 ,
			s.项目类型 ,
			s.项目级别 ,
			s.项目来源单位 ,
			s.项目类别 ,
			s.档案编号 ,
			s.财务简称 ,
			s.亚类说明 ,
			s.附注说明 ,
			s.纵向项目合同类型 ,
			 s.国民经济行业,
				 s.合作形式,
			s.社会经济目标 ,
			s.是否需要伦理评审 ,
			s.是否需要伦理批文 ,
			s.伦理批文编号 ,
			s.伦理批文时间 ,
			s.伦理批文路径 ,
			s.立项文件路径 ,
			s.备注 ,
			s.建立时间 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;


GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目结题_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_纵向项目结题_增改]
    (
      @tt tt_纵向项目结题 READONLY ,
      @tt_项目参与人 tt_项目参与人 READONLY 
    )
AS
    DECLARE @流程模板编号 INT = 440; --纵向项目结题为440
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 

    MERGE dbo.纵向项目结题 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[纵向项目编号] = s.[纵向项目编号] ,
               t.[结题验收编号] = s.[结题验收编号] ,
               t.[结题验收时间] = s.[结题验收时间] ,
               t.[结题验收是否合格] = s.[结题验收是否合格] ,
               t.[结题验收参与人数] = s.[结题验收参与人数] ,
               t.[结题资料路径] = s.[结题资料路径] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.纵向项目编号 ,
                 s.结题验收编号 ,
                 s.结题验收时间 ,
                 s.结题验收是否合格 ,
                 s.结题验收参与人数 ,
                 s.结题资料路径 ,
                 s.备注 ,
                 GETDATE()
               )
    OUTPUT
        Inserted.编号
        INTO @编号;

    DECLARE @结题编号 INT;
    SELECT  @结题编号 = 编号
    FROM    @编号;

	--项目参与人
    MERGE dbo.项目参与人 t
    USING @tt_项目参与人 s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @结题编号
        AND s.参与人编号 = t.参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[工作量占比] = s.[工作量占比] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @结题编号 ,
                 s.参与人编号 ,
                 s.工作量占比 ,
                 s.备注 ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @结题编号 THEN
        DELETE;

		
    COMMIT TRAN;

    SELECT  *
    FROM    @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目立项_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[sp_纵向项目立项_增改]
    (
      @流程模板编号 INT = 410 , --纵向项目立项为410,
      @tt tt_纵向项目立项 READONLY ,
      @tt_项目参与人 tt_项目参与人 READONLY ,
      @tt_项目经费预算 tt_项目经费预算 READONLY ,
      @tt_项目计划 tt_项目计划 READONLY ,
      @tt_项目预期成果 tt_项目预期成果 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 

    MERGE dbo.纵向项目立项 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[分类] = s.[分类] ,
               t.[项目登记情况] = s.[项目登记情况] ,
               t.[项目编号] = s.[项目编号] ,
               t.[项目中文名称] = s.[项目中文名称] ,
               t.[项目英文名称] = s.[项目英文名称] ,
               t.[项目分类] = s.[项目分类] ,
               t.[成果归属部门] = s.[成果归属部门] ,
               t.[负责人编号] = s.[负责人编号] ,
               t.[立项年度] = s.[立项年度] ,
               t.[登记日期] = s.[登记日期] ,
               t.[登记人编号] = s.[登记人编号] ,
               t.[批准日期] = s.[批准日期] ,
               t.[批准经费] = s.[批准经费] ,
               t.[配套经费] = s.[配套经费] ,
               t.[经费卡号] = s.[经费卡号] ,
               t.[项目等级] = s.[项目等级] ,
               t.[计划开始日期] = s.[计划开始日期] ,
               t.[计划完成日期] = s.[计划完成日期] ,
               t.[学科门类] = s.[学科门类] ,
               t.[学科类型] = s.[学科类型] ,
               t.[研究类型] = s.[研究类型] ,
               t.[项目类型] = s.[项目类型] ,
               t.[项目级别] = s.[项目级别] ,
               t.[项目来源单位] = s.[项目来源单位] ,
               t.[项目类别] = s.[项目类别] ,
               t.[档案编号] = s.[档案编号] ,
               t.[财务简称] = s.[财务简称] ,
               t.[亚类说明] = s.[亚类说明] ,
               t.[附注说明] = s.[附注说明] ,
               t.[纵向项目合同类型] = s.[纵向项目合同类型] ,
			   t.国民经济行业 =s.国民经济行业,
			   t.合作形式 = s.合作形式,
               t.[社会经济目标] = s.[社会经济目标] ,
               t.[是否需要伦理评审] = s.[是否需要伦理评审] ,
               t.[是否需要伦理批文] = s.[是否需要伦理批文] ,
               t.[伦理批文编号] = s.[伦理批文编号] ,
               t.[伦理批文时间] = s.[伦理批文时间] ,
               t.[伦理批文路径] = s.[伦理批文路径] ,
               t.[立项文件路径] = s.[立项文件路径] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.分类 ,
                 s.项目登记情况 ,
                 s.项目编号 ,
                 s.项目中文名称 ,
                 s.项目英文名称 ,
                 s.项目分类 ,
                 s.成果归属部门 ,
                 s.负责人编号 ,
                 s.立项年度 ,
                 s.登记日期 ,
                 s.登记人编号 ,
                 s.批准日期 ,
                 s.批准经费 ,
                 s.配套经费 ,
                 s.经费卡号 ,
                 s.项目等级 ,
                 s.计划开始日期 ,
                 s.计划完成日期 ,
                 s.学科门类 ,
                 s.学科类型 ,
                 s.研究类型 ,
                 s.项目类型 ,
                 s.项目级别 ,
                 s.项目来源单位 ,
                 s.项目类别 ,
                 s.档案编号 ,
                 s.财务简称 ,
                 s.亚类说明 ,
                 s.附注说明 ,
                 s.纵向项目合同类型 ,
				 s.国民经济行业,
				 s.合作形式,
                 s.社会经济目标 ,
                 s.是否需要伦理评审 ,
                 s.是否需要伦理批文 ,
                 s.伦理批文编号 ,
                 s.伦理批文时间 ,
                 s.伦理批文路径 ,
                 s.立项文件路径 ,
                 s.备注 ,
                 GETDATE()
               )
    OUTPUT
        Inserted.编号
        INTO @编号;


    DECLARE @项目编号 INT;
    SELECT  @项目编号 = 编号
    FROM    @编号;

	--项目参与人
    MERGE dbo.项目参与人 t
    USING @tt_项目参与人 s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号
        AND s.参与人编号 = t.参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[工作量占比] = s.[工作量占比] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @项目编号 ,
                 s.参与人编号 ,
                 s.工作量占比 ,
                 s.备注 ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号 THEN
        DELETE;

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
               t.配套经费 = s.配套经费,
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
    
	--项目计划
    DELETE  项目计划
    WHERE   流程模板编号 = @流程模板编号
            AND 项目编号 = @项目编号;
    INSERT  dbo.项目计划
            ( 流程模板编号 ,
              项目编号 ,
              开始日期 ,
              结束日期 ,
              计划内容
            )
            SELECT  @流程模板编号 ,
                    @项目编号 ,
                    开始日期 ,
                    结束日期 ,
                    计划内容
            FROM    @tt_项目计划;

	--项目预期成果;
    DELETE  dbo.项目预期成果
    WHERE   流程模板编号 = @流程模板编号
            AND 项目编号 = @项目编号;
    INSERT  dbo.项目预期成果
            ( 流程模板编号 ,
              项目编号 ,
              预期成果
            )
            SELECT  @流程模板编号 ,
                    @项目编号 ,
                    预期成果
            FROM    @tt_项目预期成果;

    COMMIT TRAN;

;
    SELECT  *
    FROM    @编号;



GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目申报_设为已立项]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_纵向项目申报_设为已立项] ( @项目申报编号 INT )
AS
    UPDATE  dbo.纵向项目申报
    SET     是否立项 = 1
    WHERE   编号 = @项目申报编号;
GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目申报_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_纵向项目申报_增改]
    (
      @流程模板编号 INT = 400 , --纵向项目申报为400
      @tt tt_纵向项目申报 READONLY ,
      @tt_项目参与人 tt_项目参与人 READONLY
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;

    DECLARE @编号 tt_编号; 
    MERGE dbo.纵向项目申报 t
    USING @tt s
    ON s.编号 = t.编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[分类] = s.[分类] ,
               t.[项目名称] = s.[项目名称] ,
               t.[申报人编号] = s.[申报人编号] ,
               t.[学科门类] = s.[学科门类] ,
               t.[学科类型] = s.[学科类型] ,
               t.[申报年度] = s.[申报年度] ,
               t.[项目类型] = s.[项目类型] ,
               t.[项目级别] = s.[项目级别] ,
               t.[项目来源单位] = s.[项目来源单位] ,
               t.[项目类别] = s.[项目类别] ,
               t.[申报时间] = s.[申报时间] ,
               t.[申请经费] = s.[申请经费] ,
               t.[计划开始日期] = s.[计划开始日期] ,
               t.[计划完成日期] = s.[计划完成日期] ,
               t.[项目等级] = s.[项目等级] ,
               t.[是否委托外单位进行实验或实验分析] = s.[是否委托外单位进行实验或实验分析] ,
               t.[实验委托检测内容] = s.[实验委托检测内容] ,
               t.[项目摘要] = s.[项目摘要] ,
               t.[是否需要伦理评审] = s.[是否需要伦理评审] ,
               t.[是否需要伦理批文] = s.[是否需要伦理批文] ,
               t.[伦理批文编号] = s.[伦理批文编号] ,
               t.[伦理批文路径] = s.[伦理批文路径] ,
               t.[项目申报书路径] = s.[项目申报书路径] ,
               t.[备注] = s.[备注] ,
               t.[是否立项] = s.[是否立项]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( s.分类 ,
                 s.项目名称 ,
                 s.申报人编号 ,
                 s.学科门类 ,
                 s.学科类型 ,
                 s.申报年度 ,
                 s.项目类型 ,
                 s.项目级别 ,
                 s.项目来源单位 ,
                 s.项目类别 ,
                 s.申报时间 ,
                 s.申请经费 ,
                 s.计划开始日期 ,
                 s.计划完成日期 ,
                 s.项目等级 ,
                 s.是否委托外单位进行实验或实验分析 ,
                 s.实验委托检测内容 ,
                 s.项目摘要 ,
                 s.是否需要伦理评审 ,
                 s.是否需要伦理批文 ,
                 s.伦理批文编号 ,
                 s.伦理批文路径 ,
                 s.项目申报书路径 ,
                 s.备注 ,
                 GETDATE() ,
                 s.是否立项 
               )
    OUTPUT
        Inserted.编号
        INTO @编号;


    --DECLARE @流程模板编号 INT = 400; --纵向项目申报为400
    DECLARE @项目编号 INT;
    SELECT  @项目编号 = 编号
    FROM    @编号;

    MERGE dbo.项目参与人 t
    USING @tt_项目参与人 s
    ON t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号
        AND s.参与人编号 = t.参与人编号
    WHEN MATCHED THEN
        UPDATE SET
               t.[工作量占比] = s.[工作量占比] ,
               t.[备注] = s.[备注]
    WHEN NOT MATCHED THEN
        INSERT
        VALUES ( @流程模板编号 ,
                 @项目编号 ,
                 s.参与人编号 ,
                 s.工作量占比 ,
                 s.备注 ,
                 GETDATE()
               )
    WHEN NOT MATCHED BY SOURCE AND t.流程模板编号 = @流程模板编号
        AND t.项目编号 = @项目编号 THEN
        DELETE;

    COMMIT TRAN;

	--返回一下论文编号
    SELECT  *
    FROM    @编号;

GO
/****** Object:  StoredProcedure [dbo].[sp_纵向项目中检_增改]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_纵向项目中检_增改](@tt tt_纵向项目中检 READONLY) 
	AS  DECLARE @编号 tt_编号; 
MERGE dbo.纵向项目中检 t
		USING @tt s
		ON s.编号 = t.编号
		WHEN MATCHED THEN
			UPDATE SET
			t.[纵向项目编号]  = s.[纵向项目编号] ,
			t.[中检资料路径]  = s.[中检资料路径] ,
			t.[备注]  = s.[备注] 
 WHEN NOT MATCHED THEN INSERT Values( 
			s.纵向项目编号 ,
			s.中检资料路径 ,
			s.备注 ,
			getdate() 
)  OUTPUT Inserted.编号 INTO @编号; SELECT * FROM @编号;
;
GO
/****** Object:  StoredProcedure [dbo].[SPFlowInit]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPFlowInit]
    (
      @FlowTemplateId INT ,
      @SourceId INT ,
      @CreatorType NVARCHAR(50) ,
      @CreatorId INT
    )
AS
    SET XACT_ABORT ON;

    BEGIN TRAN;
--1 新建一个流程,状态为0;其中,状态>=0,项目编号相同的流程,只能有一个;触发器来保证
    INSERT  dbo.Flow
            ( FlowTemplateId ,
              SourceId ,
              CreatorType ,
              CreatorId 
	        )
    VALUES  ( @FlowTemplateId ,
              @SourceId ,
              @CreatorType ,
              @CreatorId 
	        );

--2 新建这个流程的第一个步骤,状态为0;操作人类型,操作人,执行时间这3个目前没得填
    INSERT  dbo.Step
            ( StepTemplateId ,
              FlowId 
            )
            SELECT  b.Id ,
                    SCOPE_IDENTITY()
            FROM    dbo.FlowTemplate a
                    JOIN dbo.StepTemplate b ON a.Id = b.FlowTemplateId
                                               AND a.Id = @FlowTemplateId
                                               AND a.Id = b.Id;
        
    SELECT  SCOPE_IDENTITY();
    COMMIT TRAN;


GO
/****** Object:  StoredProcedure [dbo].[SPGetNextStepTemplateId]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPGetNextStepTemplateId]
    (
      @stepId INT ,
      @state INT ,
      @result INT OUTPUT
    )
--根据步骤id和操作state,找到下一步步骤模板id;没找到返回0;
--如果condition里面没有满足条件的,那么就视为结束;
AS --SPGetNextTemplateId 2,1
	
    IF ( @state = 0
         OR @state < -1
       )
        THROW 50001,N'按规则约定,状态0以及走向-1以下没有下一步',1;

    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.Step
                      WHERE     Id = @stepId )
       )
        THROW 50001,N'没有找到对应步骤,也不会找到下一步步骤模板',1;

    --DECLARE @result INT; 
    SET @result = NULL;
    IF ( EXISTS ( SELECT    1
                  FROM      Step a
                            JOIN dbo.StepTemplateState b ON a.StepTemplateId = b.StepTemplateId
                                                            AND a.Id = @stepId
                                                            AND b.State = @state
                            JOIN dbo.StepTemplateStateChoice c ON b.Id = c.StepTemplateStateId ) )
		--如果存在下一步;
		--state=0,state<-1的已经在最开始刷掉了
		--没有stepid也应该刷掉;
		--所以,按规则,没有下一步的,就是结束步骤了;
        BEGIN

            DECLARE @sourecTableName NVARCHAR(50);
            DECLARE @sourceId INT;
			--暂存源表数据,表名+记录Id
            SELECT  @sourecTableName = c.TableName ,
                    @sourceId = b.SourceId
            FROM    dbo.Step a
                    JOIN dbo.Flow b ON a.FlowId = b.Id
                    JOIN dbo.FlowTemplate c ON b.FlowTemplateId = c.Id
            WHERE   a.Id = @stepId;

--PRINT @sourecTableName;
--PRINT @sourceId;

--SELECT @sql=CONCAT('select * from ' ,@sourecTableName, ' where Id = ',@sourceId,'');
--PRINT @sql;

--fake
--SET @sourecTableName = N'Employee';
--SET @sourceId = 1;

            DECLARE @sql NVARCHAR(2000) = '';
			--得到每个choice构成的where条件
            WITH    cte
                      AS ( SELECT   c.NextStepTemplateId ,
                                    c.Sort ,
                                    ISNULL(STUFF(( SELECT   CONCAT(' and ',
                                                              d.PropName, ' ',
                                                              d.Operator, ' ',
                                                              d.Value)
                                                   FROM     dbo.StepTemplateStateChoiceCondition d
                                                   WHERE    d.StepTemplateStateChoiceId = c.Id
                                                 FOR
                                                   XML PATH('')
                                                 ), 1, 5, ''), '1=1') AS whereCondition
                           FROM     dbo.Step a
                                    JOIN dbo.StepTemplateState b ON a.StepTemplateId = b.StepTemplateId
                                                              AND a.Id = @stepId
                                                              AND b.State = @state
                                    JOIN dbo.StepTemplateStateChoice c ON b.Id = c.StepTemplateStateId
                         )
                SELECT  @sql = @sql + CONCAT(' UNION ALL ', 'SELECT ',
                                             NextStepTemplateId,
                                             ' as NextStepTemplateId,', Sort,
                                             ' as Sort FROM ',
                                             @sourecTableName, ' WHERE 编号 =',
                                             @sourceId, ' AND ',
                                             whereCondition)
                FROM    cte;

            SELECT  @sql = 'WITH cte AS(' + STUFF(@sql, 1, 11, '')
                    + ')SELECT TOP 1 @result = NextStepTemplateId FROM cte ORDER BY cte.Sort ';
			--xml for path 会处理<>为特殊符号
            SET @sql = REPLACE(@sql, 'gt;', '>');
            SET @sql = REPLACE(@sql, 'lt;', '<');

            PRINT @sql;

            EXEC sys.sp_executesql @sql, N'@result int output', @result OUTPUT;
        END;
    --SELECT  @result;




GO
/****** Object:  StoredProcedure [dbo].[SPStepDone]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SPStepDone]
    (
      @StepId INT ,
      @State INT ,
      @OperatorType NVARCHAR(50) ,
      @OperatorId INT ,
      --@NextStepTemplateId INT ,  --外面计算得出;可能为null,表示没有下一步了;
      @Remark NVARCHAR(MAX)
    )
AS --当此步骤状态为0才能操作;
    IF ( EXISTS ( SELECT    1
                  FROM      dbo.Step
                  WHERE     Id = @StepId
                            AND State <> 0 ) )
        THROW 50001,N'此步骤不存在或已完成',1;

	--不能在步骤完成这个动作里,将步骤状态设为0;
    IF ( @State = 0 )
        THROW 50001,N'操作状态错误',1;

	--StepTemplateState里面要有这个步骤继续操作的state
    IF ( NOT EXISTS ( SELECT    1
                      FROM      dbo.Step a
                                JOIN dbo.StepTemplateState b ON a.Id = @StepId
                                                              AND a.StepTemplateId = b.StepTemplateId
                                                              AND b.State = @State )
       )
        THROW 50001,N'该步骤不存在指定的操作',1;

    DECLARE @StepTemplateId INT;
    DECLARE @FlowId INT;
    DECLARE @NextStepId INT= 0;	--下一步骤Id,后面生成

    SELECT  @StepTemplateId = StepTemplateId ,
            @FlowId = FlowId
    FROM    dbo.Step
    WHERE   Id = @StepId;

    SET XACT_ABORT ON;
    BEGIN TRAN;
--1 更新此步骤状态
    UPDATE  dbo.Step
    SET     State = @State ,
            OperatorType = @OperatorType ,
            OperatorId = @OperatorId ,
            OperatorDatetime = GETDATE() ,
            Remark = @Remark
    WHERE   Id = @StepId;

--如果状态为-2以及-1以下 则终止整个流程
--流程状态变为响应状态,
    IF ( @State < -1 )
        UPDATE  dbo.Flow
        SET     State = @State
        WHERE   Id = @FlowId;

--如果状态>=-1 则进行下一步
    ELSE
        BEGIN
            DECLARE @NextStepTemplateId INT;
            EXEC dbo.SPGetNextStepTemplateId @stepId = @StepId, -- int
                @state = @State, -- int
                @result = @NextStepTemplateId OUTPUT; -- int
			
            IF ( @NextStepTemplateId IS NOT NULL )
                BEGIN
                    INSERT  dbo.Step
                            ( StepTemplateId, FlowId )
                    VALUES  ( @NextStepTemplateId, @FlowId );
                    SET @NextStepId = SCOPE_IDENTITY();

					--为下一步设置指定操作人;2019-3-13看来暂时不用放到这里了,原因见这一天的笔记;
                END;
            ELSE --如果已经是最后一步
                BEGIN
                    UPDATE  dbo.Flow
                    SET     State = 1
                    WHERE   Id = @FlowId;
                END;

        END;
    COMMIT TRAN;

    SELECT  @NextStepId;
  -- = 0表示没有下一步了

GO
/****** Object:  UserDefinedFunction [dbo].[fn_成果作者]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





        
	CREATE FUNCTION [dbo].[fn_成果作者](@成果类型 INT,@成果编号 INT ,@作者级别 NVARCHAR(50)) RETURNS NVARCHAR(100) AS 
	BEGIN 
	RETURN STUFF(( SELECT  ',' + ISNULL(t.部门名称 + '-','') + t.姓名
                FROM    dbo.tfn_成果作者(@成果类型, @成果编号) AS t
                WHERE   t.作者级别 = @作者级别
              FOR
                XML PATH('')
              ), 1, 1, '') 

	END 

GO
/****** Object:  UserDefinedFunction [dbo].[fn_根据分值获取教学评分等级]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_根据分值获取教学评分等级] ( @Score INT )
RETURNS NVARCHAR(500)
AS
    BEGIN

        DECLARE @result NVARCHAR(500);

        SELECT  @result = 等级名称
        FROM    教学评分等级
        WHERE   @Score BETWEEN 最小分值 AND 最大分值;
       

        RETURN @result;

    END;


GO
/****** Object:  UserDefinedFunction [dbo].[fn_根据流程模板编号获得项目类型名称]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[fn_根据流程模板编号获得项目类型名称] ( @流程模板编号 INT )
RETURNS NVARCHAR(50)
AS
    BEGIN
        DECLARE @项目类型名称 NVARCHAR(50);
        SELECT  @项目类型名称 = CASE @流程模板编号
                            WHEN 100 THEN '学术任职'
                            WHEN 200 THEN '主办讲座'
                            WHEN 201 THEN '讲座反馈'
                            WHEN 210 THEN '参加会议'
                            WHEN 211 THEN '参加会议反馈'
                            WHEN 300 THEN '论文管理'
	--WHEN 310 THEN '认领论文'
                            WHEN 301 THEN '著作管理'
                            WHEN 302 THEN '专利管理'
                            WHEN 303 THEN '获奖管理'
                            WHEN 400 THEN '纵向项目申报'
                            WHEN 410 THEN '纵向项目'  --纵向项目立项
                            WHEN 420 THEN '纵向项目中检'
                            WHEN 430 THEN '纵向项目变更'
                            WHEN 440 THEN '纵向项目结题'
                            WHEN 450 THEN '横向项目'  --横向项目申请
                            WHEN 460 THEN '横向项目变更'
                            WHEN 470 THEN '横向项目结题'
                            WHEN 500 THEN '纵向项目经费到账'
                            WHEN 510 THEN '横向项目经费到账'
                            WHEN 600 THEN '报销'
                          END;

        RETURN @项目类型名称;
    END;

GO
/****** Object:  UserDefinedFunction [dbo].[fn_获取项目名称]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fn_获取项目名称] ( @流程模板编号 INT, @项目编号 INT )
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
              
GO
/****** Object:  UserDefinedFunction [dbo].[fn_继教获取某活动通过所有活动内容的人数]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_继教获取某活动通过所有活动内容的人数] ( @活动编号 INT )
RETURNS INT
AS
    BEGIN
        DECLARE @该活动通过所有活动内容的人数 INT = 0;

        DECLARE @该活动的活动内容数量 INT;
        
        SELECT  @该活动的活动内容数量 = COUNT(1)
        FROM    dbo.继教活动内容
        WHERE   活动编号 = @活动编号;

        WITH    cte
                  AS ( SELECT   编号
                       FROM     继教活动内容
                       WHERE    活动编号 = @活动编号
                     ),
                cteAll --这个应该可以用"tfn_继教某活动的通过情况"来实现
                  AS ( SELECT   a1.参与人类型 ,
                                a1.参与人编号
                       FROM     v_继教慕课参与情况 a1
                                JOIN cte ON a1.慕课编号 = cte.编号
                                            AND a1.是否通过 = 1
                       UNION ALL
                       SELECT   a2.参与人类型 ,
                                a2.参与人编号
                       FROM     v_继教课后练习参与情况 a2
                                JOIN cte ON a2.课后练习编号 = cte.编号
                                            AND a2.是否通过 = 1
                       UNION ALL
                       SELECT   a3.参与人类型 ,
                                a3.参与人编号
                       FROM     v_继教理论考试参与情况 a3
                                JOIN cte ON a3.考试编号 = cte.编号
                                            AND a3.是否通过 = 1
                       UNION ALL
                       SELECT   a4.参与人类型 ,
                                a4.参与人编号
                       FROM     v_继教操作考试参与情况 a4
                                JOIN cte ON a4.考试编号 = cte.编号
                                            AND a4.是否通过 = 1
                       UNION ALL
                       SELECT   a5.参与人类型 ,
                                a5.参与人编号
                       FROM     cte a6
                                OUTER APPLY dbo.tfn_继教签到参与情况(a6.编号) a5
                       WHERE    a5.是否通过 = 1
                     ),
                cteGroup
                  AS ( SELECT   cteAll.参与人类型 ,
                                cteAll.参与人编号 ,
                                COUNT(1) AS 参与人通过的活动内容次数
                       FROM     cteAll
                       GROUP BY cteAll.参与人类型 ,
                                cteAll.参与人编号
                       HAVING   COUNT(1) >= @该活动的活动内容数量
                     )
            SELECT  @该活动通过所有活动内容的人数 = COUNT(1)
            FROM    cteGroup;

        RETURN @该活动通过所有活动内容的人数;

    END;

GO
/****** Object:  UserDefinedFunction [dbo].[fn_教学获取360评价人类型名称]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_教学获取360评价人类型名称] ( @教学360评价人类型编号 INT )
RETURNS NVARCHAR(100)
AS
    BEGIN

        DECLARE @result NVARCHAR(100);

        IF ( @教学360评价人类型编号 = 0 )
            SET @result = N'教学学员';
        ELSE
            SELECT  @result = 名称
            FROM    教学角色
            WHERE   编号 = @教学360评价人类型编号;

        RETURN @result;
    END;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_教学获取360评价人名称]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_教学获取360评价人名称]
    (
      @教学360评价人类型编号 INT ,
      @教学360评价人编号 INT
    )
RETURNS NVARCHAR(100)
AS
    BEGIN

        DECLARE @result NVARCHAR(100);

        IF ( @教学360评价人类型编号 = 0 )
            SELECT  @result = 姓名
            FROM    教学学员
            WHERE   编号 = @教学360评价人编号;
        ELSE
            SELECT  @result = 姓名
            FROM    dbo.人员
            WHERE   编号 = @教学360评价人编号;

        RETURN @result;
    END;

GO
/****** Object:  UserDefinedFunction [dbo].[fn_满足通知公告接收条件人数]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[fn_满足通知公告接收条件人数]
    (
      @tt tt_通知公告接收条件 READONLY
    )
RETURNS INT
AS
    BEGIN
	-- Declare the return variable here
        DECLARE @ResultVar INT;

        WITH    cte ( 人员编号, 接收者类型, 接收者编号 )
                  AS ( SELECT   编号 ,
                                0 ,
                                0
                       FROM     人员
                       UNION ALL
                       SELECT   编号 ,
                                10 ,
                                编号
                       FROM     dbo.人员
                       UNION ALL
                       SELECT   编号 ,
                                20 ,
                                部门编号
                       FROM     dbo.人员
                       UNION ALL
                       SELECT   a1.编号 ,
                                30 ,
                                b1.角色编号
                       FROM     dbo.人员 a1
                                JOIN dbo.人员角色 b1 ON a1.编号 = b1.人员编号
                     )
            SELECT  @ResultVar = COUNT(DISTINCT cte.人员编号)
            FROM    cte
                    JOIN @tt c ON cte.接收者类型 = c.接收者类型
                                  AND cte.接收者编号 = c.接收者编号;


	-- Return the result of the function
        RETURN @ResultVar;

    END;

GO
/****** Object:  UserDefinedFunction [dbo].[fn_某人是否可以操作某步骤]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[fn_某人是否可以操作某步骤] ( @步骤编号 INT, @人员编号 INT )
RETURNS BIT
AS
    BEGIN
		--如果该该流程状态不为0,或者步骤状态不为0,则false
		--因为目前是单线流程,所以不用判断流程状态了
        --IF ( EXISTS ( SELECT    1
        --              FROM      步骤 a
        --                        JOIN 流程 b ON a.流程编号 = b.编号
        --              WHERE     a.编号 = @步骤编号
        --                        AND ( a.状态 <> 0
        --                              OR b.状态 <> 0
        --                            ) ) )
        --    RETURN 0;
        IF ( EXISTS ( SELECT    1
                      FROM      步骤 a
                      WHERE     a.编号 = @步骤编号
                                AND a.状态 <> 0 ) )
            RETURN 0;

		--如果该步骤有指定人,
        IF ( EXISTS ( SELECT    1
                      FROM      步骤指定人
                      WHERE     步骤编号 = @步骤编号 ) )
            BEGIN
			--如果该步骤指定人中有该人员,则可,否则不可;
                IF ( EXISTS ( SELECT    1
                              FROM      步骤指定人
                              WHERE     步骤编号 = @步骤编号
                                        AND 指定人编号 = @人员编号 ) )
                    RETURN 1;
                ELSE
                    RETURN 0;

            END;

		--如果该步骤状态=0,且该人员的某一角色,在该步骤的负责角色之中,则真
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.步骤 a
                                JOIN dbo.步骤角色 b ON a.编号 = @步骤编号
                                                   AND a.步骤模板编号 = b.步骤模板编号
                                JOIN dbo.人员角色 c ON c.人员编号 = @人员编号
                                                   AND b.角色编号 = c.角色编号 ) )
            RETURN 1;

		--如果该步骤模板有一个步骤角色为0,则该流程发起人可以操作
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.步骤 a
                                JOIN 流程 a1 ON a.流程编号 = a1.编号
                                              AND a1.发起人编号 = @人员编号
                                JOIN dbo.步骤角色 b ON a.步骤模板编号 = b.步骤模板编号
                                                   AND b.角色编号 = 0
                      WHERE     a.编号 = @步骤编号 ) )
            RETURN 1;

        RETURN 0;
	

    END;

GO
/****** Object:  UserDefinedFunction [dbo].[fn_某人员是否满足通知公告接收条件_作废]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_某人员是否满足通知公告接收条件_作废] ( @人员编号 INT, @通知公告编号 INT )
RETURNS INT
AS
    BEGIN
	-- Declare the return variable here
        DECLARE @ResultVar INT = 0;

        WITH    cte ( 人员编号, 接收者类型, 接收者编号 )
                  AS ( SELECT   @人员编号 ,
                                0 ,
                                0
                       UNION ALL
                       SELECT   @人员编号 ,
                                10 ,
                                @人员编号
                       UNION ALL
                       SELECT   @人员编号 ,
                                20 ,
                                部门编号
                       FROM     dbo.人员
                       WHERE    编号 = @人员编号
                       UNION ALL
                       SELECT   @人员编号 ,
                                30 ,
                                b1.角色编号
                       FROM     dbo.人员角色 b1
                       WHERE    b1.人员编号 = @人员编号
                     )
            SELECT  @ResultVar = COUNT(1)
            FROM    cte
                    JOIN dbo.通知公告接收条件 c ON cte.接收者类型 = c.接收者类型
                                           AND cte.接收者编号 = c.接收者编号
                    JOIN dbo.通知公告 d ON c.通知公告编号 = d.编号;


	-- Return the result of the function
        RETURN @ResultVar;

    END;

GO
/****** Object:  UserDefinedFunction [dbo].[FNGetPersonInfoByType]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FNGetPersonInfoByType]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT 
    )
RETURNS NVARCHAR(500)
AS
    BEGIN

        DECLARE @result NVARCHAR(500);

        IF ( @PersonType IS NULL )
            BEGIN

                IF ( @PersonId = 0 )
                    SELECT  @result = '发起人或负责人';
            END;

        IF ( @PersonType = '人员' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '所有医院员工';
                ELSE
                    SELECT  @result =CONCAT(部门名称,'/',工号,'/', 姓名)
                    FROM    dbo.v1_人员_带部门名
                    WHERE   编号 = @PersonId;
            END;
            
        IF ( @PersonType = '教学学员' )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '所有教学学员';
                ELSE
                    SELECT  @result = 姓名
                    FROM    dbo.教学学员
                    WHERE   编号 = @PersonId;
            END;

        IF ( @PersonType = '教学角色' )
            SELECT  @result = 名称
            FROM    dbo.教学角色
            WHERE   编号 = @PersonId;

		IF ( @PersonType = '继教角色' )
            SELECT  @result = 名称
            FROM    dbo.继教角色
            WHERE   编号 = @PersonId;

        IF ( @PersonType = '部门'
             OR @PersonType = '教学科室'
           )
            BEGIN
                IF ( @PersonId = 0 )
                    SELECT  @result = '所有部门';
                ELSE
                    SELECT  @result = 名称
                    FROM    dbo.部门
                    WHERE   编号 = @PersonId;
            END;
            
        RETURN @result;

    END;


GO
/****** Object:  UserDefinedFunction [dbo].[FNIsPersonCanOperateStep]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[FNIsPersonCanOperateStep]
    (
      @StepId INT ,
      --@Person TTPersonTypeAndId READONLY
	  @PersonType NVARCHAR(50),
	  @PersonId INT
    )
RETURNS BIT
AS
    BEGIN

	DECLARE @Person TTPersonTypeAndId;
	INSERT @Person
	        ( PersonType, PersonId )
	SELECT PersonType ,
           PersonId FROM dbo.tfn_教学获取PersonTypeAndId(@PersonType,@PersonId);

		--如果该该流程状态不为0,或者步骤状态不为0,则false
		--两个都需要判断,如果中途废标退出,很可能只能依靠flow的state<>0来判断;
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.Step a
                                JOIN dbo.Flow b ON a.FlowId = b.Id
                      WHERE     a.Id = @StepId
                                AND ( a.State <> 0
                                      OR b.State <> 0
                                    ) ) )
            RETURN 0;


		--如果对于特定的步骤,传入的"人的特征"符合该步骤指定人的"描述",则返回true
        IF ( EXISTS ( SELECT    1
                      FROM      dbo.StepAssignedPerson a
                      WHERE     a.StepId = @StepId ) )
            IF ( EXISTS ( SELECT    1
                          FROM      dbo.StepAssignedPerson a
                                    JOIN @Person b ON a.StepAssignedPersonType = b.PersonType
                                                      AND ( a.StepAssignedPersonId = 0
                                                            OR a.StepAssignedPersonId = b.PersonId
                                                          )
                          WHERE     a.StepId = @StepId ) )
                RETURN 1;
            ELSE
                RETURN 0;
        ELSE
            IF ( EXISTS ( SELECT    1
                          FROM      dbo.Step a
                                    JOIN dbo.StepTemplate a1 ON a.StepTemplateId = a1.Id
                                    JOIN dbo.StepTemplateAssignedPerson a2 ON a1.Id = a2.StepTemplateId
                                    JOIN @Person b ON a2.StepAssignedPersonType = b.PersonType
                                                      AND ( a2.StepAssignedPersonId = 0
                                                            OR a2.StepAssignedPersonId = b.PersonId
                                                          )
                          WHERE     a.Id = @StepId ) )
				--如果该步骤模板有一个可操作人的type=传入的type,id=0或id=传入的id,那么可操作;
                RETURN 1;
            ELSE

                IF ( EXISTS ( SELECT    1
                              FROM      dbo.Step a
                                        JOIN dbo.Flow a1 ON a.FlowId = a1.Id
                                        JOIN @Person a2 ON a1.CreatorType = a2.PersonType
                                                           AND a1.CreatorId = a2.PersonId
                                        JOIN dbo.StepTemplateAssignedPerson b ON a.StepTemplateId = b.StepTemplateId
                                                              AND b.StepAssignedPersonType IS NULL
                                                              AND b.StepAssignedPersonId = 0
                              WHERE     a.Id = @StepId ) )
					--如果该步骤模板有一个可操作人的"标签"为null-0,则该流程发起人=现在传进来的人就可以操作
                    RETURN 1;

                ELSE
					--应该需要价格 null-1表示流程第一步的操作人=现在穿进来的人就可以操作,因为有可能流程的发起人和第一步的操作人不同;
                    RETURN 0;

        RETURN 0;
    END;


GO
/****** Object:  UserDefinedFunction [dbo].[SplitStringToTable]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE FUNCTION [dbo].[SplitStringToTable]
    (
      @String NVARCHAR(4000) , --格式如：“1，2，3，4，”
      @SplitChar NVARCHAR(10) --分割的字符：“，”
    )
RETURNS @table TABLE ( ID NVARCHAR(100) )
AS
    BEGIN
        DECLARE @Index INT;
        SET @Index = 0;

        IF @String <> ''
            BEGIN
                IF RIGHT(@String, 1) <> @SplitChar
                    SET @String = @String + @SplitChar;
                IF LEFT(@String, 1) = @SplitChar
                    SET @String = STUFF(@String, 1, 1, '');
            END;
        WHILE CHARINDEX(@SplitChar, @String, @Index) > 0
            BEGIN
                INSERT  INTO @table
                        ( ID
                        )
                VALUES  ( SUBSTRING(@String, @Index,
                                    CHARINDEX(@SplitChar, @String, @Index)
                                    - @Index)
                        );
                SET @Index = CHARINDEX(@SplitChar, @String, @Index) + 1;
            END;
        RETURN;
    END;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教获取PersonTypeAndId]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教获取PersonTypeAndId]
    (
      @PersonType NVARCHAR(50) ,
      @Id INT
    )
RETURNS @table TABLE
    (
      PersonType NVARCHAR(50) ,
      PersonId INT
    )
AS
    BEGIN
        IF ( @PersonType = '人员' )
            WITH    cte
                      AS ( SELECT   '人员' AS PersonType ,
                                    0 AS PersonId --所有人员
                           UNION ALL
                           SELECT   '人员' AS PersonType ,
                                    @Id AS PersonId --该学员
                           UNION ALL
                           SELECT   '部门' AS PersonType ,
                                    c1.部门编号 AS PersonId
                           FROM     dbo.人员 c1
                           WHERE    c1.编号 = @Id --所属部门
                           UNION ALL
                           SELECT   '继教角色' AS PersonType ,
                                    c2.继教角色编号 AS PersonId
                           FROM     dbo.继教人员角色 c2
                           WHERE    c2.人员编号 = @Id --所属角色,目前只涉及了教学角色
                         )
                INSERT  @table
                        SELECT  *
                        FROM    cte;

        IF ( @PersonType = '教学学员' )
            WITH    cte
                      AS ( SELECT   '教学学员' AS PersonType ,
                                    0 AS PersonId --所有学员
                           UNION ALL
                           SELECT   '教学学员' AS PersonType ,
                                    @Id AS PersonId --该学员
                         )
                INSERT  @table
                        SELECT  *
                        FROM    cte;

        RETURN;
    END;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学获取PersonTypeAndId]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学获取PersonTypeAndId]
    (
      @PersonType NVARCHAR(50) ,
      @Id INT
    )
RETURNS @table TABLE
    (
      PersonType NVARCHAR(50) ,
      PersonId INT
    )
AS
    BEGIN
        IF ( @PersonType = '人员' )
            WITH    cte
                      AS ( SELECT   '人员' AS PersonType ,
                                    0 AS PersonId --所有人员
                           UNION ALL
                           SELECT   '人员' AS PersonType ,
                                    @Id AS PersonId --该学员
                           UNION ALL
                           SELECT   '部门' AS PersonType ,
                                    c1.部门编号 AS PersonId
                           FROM     dbo.v_教学人员 c1
                           WHERE    c1.编号 = @Id --所属部门
                           UNION ALL
                           SELECT   '教学角色' AS PersonType ,
                                    c2.教学角色编号 AS PersonId
                           FROM     dbo.教学人员角色 c2
                           WHERE    c2.人员编号 = @Id --所属角色,目前只涉及了教学角色
                         )
                INSERT  @table
                        SELECT  *
                        FROM    cte;

        IF ( @PersonType = '教学学员' )
            WITH    cte
                      AS ( SELECT   '教学学员' AS PersonType ,
                                    0 AS PersonId --所有学员
                           UNION ALL
                           SELECT   '教学学员' AS PersonType ,
                                    @Id AS PersonId --该学员
                         )
                INSERT  @table
                        SELECT  *
                        FROM    cte;

        RETURN;
    END;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目_作废]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_项目_作废] ( @项目类型 INT, @项目编号 INT )
RETURNS @r TABLE
    (
      项目类型 NVARCHAR(50) ,
      项目名称 NVARCHAR(100)
    )
AS
    BEGIN
        IF ( @项目类型 = 1 )
            INSERT  INTO @r
                    SELECT  '纵向项目' ,
                            CONCAT(项目中文名称, 项目英文名称)
                    FROM    dbo.纵向项目立项
                    WHERE   编号 = @项目编号;
            --VALUES  ( '纵向项目', '某纵向项目名称' );
        IF ( @项目类型 = 2 )
            INSERT  INTO @r
                    SELECT  '横向项目' ,
                            合同名称
                    FROM    dbo.横向项目
                    WHERE   编号 = @项目编号;
            --VALUES  ( '横向项目', '某横向项目名称' );

        RETURN;
    END;

GO
/****** Object:  Table [dbo].[Flow]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FlowTemplateId] [int] NOT NULL,
	[SourceId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[CreatorType] [nvarchar](50) NOT NULL,
	[CreatorId] [int] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_FLOW] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FlowTemplate]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FlowTemplate](
	[Id] [int] NOT NULL,
	[TableName] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ComponentName] [nvarchar](100) NOT NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_FLOWTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Id]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Id](
	[编号] [int] NOT NULL,
 CONSTRAINT [PK_Id] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Step]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FlowId] [int] NOT NULL,
	[StepTemplateId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[OperatorType] [nvarchar](50) NULL,
	[OperatorId] [int] NULL,
	[OperatorDatetime] [datetime] NULL,
	[CreateDatetime] [datetime] NOT NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_STEP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StepAssignedPerson]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepAssignedPerson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StepId] [int] NOT NULL,
	[StepAssignedPersonType] [nvarchar](50) NULL,
	[StepAssignedPersonId] [int] NOT NULL,
 CONSTRAINT [PK_STEPASSIGNEDEMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StepTemplate]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepTemplate](
	[Id] [int] NOT NULL,
	[FlowTemplateId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ViewComponentName] [nvarchar](100) NULL,
	[EditComponentName] [nvarchar](100) NULL,
	[Style] [nvarchar](100) NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_STEPTEMPLATE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StepTemplateAssignedPerson]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepTemplateAssignedPerson](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StepTemplateId] [int] NOT NULL,
	[StepAssignedPersonType] [nvarchar](50) NULL,
	[StepAssignedPersonId] [int] NOT NULL,
	[Remark] [nvarchar](500) NULL,
 CONSTRAINT [PK_StepTemplateAssignedPerson] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StepTemplateState]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepTemplateState](
	[Id] [int] NOT NULL,
	[StepTemplateId] [int] NOT NULL,
	[State] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_STEPTEMPLATESTATE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StepTemplateStateChoice]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepTemplateStateChoice](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StepTemplateStateId] [int] NOT NULL,
	[NextStepTemplateId] [int] NOT NULL,
	[Sort] [int] NOT NULL,
	[Remark] [nvarchar](1000) NULL,
 CONSTRAINT [PK_STEPTEMPLATESTATECHOICE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StepTemplateStateChoiceCondition]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StepTemplateStateChoiceCondition](
	[StepTemplateStateChoiceId] [int] NOT NULL,
	[PropName] [nvarchar](100) NOT NULL,
	[Operator] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Remark] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[报销]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[报销](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[报销编号] [nvarchar](50) NOT NULL,
	[报销金额] [numeric](18, 2) NOT NULL,
	[报销方式] [nvarchar](50) NULL,
	[公务卡号] [nvarchar](50) NULL,
	[公务卡所属人姓名] [nvarchar](50) NULL,
	[报销人编号] [int] NOT NULL,
	[报销时间] [datetime] NOT NULL,
	[相关文件路径] [nvarchar](max) NULL,
	[申请时间] [datetime] NULL,
	[建立时间] [datetime] NULL,
	[报销经费用途] [nvarchar](1000) NULL,
 CONSTRAINT [PK_报销] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[报销详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[报销详情](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[报销编号] [int] NOT NULL,
	[项目支出类型] [nvarchar](100) NOT NULL,
	[项目支出内容] [nvarchar](100) NOT NULL,
	[财务科目] [nvarchar](50) NOT NULL,
	[报销金额] [numeric](18, 2) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_报销详情] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[步骤]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[步骤](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[步骤模板编号] [int] NOT NULL,
	[流程编号] [int] NOT NULL,
	[状态] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[操作人编号] [int] NULL,
	[执行时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[步骤角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[步骤角色](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[步骤模板编号] [int] NOT NULL,
	[角色编号] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[步骤类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[步骤类型](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[路径] [nvarchar](100) NULL,
	[样式] [nvarchar](100) NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_步骤类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[步骤类型状态]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[步骤类型状态](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[步骤类型编号] [int] NOT NULL,
	[状态值] [int] NOT NULL,
	[操作说明] [nvarchar](100) NULL,
	[操作提示] [nvarchar](1000) NULL,
	[状态说明] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_步骤类型状态] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[步骤模板]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[步骤模板](
	[编号] [int] NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[步骤类型编号] [int] NOT NULL,
	[名称] [nvarchar](100) NULL,
	[上级编号] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_步骤模板] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[步骤指定人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[步骤指定人](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[步骤编号] [int] NOT NULL,
	[指定人编号] [int] NOT NULL,
 CONSTRAINT [PK_步骤指定人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[部门]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[部门](
	[编号] [int] IDENTITY(20000,1) NOT NULL,
	[上级部门编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[负责人编号] [int] NULL,
	[排序值] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
	[是否启用] [bit] NOT NULL,
 CONSTRAINT [PK_部门] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[参加会议]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[参加会议](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[会议名称] [nvarchar](100) NOT NULL,
	[会议主办单位] [nvarchar](100) NOT NULL,
	[会议承办单位] [nvarchar](100) NULL,
	[研讨领域] [nvarchar](100) NULL,
	[学科类型] [nvarchar](50) NULL,
	[会议地址] [nvarchar](500) NULL,
	[会议开始时间] [datetime] NOT NULL,
	[会议结束时间] [datetime] NOT NULL,
	[往返时间] [int] NULL,
	[会议网址] [nvarchar](500) NULL,
	[会议简介及申请理由] [nvarchar](500) NULL,
	[申请人编号] [int] NOT NULL,
	[参会相关文件路径] [nvarchar](max) NULL,
 CONSTRAINT [PK_参加会议] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[参加会议反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[参加会议反馈](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[参加会议编号] [int] NOT NULL,
	[活动持续分钟] [int] NULL,
	[参会人数] [int] NULL,
	[参会总结] [nvarchar](500) NULL,
	[会议反馈文件路径] [nvarchar](max) NULL,
 CONSTRAINT [PK_参加会议反馈] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[成果获奖]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成果获奖](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[获奖名称] [nvarchar](200) NOT NULL,
	[获奖级别] [nvarchar](50) NOT NULL,
	[获奖日期] [date] NOT NULL,
	[获奖类别] [nvarchar](50) NOT NULL,
	[获奖等级] [nvarchar](50) NULL,
	[奖励情况] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[联系人手机] [nvarchar](50) NULL,
	[项目开始时间] [datetime] NULL,
	[项目结束时间] [datetime] NULL,
	[应用开始时间] [datetime] NULL,
	[应用结束时间] [datetime] NULL,
	[年度] [int] NULL,
	[批文时间] [datetime] NULL,
	[颁奖单位] [nvarchar](50) NULL,
	[完成人数] [int] NULL,
	[获奖证书编号] [nvarchar](50) NULL,
	[完成单位数量] [int] NULL,
	[获奖摘要] [nvarchar](500) NULL,
	[备注] [nvarchar](500) NULL,
	[相关文件路径] [nvarchar](max) NULL,
	[获奖单位文件路径] [nvarchar](max) NULL,
	[获奖批文] [nvarchar](max) NULL,
 CONSTRAINT [PK_成果获奖] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[成果论文]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成果论文](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[认领人编号] [int] NULL,
	[论文标题] [nvarchar](200) NOT NULL,
	[论文标题类型] [nvarchar](50) NULL,
	[论文Online日期] [date] NULL,
	[论文正式出版日期] [date] NULL,
	[他引次数] [int] NULL,
	[年度] [int] NULL,
	[收稿日期] [date] NULL,
	[论文所属栏目] [nvarchar](50) NULL,
	[版面费] [numeric](18, 2) NULL,
	[超额版面费] [numeric](18, 2) NULL,
	[超额费用来源] [nvarchar](50) NULL,
	[奖励情况] [nvarchar](50) NULL,
	[论文字数] [numeric](18, 2) NULL,
	[计划来源] [nvarchar](50) NULL,
	[论文版面] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[作者人数] [int] NULL,
	[关键字] [nvarchar](500) NULL,
	[论文摘要] [nvarchar](max) NULL,
	[备注] [nvarchar](1000) NULL,
	[刊物编号] [int] NULL,
	[卷号] [int] NULL,
	[期号] [int] NULL,
	[页码范围起] [int] NULL,
	[页码范围止] [int] NULL,
	[论文类型] [nvarchar](50) NULL,
	[是否与行业联合发表] [bit] NULL,
	[是否与地方联合发表] [bit] NULL,
	[是否与国际联合发表] [bit] NULL,
	[是否跨学科] [bit] NULL,
	[是否与本专业相关] [bit] NULL,
	[检索信息页相关文件路径] [nvarchar](max) NULL,
	[论文正文路径] [nvarchar](max) NULL,
	[其他相关文件路径] [nvarchar](max) NULL,
	[通讯作者] [nvarchar](50) NULL,
	[文献类型] [nvarchar](50) NULL,
 CONSTRAINT [PK_论文] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[成果项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成果项目](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[项目类型] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[成果类型] [int] NOT NULL,
	[成果编号] [int] NOT NULL,
	[是否项目带来成果] [bit] NULL,
 CONSTRAINT [PK_项目成果] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[成果著作]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成果著作](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[著作名称] [nvarchar](100) NOT NULL,
	[出版社名称] [nvarchar](100) NOT NULL,
	[著作形式] [nvarchar](50) NULL,
	[年度] [int] NOT NULL,
	[著作出版日期] [date] NOT NULL,
	[ISBN号] [nvarchar](50) NOT NULL,
	[著作字数] [int] NOT NULL,
	[奖励情况] [nvarchar](50) NULL,
	[出版地] [nvarchar](50) NULL,
	[出版社级别] [nvarchar](50) NULL,
	[著作类型] [nvarchar](50) NOT NULL,
	[是否译为外文] [bit] NULL,
	[语种] [nvarchar](50) NOT NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[作者人数] [int] NULL,
	[发行价] [numeric](18, 2) NULL,
	[备注] [nvarchar](500) NULL,
	[封面相关文件路径] [nvarchar](max) NULL,
	[版权页相关文件路径] [nvarchar](max) NULL,
	[前言页相关文件路径] [nvarchar](max) NULL,
	[完整目录页相关文件路径] [nvarchar](max) NULL,
	[其他相关文件路径] [nvarchar](max) NULL,
 CONSTRAINT [PK_成果著作] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[成果专利]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成果专利](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[专利名称] [nvarchar](100) NOT NULL,
	[专利国别] [nvarchar](50) NULL,
	[专利类型] [nvarchar](50) NOT NULL,
	[专利范围] [nvarchar](50) NULL,
	[是否授权] [bit] NULL,
	[代理机构] [nvarchar](500) NULL,
	[年度] [int] NULL,
	[专利权人名称] [nvarchar](50) NOT NULL,
	[申请号] [nvarchar](50) NULL,
	[申请日期] [date] NOT NULL,
	[公开号] [nvarchar](50) NOT NULL,
	[公开日期] [date] NULL,
	[授权机构] [nvarchar](100) NULL,
	[专利号] [nvarchar](100) NULL,
	[国际专利主分类号] [nvarchar](100) NULL,
	[授权公告日] [date] NULL,
	[证书号] [nvarchar](100) NULL,
	[是否职务发明] [bit] NULL,
	[是否生效] [bit] NULL,
	[发明人数] [int] NULL,
	[奖励金额] [numeric](18, 2) NULL,
	[超额费用] [numeric](18, 2) NULL,
	[超额费用来源] [nvarchar](100) NULL,
	[专利摘要] [nvarchar](500) NULL,
	[备注] [nvarchar](500) NULL,
	[相关文件路径] [nvarchar](max) NULL,
	[代理费金额] [numeric](18, 2) NULL,
	[代理费发票号] [nvarchar](100) NULL,
	[代理费付款日期] [date] NULL,
	[代理资助金额] [numeric](18, 2) NULL,
	[代理办理资助日期] [date] NULL,
	[代理费到账日期] [date] NULL,
	[申请费是否减缓] [bit] NULL,
	[申请费金额] [numeric](18, 2) NULL,
	[申请费收据号] [nvarchar](100) NULL,
	[申请费支付日期] [date] NULL,
	[申请费资助金额] [numeric](18, 2) NULL,
	[申请费办理资助日期] [date] NULL,
	[申请费到账日期] [date] NULL,
	[申请审查费是否延缓] [bit] NULL,
	[申请审查费用] [numeric](18, 2) NULL,
	[申请审查费收据编号] [nvarchar](100) NULL,
	[申请审查费付款日期] [date] NULL,
	[申请审查费资助金额] [numeric](18, 2) NULL,
	[申请审查费资助日期] [date] NULL,
	[申请审查费到账日期] [date] NULL,
	[授权费是否减缓] [bit] NULL,
	[授权费用金额] [numeric](18, 2) NULL,
	[授权费收据号] [nvarchar](100) NULL,
	[授权费付款日期] [date] NULL,
	[授权费资助金额] [numeric](18, 2) NULL,
	[授权费办理资助日期] [date] NULL,
	[授权费到账日期] [date] NULL,
 CONSTRAINT [PK_成果专利] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[成果作者]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[成果作者](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[成果类型] [int] NOT NULL,
	[成果编号] [int] NOT NULL,
	[作者级别] [nvarchar](50) NOT NULL,
	[作者编号] [int] NOT NULL,
	[工作量占比] [int] NULL,
	[完成字数] [int] NULL,
 CONSTRAINT [PK_成果作者] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[登录日志]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[登录日志](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[工号] [nvarchar](50) NOT NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[登录时间] [datetime] NULL,
	[IP] [nvarchar](50) NULL,
 CONSTRAINT [PK_登录日志] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[国民行业代码]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[国民行业代码](
	[编号] [int] IDENTITY(20000,1) NOT NULL,
	[上级编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[代码] [nvarchar](500) NOT NULL,
	[级别] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [int] NULL,
 CONSTRAINT [PK_国民行业代码] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[合同买方性质]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[合同买方性质](
	[编号] [int] IDENTITY(10000,1) NOT NULL,
	[上级编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[级别] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_合同买方性质] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[横向项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[横向项目](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[项目分类] [nvarchar](50) NULL,
	[项目类型] [nvarchar](50) NULL,
	[合同编号] [nvarchar](50) NOT NULL,
	[合同名称] [nvarchar](100) NOT NULL,
	[是否为第一承建单位] [bit] NULL,
	[项目负责人编号] [int] NOT NULL,
	[项目归属部门] [nvarchar](500) NULL,
	[单位名称] [nvarchar](100) NULL,
	[邮政编码] [nvarchar](50) NULL,
	[法定代表人] [nvarchar](50) NULL,
	[经费本编号] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[联系人电话] [nvarchar](50) NULL,
	[通讯地址] [nvarchar](200) NULL,
	[是否需要伦理评审] [bit] NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](50) NULL,
	[课题来源] [nvarchar](50) NULL,
	[合作方关系] [nvarchar](50) NULL,
	[合作方契约关系] [nvarchar](50) NULL,
	[合作方单位名称] [nvarchar](200) NULL,
	[合作方法人或组织机构代码] [nvarchar](50) NULL,
	[合作方法定代表人] [nvarchar](50) NULL,
	[合作方单位联系人] [nvarchar](50) NULL,
	[合作方联系电话] [nvarchar](50) NULL,
	[合作方邮箱] [nvarchar](50) NULL,
	[合作方邮政编码] [nvarchar](50) NULL,
	[合作方所在省] [nvarchar](50) NULL,
	[合作方所在市] [nvarchar](50) NULL,
	[合作方所在地区] [nvarchar](50) NULL,
	[合同金额] [numeric](18, 2) NOT NULL,
	[签订时间] [datetime] NOT NULL,
	[付款方式] [nvarchar](50) NOT NULL,
	[合同开始时间] [datetime] NOT NULL,
	[合同结束时间] [datetime] NOT NULL,
	[合作方式] [nvarchar](50) NOT NULL,
	[研究类型] [nvarchar](50) NOT NULL,
	[技术领域] [nvarchar](50) NULL,
	[合同类型] [nvarchar](50) NULL,
	[技术合同类型] [nvarchar](50) NULL,
	[是否申请技术合同认定] [bit] NULL,
	[合同技术交易额] [numeric](18, 2) NULL,
	[知识产权] [nvarchar](50) NULL,
	[计划来源] [nvarchar](50) NULL,
	[合作方所属国民经济行业] [nvarchar](50) NULL,
	[技术服务的国民经济行业] [nvarchar](50) NULL,
	[合同的社会经济目标] [nvarchar](50) NULL,
	[合作方性质] [nvarchar](50) NULL,
	[是否高新性质] [bit] NULL,
	[合同认定登记承诺书路径] [nvarchar](max) NULL,
	[合同文件路径] [nvarchar](max) NOT NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_横向项目] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[横向项目变更]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[横向项目变更](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[变更内容简介] [nvarchar](1000) NULL,
	[变更事由] [nvarchar](1000) NULL,
	[变更备注] [nvarchar](1000) NULL,
	[变更时间] [datetime] NOT NULL,
	[横向项目编号] [int] NOT NULL,
	[项目分类] [nvarchar](50) NULL,
	[项目类型] [nvarchar](50) NULL,
	[合同编号] [nvarchar](50) NOT NULL,
	[合同名称] [nvarchar](100) NOT NULL,
	[是否为第一承建单位] [bit] NULL,
	[项目负责人编号] [int] NOT NULL,
	[项目归属部门] [nvarchar](500) NULL,
	[单位名称] [nvarchar](100) NULL,
	[邮政编码] [nvarchar](50) NULL,
	[法定代表人] [nvarchar](50) NULL,
	[经费本编号] [nvarchar](50) NULL,
	[联系人] [nvarchar](50) NULL,
	[联系人电话] [nvarchar](50) NULL,
	[通讯地址] [nvarchar](200) NULL,
	[是否需要伦理评审] [bit] NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](50) NULL,
	[课题来源] [nvarchar](50) NULL,
	[合作方关系] [nvarchar](50) NULL,
	[合作方契约关系] [nvarchar](50) NULL,
	[合作方单位名称] [nvarchar](200) NULL,
	[合作方法人或组织机构代码] [nvarchar](50) NULL,
	[合作方法定代表人] [nvarchar](50) NULL,
	[合作方单位联系人] [nvarchar](50) NULL,
	[合作方联系电话] [nvarchar](50) NULL,
	[合作方邮箱] [nvarchar](50) NULL,
	[合作方邮政编码] [nvarchar](50) NULL,
	[合作方所在省] [nvarchar](50) NULL,
	[合作方所在市] [nvarchar](50) NULL,
	[合作方所在地区] [nvarchar](50) NULL,
	[合同金额] [numeric](18, 2) NOT NULL,
	[签订时间] [datetime] NOT NULL,
	[付款方式] [nvarchar](50) NOT NULL,
	[合同开始时间] [datetime] NOT NULL,
	[合同结束时间] [datetime] NOT NULL,
	[合作方式] [nvarchar](50) NOT NULL,
	[研究类型] [nvarchar](50) NOT NULL,
	[技术领域] [nvarchar](50) NULL,
	[合同类型] [nvarchar](50) NULL,
	[技术合同类型] [nvarchar](50) NULL,
	[是否申请技术合同认定] [bit] NULL,
	[合同技术交易额] [numeric](18, 2) NULL,
	[知识产权] [nvarchar](50) NULL,
	[计划来源] [nvarchar](50) NULL,
	[合作方所属国民经济行业] [nvarchar](50) NULL,
	[技术服务的国民经济行业] [nvarchar](50) NULL,
	[合同的社会经济目标] [nvarchar](50) NULL,
	[合作方性质] [nvarchar](50) NULL,
	[是否高新性质] [bit] NULL,
	[合同认定登记承诺书路径] [nvarchar](max) NULL,
	[合同文件路径] [nvarchar](max) NOT NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_横向项目变更] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[横向项目结题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[横向项目结题](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[横向项目编号] [int] NOT NULL,
	[结题验收编号] [nvarchar](100) NULL,
	[结题验收时间] [datetime] NULL,
	[结题验收是否合格] [bit] NULL,
	[结题验收参与人数] [int] NULL,
	[结题资料路径] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_横向项目结题] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[技术领域]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[技术领域](
	[编号] [int] IDENTITY(20000,1) NOT NULL,
	[上级编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[级别] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [int] NULL,
 CONSTRAINT [PK_技术领域] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教标签]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教标签](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[首字母] [nvarchar](10) NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继教标签] PRIMARY KEY CLUSTERED 
(
	[名称] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教操作考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教操作考试](
	[编号] [int] NOT NULL,
	[及格分数] [int] NOT NULL,
	[描述] [nvarchar](1000) NULL,
	[是否允许考生查看成绩] [bit] NOT NULL,
	[是否允许考生查看评分] [bit] NOT NULL,
 CONSTRAINT [PK_继培操作考试] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教操作考试参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教操作考试参与情况](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[考试批次编号] [int] NOT NULL,
	[助教老师编号] [int] NULL,
	[参与人类型] [nvarchar](50) NOT NULL,
	[参与人编号] [int] NOT NULL,
	[开始操作时间] [datetime] NOT NULL,
	[结束操作时间] [datetime] NOT NULL,
	[得分] [numeric](8, 1) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培操作考试参与情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教操作考试打分情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教操作考试打分情况](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[操作考试参与情况编号] [int] NOT NULL,
	[操作考试评分项目要求编号] [int] NOT NULL,
	[打分] [numeric](8, 1) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培操作考试打分情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教操作考试评分表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教操作考试评分表](
	[操作考试编号] [int] NOT NULL,
	[评分表编号] [int] NOT NULL,
 CONSTRAINT [PK_继培操作考试评分表] PRIMARY KEY CLUSTERED 
(
	[操作考试编号] ASC,
	[评分表编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教操作考试助教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教操作考试助教老师](
	[操作考试编号] [int] NOT NULL,
	[助教老师编号] [int] NOT NULL,
 CONSTRAINT [PK_继培操作考试助教老师] PRIMARY KEY CLUSTERED 
(
	[操作考试编号] ASC,
	[助教老师编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教活动](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[文件夹编号] [int] NOT NULL,
	[培训计划编号] [int] NULL,
	[项目分类编号] [int] NULL,
	[名称] [nvarchar](100) NOT NULL,
	[开始时间] [datetime] NULL,
	[结束时间] [datetime] NULL,
	[学分] [int] NULL,
	[封面] [nvarchar](1000) NULL,
	[简介] [nvarchar](1000) NULL,
	[必须按顺序学习] [bit] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[建立人] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培活动] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教活动可参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教活动可参与人](
	[活动编号] [int] NOT NULL,
	[可参与人类型] [nvarchar](50) NOT NULL,
	[可参与人编号] [int] NOT NULL,
 CONSTRAINT [PK_继培活动可参与人] PRIMARY KEY CLUSTERED 
(
	[活动编号] ASC,
	[可参与人类型] ASC,
	[可参与人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教活动内容]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教活动内容](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[活动编号] [int] NOT NULL,
	[类型] [nvarchar](100) NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[排序值] [int] NOT NULL,
	[开始时间] [datetime] NOT NULL,
	[结束时间] [datetime] NOT NULL,
	[地点] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培活动内容] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教活动项目分类]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教活动项目分类](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[父编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培活动项目分类] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教角色](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[能否直接配置人员] [bit] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_继培角色] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教角色权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教角色权限](
	[继教角色编号] [int] NOT NULL,
	[继教权限编号] [int] NOT NULL,
 CONSTRAINT [PK_继培角色权限_1] PRIMARY KEY CLUSTERED 
(
	[继教角色编号] ASC,
	[继教权限编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教考试批次]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教考试批次](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[考试编号] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[考试开始时间] [datetime] NOT NULL,
	[考试结束时间] [datetime] NOT NULL,
	[考试地点] [nvarchar](1000) NOT NULL,
	[人数上限] [int] NOT NULL,
	[二维码] [nvarchar](1000) NULL,
	[口令] [nvarchar](50) NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培考试批次] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教考试批次可参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教考试批次可参与人](
	[考试批次编号] [int] NOT NULL,
	[可参与人类型] [nvarchar](50) NOT NULL,
	[可参与人编号] [int] NOT NULL,
 CONSTRAINT [PK_继培考试批次可参与人] PRIMARY KEY CLUSTERED 
(
	[考试批次编号] ASC,
	[可参与人类型] ASC,
	[可参与人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教科室](
	[编号] [int] NOT NULL,
	[科室管理员编号] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继教科室] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教课后练习]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教课后练习](
	[编号] [int] NOT NULL,
	[及格分数] [int] NOT NULL,
 CONSTRAINT [PK_继教课后练习] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教课后练习参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教课后练习参与情况](
	[编号] [int] NOT NULL,
	[课后练习编号] [int] NOT NULL,
	[参与人类型] [nvarchar](50) NOT NULL,
	[参与人编号] [int] NOT NULL,
	[参与时间] [datetime] NOT NULL,
	[得分] [int] NOT NULL,
 CONSTRAINT [PK_继培课后练习参与情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教课后练习答题答案]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[继教课后练习答题答案](
	[课后练习答题情况编号] [int] NOT NULL,
	[答题答案编码] [varchar](1) NOT NULL,
 CONSTRAINT [PK_继培课后练习答题答案] PRIMARY KEY CLUSTERED 
(
	[课后练习答题情况编号] ASC,
	[答题答案编码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[继教课后练习答题情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教课后练习答题情况](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[课后练习参与情况编号] [int] NOT NULL,
	[试题编号] [int] NOT NULL,
	[显示排序值] [int] NOT NULL,
	[纠错] [nvarchar](1000) NULL,
	[答题时间] [datetime] NOT NULL,
	[是否正确] [bit] NOT NULL,
	[得分] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培课后练习答题情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教课后练习试题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教课后练习试题](
	[课后练习编号] [int] NOT NULL,
	[试题编号] [int] NOT NULL,
	[分值] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培课后练习试题] PRIMARY KEY CLUSTERED 
(
	[课后练习编号] ASC,
	[试题编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教理论考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教理论考试](
	[编号] [int] NOT NULL,
	[是否允许任何人参与] [bit] NOT NULL,
	[试卷编号] [int] NOT NULL,
	[时长] [int] NOT NULL,
	[及格分数] [int] NOT NULL,
	[是否试题乱序] [bit] NOT NULL,
	[是否允许考生查看成绩] [bit] NOT NULL,
	[是否允许考生查看答案] [bit] NOT NULL,
 CONSTRAINT [PK_继培理论考试] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教理论考试参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教理论考试参与情况](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[考试批次编号] [int] NOT NULL,
	[参与人类型] [nvarchar](50) NOT NULL,
	[参与人编号] [int] NOT NULL,
	[答题开始时间] [datetime] NOT NULL,
	[答题结束时间] [datetime] NULL,
	[得分] [int] NULL,
 CONSTRAINT [PK_继教理论考试参与情况] PRIMARY KEY CLUSTERED 
(
	[考试批次编号] ASC,
	[参与人类型] ASC,
	[参与人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教理论考试答题答案]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[继教理论考试答题答案](
	[理论考试答题情况编号] [int] NOT NULL,
	[答题答案编码] [varchar](1) NOT NULL,
 CONSTRAINT [PK_继培理论考试答题答案] PRIMARY KEY CLUSTERED 
(
	[理论考试答题情况编号] ASC,
	[答题答案编码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[继教理论考试答题情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教理论考试答题情况](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[理论考试参与情况编号] [int] NOT NULL,
	[试题编号] [int] NOT NULL,
	[显示排序值] [int] NOT NULL,
	[纠错] [nvarchar](1000) NULL,
	[答题时间] [datetime] NULL,
	[是否正确] [bit] NOT NULL,
	[得分] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培理论考试答题情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教慕课]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教慕课](
	[编号] [int] NOT NULL,
	[慕课素材编号] [int] NOT NULL,
	[是否允许下载] [bit] NOT NULL,
	[通过时长] [int] NOT NULL,
 CONSTRAINT [PK_继培慕课课时课件] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教慕课参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教慕课参与情况](
	[慕课编号] [int] NOT NULL,
	[参与人类型] [nvarchar](50) NOT NULL,
	[参与人编号] [int] NOT NULL,
	[学习时长] [int] NOT NULL,
 CONSTRAINT [PK_继培慕课课时课件学习情况] PRIMARY KEY CLUSTERED 
(
	[参与人类型] ASC,
	[参与人编号] ASC,
	[慕课编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教慕课素材]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教慕课素材](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[文件夹编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[路径] [nvarchar](500) NULL,
	[大小] [int] NOT NULL,
	[时长] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培慕课素材] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教能级]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教能级](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培能级] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教培训计划]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教培训计划](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[年份] [int] NOT NULL,
	[所属部门编号] [int] NOT NULL,
	[简介] [nvarchar](1000) NULL,
	[附件] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培培训计划] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教评分表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教评分表](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[文件夹编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培评分表] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教评分表项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教评分表项目](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[评分表编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培评分表项目] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教评分表项目要求]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教评分表项目要求](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[评分表项目编号] [int] NOT NULL,
	[要求] [nvarchar](1000) NOT NULL,
	[标准分] [numeric](8, 1) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培操作考试评分表项目要求] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教签到]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教签到](
	[编号] [int] NOT NULL,
 CONSTRAINT [PK_继培签到] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教签到参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教签到参与情况](
	[签到规定编号] [int] NOT NULL,
	[参与人类型] [nvarchar](50) NOT NULL,
	[参与人编号] [int] NOT NULL,
	[签到时间] [datetime] NULL,
 CONSTRAINT [PK_继培签到参与情况] PRIMARY KEY CLUSTERED 
(
	[签到规定编号] ASC,
	[参与人类型] ASC,
	[参与人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教签到规定]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教签到规定](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[签到编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[签到开始时间] [datetime] NOT NULL,
	[签到结束时间] [datetime] NOT NULL,
	[二维码变化秒数] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培签到规定] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教权限](
	[编号] [int] NOT NULL,
	[上级编号] [int] NOT NULL,
	[深度] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[组件名] [nvarchar](100) NULL,
	[是否菜单] [bit] NOT NULL,
	[图标] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_继培权限] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教人员](
	[编号] [int] NOT NULL,
	[能级编号] [int] NULL,
 CONSTRAINT [PK_继培人员] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教人员角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教人员角色](
	[继教角色编号] [int] NOT NULL,
	[人员编号] [int] NOT NULL,
 CONSTRAINT [PK_继培人员角色_1] PRIMARY KEY CLUSTERED 
(
	[继教角色编号] ASC,
	[人员编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教设置]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教设置](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[课时课件通过时长百分比] [int] NOT NULL,
	[理论考试及格分百分比] [int] NOT NULL,
	[最大允许离开界面次数] [int] NOT NULL,
 CONSTRAINT [PK_继教设置] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试卷]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教试卷](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[文件夹编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[描述] [nvarchar](1000) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培试卷] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试卷结构]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教试卷结构](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[试卷编号] [int] NOT NULL,
	[类型编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[排序值] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培试卷结构] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试卷试题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教试卷试题](
	[试卷结构编号] [int] NOT NULL,
	[试题编号] [int] NOT NULL,
	[分值] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[备注] [nchar](10) NULL,
 CONSTRAINT [PK_继教试卷试题] PRIMARY KEY CLUSTERED 
(
	[试卷结构编号] ASC,
	[试题编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教试题](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[文件夹编号] [int] NOT NULL,
	[类型编号] [int] NOT NULL,
	[题干] [nvarchar](1000) NOT NULL,
	[题目解析] [nvarchar](1000) NULL,
	[难易度] [nvarchar](50) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培试题] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试题备选答案]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[继教试题备选答案](
	[试题编号] [int] NOT NULL,
	[备选答案编码] [varchar](1) NOT NULL,
	[备选答案内容] [nvarchar](1000) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培试题备选答案] PRIMARY KEY CLUSTERED 
(
	[试题编号] ASC,
	[备选答案编码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[继教试题标签]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教试题标签](
	[标签编号] [int] NOT NULL,
	[试题编号] [int] NOT NULL,
 CONSTRAINT [PK_继培试题标签] PRIMARY KEY CLUSTERED 
(
	[标签编号] ASC,
	[试题编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试题类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教试题类型](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[最小答案数] [int] NOT NULL,
	[最大答案数] [int] NOT NULL,
	[分值] [int] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培试题类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教试题正确答案]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[继教试题正确答案](
	[试题编号] [int] NOT NULL,
	[正确答案编码] [varchar](1) NOT NULL,
 CONSTRAINT [PK_继培试题正确答案] PRIMARY KEY CLUSTERED 
(
	[试题编号] ASC,
	[正确答案编码] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[继教微信角色权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教微信角色权限](
	[继教角色编号] [int] NOT NULL,
	[继教微信权限编号] [int] NOT NULL,
 CONSTRAINT [PK_继培微信端角色权限_1] PRIMARY KEY CLUSTERED 
(
	[继教角色编号] ASC,
	[继教微信权限编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教微信权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教微信权限](
	[编号] [int] NOT NULL,
	[上级编号] [int] NOT NULL,
	[深度] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[组件名] [nvarchar](100) NULL,
	[是否菜单] [bit] NOT NULL,
	[图标] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教文件夹]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教文件夹](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[父编号] [int] NOT NULL,
	[类型] [nvarchar](100) NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[完整路径名] [nvarchar](1000) NULL,
	[排序值] [int] NOT NULL,
	[层级] [int] NOT NULL,
	[归属人类型] [nvarchar](100) NOT NULL,
	[归属人编号] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_继培文件夹] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教文件夹可使用人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教文件夹可使用人](
	[文件夹编号] [int] NOT NULL,
	[可使用人类型] [nvarchar](100) NOT NULL,
	[可使用人编号] [int] NOT NULL,
 CONSTRAINT [PK_继培文件夹可使用人] PRIMARY KEY CLUSTERED 
(
	[文件夹编号] ASC,
	[可使用人类型] ASC,
	[可使用人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[继教助教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[继教助教老师](
	[科室编号] [int] NOT NULL,
	[助教老师编号] [int] NOT NULL,
 CONSTRAINT [PK_继教助教老师] PRIMARY KEY CLUSTERED 
(
	[科室编号] ASC,
	[助教老师编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[讲座反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[讲座反馈](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[讲座编号] [int] NOT NULL,
	[专家姓名] [nvarchar](50) NULL,
	[专家身份证号码] [nvarchar](50) NULL,
	[专家护照号] [nvarchar](50) NULL,
	[专家联系方式] [nvarchar](50) NULL,
	[专家讲课费金额] [numeric](18, 2) NULL,
	[结算方式] [nvarchar](50) NULL,
	[活动持续分钟] [int] NOT NULL,
	[参会人数] [int] NOT NULL,
	[讲座附件路径] [nvarchar](max) NULL,
	[讲座效果] [nvarchar](500) NULL,
 CONSTRAINT [PK_讲座反馈] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[角色](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_角色] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[角色权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[角色权限](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[角色编号] [int] NOT NULL,
	[权限编号] [int] NOT NULL,
 CONSTRAINT [PK_角色权限] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学360评价]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学360评价](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[来源类型] [int] NOT NULL,
	[评价人编号] [int] NOT NULL,
	[目标类型] [int] NOT NULL,
	[被评价人编号] [int] NOT NULL,
	[评价内容] [nvarchar](500) NULL,
	[评价时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学360评价] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学360评价方向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学360评价方向](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[来源类型] [int] NOT NULL,
	[目标类型] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学360评价方向] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学360评价分类]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学360评价分类](
	[编号] [int] NOT NULL,
	[目标类型] [int] NOT NULL,
	[名称] [nvarchar](200) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学360评价分类] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学360评价评分]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学360评价评分](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学360评价编号] [int] NOT NULL,
	[教学360评价项目编号] [int] NOT NULL,
	[评分] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学360评价评分] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学360评价项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学360评价项目](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学360评价分类编号] [int] NOT NULL,
	[名称] [nvarchar](200) NOT NULL,
	[标准分] [int] NOT NULL,
	[是否启用] [bit] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学360评价项目] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学本院策略]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学本院策略](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[教学专业编号] [int] NOT NULL,
	[专业基地管理员编号] [int] NULL,
	[是否启用] [bit] NOT NULL,
	[建立日期] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学专业本院策略] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学本院科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学本院科室](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学本院策略编号] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[教学专业科室编号] [int] NOT NULL,
	[本院科室编号] [int] NOT NULL,
	[是否必选] [bit] NOT NULL,
	[培训时长] [int] NOT NULL,
	[最低管床数量] [int] NOT NULL,
	[最低全程管理数量] [int] NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学本院科室] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学本院科室任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学本院科室任务](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学本院科室编号] [int] NOT NULL,
	[项目名称] [nvarchar](50) NOT NULL,
	[任务类型编号] [int] NOT NULL,
	[是否门诊] [bit] NOT NULL,
	[是否病房] [bit] NOT NULL,
	[是否医技] [bit] NOT NULL,
	[最低评分要求] [int] NOT NULL,
	[数量要求] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学本院科室任务] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学病人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学病人](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[性别] [nvarchar](10) NULL,
	[出生日期] [date] NULL,
	[住院号] [nvarchar](50) NULL,
	[住院床号] [nvarchar](50) NULL,
	[主要诊断] [nvarchar](500) NULL,
	[次要诊断] [nvarchar](500) NULL,
	[入院日期] [date] NULL,
	[出院日期] [date] NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学病人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学补轮转]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学补轮转](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[说明] [nvarchar](500) NULL,
	[开始日期] [date] NOT NULL,
	[结束日期] [date] NOT NULL,
	[建立人] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学补轮转] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学出科申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学出科申请](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[申请出科日期] [date] NOT NULL,
	[出科小结] [nvarchar](500) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学出科申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学带教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学带教老师](
	[教学科室编号] [int] NOT NULL,
	[带教老师编号] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学带教老师_1] PRIMARY KEY CLUSTERED 
(
	[教学科室编号] ASC,
	[带教老师编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学更换带教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学更换带教老师](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[原带教老师编号] [int] NOT NULL,
	[新带教老师编号] [int] NOT NULL,
	[建立人] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学更换带教老师] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学管床病人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学管床病人](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[病人编号] [int] NOT NULL,
	[是否全程陪护] [bit] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学管床病人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学活动](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[活动主题] [nvarchar](200) NOT NULL,
	[活动开始时间] [datetime] NOT NULL,
	[活动结束时间] [datetime] NOT NULL,
	[活动地点] [nvarchar](200) NOT NULL,
	[教学活动类型编号] [int] NOT NULL,
	[主讲人编号] [int] NULL,
	[主讲人姓名] [nvarchar](50) NULL,
	[主讲人职称] [nvarchar](50) NULL,
	[活动内容] [nvarchar](2000) NULL,
	[教学病例] [nvarchar](200) NULL,
	[病人编号] [int] NULL,
	[附件] [nvarchar](max) NULL,
	[建立人] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学活动] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学活动反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学活动反馈](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学活动编号] [int] NOT NULL,
	[学员编号] [int] NOT NULL,
	[反馈内容] [nvarchar](2000) NOT NULL,
	[附件] [nvarchar](200) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学活动反馈] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学活动可参与者]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学活动可参与者](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学活动编号] [int] NOT NULL,
	[学员编号] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学活动可参与者] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学活动类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学活动类型](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[活动内容模板] [nvarchar](2000) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学活动类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学活动评价]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学活动评价](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[评价人类型] [nvarchar](50) NOT NULL,
	[评价人编号] [int] NOT NULL,
	[教学活动编号] [int] NOT NULL,
	[教学活动评价项目编号] [int] NOT NULL,
	[评分] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学活动评价] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学活动评价项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学活动评价项目](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学活动类型编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[标准分] [int] NOT NULL,
	[是否启用] [bit] NOT NULL,
	[说明] [nvarchar](500) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学活动评价项目] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学角色](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[能否直接配置人员] [bit] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学角色] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学角色权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学角色权限](
	[教学角色编号] [int] NOT NULL,
	[教学权限编号] [int] NOT NULL,
 CONSTRAINT [PK_教学角色权限_1] PRIMARY KEY CLUSTERED 
(
	[教学角色编号] ASC,
	[教学权限编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学结业申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学结业申请](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[学员编号] [int] NOT NULL,
	[说明] [nvarchar](500) NULL,
	[申请结业日期] [date] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学结业申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学考勤类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学考勤类型](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学出勤类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学考勤情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学考勤情况](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[考勤日期] [date] NOT NULL,
	[教学考勤类型编号] [int] NOT NULL,
	[说明] [nvarchar](500) NULL,
	[建立人] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学出勤情况] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学考试成绩]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学考试成绩](
	[编号] [int] NOT NULL,
	[理论考试成绩] [int] NULL,
	[技能考试成绩] [int] NULL,
	[建立人] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学考试成绩] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学科室](
	[编号] [int] NOT NULL,
	[科室管理员编号] [int] NULL,
	[最大学员人数] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学科室] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学轮转]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学轮转](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[学员编号] [int] NOT NULL,
	[计划入科日期] [date] NOT NULL,
	[计划出科日期] [date] NOT NULL,
	[实际入科日期] [date] NULL,
	[实际出科日期] [date] NULL,
	[教学本院科室编号] [int] NOT NULL,
	[带教老师编号] [int] NULL,
	[最低管床数量] [int] NOT NULL,
	[最低全程管理数量] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学轮转] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学轮转任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学轮转任务](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[项目名称] [nvarchar](50) NOT NULL,
	[任务类型编号] [int] NOT NULL,
	[是否门诊] [bit] NOT NULL,
	[是否病房] [bit] NOT NULL,
	[是否医技] [bit] NOT NULL,
	[最低评分要求] [int] NOT NULL,
	[数量要求] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学轮转任务] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学轮转手册]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学轮转手册](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[教学轮转手册类型编号] [int] NOT NULL,
	[教学专业科室任务类型编号] [int] NULL,
	[操作时间] [datetime] NULL,
	[病人编号] [int] NULL,
	[概要] [nvarchar](200) NULL,
	[内容] [nvarchar](max) NULL,
	[附件] [nvarchar](200) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学病例] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学轮转手册类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学轮转手册类型](
	[编号] [int] NOT NULL,
	[分类] [nvarchar](50) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[是否门诊] [bit] NULL,
	[是否病床] [bit] NULL,
	[是否医技] [bit] NULL,
	[内容模板] [nvarchar](max) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学轮转手册类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学轮转手册完成任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学轮转手册完成任务](
	[教学轮转手册编号] [int] NOT NULL,
	[教学轮转任务编号] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学轮转手册完成任务] PRIMARY KEY CLUSTERED 
(
	[教学轮转手册编号] ASC,
	[教学轮转任务编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学评分等级]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学评分等级](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[等级名称] [nvarchar](50) NOT NULL,
	[最小分值] [int] NOT NULL,
	[最大分值] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学评分等级] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学请假申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学请假申请](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[请假开始日期] [date] NOT NULL,
	[请假天数] [int] NOT NULL,
	[请假事由] [nvarchar](500) NOT NULL,
	[建立人] [int] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学请假申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学权限](
	[编号] [int] NOT NULL,
	[上级编号] [int] NOT NULL,
	[深度] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[PC端组件名] [nvarchar](100) NULL,
	[移动端组件名] [nvarchar](100) NULL,
	[是否菜单] [bit] NOT NULL,
	[图标] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学权限] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学人员角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学人员角色](
	[教学角色编号] [int] NOT NULL,
	[人员编号] [int] NOT NULL,
 CONSTRAINT [PK_教学人员角色_1] PRIMARY KEY CLUSTERED 
(
	[教学角色编号] ASC,
	[人员编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学通知公告]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学通知公告](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[通知类型] [nvarchar](50) NOT NULL,
	[发送人编号] [int] NOT NULL,
	[通知名称] [nvarchar](100) NOT NULL,
	[关闭时间] [datetime] NOT NULL,
	[相关文件路径] [nvarchar](500) NULL,
	[通知内容] [nvarchar](max) NULL,
	[已接收人数] [int] NOT NULL,
	[是否启用] [bit] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
	[是否必读] [bit] NULL,
 CONSTRAINT [PK_教学通知公告] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学通知公告接收条件]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学通知公告接收条件](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学通知公告编号] [int] NOT NULL,
	[接收者类型] [nvarchar](50) NULL,
	[接收者编号] [int] NOT NULL,
 CONSTRAINT [PK_教学通知公告接收条件] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学通知公告已接收人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学通知公告已接收人](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学通知公告编号] [int] NOT NULL,
	[接收人类型] [nvarchar](50) NOT NULL,
	[接收人编号] [int] NOT NULL,
 CONSTRAINT [PK_教学通知公告已接收人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学退培申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学退培申请](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[学员编号] [int] NOT NULL,
	[说明] [nvarchar](500) NULL,
	[申请退培日期] [date] NOT NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学退培申请] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学宿舍楼]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学宿舍楼](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[层数] [int] NULL,
	[单元数] [int] NULL,
	[每单元每层户数] [int] NULL,
	[每户床数] [int] NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学宿舍楼] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学学员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学学员](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[来源学校编号] [int] NULL,
	[来源学生编号] [int] NULL,
	[学员类型编号] [int] NOT NULL,
	[工号] [nvarchar](50) NOT NULL,
	[密码] [nvarchar](50) NULL,
	[头像路径] [nvarchar](100) NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[性别] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[证件类型] [nvarchar](50) NULL,
	[证件号码] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[手机号码] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[电子邮箱] [nvarchar](50) NULL,
	[QQ号码] [nvarchar](50) NULL,
	[微信号] [nvarchar](50) NULL,
	[家庭住址] [nvarchar](50) NULL,
	[取得执业证书日期] [date] NULL,
	[执业证书编号] [nvarchar](50) NULL,
	[取得医师资格证书日期] [date] NULL,
	[医师资格证书编号] [nvarchar](50) NULL,
	[最高学历] [nvarchar](50) NULL,
	[毕业年份] [int] NULL,
	[毕业学校] [nvarchar](100) NULL,
	[毕业专业] [nvarchar](100) NULL,
	[毕业证编码] [nvarchar](100) NULL,
	[学位证编码] [nvarchar](100) NULL,
	[学员培训年界] [int] NOT NULL,
	[学员培训年限] [int] NOT NULL,
	[往届应届] [nvarchar](50) NULL,
	[专业编号] [int] NOT NULL,
	[送培方式] [nvarchar](50) NULL,
	[工作单位] [nvarchar](100) NULL,
	[医疗卫生机构] [nvarchar](100) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学学员] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学学员类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学学员类型](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_学员类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学学员培训]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学学员培训](
	[编号] [int] NOT NULL,
	[报到时间] [datetime] NULL,
	[教学本院策略编号] [int] NULL,
	[实际开始培训日期] [date] NULL,
	[实际结束培训日期] [date] NULL,
	[退培日期] [date] NULL,
	[结业日期] [date] NULL,
	[证书] [nvarchar](200) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学学员培训] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学学员宿舍安排]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学学员宿舍安排](
	[编号] [int] NOT NULL,
	[宿舍楼编号] [int] NOT NULL,
	[门禁卡卡号] [nvarchar](50) NULL,
	[门牌号及床号] [nvarchar](50) NULL,
	[职位] [nvarchar](50) NULL,
	[水起数] [numeric](18, 2) NULL,
	[电起数] [numeric](18, 2) NULL,
	[气起数] [numeric](18, 2) NULL,
	[滞纳金比例] [numeric](18, 2) NULL,
	[入住日期] [date] NULL,
	[退出日期] [date] NULL,
	[退出原因] [nvarchar](500) NULL,
	[宿舍安排说明] [nvarchar](500) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学学院宿舍安排] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学医疗差错及事故记录]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学医疗差错及事故记录](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学轮转编号] [int] NOT NULL,
	[处理日期] [date] NOT NULL,
	[处理类别] [nvarchar](50) NOT NULL,
	[处理原因] [nvarchar](500) NOT NULL,
	[处理意见] [nvarchar](500) NOT NULL,
	[附件] [nvarchar](200) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学医疗差错及事故记录] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学专业]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学专业](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[年份] [int] NOT NULL,
	[是否国家标准] [bit] NOT NULL,
	[标准代码] [nvarchar](50) NULL,
	[最低培训时长] [int] NULL,
	[学习要求及目标] [nvarchar](max) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学专业] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学专业科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学专业科室](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学专业编号] [int] NOT NULL,
	[排序值] [int] NOT NULL,
	[科室名称] [nvarchar](50) NOT NULL,
	[最低培训时长] [int] NOT NULL,
	[最低管床数量] [int] NOT NULL,
	[最低全程管理数量] [int] NOT NULL,
	[科室要求] [nvarchar](max) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学专业科室] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学专业科室任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学专业科室任务](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学专业科室编号] [int] NOT NULL,
	[项目名称] [nvarchar](50) NOT NULL,
	[任务类型编号] [int] NOT NULL,
	[是否门诊] [bit] NOT NULL,
	[是否病房] [bit] NOT NULL,
	[是否医技] [bit] NOT NULL,
	[最低评分要求] [int] NOT NULL,
	[数量要求] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学专业科室任务] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学专业科室任务类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学专业科室任务类型](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学专业科室任务类型] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[教学专业科室要求]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[教学专业科室要求](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[教学专业科室编号] [int] NOT NULL,
	[项目名称] [nvarchar](500) NOT NULL,
	[说明] [nvarchar](200) NULL,
	[最低评分要求] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_教学专业科室要求] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[经费模版]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[经费模版](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_经费模版] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[经费模版项目支出类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[经费模版项目支出类型](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[所属经费模版编号] [int] NOT NULL,
	[项目支出类型] [nvarchar](100) NOT NULL,
	[经费占比] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_经费模版支出科目] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[经费模版项目支出内容]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[经费模版项目支出内容](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[所属经费模版项目支出类型编号] [int] NOT NULL,
	[项目支出内容] [nvarchar](100) NOT NULL,
	[财务科目] [nvarchar](100) NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_经费模版项目支出内容] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[来源表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[来源表](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_来源表] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[流程]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[流程](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[发起人编号] [int] NOT NULL,
	[状态] [int] NOT NULL,
	[创建时间] [datetime] NOT NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_流程] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[流程模板]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[流程模板](
	[编号] [int] NOT NULL,
	[名称] [nvarchar](100) NOT NULL,
	[路径] [nvarchar](100) NOT NULL,
	[期限天数] [int] NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_流程模板] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[期刊]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[期刊](
	[编号] [int] IDENTITY(10000,1) NOT NULL,
	[代码] [nvarchar](50) NULL,
	[名称] [nvarchar](500) NULL,
	[英文刊名] [nvarchar](500) NULL,
	[主办单位] [nvarchar](500) NULL,
	[期刊系列] [nvarchar](500) NULL,
	[收录情况] [nvarchar](1000) NULL,
	[语种] [nvarchar](50) NULL,
	[JCR分区] [nvarchar](50) NULL,
	[编目名称] [nvarchar](100) NULL,
	[编目类别] [nvarchar](100) NULL,
	[年度] [int] NULL,
	[创刊日期] [date] NULL,
	[被引用次数] [int] NULL,
	[影响因子] [numeric](18, 3) NULL,
	[特征因子分值] [numeric](18, 3) NULL,
	[ISSN号] [nvarchar](50) NULL,
	[CN号] [nvarchar](50) NULL,
	[出版周期] [nvarchar](50) NULL,
	[出版地] [nvarchar](50) NULL,
	[开本] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
	[PMID] [int] NULL,
	[DOI] [nvarchar](100) NULL,
	[UT] [nvarchar](100) NULL,
 CONSTRAINT [PK_期刊] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[区域]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[区域](
	[编号] [int] IDENTITY(20000,1) NOT NULL,
	[名称] [nvarchar](500) NOT NULL,
	[级别] [int] NOT NULL,
	[上级编号] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_区域] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[权限](
	[编号] [int] NOT NULL,
	[上级编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[路径] [nvarchar](500) NULL,
	[类型] [bit] NOT NULL,
	[排序] [int] NOT NULL,
	[图标] [nvarchar](50) NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_权限] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[人员](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[工号] [nvarchar](50) NOT NULL,
	[密码] [nvarchar](50) NOT NULL,
	[姓名] [nvarchar](50) NOT NULL,
	[部门编号] [int] NOT NULL,
	[英文名] [nvarchar](50) NULL,
	[性别] [nvarchar](50) NULL,
	[身份证] [nvarchar](50) NULL,
	[出生日期] [date] NULL,
	[入职日期] [date] NULL,
	[手机] [nvarchar](50) NULL,
	[QQ] [nvarchar](50) NULL,
	[邮箱] [nvarchar](50) NULL,
	[籍贯] [nvarchar](50) NULL,
	[毕业日期] [date] NULL,
	[合同开始日期] [date] NULL,
	[合同结束日期] [date] NULL,
	[参加工作日期] [date] NULL,
	[专业技术获得日期] [date] NULL,
	[职务任职日期] [date] NULL,
	[学位] [nvarchar](50) NULL,
	[学历] [nvarchar](50) NULL,
	[政治面貌] [nvarchar](50) NULL,
	[技术职称类别] [nvarchar](100) NULL,
	[技术职称] [nvarchar](100) NULL,
	[第二技术职称类别] [nvarchar](100) NULL,
	[第二技术职称] [nvarchar](100) NULL,
	[婚姻情况] [nvarchar](50) NULL,
	[学制] [nvarchar](50) NULL,
	[学历性质] [nvarchar](50) NULL,
	[学习形式] [nvarchar](50) NULL,
	[人员类别] [nvarchar](50) NULL,
	[个人身份] [nvarchar](50) NULL,
	[民族] [nvarchar](50) NULL,
	[专业技术级别] [nvarchar](50) NULL,
	[所学专业名称] [nvarchar](50) NULL,
	[岗位性质] [nvarchar](50) NULL,
	[职务名称] [nvarchar](50) NULL,
	[职务级别] [nvarchar](50) NULL,
	[岗位名称] [nvarchar](50) NULL,
	[岗位类型] [nvarchar](50) NULL,
	[学科门类] [nvarchar](50) NULL,
	[一级学科] [nvarchar](50) NULL,
	[二级学科] [nvarchar](50) NULL,
	[三级学科] [nvarchar](50) NULL,
	[人员类型] [nvarchar](50) NULL,
	[获得最高学历的院校] [nvarchar](100) NULL,
	[获得最高学位的院校] [nvarchar](100) NULL,
	[住宅地址] [nvarchar](100) NULL,
	[学术特长] [nvarchar](1000) NULL,
	[研究方向] [nvarchar](1000) NULL,
	[个人获得的荣誉和奖项] [nvarchar](1000) NULL,
	[备注] [nvarchar](500) NULL,
	[是否启用] [bit] NOT NULL,
 CONSTRAINT [PK_人员] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[人员角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[人员角色](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[角色编号] [int] NOT NULL,
	[人员编号] [int] NOT NULL,
 CONSTRAINT [PK_人员角色] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[任职]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[任职](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[任职开始时间] [datetime] NOT NULL,
	[任职截止时间] [datetime] NULL,
	[任职人员编号] [int] NOT NULL,
	[任职团体名称] [nvarchar](200) NOT NULL,
	[所任职务] [nvarchar](200) NOT NULL,
	[相关文件路径] [nvarchar](max) NULL,
	[建立时间] [datetime] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_任职] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[通知公告]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[通知公告](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[通知类型] [nvarchar](50) NOT NULL,
	[通知标识] [nvarchar](50) NULL,
	[发送人编号] [int] NOT NULL,
	[通知名称] [nvarchar](100) NOT NULL,
	[关闭时间] [datetime] NOT NULL,
	[相关文件路径] [nvarchar](500) NULL,
	[通知内容] [nvarchar](max) NULL,
	[接收人数] [int] NOT NULL,
	[已接收人数] [int] NOT NULL,
	[是否启用] [bit] NOT NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL,
	[是否必读] [bit] NULL,
 CONSTRAINT [PK_通知公告] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[通知公告接收条件]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[通知公告接收条件](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[通知公告编号] [int] NOT NULL,
	[接收者类型] [int] NOT NULL,
	[接收者编号] [int] NOT NULL,
 CONSTRAINT [PK_通知公告接收条件] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[通知公告已接收人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[通知公告已接收人](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[通知公告编号] [int] NOT NULL,
	[接收人编号] [int] NOT NULL,
 CONSTRAINT [PK_通知公告已接收人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[下载中心]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[下载中心](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[文件名称] [nvarchar](200) NOT NULL,
	[文件类型] [nvarchar](50) NOT NULL,
	[文件路径] [nvarchar](500) NOT NULL,
	[是否启用] [bit] NOT NULL,
	[上传人编号] [int] NOT NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_下载中心] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[项目参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目参与人](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[参与人编号] [int] NOT NULL,
	[工作量占比] [int] NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_项目参与人] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[项目分类]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目分类](
	[编号] [int] IDENTITY(20000,1) NOT NULL,
	[上级编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[级别] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_项目分类] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[项目计划]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目计划](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[开始日期] [date] NOT NULL,
	[结束日期] [date] NOT NULL,
	[计划内容] [nvarchar](1000) NULL,
 CONSTRAINT [PK_项目计划] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[项目经费到账]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目经费到账](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[拨款单位] [nvarchar](100) NOT NULL,
	[到账日期] [date] NOT NULL,
	[到账金额] [numeric](18, 2) NOT NULL,
	[技术交易额] [numeric](18, 2) NOT NULL,
	[管理费用] [numeric](18, 2) NOT NULL,
	[技术合同认定服务费] [numeric](18, 2) NOT NULL,
	[增值税] [numeric](18, 2) NOT NULL,
	[到账单位] [nvarchar](100) NULL,
	[经办人编号] [int] NOT NULL,
	[到账凭证路径] [nvarchar](max) NOT NULL,
	[建立时间] [datetime] NULL,
	[备注] [nvarchar](1000) NULL,
 CONSTRAINT [PK_项目经费到账] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[项目经费预算]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目经费预算](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[项目支出类型] [nvarchar](100) NOT NULL,
	[项目支出内容] [nvarchar](100) NOT NULL,
	[财务科目] [nvarchar](100) NOT NULL,
	[批准经费] [numeric](18, 2) NULL,
	[配套经费] [numeric](18, 2) NULL,
	[编制依据] [nvarchar](100) NULL,
 CONSTRAINT [PK_纵向项目立项经费预算] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[项目预期成果]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[项目预期成果](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[预期成果] [nvarchar](1000) NULL,
 CONSTRAINT [PK_项目预期成果] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[学科]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[学科](
	[编号] [int] IDENTITY(20000,1) NOT NULL,
	[上级编号] [int] NOT NULL,
	[名称] [nvarchar](50) NOT NULL,
	[级别] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [nvarchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[主办讲座]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[主办讲座](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[活动名称] [nvarchar](500) NOT NULL,
	[所属部门编号] [int] NULL,
	[活动经费] [numeric](18, 2) NULL,
	[会议类型] [nvarchar](50) NULL,
	[活动对象] [nvarchar](500) NULL,
	[开始时间] [datetime] NOT NULL,
	[结束时间] [datetime] NOT NULL,
	[主办人编号] [int] NOT NULL,
	[主讲人姓名] [nvarchar](50) NULL,
	[主讲人国别] [nvarchar](50) NULL,
	[主讲人单位] [nvarchar](50) NULL,
	[主讲人学位] [nvarchar](50) NULL,
	[主讲人职称] [nvarchar](50) NULL,
	[主讲人简历路径] [nvarchar](max) NULL,
	[讲座地点] [nvarchar](500) NULL,
	[内容概述] [nvarchar](500) NULL,
 CONSTRAINT [PK_主办讲座] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[专家评分]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[专家评分](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[流程模板编号] [int] NOT NULL,
	[项目编号] [int] NOT NULL,
	[专家编号] [int] NOT NULL,
	[评分项] [nvarchar](100) NOT NULL,
	[评分] [nvarchar](50) NOT NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_专家评分] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[字典]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[字典](
	[编号] [int] IDENTITY(600001,1) NOT NULL,
	[分类] [nvarchar](50) NOT NULL,
	[值] [nvarchar](50) NOT NULL,
	[上级编号] [int] NOT NULL,
	[级别] [int] NOT NULL,
	[排序] [int] NOT NULL,
	[备注] [nvarchar](500) NULL,
 CONSTRAINT [PK_字典] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[纵向项目变更]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[纵向项目变更](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[变更内容简介] [nvarchar](1000) NULL,
	[变更事由] [nvarchar](1000) NULL,
	[变更备注] [nvarchar](1000) NULL,
	[变更时间] [datetime] NOT NULL,
	[纵向项目编号] [int] NOT NULL,
	[分类] [int] NOT NULL,
	[项目登记情况] [nvarchar](50) NULL,
	[项目编号] [nvarchar](50) NULL,
	[项目中文名称] [nvarchar](100) NULL,
	[项目英文名称] [nvarchar](100) NULL,
	[项目分类] [nvarchar](50) NULL,
	[成果归属部门] [nvarchar](500) NULL,
	[负责人编号] [int] NULL,
	[立项年度] [int] NOT NULL,
	[登记日期] [date] NOT NULL,
	[登记人编号] [int] NOT NULL,
	[批准日期] [date] NOT NULL,
	[批准经费] [numeric](18, 2) NULL,
	[配套经费] [numeric](18, 2) NULL,
	[经费卡号] [nvarchar](50) NULL,
	[项目等级] [nvarchar](50) NULL,
	[计划开始日期] [date] NOT NULL,
	[计划完成日期] [date] NOT NULL,
	[学科门类] [nvarchar](50) NOT NULL,
	[学科类型] [nvarchar](50) NOT NULL,
	[研究类型] [nvarchar](50) NOT NULL,
	[项目类型] [nvarchar](50) NOT NULL,
	[项目级别] [nvarchar](50) NOT NULL,
	[项目来源单位] [nvarchar](50) NOT NULL,
	[项目类别] [nvarchar](50) NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](100) NULL,
	[亚类说明] [nvarchar](500) NULL,
	[附注说明] [nvarchar](500) NULL,
	[纵向项目合同类型] [nvarchar](50) NULL,
	[国民经济行业] [nvarchar](50) NULL,
	[合作形式] [nvarchar](50) NULL,
	[社会经济目标] [nvarchar](1000) NULL,
	[是否需要伦理评审] [bit] NULL,
	[是否需要伦理批文] [bit] NULL,
	[伦理批文编号] [nvarchar](50) NULL,
	[伦理批文时间] [datetime] NULL,
	[伦理批文路径] [nvarchar](max) NULL,
	[立项文件路径] [nvarchar](max) NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_纵向项目变更] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[纵向项目结题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[纵向项目结题](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[纵向项目编号] [int] NOT NULL,
	[结题验收编号] [nvarchar](100) NULL,
	[结题验收时间] [datetime] NULL,
	[结题验收是否合格] [bit] NULL,
	[结题验收参与人数] [int] NULL,
	[结题资料路径] [nvarchar](1000) NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_纵向项目结题] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[纵向项目立项]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[纵向项目立项](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[分类] [int] NOT NULL,
	[项目登记情况] [nvarchar](50) NULL,
	[项目编号] [nvarchar](50) NULL,
	[项目中文名称] [nvarchar](100) NULL,
	[项目英文名称] [nvarchar](100) NULL,
	[项目分类] [nvarchar](50) NULL,
	[成果归属部门] [nvarchar](500) NULL,
	[负责人编号] [int] NULL,
	[立项年度] [int] NOT NULL,
	[登记日期] [date] NOT NULL,
	[登记人编号] [int] NOT NULL,
	[批准日期] [date] NOT NULL,
	[批准经费] [numeric](18, 2) NULL,
	[配套经费] [numeric](18, 2) NULL,
	[经费卡号] [nvarchar](50) NULL,
	[项目等级] [nvarchar](50) NULL,
	[计划开始日期] [date] NOT NULL,
	[计划完成日期] [date] NOT NULL,
	[学科门类] [nvarchar](50) NOT NULL,
	[学科类型] [nvarchar](50) NOT NULL,
	[研究类型] [nvarchar](50) NOT NULL,
	[项目类型] [nvarchar](50) NOT NULL,
	[项目级别] [nvarchar](50) NOT NULL,
	[项目来源单位] [nvarchar](50) NOT NULL,
	[项目类别] [nvarchar](50) NULL,
	[档案编号] [nvarchar](50) NULL,
	[财务简称] [nvarchar](100) NULL,
	[亚类说明] [nvarchar](500) NULL,
	[附注说明] [nvarchar](500) NULL,
	[纵向项目合同类型] [nvarchar](50) NULL,
	[国民经济行业] [nvarchar](50) NULL,
	[合作形式] [nvarchar](50) NULL,
	[社会经济目标] [nvarchar](1000) NULL,
	[是否需要伦理评审] [bit] NULL,
	[是否需要伦理批文] [bit] NULL,
	[伦理批文编号] [nvarchar](50) NULL,
	[伦理批文时间] [datetime] NULL,
	[伦理批文路径] [nvarchar](max) NULL,
	[立项文件路径] [nvarchar](max) NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_纵向项目立项] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[纵向项目申报]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[纵向项目申报](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[分类] [int] NOT NULL,
	[项目名称] [nvarchar](100) NOT NULL,
	[申报人编号] [int] NOT NULL,
	[学科门类] [nvarchar](50) NULL,
	[学科类型] [nvarchar](50) NULL,
	[申报年度] [int] NOT NULL,
	[项目类型] [nvarchar](50) NULL,
	[项目级别] [nvarchar](50) NULL,
	[项目来源单位] [nvarchar](50) NULL,
	[项目类别] [nvarchar](50) NULL,
	[申报时间] [datetime] NULL,
	[申请经费] [numeric](18, 2) NOT NULL,
	[计划开始日期] [date] NOT NULL,
	[计划完成日期] [date] NOT NULL,
	[项目等级] [nvarchar](50) NULL,
	[是否委托外单位进行实验或实验分析] [bit] NULL,
	[实验委托检测内容] [nvarchar](1000) NULL,
	[项目摘要] [nvarchar](1000) NULL,
	[是否需要伦理评审] [bit] NULL,
	[是否需要伦理批文] [bit] NULL,
	[伦理批文编号] [nvarchar](50) NULL,
	[伦理批文路径] [nvarchar](max) NULL,
	[项目申报书路径] [nvarchar](max) NULL,
	[备注] [nvarchar](500) NULL,
	[建立时间] [datetime] NULL,
	[是否立项] [bit] NULL,
 CONSTRAINT [PK_纵向项目申报] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[纵向项目中检]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[纵向项目中检](
	[编号] [int] IDENTITY(1,1) NOT NULL,
	[纵向项目编号] [int] NOT NULL,
	[中检资料路径] [nvarchar](500) NULL,
	[备注] [nvarchar](1000) NULL,
	[建立时间] [datetime] NULL,
 CONSTRAINT [PK_纵向项目中检] PRIMARY KEY CLUSTERED 
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[v1_人员_带部门名]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v1_人员_带部门名]
AS
    SELECT  a.编号 ,
            a.工号 ,
            a.密码 ,
            a.姓名 ,
            a.部门编号 ,
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
            a.是否启用 ,
            b.名称 AS 部门名称,
			CONCAT(a.工号,'/',a.姓名,'/',b.名称) AS AllName
    FROM    dbo.人员 a
            LEFT JOIN dbo.部门 b ON a.部门编号 = b.编号
			-- WHERE a.编号 <> 2;





GO
/****** Object:  View [dbo].[v2_主办讲座]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v2_主办讲座]
AS
    SELECT  a.编号 ,
            a.活动名称 ,
            a.所属部门编号 ,
			c.名称 AS 所属部门名称,
            a.活动经费 ,
            a.会议类型 ,
            a.活动对象 ,
            a.开始时间 ,
            a.结束时间 ,
            a.主办人编号 ,
            a.主讲人姓名 ,
            a.主讲人国别 ,
            a.主讲人单位 ,
            a.主讲人学位 ,
            a.主讲人职称 ,
            a.主讲人简历路径 ,
            a.讲座地点 ,
            a.内容概述 ,
            b.工号 AS 主办人工号 ,
            b.姓名 AS 主办人姓名 ,
            b.部门名称 AS 主办人部门名称
    FROM    dbo.主办讲座 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.主办人编号 = b.编号
			LEFT JOIN dbo.部门 c ON a.所属部门编号 =c.编号;






GO
/****** Object:  View [dbo].[v2_步骤]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v2_步骤]
AS
    SELECT  a.编号 ,
            b.名称 ,
            a.步骤模板编号 ,
            a.流程编号 ,
            a.状态 ,
            a.建立时间 ,
            b1.名称 AS 链接名称 ,
            b1.路径 AS 链接路径 ,
            b1.样式 AS 链接样式 ,
            a.操作人编号 ,
            c.工号 ,
            c.姓名 ,
            c.部门名称 ,
            a.执行时间 ,
            b2.操作说明 ,
            b2.操作提示 ,
            b2.状态说明 ,
            a.备注
    FROM    dbo.步骤 a
            JOIN dbo.步骤模板 b ON a.步骤模板编号 = b.编号
            LEFT JOIN dbo.步骤类型 b1 ON b.步骤类型编号 = b1.编号
            LEFT JOIN dbo.步骤类型状态 b2 ON b1.编号 = b2.步骤类型编号
                                       AND a.状态 = b2.状态值
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.操作人编号 = c.编号;




GO
/****** Object:  View [dbo].[v3_流程]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v3_流程]
AS
    SELECT  a.编号 ,
            a.流程模板编号 ,
		   --CASE a.流程模板编号 WHEN 100 THEN '人员任职申请' END AS 流程,
            c.名称 ,
            c.路径 ,
            a.项目编号 ,
            a.发起人编号 ,
            b.工号 ,
            b.姓名 ,
            b.部门名称 ,
            a.状态 ,
            CASE a.状态
              WHEN 0 THEN '未完成'
              WHEN 1 THEN '已完成'
              WHEN -2 THEN '被终止'
              WHEN -3 THEN '已过期'
            END AS 状态名称 ,
            a.创建时间 ,
            a.备注 ,
            d.流程编号 ,
            d.编号 AS 步骤编号 ,
            d.名称 AS 步骤名称 ,
            d.状态 AS 步骤状态 ,
            d.链接名称 AS 步骤链接名称 ,
            d.链接路径 AS 步骤链接路径 ,
            d.链接样式 AS 步骤链接样式 ,
            d.操作人编号 AS 步骤操作人编号 ,
            d.工号 AS 步骤操作人工号 ,
            d.姓名 AS 步骤操作人姓名 ,
            d.部门名称 AS 步骤操作人部门名称 ,
            d.执行时间 AS 步骤执行时间 ,
            d.状态说明 AS 步骤状态说明
		   --c.*
    FROM    流程 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.发起人编号 = b.编号
            JOIN dbo.流程模板 c ON a.流程模板编号 = c.编号
            OUTER APPLY ( SELECT TOP 1
                                    *
                          FROM      dbo.v2_步骤
                          WHERE     流程编号 = a.编号
                          ORDER BY  编号 DESC
                        ) d;





GO
/****** Object:  UserDefinedFunction [dbo].[tfn_流程]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_流程]
    (
      @流程模板编号 INT ,
      @项目编号 INT ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  编号 AS 流程编号 ,
            流程模板编号 ,
            名称 AS 流程名称 ,
            路径 AS 流程相关项目路径 ,
            项目编号 ,
            发起人编号 ,
            工号 AS 发起人工号 ,
            姓名 AS 发起人姓名 ,
            部门名称 AS 发起人部门名称 ,
            状态 ,
            状态名称 ,
            创建时间 AS 流程创建时间 ,
            --备注 ,
            步骤编号 ,
            步骤名称 ,
            步骤状态 ,
            步骤链接名称 ,
            步骤链接路径 ,
			步骤链接样式 ,
            步骤操作人编号 ,
            步骤操作人工号 ,
            步骤操作人姓名 ,
            步骤操作人部门名称 ,
            步骤执行时间 ,
            步骤状态说明 ,
            dbo.fn_某人是否可以操作某步骤(步骤编号, @人员编号) AS 是否可处理
    FROM    dbo.v3_流程
    WHERE   流程模板编号 = ISNULL(@流程模板编号, 流程模板编号)
            AND 项目编号 = ISNULL(@项目编号, 项目编号);
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_主办讲座]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_主办讲座] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.* ,
			CAST( IIF(c.状态 = 1,1,0) AS BIT) AS 是否可以反馈,
            CAST(IIF(EXISTS ( SELECT 1
                         FROM   讲座反馈
                         WHERE  讲座编号 = a.编号 ), 1, 0) AS BIT) AS 是否反馈过
    FROM    dbo.v2_主办讲座 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  View [dbo].[v3_讲座反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v3_讲座反馈]
AS
    SELECT  b.编号 ,
            b.讲座编号 ,
            a.活动名称 ,
            a.所属部门编号 ,
			a.所属部门名称,
            a.活动经费 ,
            a.会议类型 ,
            a.活动对象 ,
            a.开始时间 ,
            a.结束时间 ,
            a.主办人编号 ,
            a.主讲人姓名 ,
            a.主讲人国别 ,
            a.主讲人单位 ,
            a.主讲人学位 ,
            a.主讲人职称 ,
            a.主讲人简历路径 ,
            a.讲座地点 ,
            a.内容概述 ,
            a.主办人工号 ,
            a.主办人姓名 ,
            a.主办人部门名称 ,
            b.专家姓名 ,
            b.专家身份证号码 ,
            b.专家护照号 ,
            b.专家联系方式 ,
            b.专家讲课费金额 ,
            b.结算方式 ,
            b.活动持续分钟 ,
            b.参会人数 ,
            b.讲座附件路径 ,
            b.讲座效果
    FROM    讲座反馈 b
            JOIN dbo.v2_主办讲座 a ON b.讲座编号 = a.编号;




GO
/****** Object:  View [dbo].[v3_主办讲座报销]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


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
/****** Object:  View [dbo].[VStep]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[VStep]
AS
    SELECT  a.Id ,
            b.FlowTemplateId ,
            a.FlowId ,
            a1.SourceId ,
            a.StepTemplateId ,
            b.Name AS StepTemplateName ,
            b.ViewComponentName ,
            b.EditComponentName ,
            b.Style ,
            a.State ,
            c.Name AS StateName ,
            a.OperatorType ,
            a.OperatorId ,
            dbo.FNGetPersonInfoByType(a.OperatorType, a.OperatorId) AS OpeartorInfo ,
            a.OperatorDatetime ,
            a.CreateDatetime ,
            a.Remark
    FROM    dbo.Step a
            JOIN dbo.Flow a1 ON a.FlowId = a1.Id
            JOIN dbo.StepTemplate b ON a.StepTemplateId = b.Id
            JOIN dbo.StepTemplateState c ON c.StepTemplateId = a.StepTemplateId
                                            AND c.State = a.State;




GO
/****** Object:  View [dbo].[VFlow]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[VFlow]
AS
    SELECT  a.Id AS FlowId ,
            a.FlowTemplateId ,
            c.Name AS FlowTemplateName ,
            c.ComponentName AS FlowTemplateComponentName ,
            a.SourceId ,
            a.State ,
            CASE WHEN a.State = 0 THEN '未完成'
                 WHEN a.State = 1 THEN '已完成'
                 WHEN a.State = -2 THEN '作废'
                 WHEN a.State = -3 THEN '已过期'
            END AS StateName ,
            a.CreatorType ,
            a.CreatorId ,
            dbo.FNGetPersonInfoByType(a.CreatorType, a.CreatorId) AS CreatorInfo ,
            a.CreateDateTime ,
            a.Remark ,
            d.Id AS LastStepId ,
            d.StepTemplateId AS LastStepTemplateId ,
            d.StepTemplateName AS LastStepTemplateName ,
            d.ViewComponentName AS LastViewStepComponentName ,
            d.EditComponentName AS LastEditStepComponentName ,
            d.Style AS LastStepTemplateStyle ,
            d.State AS LastStepState ,
            d.StateName AS LastStepStateName ,
            d.OperatorType AS LastStepOperatorType ,
            d.OperatorId AS LastStepOperatorId ,
            d.OpeartorInfo AS LastStepOpeartorInfo ,
            d.OperatorDatetime AS LastStepOperatorDatetime
    FROM    dbo.Flow a
            JOIN dbo.FlowTemplate c ON a.FlowTemplateId = c.Id
            OUTER APPLY ( SELECT TOP 1
                                    *
                          FROM      dbo.VStep
                          WHERE     FlowId = a.Id
                          ORDER BY  Id DESC
                        ) d;



GO
/****** Object:  UserDefinedFunction [dbo].[TFNFlow]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[TFNFlow]
    (
      @FlowTemplateId INT ,
      @SourceId INT ,
      --@Person TTPersonTypeAndId READONLY
	  @PersonType NVARCHAR(50),
	  @PersonId INT
    )
RETURNS TABLE
AS RETURN
    SELECT  * ,
            dbo.FNIsPersonCanOperateStep(LastStepId, @PersonType,@PersonId) AS IsCanOperate
    FROM    dbo.VFlow
    WHERE   FlowTemplateId = ISNULL(@FlowTemplateId, FlowTemplateId)
            AND SourceId = ISNULL(@SourceId, SourceId);

GO
/****** Object:  View [dbo].[v_教学科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_教学科室]
AS
    SELECT  a.编号 ,
            a.上级部门编号 ,
            a.名称 ,
            a.负责人编号 ,
            b.姓名 AS 负责人姓名 ,
            a.排序值 ,
            a.备注 ,
            a.是否启用 ,
            IIF(EXISTS ( SELECT 1
                         FROM   部门 b
                         WHERE  b.上级部门编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            CAST(IIF(a1.编号 IS NULL, 0, 1) AS BIT) AS 是否教学科室 ,
            a1.科室管理员编号 ,
            b1.姓名 AS 科室管理员姓名 ,
			a1.最大学员人数,
            x.带教老师数量
    FROM    dbo.部门 a
            LEFT JOIN dbo.教学科室 a1 ON a.编号 = a1.编号
            LEFT JOIN dbo.人员 b ON a.负责人编号 = b.编号
            LEFT JOIN dbo.人员 b1 ON a1.科室管理员编号 = b1.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 带教老师数量
                          FROM      教学带教老师
                          WHERE     教学科室编号 = a.编号
                        ) x;






GO
/****** Object:  View [dbo].[v_教学本院科室任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学本院科室任务]
AS
    SELECT  a.编号 ,
            a.教学本院科室编号 ,
            a.项目名称 ,
            a.任务类型编号 ,
            b.名称 AS 任务类型名称 ,
            a.是否门诊 ,
            a.是否病房 ,
            a.是否医技 ,
            a.最低评分要求 ,
            dbo.fn_根据分值获取教学评分等级(a.最低评分要求) AS 最低评分等级 ,
            a.数量要求 ,
            a.备注
    FROM    dbo.教学本院科室任务 a
            LEFT
 JOIN dbo.教学专业科室任务类型 b ON a.任务类型编号 = b.编号;


GO
/****** Object:  View [dbo].[v_教学本院科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v_教学本院科室]
AS
    SELECT  a.编号 ,
            a.教学本院策略编号 ,
            b.名称 AS 教学本院策略名称 ,
            a.排序值 ,
            a.教学专业科室编号 ,
            c.科室名称 AS 教学专业科室名称 ,
            a.本院科室编号 ,
            d.名称 AS 本院科室名称 ,
            d.科室管理员编号 ,
            d.科室管理员姓名 ,
            d.最大学员人数 ,
            d.带教老师数量 ,
            a.是否必选 ,
            a.培训时长 ,
            a.最低管床数量 ,
            a.最低全程管理数量 ,
            a.备注 ,
            e.*
    FROM    dbo.教学本院科室 a
            LEFT JOIN dbo.教学本院策略 b ON a.教学本院策略编号 = b.编号
            LEFT JOIN 教学专业科室 c ON a.教学专业科室编号 = c.编号
            LEFT JOIN dbo.v_教学科室 d ON a.本院科室编号 = d.编号
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE WHEN e1.任务类型名称 = '技能'
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 技能病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.任务类型名称 = '疾病'
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 疾病病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.是否门诊 = 1
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 门诊病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.是否病房 = 1
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 住院病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.是否医技 = 1
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 医技病例数
                          FROM      dbo.v_教学本院科室任务 e1
                          WHERE     e1.教学本院科室编号 = a.编号
                        ) e;








GO
/****** Object:  View [dbo].[v_教学轮转任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学轮转任务]
AS
    SELECT  a.编号 ,
            a.教学轮转编号 ,
            a.项目名称 ,
            a.任务类型编号 ,
            b.名称 AS 任务类型名称 ,
            a.是否门诊 ,
            a.是否病房 ,
            a.是否医技 ,
            a.最低评分要求 ,
            dbo.fn_根据分值获取教学评分等级(a.最低评分要求) AS 最低评分等级 ,
            a.数量要求 ,
            a.备注
    FROM    dbo.教学轮转任务 a
            LEFT
 JOIN dbo.教学专业科室任务类型 b ON a.任务类型编号 = b.编号;



GO
/****** Object:  View [dbo].[v_教学轮转]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[v_教学轮转] AS
SELECT  a.编号 ,
        a.学员编号 ,
        b.姓名 AS 学员姓名 ,
        a.计划入科日期 ,
        a.计划出科日期 ,
        a.实际入科日期 ,
        a.实际出科日期 ,
        a.教学本院科室编号 ,
		c.教学本院策略编号,
		c.教学本院策略名称,
        c.教学专业科室编号 ,
        c.教学专业科室名称 ,
        c.本院科室编号 ,
        c.本院科室名称 ,
		c.最大学员人数,
		--当前在科人数没有统计,这个如何/在哪统计是个问题...
        c.科室管理员编号 ,
        c.科室管理员姓名 ,
        a.带教老师编号 ,
        d.姓名 AS 带教老师姓名 ,
        a.最低管床数量 ,
        a.最低全程管理数量 ,
        a.备注 ,
		 CASE WHEN a.实际出科日期 IS NOT NULL THEN N'已出科'
                 WHEN a.实际入科日期 IS NOT NULL THEN N'在科' 
                 ELSE N'未入科'
            END AS '状态' ,
        e.*
FROM    dbo.教学轮转 a
        JOIN 教学学员 b ON a.学员编号 = b.编号
        LEFT JOIN dbo.v_教学本院科室 c ON a.教学本院科室编号 = c.编号
        LEFT JOIN 人员 d ON a.带教老师编号 = d.编号
        OUTER APPLY ( SELECT    ISNULL(SUM(CASE WHEN e1.任务类型名称 = '技能'
                                                THEN e1.数量要求
                                                ELSE 0
                                           END), 0) AS 技能病例数 ,
                                ISNULL(SUM(CASE WHEN e1.任务类型名称 = '疾病'
                                                THEN e1.数量要求
                                                ELSE 0
                                           END), 0) AS 疾病病例数 ,
                                ISNULL(SUM(CASE WHEN e1.是否门诊 = 1 THEN e1.数量要求
                                                ELSE 0
                                           END), 0) AS 门诊病例数 ,
                                ISNULL(SUM(CASE WHEN e1.是否病房 = 1 THEN e1.数量要求
                                                ELSE 0
                                           END), 0) AS 住院病例数 ,
                                ISNULL(SUM(CASE WHEN e1.是否医技 = 1 THEN e1.数量要求
                                                ELSE 0
                                           END), 0) AS 医技病例数
                      FROM      dbo.v_教学轮转任务 e1
                      WHERE     e1.教学轮转编号 = a.编号
                    ) e;






GO
/****** Object:  UserDefinedFunction [dbo].[tfn_我的轮转]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_我的轮转]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT
    )
RETURNS TABLE
AS RETURN
    --DECLARE @PersonId int = 3094
SELECT  *
FROM    dbo.v_教学轮转 a
WHERE   --如果是"教学学员",那么只能看到自己的
        ( @PersonType = '教学学员'
          AND a.学员编号 = @PersonId
        )
		--如果我是医院管理员,可以看到所有学员,注意系统管理员看不到啥
        OR EXISTS ( SELECT  1
                    FROM    dbo.教学人员角色 b
                    WHERE   @PersonType = '人员'
                            AND b.人员编号 = @PersonId
                            AND b.教学角色编号 = 2 )
        OR --如果是科室管理员,可以看到某学员的本科室轮转
        ( @PersonType = '人员'
          AND a.科室管理员编号 = @PersonId
        )
        OR --如果是带教老师,可以看到自己负责的学员的本科室轮转
        ( @PersonType = '人员'
          AND a.带教老师编号 = @PersonId
        );
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学轮转手册申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_教学轮转手册申请]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            c.教学轮转编号 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            --c.编号 ,
            --c.教学轮转编号 ,
            c.教学轮转手册类型编号 ,
			c1.名称 AS 教学轮转手册类型名称,
            c.操作时间 ,
            c.病人编号 ,
			c2.姓名 AS 病人姓名,
			c2.住院号,
			c2.住院床号,
            c.概要 ,
            c.内容 ,
            c.附件 ,
            c.建立时间 ,
            c.备注 ,
			--
			d.*
    --FROM    dbo.tfn_我的学员(@人员类型, @人员编号) a
    --        JOIN dbo.v_教学轮转 b ON a.编号 = b.学员编号
    --        JOIN dbo.教学更换带教老师 c ON b.编号 = c.教学轮转编号
    --        JOIN 人员 d ON c.原带教老师编号 = d.编号
    --        JOIN 人员 e ON c.新带教老师编号 = e.编号;
    FROM    dbo.tfn_我的轮转(@人员类型, @人员编号) b
            JOIN dbo.教学轮转手册 c ON b.编号 = c.教学轮转编号 JOIN 教学轮转手册类型 c1 ON c.教学轮转手册类型编号 = c1.编号
			LEFT JOIN 教学病人 c2 ON c.病人编号 = c2.编号
			 OUTER APPLY dbo.TFNFlow(300, c.编号, @人员类型, @人员编号) d;
			;

GO
/****** Object:  View [dbo].[v_tfn_教学轮转手册申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_教学轮转手册申请] AS
SELECT * FROM tfn_教学轮转手册申请(NULL,NULL)
GO
/****** Object:  View [dbo].[v_教学专业科室任务]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学专业科室任务]
AS
    SELECT  a.编号 ,
            a.教学专业科室编号 ,
            a.项目名称 ,
            a.任务类型编号 ,
            b.名称 AS 任务类型名称 ,
            a.是否门诊 ,
            a.是否病房 ,
            a.是否医技 ,
            a.最低评分要求 ,
            dbo.fn_根据分值获取教学评分等级(a.最低评分要求) AS 最低评分等级 ,
            a.数量要求 ,
            a.备注
    FROM    dbo.教学专业科室任务 a
            LEFT
 JOIN dbo.教学专业科室任务类型 b ON a.任务类型编号 = b.编号;

GO
/****** Object:  View [dbo].[v_教学专业科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_教学专业科室]
AS
    SELECT  a.* ,
            b.名称 AS 教学专业名称 ,
            c.*
    FROM    教学专业科室 a
            LEFT JOIN dbo.教学专业 b ON a.教学专业编号 = b.编号
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE WHEN c1.任务类型名称 = '技能'
                                                    THEN c1.数量要求
                                                    ELSE 0
                                               END), 0) AS 技能病例数 ,
                                    ISNULL(SUM(CASE WHEN c1.任务类型名称 = '疾病'
                                                    THEN c1.数量要求
                                                    ELSE 0
                                               END), 0) AS 疾病病例数 ,
                                    ISNULL(SUM(CASE WHEN c1.是否门诊 = 1
                                                    THEN c1.数量要求
                                                    ELSE 0
                                               END), 0) AS 门诊病例数 ,
                                    ISNULL(SUM(CASE WHEN c1.是否病房 = 1
                                                    THEN c1.数量要求
                                                    ELSE 0
                                               END), 0) AS 住院病例数 ,
                                    ISNULL(SUM(CASE WHEN c1.是否医技 = 1
                                                    THEN c1.数量要求
                                                    ELSE 0
                                               END), 0) AS 医技病例数
                          FROM      dbo.v_教学专业科室任务 c1
                          WHERE     c1.教学专业科室编号 = a.编号
                        ) c;




GO
/****** Object:  View [dbo].[v_继教评分表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_继教评分表]
AS
    SELECT  * ,
            CAST(IIF(EXISTS ( SELECT    1
                              FROM      dbo.继教操作考试评分表 b
                              WHERE     b.评分表编号 = a.编号 ), 1, 0) AS BIT) AS 是否被引用
    FROM    dbo.继教评分表 a
            OUTER APPLY ( SELECT    COUNT(1) AS 项目数
                          FROM      dbo.继教评分表项目 c
                          WHERE     c.评分表编号 = a.编号
                        ) x
            OUTER APPLY ( SELECT    SUM(e.标准分) AS 总分值
                          FROM      继教评分表项目 d
                                    JOIN dbo.继教评分表项目要求 e ON d.编号 = e.评分表项目编号
                          WHERE     d.评分表编号 = a.编号
                        ) y;


GO
/****** Object:  View [dbo].[v_继教操作考试评分表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_继教操作考试评分表]
AS
    SELECT  a.* ,
	--b.编号 ,
            b.文件夹编号 ,
            b.名称 AS 评分表名称 ,
            b.建立时间 ,
            b.备注 ,
            b.项目数 ,
            b.总分值 ,
            b.是否被引用
    FROM    继教操作考试评分表 a
            JOIN v_继教评分表 b ON a.评分表编号 = b.编号;



GO
/****** Object:  View [dbo].[v_教学学员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_教学学员] AS
SELECT a.编号 ,
       --a.来源学校编号 ,
       --a.来源学生编号 ,
       a.学员类型编号 ,
	   b.名称 AS 学员类型名称,
       a.工号 ,
       --a.密码 ,
       a.头像路径 ,
       a.姓名 ,
       a.性别 ,
       a.民族 ,
       a.证件类型 ,
       a.证件号码 ,
       a.出生日期 ,
       a.手机号码 ,
       a.政治面貌 ,
       a.电子邮箱 ,
       a.QQ号码 ,	
       a.微信号 ,
       a.家庭住址 ,
       a.取得执业证书日期 ,
       a.执业证书编号 ,
       a.取得医师资格证书日期 ,
       a.医师资格证书编号 ,
       a.最高学历 ,
       a.毕业年份 ,
       a.毕业学校 ,
       a.毕业专业 ,
       a.毕业证编码 ,
       a.学位证编码 ,
       a.学员培训年界 ,
       a.学员培训年限 ,
       a.往届应届 ,
       a.专业编号 ,
	   c.名称 AS 专业名称,
       a.送培方式 ,
       a.工作单位 ,
       a.医疗卫生机构 ,
       a.建立时间 ,
       a.备注 FROM dbo.教学学员 a LEFT JOIN dbo.教学学员类型 b ON a.学员类型编号 = b.编号 
	   LEFT JOIN 教学专业 c ON a.专业编号 = c.编号;



GO
/****** Object:  View [dbo].[v_教学学员培训情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--v_教学学员培训情况,注意:和"v_教学学员"数据相对应,因为这里用了leftjoin
--教学学员培训中有数据的学员,才是报到过的;
--可以逐步往里面增加多种统计数据;
CREATE VIEW [dbo].[v_教学学员培训情况]
AS
    WITH    cte
              AS ( SELECT   cte1.编号 ,
                            cte1.报到时间 ,
                            cte1.教学本院策略编号 ,
                            cte22.计划入科日期 AS 计划开始培训日期 ,
                            cte33.计划出科日期 AS 计划结束培训日期 ,
                            cte1.实际开始培训日期 ,
                            cte1.实际结束培训日期 ,
                            cte1.退培日期 ,
                            cte1.结业日期 ,
                            cte1.证书 ,
                            cte1.建立时间 ,
                            cte1.备注
                   FROM     dbo.教学学员培训 cte1
                            OUTER APPLY ( SELECT TOP 1
                                                    cte2.计划入科日期
                                          FROM      教学轮转 cte2
                                          WHERE     cte2.学员编号 = cte1.编号
                                          ORDER BY  cte2.计划入科日期
                                        ) cte22
                            OUTER APPLY ( SELECT TOP 1
                                                    cte3.计划出科日期
                                          FROM      教学轮转 cte3
                                          WHERE     cte3.学员编号 = cte1.编号
                                          ORDER BY  cte3.计划入科日期 DESC
                                        ) cte33
                 )
    SELECT  a.编号 ,
            a.学员类型编号 ,
            a.学员类型名称 ,
            a.工号 ,
            a.头像路径 ,
            a.姓名 ,
            a.性别 ,
       --a.民族 ,
       --a.证件类型 ,
       --a.证件号码 ,
       --a.出生日期 ,
       --a.手机号码 ,
       --a.政治面貌 ,
       --a.电子邮箱 ,
       --a.QQ号码 ,
       --a.微信号 ,
       --a.家庭住址 ,
       --a.取得执业证书日期 ,
       --a.执业证书编号 ,
       --a.取得医师资格证书日期 ,
       --a.医师资格证书编号 ,
            a.最高学历 ,
       --a.毕业年份 ,
       --a.毕业学校 ,
       --a.毕业专业 ,
       --a.毕业证编码 ,
       --a.学位证编码 ,
            a.学员培训年界 ,
            a.学员培训年限 ,
            a.往届应届 ,
            a.专业编号 ,
            a.专业名称 ,
            a.送培方式 ,
       --b.编号 ,
            CASE WHEN b.编号 IS NULL THEN N'未报到'
                 WHEN b.退培日期 IS NOT NULL THEN N'退培'
                 WHEN b.计划开始培训日期 IS NULL THEN N'已报到'
                 WHEN b.实际开始培训日期 IS NULL THEN N'轮转计划已安排'
                 WHEN b.实际结束培训日期 IS NULL THEN N'在培'
                 WHEN b.结业日期 IS NULL THEN N'待结业'
                 WHEN b.结业日期 IS NOT NULL THEN N'结业'
                 ELSE N'未知'
            END AS '状态' ,
            b.报到时间 ,
            b.教学本院策略编号 ,
            c.名称 AS 教学本院策略名称 ,
            b.计划开始培训日期 ,
            b.计划结束培训日期 ,
            b.实际开始培训日期 ,
            b.实际结束培训日期 ,
            b.退培日期 ,
            b.结业日期 ,
            b.证书 ,
            b.建立时间 ,
            b.备注 ,
            z.*
    FROM    v_教学学员 a
            LEFT JOIN cte b ON b.编号 = a.编号
            LEFT JOIN dbo.教学本院策略 c ON b.教学本院策略编号 = c.编号
            OUTER APPLY ( SELECT TOP 1
                                    编号 AS 计划教学轮转编号 ,
                                    本院科室编号 AS 计划教学轮转本院科室编号 ,
                                    本院科室名称 AS 计划教学轮转本院科室名称 ,
                                    科室管理员编号 AS 计划科室管理员编号 ,
                                    科室管理员姓名 AS 计划科室管理员姓名
                          FROM      v_教学轮转
                          WHERE     学员编号 = a.编号
                                    AND GETDATE() BETWEEN 计划入科日期 AND 计划出科日期
                        ) y
            OUTER APPLY ( SELECT TOP 1
                                    编号 AS 当前教学轮转编号 ,
                                    本院科室编号 AS 当前教学轮转本院科室编号 ,
                                    本院科室名称 AS 当前教学轮转本院科室名称 ,
                                    科室管理员编号 AS 当前科室管理员编号 ,
                                    科室管理员姓名 AS 当前科室管理员姓名
                          FROM      v_教学轮转
                          WHERE     学员编号 = a.编号
                                    AND 状态 = '在科'
                        ) z;













GO
/****** Object:  UserDefinedFunction [dbo].[tfn_我的学员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_我的学员]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT
    )
RETURNS TABLE
AS RETURN
    --DECLARE @PersonId int = 3094
SELECT  *
FROM    dbo.v_教学学员培训情况 a
WHERE   --如果是"教学学员",那么只能看到自己的
        ( @PersonType = '教学学员'
          AND a.编号 = @PersonId
        )
		--如果我是医院管理员,可以看到所有学员,注意系统管理员看不到啥
        OR EXISTS ( SELECT  1
                    FROM    dbo.教学人员角色 b
                    WHERE   @PersonType = '人员'
                            AND b.人员编号 = @PersonId
                            AND b.教学角色编号 = 2 )
        OR --如果是科室管理员,可以看到有计划到本科室轮转的学员
        EXISTS ( SELECT 1
                 FROM   教学科室 c1 JOIN 教学本院科室 c2 ON c1.编号 = c2.本院科室编号
                        JOIN 教学轮转 c3 ON c2.编号 = c3.教学本院科室编号
                 WHERE  @PersonType = '人员'
                        AND c1.科室管理员编号 = @PersonId
                        AND c3.学员编号 = a.编号 )
        OR --如果是带教老师,可以看到自己负责的学员
        EXISTS ( SELECT 1
                 FROM   教学轮转 d1
                 WHERE  @PersonType = '人员'
                        AND d1.带教老师编号 = @PersonId
                        AND d1.学员编号 = a.编号 );
GO
/****** Object:  View [dbo].[v_教学学员报到]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学学员报到]
AS
    SELECT  b.编号 ,
            b.学员类型编号 ,
            b.学员类型名称 ,
            b.工号 ,
            b.头像路径 ,
            b.姓名 ,
            b.性别 ,
            b.学员培训年界 ,
            b.学员培训年限 ,
            b.往届应届 ,
            b.专业编号 ,
            b.专业名称 ,
            b.送培方式 ,
            CAST(IIF(b.报到时间 IS NULL, 0, 1) AS BIT) AS 是否已报到 ,
            b.报到时间 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.计划开始培训日期 ,
            b.计划结束培训日期 ,
            b.实际开始培训日期 ,
            b.实际结束培训日期 ,
            b.退培日期 ,
            b.结业日期 ,
            b.证书 ,
            b.建立时间 ,
            b.备注
    FROM    dbo.v_教学学员培训情况 b;






GO
/****** Object:  View [dbo].[v_继教慕课参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教慕课参与情况]
AS
    SELECT  a.慕课编号,
            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.学习时长 ,
            CAST(IIF(a.学习时长 >= b.通过时长, 1, 0) AS BIT) AS 是否通过
    FROM    dbo.继教慕课参与情况 a
            JOIN 继教慕课 b ON a.慕课编号 = b.编号;
GO
/****** Object:  View [dbo].[v_继教课后练习参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教课后练习参与情况]
AS
    SELECT  a.课后练习编号 ,
            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.参与时间 ,
            a.得分 ,
            CAST(IIF(a.得分 >= b.及格分数, 1, 0) AS BIT) AS 是否通过
    FROM    dbo.继教课后练习参与情况 a
            JOIN dbo.继教课后练习 b ON a.课后练习编号 = b.编号;



GO
/****** Object:  View [dbo].[v_继教理论考试参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_继教理论考试参与情况]
AS
    SELECT  b.考试编号,
	a.考试批次编号 ,
            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.答题开始时间 ,
			a.答题结束时间,
            a.得分 ,
            CAST(IIF(a.得分 >= c.及格分数, 1, 0) AS BIT) AS 是否通过
    FROM    dbo.继教理论考试参与情况 a
            JOIN dbo.继教考试批次 b ON a.考试批次编号 = b.编号
			JOIN 继教理论考试 c ON b.考试编号 = c.编号


GO
/****** Object:  View [dbo].[v_继教操作考试参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教操作考试参与情况]
AS
    SELECT  b.考试编号,
	a.考试批次编号 ,
            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.开始操作时间 ,
			a.结束操作时间,
            a.得分 ,
            CAST(IIF(a.得分 >= c.及格分数, 1, 0) AS BIT) AS 是否通过
    FROM    dbo.继教操作考试参与情况 a
            JOIN dbo.继教考试批次 b ON a.考试批次编号 = b.编号
			JOIN 继教操作考试 c ON b.考试编号 = c.编号



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教签到参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教签到参与情况] ( @签到编号 INT )
RETURNS TABLE
RETURN
    WITH    cte签到规定次数
              AS ( SELECT   COUNT(1) AS 签到规定次数
                   FROM     继教签到规定
                   WHERE    签到编号 = @签到编号
                 ),
            cte签到按人统计
              AS ( SELECT   i1.参与人类型 ,
                            i1.参与人编号 ,
                            COUNT(1) AS 签到次数
                   FROM     继教签到参与情况 i1
                            JOIN 继教签到规定 i2 ON i1.签到规定编号 = i2.编号
                                              AND i2.签到编号 = @签到编号
                   GROUP BY i1.参与人类型 ,
                            i1.参与人编号
                 )
    SELECT  @签到编号 AS 签到编号 ,
            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.签到次数 ,
            CAST(IIF(a.签到次数 >= b.签到规定次数, 1, 0) AS BIT) AS 是否通过
    FROM    cte签到按人统计 a
            JOIN cte签到规定次数 b ON 1 = 1;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某活动内容的通过情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某活动内容的通过情况] ( @活动内容编号 INT )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT   a3.参与人类型 ,
                            a3.参与人编号 ,
                            a3.参与人称谓 ,
                            a3.是否通过 ,
                            ROW_NUMBER() OVER ( PARTITION BY a3.参与人类型,
                                                a3.参与人编号 ORDER BY a3.考试批次编号 DESC ) AS r_id
                   FROM     v_继教理论考试参与情况 a3
                   WHERE    a3.考试编号 = @活动内容编号
                 )
    SELECT  a1.参与人类型 ,
            a1.参与人编号 ,
            a1.参与人称谓 ,
            a1.是否通过
    FROM    v_继教慕课参与情况 a1
    WHERE   a1.慕课编号 = @活动内容编号
    UNION ALL
    SELECT  a2.参与人类型 ,
            a2.参与人编号 ,
            a2.参与人称谓 ,
            a2.是否通过
    FROM    v_继教课后练习参与情况 a2
    WHERE   a2.课后练习编号 = @活动内容编号
    --UNION ALL
    --SELECT TOP 1 a3.参与人类型 ,
    --        a3.参与人编号 ,
    --        a3.参与人称谓 ,
    --        a3.是否通过
    --FROM    v_继教理论考试参与情况 a3
    --WHERE   a3.考试编号 = @活动内容编号 ORDER BY a3.考试批次编号
    UNION ALL
    SELECT  cte.参与人类型 ,
            cte.参与人编号 ,
            cte.参与人称谓 ,
            cte.是否通过
    FROM    cte
    WHERE   cte.r_id = 1
    UNION ALL
    SELECT  a4.参与人类型 ,
            a4.参与人编号 ,
            a4.参与人称谓 ,
            a4.是否通过
    FROM    v_继教操作考试参与情况 a4
    WHERE   a4.考试编号 = @活动内容编号
    UNION ALL
    SELECT  a5.参与人类型 ,
            a5.参与人编号 ,
            a5.参与人称谓 ,
            a5.是否通过
    FROM    dbo.tfn_继教签到参与情况(@活动内容编号) a5;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某活动的通过情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某活动的通过情况] ( @活动编号 INT )
RETURNS TABLE
RETURN
    SELECT  a.编号 AS 活动内容编号 ,
            b.*
    FROM    继教活动内容 a
            CROSS APPLY tfn_继教某活动内容的通过情况(a.编号) b
    WHERE   a.活动编号 = @活动编号; 
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某活动的通过情况统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_继教某活动的通过情况统计] ( @活动编号 INT )
RETURNS TABLE
RETURN
    WITH    cteA
              AS ( SELECT   COUNT(1) AS 活动内容数量
                   FROM     dbo.继教活动内容
                   WHERE    活动编号 = @活动编号
                 ),
            cte
              AS ( SELECT   a.参与人类型 ,
                            a.参与人编号 ,
                            a.参与人称谓 ,
                            a.是否通过 ,
                            SUM(1) OVER ( PARTITION BY a.参与人类型, a.参与人编号 ) AS 参与活动内容次数 ,
                            SUM(CASE WHEN a.是否通过 = 1 THEN 1
                                     ELSE 0
                                END) OVER ( PARTITION BY a.参与人类型, a.参与人编号 ) AS 通过活动内容次数 ,
                            ROW_NUMBER() OVER ( PARTITION BY a.参与人类型, a.参与人编号 ORDER BY a.活动内容编号 ) AS r_n
                   FROM     tfn_继教某活动的通过情况(@活动编号) AS a
                 ),
            cte1
              AS ( SELECT   *
                   FROM     cte
                   WHERE    cte.r_n = 1
                 ),
            cteResult
              AS ( SELECT   a.可参与人类型 AS 参与人类型 ,
                            a.可参与人编号 AS 参与人编号 ,
                            --b.姓名 ,
                            --b.部门编号 ,
                            --b.部门名称 ,
                            ISNULL(cte1.参与人称谓,
                                   dbo.FNGetPersonInfoByType(a.可参与人类型,
                                                             a.可参与人编号)) AS 参与人称谓 ,
                            ISNULL(cte1.参与活动内容次数, 0) AS 参与活动内容次数 ,
                            ISNULL(cte1.通过活动内容次数, 0) AS 通过活动内容次数
                   FROM     dbo.继教活动可参与人 a --LEFT JOIN dbo.v1_人员_带部门名 b ON a.可参与人类型 = '人员'
                            --                              AND a.可参与人编号 = b.编号
                            LEFT JOIN cte1 ON a.可参与人类型 = cte1.参与人类型
                                              AND a.可参与人编号 = cte1.参与人编号
                   WHERE    a.活动编号 = @活动编号
                 )
    SELECT  cteResult.参与人类型 ,
            cteResult.参与人编号 ,
            --cteResult.姓名 ,
            --cteResult.部门编号 ,
            --cteResult.部门名称 ,
            cteResult.参与人称谓 ,
            cteResult.参与活动内容次数 ,
            cteResult.通过活动内容次数 ,
            cteA.活动内容数量,
			CAST(IIF(cteResult.通过活动内容次数 = cteA.活动内容数量,1,0) AS BIT) 是否完成
    FROM    cteResult ,
            cteA;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某活动按科室统计通过人数]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[tfn_继教某活动按科室统计通过人数] ( @活动编号 INT )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT   a.* ,
                            b.部门编号 ,
                            b.部门名称 ,
                            COUNT(1) OVER ( PARTITION BY b.部门编号 ORDER BY ( SELECT
                                                              NULL
                                                              ) ) AS 参与人数 ,
                            SUM(CASE a.是否完成
                                  WHEN 0 THEN 0
                                  WHEN 1 THEN 1
                                END) OVER ( PARTITION BY b.部门编号 ORDER BY ( SELECT
                                                              NULL
                                                              ) ) AS 完成人数 ,
                            ROW_NUMBER() OVER ( PARTITION BY b.部门编号 ORDER BY ( SELECT
                                                              NULL
                                                              ) ) AS r_id
                   FROM     tfn_继教某活动的通过情况统计(@活动编号) a
                            JOIN dbo.v1_人员_带部门名 b ON a.参与人编号 = b.编号
                   WHERE    a.参与人类型 = '人员'
                 )
    SELECT  cte.部门编号 ,
            cte.部门名称 ,
            cte.参与人数 ,
            cte.完成人数
    FROM    cte
    WHERE   cte.r_id = 1;
	
GO
/****** Object:  View [dbo].[v_tfn_继教某活动按科室统计通过人数]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    CREATE VIEW [dbo].[v_tfn_继教某活动按科室统计通过人数] as
	SELECT * FROM tfn_继教某活动按科室统计通过人数(NULL)
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学出科申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_教学出科申请]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            c.教学轮转编号 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            --c.编号 ,
            --c.教学轮转编号 ,
            c.申请出科日期 ,
            c.出科小结 ,
            c.建立时间 ,
            c.备注 ,
			--
			d.*
    --FROM    dbo.tfn_我的学员(@人员类型, @人员编号) a
    --        JOIN dbo.v_教学轮转 b ON a.编号 = b.学员编号
    --        JOIN dbo.教学更换带教老师 c ON b.编号 = c.教学轮转编号
    --        JOIN 人员 d ON c.原带教老师编号 = d.编号
    --        JOIN 人员 e ON c.新带教老师编号 = e.编号;
    FROM    dbo.tfn_我的轮转(@人员类型, @人员编号) b
            JOIN dbo.教学出科申请 c ON b.编号 = c.教学轮转编号 
			 OUTER APPLY dbo.TFNFlow(400, c.编号, @人员类型, @人员编号) d;
			;

GO
/****** Object:  View [dbo].[v_tfn_教学出科申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_教学出科申请] AS
SELECT * FROM tfn_教学出科申请(NULL,NULL)
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_讲座反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_讲座反馈] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v3_讲座反馈 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  View [dbo].[v_继教慕课]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_继教慕课]
AS
    SELECT  a0.编号 ,
            a0.活动编号 ,
            a0.类型 ,
            a0.名称 ,
            a0.排序值 ,
            a0.开始时间 ,
            a0.结束时间 ,
            a0.地点 ,
            a0.备注 ,
	--a.编号 ,
            a.慕课素材编号 ,
            b.名称 AS 慕课素材名称 ,
            b.路径 AS 慕课素材路径 ,
            a.是否允许下载 ,
            a.通过时长 ,
            x.参与人数 ,
            x.通过人数
    FROM    继教活动内容 a0
            JOIN 继教慕课 a ON a.编号 = a0.编号
            LEFT JOIN 继教慕课素材 b ON a.慕课素材编号 = b.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 参与人数 ,
                                    ISNULL( SUM(CASE m.是否通过
                                          WHEN 1 THEN 1
                                          ELSE 0
                                        END),0) AS 通过人数
                          FROM      dbo.v_继教慕课参与情况 m
                          WHERE     m.慕课编号 = a.编号
                        ) x;




GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学结业申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_教学结业申请]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  a0.编号 ,
            a0.学员编号 ,
            a0.说明 ,
            a0.申请结业日期 ,
            a0.建立时间 ,
            a0.备注 ,
			--
            a.学员类型编号 ,
            a.学员类型名称 ,
            a.工号 ,
            a.头像路径 ,
            a.姓名 ,
            a.性别 ,
            a.学员培训年界 ,
            a.学员培训年限 ,
            a.往届应届 ,
            a.专业编号 ,
            a.专业名称 ,
            a.送培方式 ,
            a.状态 ,
            a.报到时间 ,
            a.教学本院策略编号 ,
            a.教学本院策略名称 ,
            a.计划开始培训日期 ,
            a.计划结束培训日期 ,
            a.实际开始培训日期 ,
            a.实际结束培训日期 ,
            a.退培日期 ,
            a.结业日期 ,
            a.证书 ,
			--
            b.*
    FROM    dbo.教学结业申请 a0
            JOIN dbo.tfn_我的学员(@人员类型, @人员编号) a ON a0.学员编号 = a.编号
            OUTER APPLY dbo.TFNFlow(500, a0.编号, @人员类型, @人员编号) b;
GO
/****** Object:  View [dbo].[v_tfn_教学结业申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_教学结业申请] AS
 SELECT * FROM tfn_教学结业申请(NULL,NULL)
GO
/****** Object:  View [dbo].[v2_通知公告]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v2_通知公告] AS
SELECT  a.编号 ,
        a.通知类型 ,
        a.通知标识 ,
        a.发送人编号 ,
        a.通知名称 ,
        a.关闭时间 ,
        a.相关文件路径 ,
        a.通知内容 ,
        a.接收人数 ,
        a.已接收人数 ,
        a.是否启用 ,
        a.建立时间 ,
        a.备注 ,
		a.是否必读,
        b.工号 AS 发送人工号 ,
        b.姓名 AS 发送人姓名 ,
        b.部门编号 AS 发送人部门编号 ,
        b.部门名称 AS 发送人部门名称
FROM    dbo.通知公告 a
        LEFT JOIN dbo.v1_人员_带部门名 b ON a.发送人编号 = b.编号;





GO
/****** Object:  UserDefinedFunction [dbo].[tfn_某人员可查看的通知公告]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[tfn_某人员可查看的通知公告] ( @人员编号 INT )
RETURNS TABLE
AS RETURN
    WITH    cte ( 人员编号, 接收者类型, 接收者编号 )
              AS ( SELECT   @人员编号 ,
                            0 ,
                            0
                   UNION ALL
                   SELECT   @人员编号 ,
                            10 ,
                            @人员编号
                   UNION ALL
                   SELECT   @人员编号 ,
                            20 ,
                            部门编号
                   FROM     dbo.人员
                   WHERE    编号 = @人员编号
                   UNION ALL
                   SELECT   @人员编号 ,
                            30 ,
                            b1.角色编号
                   FROM     dbo.人员角色 b1
                   WHERE    b1.人员编号 = @人员编号
                 )
    SELECT  a.编号 ,
            a.通知类型 ,
            a.通知标识 ,
            a.发送人编号 ,
            a.通知名称 ,
            a.关闭时间 ,
            a.相关文件路径 ,
            --a.通知内容 ,
            a.接收人数 ,
            a.已接收人数 ,
            a.是否启用 ,
            a.建立时间 ,
            a.备注 ,
			a.是否必读,
            a.发送人工号 ,
            a.发送人姓名 ,
            a.发送人部门编号 ,
            a.发送人部门名称 ,
            IIF(EXISTS ( SELECT 1
                         FROM   dbo.通知公告已接收人 b
                         WHERE  b.通知公告编号 = a.编号
                                AND b.接收人编号 = @人员编号 ), 1, 0) AS 是否已接收
    FROM    v2_通知公告 a
    WHERE   EXISTS ( SELECT 1
                     FROM   cte
                            JOIN dbo.通知公告接收条件 c ON cte.接收者类型 = c.接收者类型
                                                   AND cte.接收者编号 = c.接收者编号
                                                   AND c.通知公告编号 = a.编号 );
					





GO
/****** Object:  View [dbo].[v_继教试题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教试题] as

SELECT  a.编号 ,
a.文件夹编号,
        a.类型编号 ,
        b.名称 AS 类型名称 ,
        a.题干 ,
        a.题目解析 ,
        a.难易度 ,
        a.建立时间 ,
        a.备注 ,
        x.* ,
        CASE x.答题次数
          WHEN 0 THEN NULL
          ELSE x.正确答题次数 * 100 / x.答题次数
        END AS 答题正确率 ,
        y.*
FROM    dbo.继教试题 a
        JOIN 继教试题类型 b ON a.类型编号 = b.编号
        OUTER APPLY ( SELECT    COUNT(1) AS 答题次数 ,
                                ISNULL(SUM(CASE WHEN m.是否正确 = 1 THEN 1
                                                ELSE 0
                                           END), 0) AS 正确答题次数
                      FROM      继教理论考试答题情况 m
                      WHERE     m.试题编号 = a.编号
                    ) x
        OUTER APPLY ( SELECT    COUNT(1) AS 被引次数
                      FROM      dbo.继教试卷试题 n
                      WHERE     n.试题编号 = a.编号
                    ) y;


GO
/****** Object:  View [dbo].[v_继教试卷试题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教试卷试题] as
SELECT c.编号 ,
            c.文件夹编号 ,
            c.类型编号 ,
            c.类型名称 ,
            c.题干 ,
            c.题目解析 ,
            c.难易度 ,
            c.建立时间 ,
            c.备注,
            c.答题次数 ,
            c.正确答题次数 ,
            c.答题正确率 ,
            c.被引次数,b.试卷编号, a.试卷结构编号 ,
       a.试题编号 ,
       a.分值 ,
       a.排序值  FROM 继教试卷试题 a JOIN dbo.继教试卷结构 b ON a.试卷结构编号 = b.编号 join dbo.v_继教试题 c ON a.试题编号 = c.编号

GO
/****** Object:  View [dbo].[v2_项目参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v2_项目参与人] AS 
SELECT  a.编号 ,
        a.流程模板编号 ,
        a.项目编号 ,
        a.参与人编号 ,
        b.工号 ,
        b.姓名 ,
        b.部门编号 ,
        b.部门名称 ,
        a.工作量占比 ,
        a.备注 ,
        a.建立时间
FROM    项目参与人 a
        JOIN dbo.v1_人员_带部门名 b ON a.参与人编号 = b.编号;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_项目参与人] ( @流程模板编号 INT, @项目编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.v2_项目参与人 a
    WHERE   a.流程模板编号 = @流程模板编号
            AND a.项目编号 = @项目编号;

GO
/****** Object:  View [dbo].[v_继教课后练习]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_继教课后练习]
AS
    SELECT  a0.编号 ,
            a0.活动编号 ,
            a0.类型 ,
            a0.名称 ,
            a0.排序值 ,
            a0.开始时间 ,
            a0.结束时间 ,
            a0.地点 ,
            a0.备注 ,
            a.及格分数 ,
            x.参与人数 ,
            x.通过人数
    FROM    继教活动内容 a0
            JOIN 继教课后练习 a ON a.编号 = a0.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 参与人数 ,
                                    ISNULL( SUM(CASE m.是否通过
                                          WHEN 1 THEN 1
                                          ELSE 0
                                        END),0) AS 通过人数
                          FROM      dbo.v_继教课后练习参与情况 m
                          WHERE     m.课后练习编号 = a.编号
                        ) x;




GO
/****** Object:  View [dbo].[v2_纵向项目申报_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[v2_纵向项目申报_列表]
AS
    SELECT  a.编号 ,
            a.分类 ,
            CASE a.分类
              WHEN 1 THEN '科研项目'
              WHEN 2 THEN '重点学科'
              WHEN 3 THEN '人才培养'
            END AS 分类名称 ,
            a.项目名称 ,
            a.申报人编号 ,
            b.工号 申报人工号,
            b.姓名 AS 申报人姓名,
            b.部门编号 AS 申报人部门编号,
            b.部门名称 AS 申报人部门名称,
            a.学科门类 ,
			a.申报年度,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.申报时间 ,
            a.申请经费 ,
            a.计划开始日期 ,
            a.计划完成日期,a.是否立项
    FROM    dbo.纵向项目申报 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.申报人编号 = b.编号;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_纵向项目申报]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_纵向项目申报] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v2_纵向项目申报_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  View [dbo].[v_继教理论考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_继教理论考试]
AS
    SELECT  a0.编号 ,
            a0.活动编号 ,
            a0.类型 ,
            a0.名称 ,
            a0.排序值 ,
            a0.开始时间 ,
            a0.结束时间 ,
            a0.地点 ,
            a0.备注 ,
			a.是否允许任何人参与,
			a.试卷编号,
			b.名称 AS 试卷名称,
			a.时长,
			a.及格分数,
            a.是否试题乱序 ,
			a.是否允许考生查看成绩,
			a.是否允许考生查看答案,
            x.参与人数 ,
            x.通过人数
    FROM    继教活动内容 a0
            JOIN 继教理论考试 a ON a.编号 = a0.编号
			LEFT JOIN 继教试卷 b ON a.试卷编号 = b.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 参与人数 ,
                                   ISNULL( SUM(CASE m.是否通过
                                          WHEN 1 THEN 1
                                          ELSE 0
                                        END),0) AS 通过人数
                          FROM      dbo.v_继教理论考试参与情况 m
                          WHERE     m.考试编号 = a.编号
                        ) x;





GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可参与的理论考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_继教某人可参与的理论考试]
    (
      @可参与人类型 NVARCHAR(50) ,
      @可参与人编号 INT,
	  @口令 NVARCHAR(50)
    )
RETURNS TABLE
RETURN
    --名字为什么不用"tfn_继教某人可参与的理论考试活动"
--是因为,其实这个里面是可以包含慕课活动的理论考试的.

WITH cte AS (

    SELECT  a.编号 ,
            a.文件夹编号 ,
            a0.类型 AS 活动类型 ,
            a.培训计划编号 ,
            a1.名称 AS 培训计划名称 ,
            a1.年份 AS 培训计划年份 ,
            a.项目分类编号 ,
            a2.名称 AS 项目分类名称 ,
            a.名称 ,
            a.开始时间 AS 活动开始时间 ,
            a.结束时间 AS 活动结束时间 ,
            a.学分 ,
            a.封面 ,
            a.简介 ,
            a.必须按顺序学习 ,
            a.建立时间 ,
            a.建立人 ,
            a3.姓名 AS 建立人姓名 ,
            a.备注 AS 活动备注 ,
            CASE WHEN a.开始时间 IS NULL
                      AND a.结束时间 IS NULL THEN '未发布'
                 WHEN GETDATE() < a.开始时间 THEN '未开始'
                 WHEN GETDATE() BETWEEN a.开始时间 AND a.结束时间 THEN '进行中'
                 WHEN a.结束时间 < GETDATE() THEN '已结束'
            END AS '状态' ,

            b.编号 AS 考试编号 ,
            b.名称 AS 考试名称 ,
            b.开始时间 AS 考试开始时间 ,
            b.结束时间 AS 考试结束时间 ,
            b.地点 ,
            b.是否允许任何人参与 ,
            b.试卷编号 ,
            b.试卷名称 ,
            b.时长 ,
            b.及格分数 ,
            b.是否试题乱序 ,
            b.是否允许考生查看成绩 ,
            b.是否允许考生查看答案 ,
            b.参与人数 ,
            b.通过人数 ,
            b.备注 AS 考试备注 ,

            c.编号 AS 考试批次编号 ,
            c.考试开始时间  AS 考试批次开始时间,
            c.考试结束时间  AS 考试批次结束时间,
            c.考试地点 ,
            c.人数上限 ,
            c.二维码 ,
            c.口令 ,
            c.备注 AS 考试批次备注

    FROM    dbo.继教活动 a
            JOIN dbo.继教文件夹 a0 ON a.文件夹编号 = a0.编号
            LEFT JOIN dbo.继教培训计划 a1 ON a.培训计划编号 = a1.编号
            LEFT JOIN dbo.继教活动项目分类 a2 ON a.项目分类编号 = a2.编号
            LEFT JOIN 人员 a3 ON a.建立人 = a3.编号
			--19-10-14以上应该由"v_继教活动"(不带统计)这样一个view来获取;

            JOIN dbo.v_继教理论考试 b ON a.编号 = b.活动编号
            JOIN dbo.继教考试批次 c ON b.编号 = c.考试编号



)
    SELECT  *
    FROM    cte
            OUTER APPLY ( SELECT    m.是否通过,m.得分,m.答题开始时间,m.答题结束时间
                          FROM      dbo.v_继教理论考试参与情况 m
                          WHERE     m.考试批次编号 = cte.考试批次编号
                                    AND m.参与人类型 = @可参与人类型
                                    AND m.参与人编号 = @可参与人编号
                        ) x
    WHERE   cte.活动开始时间 IS NOT NULL --必然是已发布的活动,这个是写死在这里了的
            AND ( EXISTS ( SELECT   1
                           FROM     dbo.继教考试批次可参与人 n
                           WHERE    n.考试批次编号 = cte.考试批次编号
                                    AND n.可参与人类型 = @可参与人类型
                                    AND n.可参与人编号 = @可参与人编号 )
                  OR cte.是否允许任何人参与 = 1
				  --OR (cte.口令 IS NOT NULL AND cte.口令 = @口令)
                ) AND  (@口令 = '' or cte.口令 = @口令);




GO
/****** Object:  View [dbo].[v_继教自测]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教自测]
AS
    SELECT  a0.编号 ,
            a0.活动编号 ,
            a0.类型 ,
            a0.名称 ,
            a0.排序值 ,
            a0.开始时间 ,
            a0.结束时间 ,
            a0.地点 ,
            a0.备注 ,
			a.是否允许任何人参与,
			a.试卷编号,
			b.名称 AS 试卷名称,
			a.时长,
			a.及格分数,
            a.是否试题乱序 ,
			a.是否允许考生查看成绩,
			a.是否允许考生查看答案,
            x.*
    FROM    继教活动内容 a0
            JOIN 继教理论考试 a ON a.编号 = a0.编号
			LEFT JOIN 继教试卷 b ON a.试卷编号 = b.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 自测人次
                          FROM      dbo.继教考试批次 m
                          WHERE     m.考试编号 = a.编号
                        ) x;






GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可参与的自测]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某人可参与的自测]
    (
      @可参与人类型 NVARCHAR(50) ,
      @可参与人编号 INT
    )
RETURNS TABLE
RETURN
--名字为什么不用"tfn_继教某人可参与的理论考试活动"
--是因为,其实这个里面是可以包含慕课活动的理论考试的.


   --declare   @可参与人类型 NVARCHAR(50)  = '人员';
   --  declare @可参与人编号 INT = 5099;

WITH cte AS (

    SELECT  a.编号 ,
            a.文件夹编号 ,
            a0.类型 AS 活动类型 ,
            a.培训计划编号 ,
            a1.名称 AS 培训计划名称 ,
            a1.年份 AS 培训计划年份 ,
            a.项目分类编号 ,
            a2.名称 AS 项目分类名称 ,
            a.名称 ,
            a.开始时间 AS 活动开始时间 ,
            a.结束时间 AS 活动结束时间 ,
            a.学分 ,
            a.封面 ,
            a.简介 ,
            a.必须按顺序学习 ,
            a.建立时间 ,
            a.建立人 ,
            a3.姓名 AS 建立人姓名 ,
            a.备注 AS 活动备注 ,
            CASE WHEN a.开始时间 IS NULL
                      AND a.结束时间 IS NULL THEN '未发布'
                 WHEN GETDATE() < a.开始时间 THEN '未开始'
                 WHEN GETDATE() BETWEEN a.开始时间 AND a.结束时间 THEN '进行中'
                 WHEN a.结束时间 < GETDATE() THEN '已结束'
            END AS '状态' ,

            b.编号 AS 考试编号 ,
            b.名称 AS 考试名称 ,
            b.开始时间 AS 考试开始时间 ,
            b.结束时间 AS 考试结束时间 ,
            b.地点 ,
            b.是否允许任何人参与 ,
            b.试卷编号 ,
            b.试卷名称 ,
            b.时长 ,
            b.及格分数 ,
            b.是否试题乱序 ,
            b.是否允许考生查看成绩 ,
            b.是否允许考生查看答案 ,
            b.自测人次 ,
            b.备注 AS 考试备注 

            --c.编号 AS 考试批次编号 ,
            --c.考试开始时间  AS 考试批次开始时间,
            --c.考试结束时间  AS 考试批次结束时间,
            --c.考试地点 ,
            --c.人数上限 ,
            --c.二维码 ,
            --c.口令 ,
            --c.备注 AS 考试批次备注

    FROM    dbo.继教活动 a
            JOIN dbo.继教文件夹 a0 ON a.文件夹编号 = a0.编号
            LEFT JOIN dbo.继教培训计划 a1 ON a.培训计划编号 = a1.编号
            LEFT JOIN dbo.继教活动项目分类 a2 ON a.项目分类编号 = a2.编号
            LEFT JOIN 人员 a3 ON a.建立人 = a3.编号
			--19-10-14以上应该由"v_继教活动"(不带统计)这样一个view来获取;

            JOIN dbo.v_继教自测 b ON a.编号 = b.活动编号
            --JOIN dbo.继教考试批次 c ON b.编号 = c.考试编号

)
    SELECT  *
    FROM    cte
            OUTER APPLY ( SELECT   COUNT(1) AS 参与次数,ISNULL( SUM( case m.是否通过 WHEN 1 THEN 1 ELSE 0 END),0) AS 通过次数
                          FROM      dbo.v_继教理论考试参与情况 m JOIN 继教考试批次 m1 ON m.考试批次编号 = m1.编号
                          WHERE     m1.考试编号 = cte.考试编号
                                    AND m.参与人类型 = @可参与人类型
                                    AND m.参与人编号 = @可参与人编号
                        ) x
    WHERE   cte.活动开始时间 IS NOT NULL --必然是已发布的活动,这个是写死在这里了的
            AND ( EXISTS ( SELECT 1
                     FROM   dbo.继教活动可参与人 n
                     WHERE  n.活动编号 = cte.编号
                            AND n.可参与人类型 = @可参与人类型
                            AND n.可参与人编号 = @可参与人编号 )
                  OR cte.是否允许任何人参与 = 1
				  --OR (cte.口令 IS NOT NULL AND cte.口令 = @口令)
                ) ;




GO
/****** Object:  View [dbo].[v_继教活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_继教活动]
AS
    SELECT  a.编号 ,
            a.文件夹编号 ,
            a.培训计划编号 ,
            a1.名称 AS 培训计划名称 ,
            a1.年份 AS 培训计划年份 ,
            a.项目分类编号 ,
            a2.名称 AS 项目分类名称 ,
            a.名称 ,
            a.开始时间 ,
            a.结束时间 ,
            a.学分 ,
            a.封面 ,
            a.简介 ,
            a.必须按顺序学习 ,
			a.建立时间,
			a.建立人,
			a3.姓名 AS 建立人姓名,
            a.备注 ,
            CASE WHEN a.开始时间 IS NULL
                      AND a.结束时间 IS NULL THEN '未发布'
                 WHEN GETDATE() < a.开始时间 THEN '未开始'
                 WHEN GETDATE() BETWEEN a.开始时间 AND a.结束时间 THEN '进行中'
                 WHEN a.结束时间 < GETDATE() THEN '已结束'
            END AS '状态' ,
            x.应学人数 ,
            dbo.fn_继教获取某活动通过所有活动内容的人数(a.编号) AS 完成人数
    FROM    dbo.继教活动 a
            LEFT JOIN dbo.继教培训计划 a1 ON a.培训计划编号 = a1.编号
            LEFT JOIN dbo.继教活动项目分类 a2 ON a.项目分类编号 = a2.编号
			LEFT JOIN 人员 a3 ON a.建立人 = a3.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 应学人数
                          FROM      dbo.继教活动可参与人 m
                          WHERE     m.活动编号 = a.编号
                        ) x; 






GO
/****** Object:  View [dbo].[v_继教理论考试活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教理论考试活动]
AS
    SELECT  b.文件夹编号 ,
	b.学分,
            a.* ,
            --CASE WHEN b.开始时间 IS NULL
            --          AND b.结束时间 IS NULL THEN '未发布'
            --     WHEN GETDATE() < b.开始时间 THEN '未开始'
            --     WHEN GETDATE() BETWEEN b.开始时间 AND b.结束时间 THEN '进行中'
            --     WHEN b.结束时间 < GETDATE() THEN '已结束'
            --END AS '状态' ,
			b.状态,
			b.应学人数 AS 应考人数,
            b.建立人 ,
            b.建立人姓名 ,
            b.建立时间
    FROM    dbo.v_继教理论考试 a
            JOIN dbo.v_继教活动 b ON a.活动编号 = b.编号
            JOIN 人员 c ON b.建立人 = c.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学退培申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学退培申请]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  a0.编号 ,
            a0.学员编号 ,
            a0.说明 ,
            a0.申请退培日期 ,
            a0.建立时间 ,
            a0.备注 ,
			--
            a.学员类型编号 ,
            a.学员类型名称 ,
            a.工号 ,
            a.头像路径 ,
            a.姓名 ,
            a.性别 ,
            a.学员培训年界 ,
            a.学员培训年限 ,
            a.往届应届 ,
            a.专业编号 ,
            a.专业名称 ,
            a.送培方式 ,
            a.状态 ,
            a.报到时间 ,
            a.教学本院策略编号 ,
            a.教学本院策略名称 ,
            a.计划开始培训日期 ,
            a.计划结束培训日期 ,
            a.实际开始培训日期 ,
            a.实际结束培训日期 ,
            a.退培日期 ,
            a.结业日期 ,
            a.证书 ,
			--
            b.*
    FROM    dbo.教学退培申请 a0
            JOIN dbo.tfn_我的学员(@人员类型, @人员编号) a ON a0.学员编号 = a.编号
            OUTER APPLY dbo.TFNFlow(100, a0.编号, @人员类型, @人员编号) b;
GO
/****** Object:  View [dbo].[v_继教操作考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_继教操作考试]
AS
    SELECT  a0.编号 ,
            a0.活动编号 ,
            a0.类型 ,
            a0.名称 ,
            a0.排序值 ,
            a0.开始时间 ,
            a0.结束时间 ,
            a0.地点 ,
            a0.备注 ,
            a.及格分数 ,
			a.描述,
			a.是否允许考生查看成绩,
			a.是否允许考生查看评分,
            x.参与人数 ,
            x.通过人数
    FROM    继教活动内容 a0
            JOIN 继教操作考试 a ON a.编号 = a0.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 参与人数 ,
                                    ISNULL(SUM(CASE m.是否通过
                                          WHEN 1 THEN 1
                                          ELSE 0
                                        END),0) AS 通过人数
                          FROM      dbo.v_继教操作考试参与情况 m
                          WHERE     m.考试编号 = a.编号
                        ) x;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可参与的操作考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某人可参与的操作考试]
    (
      @可参与人类型 NVARCHAR(50) ,
      @可参与人编号 INT
	  --@口令 NVARCHAR(50)
    )
RETURNS TABLE
RETURN
    --名字为什么不用"tfn_继教某人可参与的理论考试活动"
--是因为,其实这个里面是可以包含慕课活动的理论考试的.

WITH    cte
          AS ( SELECT   a.编号 ,
                        a.文件夹编号 ,
                        a0.类型 AS 活动类型 ,
                        a.培训计划编号 ,
                        a1.名称 AS 培训计划名称 ,
                        a1.年份 AS 培训计划年份 ,
                        a.项目分类编号 ,
                        a2.名称 AS 项目分类名称 ,
                        a.名称 ,
                        a.开始时间 AS 活动开始时间 ,
                        a.结束时间 AS 活动结束时间 ,
                        a.学分 ,
                        a.封面 ,
                        a.简介 ,
                        a.必须按顺序学习 ,
                        a.建立时间 ,
                        a.建立人 ,
                        a3.姓名 AS 建立人姓名 ,
                        a.备注 AS 活动备注 ,
                        CASE WHEN a.开始时间 IS NULL
                                  AND a.结束时间 IS NULL THEN '未发布'
                             WHEN GETDATE() < a.开始时间 THEN '未开始'
                             WHEN GETDATE() BETWEEN a.开始时间 AND a.结束时间
                             THEN '进行中'
                             WHEN a.结束时间 < GETDATE() THEN '已结束'
                        END AS '状态' ,
                        b.编号 AS 考试编号 ,
                        b.名称 AS 考试名称 ,
                        b.开始时间 AS 考试开始时间 ,
                        b.结束时间 AS 考试结束时间 ,
                        b.地点 ,
                        b.及格分数 ,
                        b.描述 ,
                        b.是否允许考生查看成绩 ,
                        b.是否允许考生查看评分 ,
                        b.参与人数 ,
                        b.通过人数 ,
                        b.备注 AS 考试备注 ,
                        c.编号 AS 考试批次编号 ,
                        c.考试开始时间 AS 考试批次开始时间 ,
                        c.考试结束时间 AS 考试批次结束时间 ,
                        c.考试地点 ,
                        c.人数上限 ,
                        c.二维码 ,
                        c.口令 ,
                        c.备注 AS 考试批次备注
               FROM     dbo.继教活动 a
                        JOIN dbo.继教文件夹 a0 ON a.文件夹编号 = a0.编号
                        LEFT JOIN dbo.继教培训计划 a1 ON a.培训计划编号 = a1.编号
                        LEFT JOIN dbo.继教活动项目分类 a2 ON a.项目分类编号 = a2.编号
                        LEFT JOIN 人员 a3 ON a.建立人 = a3.编号
			--19-10-14以上应该由"v_继教活动"(不带统计)这样一个view来获取;
                        JOIN dbo.v_继教操作考试 b ON a.编号 = b.活动编号
                        JOIN dbo.继教考试批次 c ON b.编号 = c.考试编号
             )
    SELECT  *
    FROM    cte
            OUTER APPLY ( SELECT    m.是否通过 ,
                                    m.得分 ,
                                    m.开始操作时间 ,
                                    m.结束操作时间
                          FROM      dbo.v_继教操作考试参与情况 m
                          WHERE     m.考试批次编号 = cte.考试批次编号
                                    AND m.参与人类型 = @可参与人类型
                                    AND m.参与人编号 = @可参与人编号
                        ) x
    WHERE   cte.活动开始时间 IS NOT NULL --必然是已发布的活动,这个是写死在这里了的
            AND ( EXISTS ( SELECT   1
                           FROM     dbo.继教考试批次可参与人 n
                           WHERE    n.考试批次编号 = cte.考试批次编号
                                    AND n.可参与人类型 = @可参与人类型
                                    AND n.可参与人编号 = @可参与人编号 )
                  --OR cte.是否允许任何人参与 = 1
				  --OR (cte.口令 IS NOT NULL AND cte.口令 = @口令)
                  ); --AND  (@口令 = '' or cte.口令 = @口令);




GO
/****** Object:  View [dbo].[v_继教操作考试活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教操作考试活动]
AS
    SELECT  b.文件夹编号 ,
            b.学分 ,
            a.* ,
            --CASE WHEN b.开始时间 IS NULL
            --          AND b.结束时间 IS NULL THEN '未发布'
            --     WHEN GETDATE() < b.开始时间 THEN '未开始'
            --     WHEN GETDATE() BETWEEN b.开始时间 AND b.结束时间 THEN '进行中'
            --     WHEN b.结束时间 < GETDATE() THEN '已结束'
            --END AS '状态' ,
            b.状态 ,
            b.应学人数 AS 应考人数 ,
            b.建立人 ,
            b.建立人姓名 ,
            b.建立时间
    FROM    dbo.v_继教操作考试 a
            JOIN dbo.v_继教活动 b ON a.活动编号 = b.编号
            JOIN 人员 c ON b.建立人 = c.编号;



GO
/****** Object:  View [dbo].[v_教学轮转_任务完成情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_教学轮转_任务完成情况]
AS
    SELECT  a.编号 ,
            a.学员编号 ,
            b.姓名 AS 学员姓名 ,
            a.计划入科日期 ,
            a.计划出科日期 ,
            a.实际入科日期 ,
            a.实际出科日期 ,
            a.教学本院科室编号 ,
            c.教学本院策略编号 ,
            c.教学本院策略名称 ,
            c.教学专业科室编号 ,
            c.教学专业科室名称 ,
            c.本院科室编号 ,
            c.本院科室名称 ,
            c.最大学员人数 ,
		--当前在科人数没有统计,这个如何/在哪统计是个问题...
            c.科室管理员编号 ,
            c.科室管理员姓名 ,
            a.带教老师编号 ,
            d.姓名 AS 带教老师姓名 ,
            a.最低管床数量 ,
            a.最低全程管理数量 ,
            a.备注 ,
            CASE WHEN a.实际出科日期 IS NOT NULL THEN N'已出科'
                 WHEN a.实际入科日期 IS NOT NULL THEN N'在科'
                 ELSE N'未入科'
            END AS '状态' ,
            e.*,f.*
    FROM    dbo.教学轮转 a
            JOIN 教学学员 b ON a.学员编号 = b.编号
            LEFT JOIN dbo.v_教学本院科室 c ON a.教学本院科室编号 = c.编号
            LEFT JOIN 人员 d ON a.带教老师编号 = d.编号
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE WHEN e1.任务类型名称 = '技能'
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 技能病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.任务类型名称 = '疾病'
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 疾病病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.是否门诊 = 1
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 门诊病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.是否病房 = 1
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 住院病例数 ,
                                    ISNULL(SUM(CASE WHEN e1.是否医技 = 1
                                                    THEN e1.数量要求
                                                    ELSE 0
                                               END), 0) AS 医技病例数
                          FROM      dbo.v_教学轮转任务 e1
                          WHERE     e1.教学轮转编号 = a.编号
                        ) e
            OUTER APPLY ( SELECT    已完成技能病例数 = ISNULL(SUM(CASE
                                                              WHEN f1.任务类型名称 = '技能'
                                                              THEN 1
                                                              ELSE 0
                                                            END), 0) ,
                                    已完成疾病病例数 = ISNULL(SUM(CASE
                                                              WHEN f1.任务类型名称 = '疾病'
                                                              THEN 1
                                                              ELSE 0
                                                            END), 0) ,
                                    已完成门诊病例数 = ISNULL(SUM(CASE
                                                              WHEN f1.是否门诊 = 1
                                                              THEN 1
                                                              ELSE 0
                                                            END), 0) ,
                                    已完成病房病例数 = ISNULL(SUM(CASE
                                                              WHEN f1.是否病房 = 1
                                                              THEN 1
                                                              ELSE 0
                                                            END), 0) ,
                                    已完成医技病例数 = ISNULL(SUM(CASE
                                                              WHEN f1.是否医技 = 1
                                                              THEN 1
                                                              ELSE 0
                                                            END), 0)
                          FROM      dbo.v_教学轮转任务 f1
                                    JOIN 教学轮转手册完成任务 f2 ON f1.编号 = f2.教学轮转任务编号
                                    JOIN 教学轮转手册 f3 ON f2.教学轮转手册编号 = f3.编号
                                    JOIN dbo.Flow f4 ON f3.编号 = f4.SourceId
                                                        AND f4.FlowTemplateId = 300
                                                        AND f4.State = 1
                          WHERE     f1.教学轮转编号 = a.编号
                        ) f;







GO
/****** Object:  View [dbo].[v_tfn_继教签到参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


						CREATE VIEW [dbo].[v_tfn_继教签到参与情况] AS 
						SELECT * FROM tfn_继教签到参与情况(0)

GO
/****** Object:  View [dbo].[v_继教签到]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教签到]
AS
    SELECT  a0.编号 ,
            a0.活动编号 ,
            a0.类型 ,
            a0.名称 ,
            a0.排序值 ,
            a0.开始时间 ,
            a0.结束时间 ,
            a0.地点 ,
            a0.备注 ,
			y.规定签到次数,
            x.参与人数 ,
            x.通过人数
    FROM    继教活动内容 a0
            JOIN 继教签到 a ON a.编号 = a0.编号
			OUTER APPLY(SELECT COUNT(1) AS 规定签到次数 FROM 继教签到规定 n WHERE n.签到编号 = a.编号) y
            OUTER APPLY ( SELECT    COUNT(1) AS 参与人数 ,
                                    ISNULL(SUM(CASE m.是否通过
                                          WHEN 1 THEN 1
                                          ELSE 0
                                        END),0) AS 通过人数
                          FROM      dbo.tfn_继教签到参与情况(a.编号) m
                        ) x;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可参与的签到]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某人可参与的签到]
    (
      @可参与人类型 NVARCHAR(50) ,
      @可参与人编号 INT
    )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT   a.编号 ,
                            a.文件夹编号 ,
                            a0.类型 AS 活动类型 ,
                            a.培训计划编号 ,
                            a1.名称 AS 培训计划名称 ,
                            a1.年份 AS 培训计划年份 ,
                            a.项目分类编号 ,
                            a2.名称 AS 项目分类名称 ,
                            a.名称 ,
                            a.开始时间 AS 活动开始时间 ,
                            a.结束时间 AS 活动结束时间 ,
                            a.学分 ,
                            a.封面 ,
                            a.简介 ,
                            a.必须按顺序学习 ,
                            a.建立时间 ,
                            a.建立人 ,
                            a3.姓名 AS 建立人姓名 ,
                            a.备注 AS 活动备注 ,
                            CASE WHEN a.开始时间 IS NULL
                                      AND a.结束时间 IS NULL THEN '未发布'
                                 WHEN GETDATE() < a.开始时间 THEN '未开始'
                                 WHEN GETDATE() BETWEEN a.开始时间 AND a.结束时间
                                 THEN '进行中'
                                 WHEN a.结束时间 < GETDATE() THEN '已结束'
                            END AS '状态' ,
                            b.编号 AS 签到编号 ,
                            b.名称 AS 签到名称 ,
                            b.开始时间 AS 签到开始时间 ,
                            b.结束时间 AS 签到结束时间 ,
                            b.地点 ,
                            b.备注 AS 签到备注 ,
                            b.规定签到次数 ,
                            b.参与人数 ,
                            b.通过人数
                   FROM     dbo.继教活动 a
                            JOIN dbo.继教文件夹 a0 ON a.文件夹编号 = a0.编号
                            LEFT JOIN dbo.继教培训计划 a1 ON a.培训计划编号 = a1.编号
                            LEFT JOIN dbo.继教活动项目分类 a2 ON a.项目分类编号 = a2.编号
                            LEFT JOIN 人员 a3 ON a.建立人 = a3.编号
			--19-10-14以上应该由"v_继教活动"(不带统计)这样一个view来获取;
                            JOIN dbo.v_继教签到 b ON a.编号 = b.活动编号
                 )
    SELECT  *
    FROM    cte
            OUTER APPLY ( SELECT    m.参与人称谓 ,
                                    m.签到次数 ,
                                    m.是否通过
                          FROM      dbo.tfn_继教签到参与情况(cte.签到编号) m
                          WHERE     m.参与人类型 = @可参与人类型
                                    AND m.参与人编号 = @可参与人编号
                        ) x
    WHERE   cte.活动开始时间 IS NOT NULL --必然是已发布的活动,这个是写死在这里了的
            AND ( EXISTS ( SELECT   1
                           FROM     dbo.继教活动可参与人 n
                           WHERE    n.活动编号 = cte.编号
                                    AND n.可参与人类型 = @可参与人类型
                                    AND n.可参与人编号 = @可参与人编号 )
                  );




GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某助教可打分的操作考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某助教可打分的操作考试] ( @助教编号 INT )
RETURNS TABLE
RETURN
    SELECT  *
    FROM    dbo.v_继教操作考试活动 a
    WHERE   EXISTS ( SELECT 1
                     FROM   dbo.继教操作考试助教老师 b
                     WHERE  b.操作考试编号 = a.编号
                            AND b.助教老师编号 = @助教编号 );
GO
/****** Object:  View [dbo].[v_继教签到活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教签到活动]
AS
    SELECT  b.文件夹编号 ,
            b.学分 ,
            a.* ,
            b.状态 ,
            b.应学人数 AS 应考人数 ,
            b.建立人 ,
            b.建立人姓名 ,
            b.建立时间
    FROM    dbo.v_继教签到 a
            JOIN dbo.v_继教活动 b ON a.活动编号 = b.编号
            JOIN 人员 c ON b.建立人 = c.编号;




GO
/****** Object:  View [dbo].[v_继教活动内容]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教活动内容]
AS
    SELECT  *
    FROM    dbo.继教活动内容 a
            OUTER APPLY ( SELECT    COUNT(1) AS 参与人次 ,
                                    ISNULL( SUM(CASE m.是否通过
                                          WHEN 1 THEN 1
                                          ELSE 0
                                        END),0) AS 通过人数
                          FROM      dbo.tfn_继教某活动内容的通过情况(a.编号) m
                        ) x;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可参与的活动内容]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某人可参与的活动内容]
    (
      @活动编号 INT ,
      @可参与人类型 NVARCHAR(50) ,
      @可参与人编号 INT
    )
RETURNS TABLE
RETURN
    SELECT  *
    FROM    dbo.继教活动内容 a
            OUTER APPLY ( SELECT    m.是否通过
                          FROM      dbo.tfn_继教某活动内容的通过情况(a.编号) m
                          WHERE     m.参与人类型 = @可参与人类型
                                    AND m.参与人编号 = @可参与人编号
                        ) x
    WHERE   a.活动编号 = @活动编号;



GO
/****** Object:  View [dbo].[v2_下载中心]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v2_下载中心] AS
SELECT  a.* ,
        b.工号 AS 上传人工号 ,
        b.姓名 AS 上传人姓名 ,
        b.部门编号 AS 上传人部门编号 ,
        b.部门名称 AS 上传人部门名称
FROM    dbo.下载中心 a
        LEFT JOIN dbo.v1_人员_带部门名 b ON a.上传人编号 = b.编号;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_某人员可查看的下载中心]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_某人员可查看的下载中心] ( @人员编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  *
    FROM    dbo.v2_下载中心
    WHERE   上传人编号 = @人员编号
            OR 是否启用 = 1;
					


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可参与的活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_继教某人可参与的活动]
    (
      @可参与人类型 NVARCHAR(50) ,
      @可参与人编号 INT
    )
RETURNS TABLE
RETURN
    SELECT  a.编号 ,
            a.文件夹编号 ,
            a0.类型 AS 活动类型 ,
            a.培训计划编号 ,
            a1.名称 AS 培训计划名称 ,
            a1.年份 AS 培训计划年份 ,
            a.项目分类编号 ,
            a2.名称 AS 项目分类名称 ,
            a.名称 ,
            a.开始时间 ,
            a.结束时间 ,
            a.学分 ,
            a.封面 ,
            a.简介 ,
            a.必须按顺序学习 ,
            a.建立时间 ,
            a.建立人 ,
            a3.姓名 AS 建立人姓名 ,
            a.备注 ,
            CASE WHEN a.开始时间 IS NULL
                      AND a.结束时间 IS NULL THEN '未发布'
                 WHEN GETDATE() < a.开始时间 THEN '未开始'
                 WHEN GETDATE() BETWEEN a.开始时间 AND a.结束时间 THEN '进行中'
                 WHEN a.结束时间 < GETDATE() THEN '已结束'
            END AS '状态' ,
            x.活动内容数量 ,
            y.*
            --x.应学人数 ,
            --dbo.fn_继教获取某活动通过所有活动内容的人数(a.编号) AS 完成人数
    FROM    dbo.继教活动 a
            JOIN dbo.继教文件夹 a0 ON a.文件夹编号 = a0.编号
            LEFT JOIN dbo.继教培训计划 a1 ON a.培训计划编号 = a1.编号
            LEFT JOIN dbo.继教活动项目分类 a2 ON a.项目分类编号 = a2.编号
            LEFT JOIN 人员 a3 ON a.建立人 = a3.编号
			
            --OUTER APPLY ( SELECT    COUNT(1) AS 应学人数
            --              FROM      dbo.继教活动可参与人 m
            --              WHERE     m.活动编号 = a.编号
            --            ) x; 
            OUTER APPLY ( SELECT    COUNT(1) AS 活动内容数量
                          FROM      dbo.继教活动内容 m
                          WHERE     m.活动编号 = a.编号
                        ) x
            OUTER APPLY ( SELECT    COUNT(1) AS 参与活动内容数量 ,
                                    ISNULL(SUM(CASE WHEN o.是否通过 = 1 THEN 1
                                                    ELSE 0
                                               END), 0) AS 通过活动内容数量
                          FROM      dbo.tfn_继教某活动的通过情况(a.编号) o
                          WHERE     o.参与人类型 = @可参与人类型
                                    AND o.参与人编号 = @可参与人编号
                        ) y
    WHERE   EXISTS ( SELECT 1
                     FROM   dbo.继教活动可参与人 n
                     WHERE  n.活动编号 = a.编号
                            AND n.可参与人类型 = @可参与人类型
                            AND n.可参与人编号 = @可参与人编号 )
            AND a.开始时间 IS NOT NULL; --必然是已发布的活动,这个是写死在这里了的




GO
/****** Object:  View [dbo].[v2_参加会议]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v2_参加会议]
AS
    SELECT  a.* ,
            b.工号 AS 申请人工号 ,
            b.姓名 AS 申请人姓名 ,
            b.部门名称 AS 申请人部门名称
    FROM    dbo.参加会议 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.申请人编号 = b.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_参加会议]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_参加会议]
    (
      @人员编号 INT ,
      @流程模板编号 INT 
    )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*,
			CAST( IIF(c.状态 = 1,1,0) AS BIT) AS 是否可以反馈,
			CAST(IIF(EXISTS ( SELECT 1
                         FROM   参加会议反馈
                         WHERE  参加会议编号 = a.编号 ), 1, 0) AS BIT) AS 是否反馈过
    FROM    dbo.v2_参加会议 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c

GO
/****** Object:  View [dbo].[v3_参加会议反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[v3_参加会议反馈]
AS
    SELECT  b.编号 ,
            b.参加会议编号 ,
            a.会议名称 ,
            a.会议主办单位 ,
            a.会议承办单位 ,
            a.研讨领域 ,
            a.学科类型 ,
            a.会议地址 ,
            a.会议开始时间 ,
            a.会议结束时间 ,
            a.往返时间 ,
            a.会议网址 ,
            a.会议简介及申请理由 ,
            a.申请人编号 ,
            a.参会相关文件路径 ,
            a.申请人工号 ,
            a.申请人姓名 ,
            a.申请人部门名称 ,
            b.活动持续分钟 ,
            b.参会人数 ,
            b.参会总结 ,
            b.会议反馈文件路径
    FROM    dbo.v2_参加会议 a
            JOIN dbo.参加会议反馈 b ON a.编号 = b.参加会议编号;





GO
/****** Object:  View [dbo].[v3_参加会议报销]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v3_参加会议报销]
AS
    SELECT  a.* ,
            ISNULL(b.待审核报销, 0) AS 待审核报销 ,
            ISNULL(b.已审核报销, 0) AS 已审核报销
    FROM    dbo.v2_参加会议 a
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
                          WHERE     b1.流程模板编号 = 210
                                    AND b1.项目编号 = a.编号
                        ) b;






GO
/****** Object:  View [dbo].[v_教学活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_教学活动]
AS
    SELECT  a.编号 ,
            a.活动主题 ,
            a.活动开始时间 ,
            a.活动结束时间 ,
            a.活动地点 ,
            a.教学活动类型编号 ,
            a1.名称 AS 教学活动类型名称 ,
            a.主讲人编号 ,
            a.主讲人姓名 ,
            a3.部门编号 AS 主讲人部门编号 ,
            a3.部门名称 AS 主讲人部门名称 ,
            a.主讲人职称 ,
            a.活动内容 ,
            a.教学病例 ,
            a.病人编号 ,
            a2.姓名 AS 病人姓名 ,
            a2.性别 AS 病人性别 ,
            a2.出生日期 AS 病人出生日期 ,
            a2.住院号 AS 病人住院号 ,
            a2.住院床号 AS 病人住院床号 ,
            a2.主要诊断 AS 病人主要诊断 ,
            a2.次要诊断 AS 病人次要诊断 ,
            a2.入院日期 AS 病人入院日期 ,
            a2.出院日期 AS 病人出院日期 ,
            a.附件 ,
            a.建立人 ,
            a.建立时间 ,
            a.备注 ,
            b.反馈数量 ,
            c.评价次数 ,
            c.所有项目满分 ,
            c.所有项目总得分 ,
            c.得分星数
    FROM    dbo.教学活动 a
            JOIN dbo.教学活动类型 a1 ON a.教学活动类型编号 = a1.编号
            LEFT JOIN 教学病人 a2 ON a.病人编号 = a2.编号
            LEFT JOIN dbo.v1_人员_带部门名 a3 ON a.主讲人编号 = a3.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 反馈数量
                          FROM      dbo.教学活动反馈
                          WHERE     教学活动编号 = a.编号
                        ) b
			--COUNT(DISTINCT c1.评价人编号) AS 评价次数 因为这的评价人只有学员,所以就按这个统计了,其实评价和评价打分应该分为父子表
            OUTER APPLY ( SELECT    COUNT(DISTINCT c1.评价人编号) AS 评价次数 ,
                                    SUM(c2.标准分) AS 所有项目满分 ,
                                    SUM(c1.评分) AS 所有项目总得分 ,
                                    CEILING(SUM(c1.评分) / ( SUM(c2.标准分) / 5.0 )) AS 得分星数
                          FROM      教学活动评价 c1
                                    JOIN dbo.教学活动评价项目 c2 ON c1.教学活动评价项目编号 = c2.编号
                          WHERE     c1.教学活动编号 = a.编号
                        ) c;





GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学某学员可查看的教学活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_教学某学员可查看的教学活动] ( @PersonId INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.v_教学活动 a
    WHERE   EXISTS ( SELECT 1
                     FROM   dbo.教学活动可参与者 b
                     WHERE  b.教学活动编号 = a.编号
                            AND (b.学员编号 = @PersonId  OR b.学员编号=0));
					





GO
/****** Object:  View [dbo].[v_教学补轮转]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学补轮转] AS 
SELECT a.编号 ,
       a.教学轮转编号 ,
	   b.学员编号,
	   b.学员姓名,
	   b.计划入科日期,
	   b.本院科室编号,
	   b.本院科室名称,
	   b.科室管理员编号,
	   b.科室管理员姓名,
	   b.带教老师编号,
	   b.带教老师姓名,
       a.说明 ,
       a.开始日期 ,
       a.结束日期 ,
       a.建立人 ,
       a.建立时间 ,
       a.备注 FROM dbo.教学补轮转 a JOIN v_教学轮转 b ON a.教学轮转编号 = b.编号
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_参加会议反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_参加会议反馈] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v3_参加会议反馈 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学活动评价_按项目统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学活动评价_按项目统计]
    (
      @教学活动类型编号 INT ,
      @教学活动编号 INT
    )
RETURNS TABLE
AS RETURN
    --DECLARE @PersonId int = 3094
SELECT  *
FROM    教学活动评价项目 a
        OUTER APPLY ( SELECT    SUM(b.评分) / COUNT(b.评分) AS 平均得分, COUNT(b.评分) AS 评价人数
                      FROM      dbo.教学活动评价 b
                      WHERE     b.教学活动编号 = @教学活动编号
                                AND b.教学活动评价项目编号 = a.编号
                    ) z
WHERE   a.教学活动类型编号 = @教学活动类型编号;


GO
/****** Object:  View [dbo].[v_tfn_教学活动评价_按项目统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_教学活动评价_按项目统计]
AS
SELECT * FROM tfn_教学活动评价_按项目统计(NULL,NULL)
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学活动评价]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_教学活动评价]
    (
      @教学活动类型编号 INT ,
      @教学活动编号 INT ,
      @教学学员编号 INT
    )
RETURNS TABLE
AS RETURN
    --DECLARE @PersonId int = 3094
SELECT  
        a.名称 AS 评价项目名称,
        a.标准分 ,
        a.是否启用 ,
        --
		b.编号 ,
        b.评价人类型 ,
        b.评价人编号 ,
		c.姓名 AS 评价人姓名,
        b.教学活动编号 ,
        b.教学活动评价项目编号 ,
        b.评分 ,
        b.备注
FROM    教学活动评价项目 a
        LEFT JOIN 教学活动评价 b ON a.教学活动类型编号 = @教学活动类型编号
                              AND b.教学活动编号 = @教学活动编号
                              AND b.评价人编号 = @教学学员编号
                              AND a.编号 = b.教学活动评价项目编号 JOIN 教学学员 c ON b.评价人编号 = c.编号;
GO
/****** Object:  View [dbo].[v_tfn_教学活动评价]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_教学活动评价] as
SELECT * FROM tfn_教学活动评价(NULL,NULL,NULL)
GO
/****** Object:  View [dbo].[v2_纵向项目立项_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v2_纵向项目立项_列表]
AS
    SELECT  a.编号 ,
            a.分类 ,
			a.项目编号 AS 纵向项目项目编号,
            CASE a.分类
              WHEN 1 THEN '科研项目'
              WHEN 2 THEN '重点学科'
              WHEN 3 THEN '人才培养'
            END AS 分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --b.名称 AS 成果归属部门名称 ,
            a.负责人编号,
			c.工号 AS 负责人工号 ,
            c.姓名 AS 负责人姓名 ,
            c.部门编号 AS 负责人部门编号 ,
            c.部门名称 AS 负责人部门名称,
			a.登记人编号,
			d.姓名 AS 登记人姓名
    FROM    dbo.纵向项目立项 a
            --LEFT JOIN 部门 b ON a.成果归属部门编号 = b.编号
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.负责人编号 = c.编号 
			LEFT JOIN 人员 d ON a.登记人编号 = d.编号;


GO
/****** Object:  View [dbo].[v4_纵向项目总览]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[v4_纵向项目总览] AS
SELECT  a.* ,
        b.名称 ,
        b.项目编号 ,
        b.路径 ,
        b.发起人编号 ,
        CONCAT(b.状态名称, '-', b.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.v3_流程 b ON b.流程模板编号 = 410
                            AND a.编号 = b.项目编号
UNION ALL
SELECT  a.* ,
        c.名称 ,
        c.项目编号 ,
        c.路径 ,
        c.发起人编号 ,
        CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.纵向项目中检 b ON a.编号 = b.纵向项目编号
        JOIN dbo.v3_流程 c ON c.流程模板编号 = 420
                            AND b.编号 = c.项目编号
UNION ALL
SELECT  a.* ,
        c.名称 ,
        c.项目编号 ,
        c.路径 ,
        c.发起人编号 ,
        CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.纵向项目变更 b ON a.编号 = b.纵向项目编号
        JOIN dbo.v3_流程 c ON c.流程模板编号 = 430
                            AND b.编号 = c.项目编号
UNION ALL
SELECT  a.* ,
        c.名称 ,
        c.项目编号 ,
        c.路径 ,
        c.发起人编号 ,
        CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
FROM    v2_纵向项目立项_列表 a
        JOIN dbo.纵向项目结题 b ON a.编号 = b.纵向项目编号
        JOIN dbo.v3_流程 c ON c.流程模板编号 = 440
                            AND b.编号 = c.项目编号;






GO
/****** Object:  View [dbo].[v3_项目经费到账_纵向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v3_项目经费到账_纵向]
AS
    SELECT  a.编号,
	a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号 ,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
            a.登记人编号 ,
            a.登记人姓名 ,
            a.批准经费 + a.配套经费 AS 经费 ,
            IIF(a.批准经费 + a.配套经费 - b.待审核到账 - b.已审核到账>0,a.批准经费 + a.配套经费 - b.待审核到账 - b.已审核到账,0) AS 未到经费 ,
            b.待审核到账 AS  待审核到账,
            b.已审核到账 AS 已审核到账
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 待审核到账 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 已审核到账
                          FROM      项目经费到账 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 500
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 410
                                    AND b1.项目编号 = a.编号
                        ) b;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_纵向项目立项]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






			CREATE FUNCTION [dbo].[tfn_纵向项目立项] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_纵向项目中检]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[tfn_纵向项目中检]
    (
      @人员编号 INT ,
      @立项流程模板编号 INT ,
      @中检流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.纵向项目编号 ,
            b.中检资料路径 ,
            b.备注 ,
            b.建立时间 ,
			a.编号 AS 纵向项目立项编号,
			a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
			a.登记人编号 AS 立项登记人编号,
			a.登记人姓名 AS 立项登记人姓名,
            IIF(c.状态 IS NULL,'未发起中检', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--按立项项目分组,是否有未完成的中检,有则不能发起
		--如果状态为null则表示还没有开始中检,如果=1则表示该中检已经结束,都不参与计数,否则+1,最后计算 = 0则可以发起中检
            CAST(IIF(COUNT(IIF(c.状态 IS NULL
                      OR c.状态 = 1, NULL, 1)) OVER ( PARTITION BY a.编号 ) = 0, 1, 0) AS bit) AS '是否可发起中检'
    FROM    dbo.v2_纵向项目立项_列表 a
            LEFT JOIN 纵向项目中检 b ON a.编号 = b.纵向项目编号
			--下面不能用dbo.tfn_流程(@中检流程模板编号, b.编号, @人员编号),因为b.编号为null的时候,将会取出所有编号流程,那么其中的c.状态都不对了.
			--也就是说,tfn_流程中的"项目编号 = ISNULL(@项目编号, 项目编号)"条件在这里有点画蛇添足;
            OUTER APPLY dbo.tfn_流程(@中检流程模板编号, ISNULL(b.编号,0), @人员编号) c
    WHERE   --立项流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @立项流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在已经任何状态的结题
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.纵向项目结题
                             WHERE  纵向项目编号 = a.编号 ); 

GO
/****** Object:  View [dbo].[v3_项目经费报销_纵向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v3_项目经费报销_纵向]
AS
    SELECT  a.编号,
	a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号 ,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
            a.登记人编号 ,
            a.登记人姓名 ,
            a.批准经费 + a.配套经费 AS 经费 ,
            IIF(a.批准经费 + a.配套经费 - b.待审核报销 - b.已审核报销>0,a.批准经费 + a.配套经费 - b.待审核报销 - b.已审核报销,0) AS 剩余经费 ,
            b.待审核报销 AS 待审核报销,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v2_纵向项目立项_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 待审核报销 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 已审核报销
                          FROM      dbo.报销 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 600
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 410
                                    AND b1.项目编号 = a.编号
                        ) b;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_纵向项目结题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[tfn_纵向项目结题]
    (
      @人员编号 INT ,
      @立项流程模板编号 INT ,
      @中检流程模板编号 INT ,
      @变更流程模板编号 INT ,
      @结题流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.纵向项目编号 ,
            b.结题验收编号 ,
            b.结题验收时间 ,
            b.结题验收是否合格 ,
            b.结题验收参与人数 ,
            b.结题资料路径 ,
            b.备注 ,
            b.建立时间 ,
            a.编号 AS 纵向项目立项编号 ,
			a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
			a.登记人编号 AS 立项登记人编号,
			a.登记人姓名 AS 立项登记人姓名,
            IIF(c.状态 IS NULL, '未发起结题', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--如果状态为null则表示还没有开始结题,则可发起结题,否则不能
            CAST(IIF(c.状态 IS NULL, 1, 0)AS BIT) AS '是否可发起结题'
    FROM    dbo.v2_纵向项目立项_列表 a
            LEFT JOIN dbo.纵向项目结题 b ON a.编号 = b.纵向项目编号
            OUTER APPLY dbo.tfn_流程(@结题流程模板编号, ISNULL(b.编号,0), @人员编号) c
    WHERE   --立项流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @立项流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在未完成的中检
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.流程 m JOIN dbo.纵向项目中检 n ON m.流程模板编号=@中检流程模板编号 AND m.项目编号 = n.编号
                             WHERE  a.编号 = n.纵向项目编号 AND m.状态 <> 1)
			--不存在未完成的变更
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.流程 m JOIN dbo.纵向项目变更 n ON m.流程模板编号=@变更流程模板编号 AND m.项目编号 = n.编号
                             WHERE  a.编号 = n.纵向项目编号 and m.状态 <> 1);
							

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_纵向项目变更]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_纵向项目变更]
    (
      @人员编号 INT ,
      @立项流程模板编号 INT ,
      @变更流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.变更内容简介 ,
            b.变更事由 ,
            b.变更备注 ,
            b.变更时间 ,
            a.编号 AS 纵向项目立项编号 ,
			a.纵向项目项目编号,
            a.分类 ,
            a.分类名称 ,
            a.项目中文名称 ,
            a.项目英文名称 ,
            a.项目类型 ,
            a.项目级别 ,
            a.项目来源单位 ,
            a.项目类别 ,
            a.批准经费 ,
            a.配套经费 ,
            a.计划开始日期 ,
            a.计划完成日期 ,
            --a.成果归属部门名称 ,
            a.负责人编号 ,
            a.负责人工号 ,
            a.负责人姓名 ,
            a.负责人部门编号 ,
            a.负责人部门名称 ,
            a.登记人编号 AS 立项登记人编号 ,
            a.登记人姓名 AS 立项登记人姓名 ,
            IIF(c.状态 IS NULL, '未发起变更', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
		--按立项项目分组,是否有未完成的变更,有则不能发起
		--如果状态为null则表示还没有开始变更,如果=1则表示该变更已经结束,都不参与计数,否则+1,最后计算 = 0则可以发起变更
		--同时@人员编号等于流程立项登记人编号,才能发起变更;
            CAST(IIF(COUNT(IIF(c.状态 IS NULL OR c.状态 = 1, NULL, 1)) OVER ( PARTITION BY a.编号 ) = 0
            AND @人员编号 in (a.登记人编号,a.负责人编号), 1, 0) AS BIT) AS '是否可发起变更'
			--iif(EXISTS ( SELECT 1
   --                                              FROM   流程 d
   --                                              WHERE  d.流程模板编号 = @变更流程模板编号
   --                                                     AND d.项目编号 = a.编号
   --                                                     AND d.状态 <> 1 ) or @人员编号 <> a.登记人编号,0,1) AS  '是否可发起变更2'
    FROM    dbo.v2_纵向项目立项_列表 a
            LEFT JOIN 纵向项目变更 b ON a.编号 = b.纵向项目编号
            OUTER APPLY dbo.tfn_流程(@变更流程模板编号, ISNULL(b.编号, 0), @人员编号) c
            --OUTER APPLY ( SELECT    IIF(EXISTS ( SELECT 1
            --                                     FROM   流程 d
            --                                     WHERE  d.流程模板编号 = @变更流程模板编号
            --                                            AND d.项目编号 = a.编号
            --                                            AND d.状态 <> 1 ), 0, 1) AS 已有变更是否都完成
            --            ) e
    WHERE   --立项流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @立项流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在已经任何状态的结题
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.纵向项目结题
                             WHERE  纵向项目编号 = a.编号 ); 

GO
/****** Object:  View [dbo].[v4_纵向项目经费统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v4_纵向项目经费统计]
AS
SELECT 
       a.负责人部门名称 ,
       SUM(a.经费 ) AS 经费,
       SUM(a.未到经费) AS 未到经费 ,
       SUM(a.待审核到账 ) AS 待审核到账,
       SUM(a.已审核到账 ) AS 已审核到账,
       --SUM(b.剩余经费) AS 剩余经费 ,
       SUM(b.待审核报销 ) AS 待审核报销,
       SUM(b.已审核报销) AS 已审核报销 FROM dbo.v3_项目经费到账_纵向 a JOIN v3_项目经费报销_纵向 b ON a.编号 = b.编号 GROUP BY a.负责人部门名称;


GO
/****** Object:  View [dbo].[v4_纵向项目汇总]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v4_纵向项目汇总]
AS
    SELECT  a1.状态名称,a1.步骤名称, a1.步骤状态说明,
            a.*,
            b.剩余经费 ,
            b.待审核报销 ,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v3_项目经费到账_纵向 a LEFT JOIN dbo.v3_流程 a1 ON a1.流程模板编号 = 450 AND a.编号 = a1.项目编号
            JOIN v3_项目经费报销_纵向 b ON a.编号 = b.编号;


GO
/****** Object:  View [dbo].[v2_横向项目_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v2_横向项目_列表]
AS
    SELECT  a.编号 ,
            a.合同编号 ,
            a.合同名称 ,
            a.合同金额 ,
            a.签订时间 ,
            a.项目负责人编号 ,
            c.工号 AS 项目负责人工号 ,
            c.姓名 AS 项目负责人姓名 ,
            c.部门编号 AS 项目负责人部门编号 ,
            c.部门名称 AS 项目负责人部门名称 ,
            a.项目归属部门 
    FROM    dbo.横向项目 a
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.项目负责人编号 = c.编号;




GO
/****** Object:  View [dbo].[v3_项目经费到账_横向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dbo].[v3_项目经费到账_横向]
AS
    SELECT  a.* ,
            a.合同金额 AS 经费 ,
            IIF(a.合同金额 - b.待审核到账 - b.已审核到账>0,a.合同金额 - b.待审核到账 - b.已审核到账,0) AS 未到经费 ,
            b.待审核到账 AS 待审核到账 ,
            b.已审核到账 AS 已审核到账
    FROM    dbo.v2_横向项目_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 待审核到账 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.到账金额
                                            ELSE 0
                                          END),0) AS 已审核到账
                          FROM      项目经费到账 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 510
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 450
                                    AND b1.项目编号 = a.编号
                        ) b;


GO
/****** Object:  View [dbo].[v3_项目经费报销_横向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v3_项目经费报销_横向]
AS
    SELECT  a.* ,
            a.合同金额 AS 经费 ,
            IIF(a.合同金额 - b.待审核报销 - b.已审核报销>0,a.合同金额 - b.待审核报销 - b.已审核报销,0) AS 剩余经费 ,
            b.待审核报销 AS 待审核报销 ,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v2_横向项目_列表 a
            OUTER APPLY ( SELECT    ISNULL(SUM(CASE b2.状态
                                            WHEN 0 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 待审核报销 ,
                                    ISNULL(SUM(CASE b2.状态
                                            WHEN 1 THEN b1.报销金额
                                            ELSE 0
                                          END),0) AS 已审核报销
                          FROM      dbo.报销 b1
                                    JOIN 流程 b2 ON b2.流程模板编号 = 600
                                                  AND b1.编号 = b2.项目编号
                          WHERE     b1.流程模板编号 = 450
                                    AND b1.项目编号 = a.编号
                        ) b;

GO
/****** Object:  View [dbo].[v4_横向项目经费统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v4_横向项目经费统计]
as
SELECT 
       a.项目负责人部门名称 ,
       SUM(a.经费 ) AS 经费,
       SUM(a.未到经费) AS 未到经费 ,
       SUM(a.待审核到账 ) AS 待审核到账,
       SUM(a.已审核到账 ) AS 已审核到账,
       --SUM(b.剩余经费) AS 剩余经费 ,
       SUM(b.待审核报销 ) AS 待审核报销,
       SUM(b.已审核报销) AS 已审核报销 FROM dbo.v3_项目经费到账_横向 a JOIN v3_项目经费报销_横向 b ON a.编号 = b.编号 GROUP BY a.项目负责人部门名称;

GO
/****** Object:  View [dbo].[v4_横向项目汇总]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v4_横向项目汇总]
AS
    SELECT  a1.状态名称,a1.步骤名称, a1.步骤状态说明,
            a.*,
            b.剩余经费 ,
            b.待审核报销 ,
            b.已审核报销 AS 已审核报销
    FROM    dbo.v3_项目经费到账_横向 a LEFT JOIN dbo.v3_流程 a1 ON a1.流程模板编号 = 450 AND a.编号 = a1.项目编号
            JOIN v3_项目经费报销_横向 b ON a.编号 = b.编号;


GO
/****** Object:  View [dbo].[v_tfn_继教某人可参与的操作考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_继教某人可参与的操作考试] AS 
SELECT * FROM tfn_继教某人可参与的操作考试(NULL,NULL)
GO
/****** Object:  View [dbo].[v_tfn_继教某人可参与的活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_继教某人可参与的活动] AS 
SELECT * FROM [dbo].[tfn_继教某人可参与的活动](NULL,null)
GO
/****** Object:  View [dbo].[VTFNFLow]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VTFNFLow] as
SELECT * FROM dbo.TFNFlow(NULL,NULL,null,null) WHERE 1=2
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学请假申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学请假申请]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            c.教学轮转编号 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            --c.编号 ,
            --c.教学轮转编号 ,
            c.请假开始日期 ,
            c.请假天数 ,
            c.请假事由 ,
            c.建立人 ,
            c.建立时间 ,
            c.备注,
			--
			d.*
    --FROM    dbo.tfn_我的学员(@人员类型, @人员编号) a
    --        JOIN dbo.v_教学轮转 b ON a.编号 = b.学员编号
    --        JOIN dbo.教学更换带教老师 c ON b.编号 = c.教学轮转编号
    --        JOIN 人员 d ON c.原带教老师编号 = d.编号
    --        JOIN 人员 e ON c.新带教老师编号 = e.编号;
    FROM    dbo.tfn_我的轮转(@人员类型, @人员编号) b
            JOIN dbo.教学请假申请 c ON b.编号 = c.教学轮转编号 
			 OUTER APPLY dbo.TFNFlow(200, c.编号, @人员类型, @人员编号) d;
			;

GO
/****** Object:  View [dbo].[v_tfn_继教某人可参与的活动内容]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_继教某人可参与的活动内容]
 AS
 
 SELECT * FROM dbo.tfn_继教某人可参与的活动内容(NULL,NULL,NULL)
GO
/****** Object:  View [dbo].[v_tfn_继教某人可参与的签到]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_继教某人可参与的签到] AS
SELECT * FROM tfn_继教某人可参与的签到(NULL,NULL)
GO
/****** Object:  View [dbo].[v2_项目经费到账_纵向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v2_项目经费到账_纵向]
AS
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,
			a1.项目中文名称 AS 项目名称,
            --CASE a.流程模板编号
            --  WHEN 410 THEN ( SELECT    项目中文名称
            --                  FROM      dbo.纵向项目立项
            --                  WHERE     编号 = a.项目编号
            --                )
            --  WHEN 450 THEN ( SELECT    合同名称
            --                  FROM      dbo.横向项目
            --                  WHERE     编号 = a.项目编号
            --                )
            --END AS 项目名称 ,
            a.拨款单位 ,
            a.到账日期 ,
            a.到账金额 ,
            a.技术交易额 ,
            a.管理费用 ,
            a.技术合同认定服务费 ,
            a.增值税 ,
            a.到账单位 ,
            a.经办人编号 ,
            a.到账凭证路径 ,
            a.建立时间 ,
            a.备注 ,
            b.工号 AS 经办人工号 ,
            b.姓名 AS 经办人姓名 ,
            b.部门编号 AS 经办人部门编号 ,
            b.部门名称 AS 经办人部门名称
    FROM    dbo.项目经费到账 a
            JOIN dbo.纵向项目立项 a1 ON a.流程模板编号 = 410
                                  AND a.项目编号 = a1.编号
            LEFT  JOIN dbo.v1_人员_带部门名 b ON a.经办人编号 = b.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目经费到账_纵向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_项目经费到账_纵向] ( @人员编号 INT)
RETURNS TABLE
AS RETURN
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,a.项目名称,
            a.拨款单位 ,
            a.到账日期 ,
            a.到账金额 ,
            a.技术交易额 ,
            a.管理费用 ,
            a.技术合同认定服务费 ,
            a.增值税 ,
            a.到账单位 ,
            a.经办人编号 ,
            a.到账凭证路径 ,
            a.建立时间 ,
            a.备注 ,
            a.经办人工号 ,
            a.经办人姓名 ,
            a.经办人部门编号 ,
            a.经办人部门名称 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.流程编号 ,
            --c.流程模板编号 ,
            c.流程名称 ,
            c.流程相关项目路径 ,
            --c.项目编号 ,
            c.发起人编号 ,
            c.发起人工号 ,
            c.发起人姓名 ,
            c.发起人部门名称 ,
            c.状态 ,
            c.状态名称 ,
            c.流程创建时间 ,
            c.步骤编号 ,
            c.步骤名称 ,
            c.步骤状态 ,
            c.步骤链接名称 ,
            c.步骤链接路径 ,
			c.步骤链接样式 ,
            c.步骤操作人编号 ,
            c.步骤操作人工号 ,
            c.步骤操作人姓名 ,
            c.步骤操作人部门名称 ,
            c.步骤执行时间 ,
            c.步骤状态说明 ,
            c.是否可处理
    FROM    dbo.v2_项目经费到账_纵向 a
            OUTER APPLY dbo.tfn_流程(500, a.编号, @人员编号) c;

GO
/****** Object:  View [dbo].[v2_项目经费到账_横向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v2_项目经费到账_横向]
AS
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,
			a1.合同名称 AS 项目名称,
            --CASE a.流程模板编号
            --  WHEN 410 THEN ( SELECT    项目中文名称
            --                  FROM      dbo.纵向项目立项
            --                  WHERE     编号 = a.项目编号
            --                )
            --  WHEN 450 THEN ( SELECT    合同名称
            --                  FROM      dbo.横向项目
            --                  WHERE     编号 = a.项目编号
            --                )
            --END AS 项目名称 ,
            a.拨款单位 ,
            a.到账日期 ,
            a.到账金额 ,
            a.技术交易额 ,
            a.管理费用 ,
            a.技术合同认定服务费 ,
            a.增值税 ,
            a.到账单位 ,
            a.经办人编号 ,
            a.到账凭证路径 ,
            a.建立时间 ,
            a.备注 ,
            b.工号 AS 经办人工号 ,
            b.姓名 AS 经办人姓名 ,
            b.部门编号 AS 经办人部门编号 ,
            b.部门名称 AS 经办人部门名称
    FROM    dbo.项目经费到账 a
            JOIN dbo.横向项目 a1 ON a.流程模板编号 = 450
                                  AND a.项目编号 = a1.编号
            LEFT  JOIN dbo.v1_人员_带部门名 b ON a.经办人编号 = b.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目经费到账_横向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_项目经费到账_横向] ( @人员编号 INT)
RETURNS TABLE
AS RETURN
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,a.项目名称,
            a.拨款单位 ,
            a.到账日期 ,
            a.到账金额 ,
            a.技术交易额 ,
            a.管理费用 ,
            a.技术合同认定服务费 ,
            a.增值税 ,
            a.到账单位 ,
            a.经办人编号 ,
            a.到账凭证路径 ,
            a.建立时间 ,
            a.备注 ,
            a.经办人工号 ,
            a.经办人姓名 ,
            a.经办人部门编号 ,
            a.经办人部门名称 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.流程编号 ,
            --c.流程模板编号 ,
            c.流程名称 ,
            c.流程相关项目路径 ,
            --c.项目编号 ,
            c.发起人编号 ,
            c.发起人工号 ,
            c.发起人姓名 ,
            c.发起人部门名称 ,
            c.状态 ,
            c.状态名称 ,
            c.流程创建时间 ,
            c.步骤编号 ,
            c.步骤名称 ,
            c.步骤状态 ,
            c.步骤链接名称 ,
            c.步骤链接路径 ,
			c.步骤链接样式 ,
            c.步骤操作人编号 ,
            c.步骤操作人工号 ,
            c.步骤操作人姓名 ,
            c.步骤操作人部门名称 ,
            c.步骤执行时间 ,
            c.步骤状态说明 ,
            c.是否可处理
    FROM    dbo.v2_项目经费到账_横向 a
            OUTER APPLY dbo.tfn_流程(510, a.编号, @人员编号) c;

GO
/****** Object:  View [dbo].[v2_报销]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v2_报销]
AS
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,
            dbo.fn_根据流程模板编号获得项目类型名称(a.流程模板编号) AS 项目类型 ,
            --CASE a.流程模板编号
            --  WHEN 410 THEN ( SELECT    项目中文名称
            --                  FROM      dbo.纵向项目立项
            --                  WHERE     编号 = a.项目编号
            --                )
            --  WHEN 450 THEN ( SELECT    合同名称
            --                  FROM      dbo.横向项目
            --                  WHERE     编号 = a.项目编号
            --                )
            --  WHEN 210 THEN ( SELECT    会议名称
            --                  FROM      dbo.参加会议
            --                  WHERE     编号 = a.项目编号
            --                )
            dbo.fn_获取项目名称(a.流程模板编号, a.项目编号) AS 项目名称 ,
            a.报销编号 ,
            a.报销金额 ,
            a.报销方式 ,
            a.公务卡号 ,
            a.公务卡所属人姓名 ,
            a.报销人编号 ,
            a.报销时间 ,
            a.相关文件路径 ,
            a.申请时间 ,
            a.建立时间 ,
            a.报销经费用途 ,
            b.工号 AS 报销人工号 ,
            b.姓名 AS 报销人姓名 ,
            b.部门编号 AS 报销人部门编号 ,
            b.部门名称 AS 报销人部门名称
    FROM    dbo.报销 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.报销人编号 = b.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_报销]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_报销] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.流程编号 ,
            --c.流程模板编号 ,
            c.流程名称 ,
            c.流程相关项目路径 ,
            --c.项目编号 ,
            c.发起人编号 ,
            c.发起人工号 ,
            c.发起人姓名 ,
            c.发起人部门名称 ,
            c.状态 ,
            c.状态名称 ,
            c.流程创建时间 ,
            c.步骤编号 ,
            c.步骤名称 ,
            c.步骤状态 ,
            c.步骤链接名称 ,
            c.步骤链接路径 ,
			c.步骤链接样式 ,
            c.步骤操作人编号 ,
            c.步骤操作人工号 ,
            c.步骤操作人姓名 ,
            c.步骤操作人部门名称 ,
            c.步骤执行时间 ,
            c.步骤状态说明 ,
            c.是否可处理
    FROM    dbo.[v2_报销] a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  View [dbo].[v_继教自测活动]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教自测活动]
AS
    SELECT  b.文件夹编号 ,
	b.学分,
            a.* ,
            --CASE WHEN b.开始时间 IS NULL
            --          AND b.结束时间 IS NULL THEN '未发布'
            --     WHEN GETDATE() < b.开始时间 THEN '未开始'
            --     WHEN GETDATE() BETWEEN b.开始时间 AND b.结束时间 THEN '进行中'
            --     WHEN b.结束时间 < GETDATE() THEN '已结束'
            --END AS '状态' ,
			b.状态,
			b.应学人数 AS 应考人数,
            b.建立人 ,
            b.建立人姓名 ,
            b.建立时间
    FROM    dbo.v_继教自测 a
            JOIN dbo.v_继教活动 b ON a.活动编号 = b.编号
            JOIN 人员 c ON b.建立人 = c.编号;



GO
/****** Object:  View [dbo].[v_tfn_教学退培申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_教学退培申请] AS
SELECT * FROM tfn_教学退培申请(NULL,NULL)
GO
/****** Object:  View [dbo].[v1_预算已报销详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE VIEW [dbo].[v1_预算已报销详情]
/*某预算包括多个子项,将统计对应流程模板编号+项目编号的(未完成+完成)的注销的对应项目支出类型+支出内容的报销金额之和*/
AS
    SELECT  x.编号 ,
            x.流程模板编号 ,
            x.项目编号 ,
            x.项目支出类型 ,
            x.项目支出内容 ,
            x.财务科目 ,
            x.批准经费 ,
            x.配套经费 ,
            x.编制依据 ,
            x.批准经费 + ISNULL(x.配套经费,0) AS 经费 ,
            ISNULL(c.已报销金额, 0) AS 已报销金额
    FROM    dbo.项目经费预算 x
            OUTER APPLY ( SELECT    SUM(b.报销金额) AS 已报销金额
                          FROM      dbo.报销 a
                                    JOIN 流程 a1 ON a1.流程模板编号 = 600
                                                  AND a.编号 = a1.项目编号
                                                  AND a1.状态 IN ( 0, 1 )
                                    JOIN dbo.报销详情 b ON a.编号 = b.报销编号
                          WHERE     a.流程模板编号 = x.流程模板编号
                                    AND a.项目编号 = x.项目编号
                                    AND b.项目支出类型 = x.项目支出类型
                                    AND b.项目支出内容 = x.项目支出内容
                        ) c;




GO
/****** Object:  UserDefinedFunction [dbo].[tfn_某报销所属项目预算已报销详情以及本次报销金额]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_某报销所属项目预算已报销详情以及本次报销金额] ( @报销编号 INT )
RETURNS TABLE
AS RETURN
    /*根据报销编号取响应的项目流程模板编号+项目编号后,
到"v1_预算已报销详情"取该项目按预算的"项目支出类型+项目支出内容"分类统计的"已报销金额"
然后带上该报销下"项目支出类型+项目支出内容"相同的报销金额和备注*/
    SELECT  c.编号 ,
--		 a.编号 ,
--       a.流程模板编号 ,
--       a.项目编号 ,
            a.项目支出类型 ,
            a.项目支出内容 ,
            a.财务科目 ,
            a.批准经费 ,
            a.配套经费 ,
            a.编制依据 ,
            a.经费 ,
            a.已报销金额 ,
       --b.编号 ,
       --b.流程模板编号 ,
       --b.项目编号 ,
       --b.报销编号 ,
       --b.报销金额 ,
       --b.报销方式 ,
       --b.公务卡号 ,
       --b.公务卡所属人姓名 ,
       --b.报销人编号 ,
       --b.报销时间 ,
       --b.相关文件路径 ,
       --b.申请时间 ,
       --b.建立时间 ,
       --b.报销经费用途 ,
       --c.报销编号 ,
       --c.项目支出类型 ,
       --c.项目支出内容 ,
       --c.财务科目 ,
            c.报销金额 ,
            c.备注
    FROM    dbo.v1_预算已报销详情 a
            JOIN 报销 b ON b.编号 = @报销编号
                         AND a.流程模板编号 = b.流程模板编号
                         AND a.项目编号 = b.项目编号
            LEFT JOIN dbo.报销详情 c ON b.编号 = c.报销编号
                                    AND a.项目支出类型 = c.项目支出类型
                                    AND a.项目支出内容 = c.项目支出内容;
   

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学考试成绩]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学考试成绩]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            --c.编号 ,
            c.理论考试成绩 ,
            c.技能考试成绩 ,
            c.建立人 ,
            c.建立时间 ,
            c.备注
    --FROM    dbo.tfn_我的学员(@人员类型, @人员编号) a
    --        JOIN dbo.v_教学轮转 b ON a.编号 = b.学员编号
    FROM    dbo.tfn_我的轮转(@人员类型, @人员编号) b
            LEFT JOIN dbo.教学考试成绩 c ON b.编号 = c.编号;

GO
/****** Object:  View [dbo].[v_tfn_教学考试成绩]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_教学考试成绩] AS 
SELECT * FROM dbo.tfn_教学考试成绩(NULL,NULL)
GO
/****** Object:  View [dbo].[v1_成果论文_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v1_成果论文_列表]
AS
    SELECT  a.编号 ,
            a.论文标题 ,
            a.论文Online日期 ,
            a.论文正式出版日期 ,
            ISNULL(b.名称, b.英文刊名) AS 刊物名称 ,
			b.PMID,b.DOI,b.UT,
			b.期刊系列,b.JCR分区,b.影响因子,b.特征因子分值,
			a.认领人编号,
            dbo.fn_成果作者(1, a.编号, '第一作者') AS 第一作者,a.通讯作者,a.文献类型
    FROM    dbo.成果论文 a
            LEFT JOIN dbo.期刊 b ON a.刊物编号 = b.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_成果论文]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_成果论文] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            b.姓名 AS 认领人姓名 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v1_成果论文_列表 a
            LEFT JOIN 人员 b ON a.认领人编号 = b.编号
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;
GO
/****** Object:  View [dbo].[v_tfn_继教某人可参与的理论考试]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_tfn_继教某人可参与的理论考试] AS
SELECT * FROM tfn_继教某人可参与的理论考试(NULL,NULL,NULL);


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学医疗差错及事故记录]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学医疗差错及事故记录]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            c.教学轮转编号 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            --c.编号 ,
            c.处理日期 ,
            c.处理类别 ,
            c.处理原因 ,
            c.处理意见 ,
            c.附件 ,
            c.备注
    --FROM    dbo.tfn_我的学员(@人员类型, @人员编号) a
    --        JOIN dbo.v_教学轮转 b ON a.编号 = b.学员编号
	    FROM   dbo.tfn_我的轮转(@人员类型, @人员编号) b
            JOIN dbo.教学医疗差错及事故记录 c ON b.编号 = c.教学轮转编号;

GO
/****** Object:  View [dbo].[v_tfn_教学医疗差错及事故记录]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_教学医疗差错及事故记录] AS 
SELECT * FROM dbo.tfn_教学医疗差错及事故记录(NULL,NULL)
GO
/****** Object:  View [dbo].[v1_成果著作_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_成果著作_列表]
AS
    SELECT  a.编号 ,
            a.著作名称 ,
            a.著作出版日期 ,
            a.年度 ,
            a.出版社名称 ,
            a.著作类型 ,
            dbo.fn_成果作者(2, a.编号, '主编') AS 主编
    FROM    dbo.成果著作 a;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_成果著作]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_成果著作] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v1_成果著作_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;
GO
/****** Object:  View [dbo].[v_继教人员_带部门名]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教人员_带部门名]
AS
    SELECT  a.编号 ,
            a.工号 ,
            a.密码 ,
            a.姓名 ,
            a.部门编号 ,
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
            a.是否启用 ,
            b.名称 AS 部门名称,

			c.能级编号,
			d.名称 AS 能级名称,
			CONCAT(a.工号,'/',a.姓名,'/',b.名称) AS AllName
    FROM    dbo.人员 a
            LEFT JOIN dbo.部门 b ON a.部门编号 = b.编号
			LEFT JOIN 继教人员 c ON a.编号 = c.编号 
			LEFT JOIN 继教能级 d ON c.能级编号 = d.编号


GO
/****** Object:  View [dbo].[v_继教角色人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教角色人员]
AS
    SELECT  a.* ,
            b.编号 AS 角色编号 ,
            CAST(IIF(c.继教角色编号 IS NULL, 0, 1) AS BIT) AS 该人员是否属于该角色
    FROM    v_继教人员_带部门名 a
            FULL JOIN 继教角色 b ON 1 = 1
            LEFT JOIN dbo.继教人员角色 c ON a.编号 = c.人员编号
                                      AND b.编号 = c.继教角色编号;


GO
/****** Object:  View [dbo].[v_tfn_继教某人可参与的自测]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_继教某人可参与的自测] AS
SELECT * FROM tfn_继教某人可参与的自测(NULL,NULL)
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学更换带教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学更换带教老师]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            c.教学轮转编号 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            --c.编号 ,
            --c.教学轮转编号 ,
            c.原带教老师编号 ,
            d.姓名 AS 原带教老师姓名 ,
            c.新带教老师编号 ,
            e.姓名 AS 新带教老师姓名 ,
            c.建立人 ,
            c.建立时间 ,
            c.备注
    --FROM    dbo.tfn_我的学员(@人员类型, @人员编号) a
    --        JOIN dbo.v_教学轮转 b ON a.编号 = b.学员编号
    --        JOIN dbo.教学更换带教老师 c ON b.编号 = c.教学轮转编号
    --        JOIN 人员 d ON c.原带教老师编号 = d.编号
    --        JOIN 人员 e ON c.新带教老师编号 = e.编号;
    FROM    dbo.tfn_我的轮转(@人员类型, @人员编号) b
            JOIN dbo.教学更换带教老师 c ON b.编号 = c.教学轮转编号
            JOIN 人员 d ON c.原带教老师编号 = d.编号
            JOIN 人员 e ON c.新带教老师编号 = e.编号;

GO
/****** Object:  View [dbo].[v_tfn_教学更换带教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_tfn_教学更换带教老师] AS SELECT * FROM tfn_教学更换带教老师(NULL,NULL)

GO
/****** Object:  View [dbo].[v_tfn_继教某活动的通过情况统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[v_tfn_继教某活动的通过情况统计] AS
    SELECT * FROM tfn_继教某活动的通过情况统计(NULL)
GO
/****** Object:  View [dbo].[v_继教试题_统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教试题_统计] AS

SELECT  a.编号 ,
a.文件夹编号,
        a.类型编号 ,
        b.名称 AS 类型名称 ,
        a.题干 ,
        a.题目解析 ,
        a.难易度 ,
        a.建立时间 ,
        a.备注 ,
        x.* ,
        CASE x.答题次数
          WHEN 0 THEN NULL
          ELSE x.正确答题次数 * 100 / x.答题次数
        END AS 答题正确率 ,
        y.*
FROM    dbo.继教试题 a
        JOIN 继教试题类型 b ON a.类型编号 = b.编号
        OUTER APPLY ( SELECT    COUNT(1) AS 答题次数 ,
                                ISNULL(SUM(CASE WHEN m.是否正确 = 1 THEN 1
                                                ELSE 0
                                           END), 0) AS 正确答题次数
                      FROM      继教理论考试答题情况 m
                      WHERE     m.试题编号 = a.编号
                    ) x
        OUTER APPLY ( SELECT    COUNT(1) AS 被引次数
                      FROM      dbo.继教试卷试题 n
                      WHERE     n.试题编号 = a.编号
                    ) y;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某次考试试题正确率统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_继教某次考试试题正确率统计] ( @考试编号 INT )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT  c.试题编号, COUNT(1) AS 本次考试答题次数 ,
                            ISNULL(SUM(CASE WHEN c.是否正确 = 1 THEN 1
                                            ELSE 0
                                       END), 0) AS 本次考试正确答题次数
                   FROM     继教考试批次 a
                            JOIN 继教理论考试参与情况 b ON a.编号 = b.考试批次编号
                            JOIN 继教理论考试答题情况 c ON b.编号 = c.理论考试参与情况编号
							
                   WHERE    a.考试编号 = @考试编号 GROUP BY c.试题编号
                 )
    SELECT  x.*,cte.*,CASE cte.本次考试答题次数
          WHEN 0 THEN NULL
          ELSE cte.本次考试正确答题次数 * 100 / cte.本次考试答题次数
        END AS 本次考试答题正确率
    FROM  v_继教试题_统计 x join  cte ON x.编号 = cte.试题编号;

GO
/****** Object:  View [dbo].[v1_成果专利_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v1_成果专利_列表]
AS
    SELECT  a.编号 ,
            a.专利名称 ,
            a.专利权人名称 ,
            a.专利类型 ,
            a.是否授权 ,
            a.年度 ,
            dbo.fn_成果作者(3, a.编号, '第一') AS 第一发明人
    FROM    dbo.成果专利 a;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_成果专利]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_成果专利] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v1_成果专利_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_角色中的人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_角色中的人员] ( @角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.v1_人员_带部门名 a
    WHERE   a.编号 IN ( SELECT    b.人员编号
                      FROM      人员角色 b
                      WHERE     b.角色编号 = @角色编号 ); 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_角色中没有的人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_角色中没有的人员] ( @角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.v1_人员_带部门名 a
    WHERE   a.编号 NOT IN ( SELECT    b.人员编号
                          FROM      人员角色 b
                          WHERE     b.角色编号 = @角色编号 ); 

GO
/****** Object:  View [dbo].[v2_任职]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v2_任职]
AS
    SELECT  a.编号 ,
            a.任职开始时间 ,
            a.任职截止时间 ,
            a.任职人员编号 ,
            b.工号 ,
            b.姓名 ,
			b.部门编号,
            b.部门名称 ,
            a.任职团体名称 ,
            a.所任职务 ,
            a.相关文件路径 ,
            a.建立时间 ,
            a.备注
    FROM    dbo.任职 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.任职人员编号 = b.编号;




GO
/****** Object:  View [dbo].[v2_横向项目_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v2_横向项目_详情]
AS
    SELECT  a.* ,
            c.工号 AS 项目负责人工号 ,
            c.姓名 AS 项目负责人姓名 ,
            c.部门编号 AS 项目负责人部门编号 ,
            c.部门名称 AS 项目负责人部门名称 
    FROM    dbo.横向项目 a
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.项目负责人编号 = c.编号;



GO
/****** Object:  View [dbo].[v2_通知公告_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v2_通知公告_列表] AS
SELECT  a.编号 ,
        a.通知类型 ,
        a.通知标识 ,
        a.发送人编号 ,
        a.通知名称 ,
        a.关闭时间 ,
        a.相关文件路径 ,
        --a.通知内容 ,
        a.接收人数 ,
        a.已接收人数 ,
        a.是否启用 ,
        a.建立时间 ,
        a.备注 ,
		a.是否必读,
        b.工号 AS 发送人工号 ,
        b.姓名 AS 发送人姓名 ,
        b.部门编号 AS 发送人部门编号 ,
        b.部门名称 AS 发送人部门名称
FROM    dbo.通知公告 a
        LEFT JOIN dbo.v1_人员_带部门名 b ON a.发送人编号 = b.编号;


GO
/****** Object:  View [dbo].[v2_横向项目变更_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v2_横向项目变更_详情]
AS
    SELECT  a.* ,
            c.工号 AS 项目负责人工号 ,
            c.姓名 AS 项目负责人姓名 ,
            c.部门编号 AS 项目负责人部门编号 ,
            c.部门名称 AS 项目负责人部门名称 
    FROM    dbo.横向项目变更 a
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.项目负责人编号 = c.编号;




GO
/****** Object:  View [dbo].[v_教学通知公告_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学通知公告_列表] AS
SELECT  a.编号 ,
        a.通知类型 ,
        a.发送人编号 ,
        a.通知名称 ,
        a.关闭时间 ,
        a.相关文件路径 ,
        --a.通知内容 ,
        a.已接收人数 ,
        a.是否启用 ,
        a.建立时间 ,
        a.备注 ,
        a.是否必读,
        b.工号 AS 发送人工号 ,
        b.姓名 AS 发送人姓名 ,
        b.部门编号 AS 发送人部门编号 ,
        b.部门名称 AS 发送人部门名称
FROM    dbo.教学通知公告 a
        LEFT JOIN dbo.v1_人员_带部门名 b ON a.发送人编号 = b.编号;



GO
/****** Object:  View [dbo].[v_教学通知公告]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学通知公告]
AS
    SELECT  a.编号 ,
            a.通知类型 ,
            a.发送人编号 ,
            a.通知名称 ,
            a.关闭时间 ,
            a.相关文件路径 ,
            a.通知内容 ,
            a.已接收人数 ,
            a.是否启用 ,
            a.建立时间 ,
            a.备注 ,
            a.是否必读 ,
            b.工号 AS 发送人工号 ,
            b.姓名 AS 发送人姓名 ,
            b.部门编号 AS 发送人部门编号 ,
            b.部门名称 AS 发送人部门名称
    FROM    dbo.教学通知公告 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.发送人编号 = b.编号;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_成果作者]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_成果作者] ( @成果类型 INT, @成果编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.编号 ,
            a.作者级别 ,
            a.作者编号 ,
            a.工作量占比 ,
            a.完成字数 ,
            b.工号 ,
            b.姓名 ,
            b.部门编号 ,
            b.部门名称
    FROM    成果作者 a
            JOIN dbo.v1_人员_带部门名 b ON a.作者编号 = b.编号
    WHERE   a.成果类型 = @成果类型
            AND a.成果编号 = @成果编号;

GO
/****** Object:  View [dbo].[v_继教操作考试助教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教操作考试助教老师]
AS
    SELECT  a.操作考试编号 ,
            a.助教老师编号 ,
            b.姓名 ,
            b.部门编号 ,
            b.部门名称
    FROM    dbo.继教操作考试助教老师 a
            JOIN dbo.v1_人员_带部门名 b ON a.助教老师编号 = b.编号;
GO
/****** Object:  View [dbo].[v2_纵向项目变更_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v2_纵向项目变更_详情]
AS
    SELECT  a.* ,
            --b.名称 AS 成果归属部门名称 ,
            c.工号 AS 负责人工号 ,
            c.姓名 AS 负责人姓名 ,
            c.部门编号 AS 负责人部门编号 ,
            c.部门名称 AS 负责人部门名称 ,
            d.姓名 AS 登记人姓名 ,
            d.部门编号 AS 登记人部门编号 ,
            d.部门名称 AS 登记人部门名称
    FROM    dbo.纵向项目变更 a
            --LEFT JOIN 部门 b ON a.成果归属部门编号 = b.编号
            LEFT JOIN dbo.v1_人员_带部门名 c ON a.负责人编号 = c.编号
            LEFT JOIN dbo.v1_人员_带部门名 d ON a.登记人编号 = d.编号;






GO
/****** Object:  UserDefinedFunction [dbo].[tfn_专家评分]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_专家评分] ( @流程模板编号 INT, @项目编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            b.姓名 AS 专家姓名 ,
            b.部门编号 AS 专家部门编号 ,
            b.部门名称 AS 专家部门名称
    FROM    dbo.专家评分 a
            LEFT JOIN dbo.v1_人员_带部门名 b ON a.专家编号 = b.编号
    WHERE   a.流程模板编号 = @流程模板编号
            AND a.项目编号 = @项目编号;

GO
/****** Object:  View [dbo].[v2_纵向项目立项_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v2_纵向项目立项_详情] AS
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
/****** Object:  View [dbo].[v2_项目经费到账_作废]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v2_项目经费到账_作废]
AS
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,
            CASE a.流程模板编号
              WHEN 410 THEN ( SELECT    项目中文名称
                              FROM      dbo.纵向项目立项
                              WHERE     编号 = a.项目编号
                            )
              WHEN 450 THEN ( SELECT    合同名称
                              FROM      dbo.横向项目
                              WHERE     编号 = a.项目编号
                            )
            END AS 项目名称 ,
            a.拨款单位 ,
            a.到账日期 ,
            a.到账金额 ,
            a.技术交易额 ,
            a.管理费用 ,
            a.技术合同认定服务费 ,
            a.增值税 ,
            a.到账单位 ,
            a.经办人编号 ,
            a.到账凭证路径 ,
            a.建立时间 ,
            a.备注 ,
            b.工号 AS 经办人工号 ,
            b.姓名 AS 经办人姓名 ,
            b.部门编号 AS 经办人部门编号 ,
            b.部门名称 AS 经办人部门名称
    FROM    dbo.项目经费到账 a
            LEFT  JOIN dbo.v1_人员_带部门名 b ON a.经办人编号 = b.编号;


GO
/****** Object:  View [dbo].[v2_纵向项目申报_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v2_纵向项目申报_详情] AS


SELECT a.编号 ,
       a.分类 ,
       a.项目名称 ,
       a.申报人编号 ,
	   b.工号,b.姓名,b.部门编号,b.部门名称,
       a.学科门类 ,
       a.学科类型 ,
       a.申报年度 ,
       a.项目类型 ,
       a.项目级别 ,
       a.项目来源单位 ,
       a.项目类别 ,
       a.申报时间 ,
       a.申请经费 ,
       a.计划开始日期 ,
       a.计划完成日期 ,
       a.项目等级 ,
       a.是否委托外单位进行实验或实验分析 ,
       a.实验委托检测内容 ,
       a.项目摘要 ,
       a.是否需要伦理评审 ,
       a.是否需要伦理批文 ,
       a.伦理批文编号 ,
       a.伦理批文路径 ,
       a.项目申报书路径 ,
       a.备注 ,
       a.建立时间 ,
       a.是否立项 FROM dbo.纵向项目申报 a LEFT JOIN dbo.v1_人员_带部门名 b ON a.申报人编号 = b.编号
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_某纵向项目变更之后的第一次成功变更详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_某纵向项目变更之后的第一次成功变更详情]
    (
      @纵向项目立项编号 INT ,
      @纵向项目变更编号 INT
    )
RETURNS TABLE
AS
 RETURN
    SELECT TOP 1
            a.*
    FROM    dbo.v2_纵向项目变更_详情 a
            JOIN 流程 b ON b.流程模板编号 = 430
                         AND a.编号 = b.项目编号
                         AND b.状态 = 1
    WHERE   纵向项目编号 = @纵向项目立项编号
            AND a.编号 > @纵向项目变更编号;
GO
/****** Object:  View [dbo].[v1_成果获奖_列表]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v1_成果获奖_列表]
AS
    SELECT  a.编号 ,
            a.获奖名称 ,
            a.获奖日期 ,
            a.获奖级别 ,
            a.获奖类别 ,
			a.获奖等级 ,
            a.颁奖单位 ,
            a.年度 ,
            dbo.fn_成果作者(4, a.编号, '第一') AS 第一完成人
    FROM    dbo.成果获奖 a;



GO
/****** Object:  UserDefinedFunction [dbo].[tfn_成果获奖]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_成果获奖] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
			c.*
    FROM    dbo.v1_成果获奖_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学管床病人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学管床病人]
    (
      @人员类型 NVARCHAR(50) ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            b.学员编号 ,
            b.学员姓名 ,
            c.教学轮转编号 ,
            b.计划入科日期 ,
            b.计划出科日期 ,
            b.实际入科日期 ,
            b.实际出科日期 ,
            b.教学本院科室编号 ,
            b.教学本院策略编号 ,
            b.教学本院策略名称 ,
            b.教学专业科室编号 ,
            b.教学专业科室名称 ,
            b.本院科室编号 ,
            b.本院科室名称 ,
            b.科室管理员编号 ,
            b.科室管理员姓名 ,
            b.带教老师编号 ,
            b.带教老师姓名 ,
            --b.最低管床数量 ,
            --b.最低全程管理数量 ,
            --b.备注 ,
            b.状态 ,
            --b.技能病例数 ,
            --b.疾病病例数 ,
            --b.门诊病例数 ,
            --b.住院病例数 ,
            --b.医技病例数,
            c.病人编号 ,
            d.姓名 AS 病人姓名 ,
            d.性别 AS 病人性别 ,
            d.出生日期 AS 病人出生日期 ,
            d.住院号 AS 病人住院号 ,
            d.住院床号 AS 病人住院床号 ,
            d.主要诊断 AS 病人主要诊断 ,
            d.次要诊断 AS 病人次要诊断 ,
            d.入院日期 AS 病人入院日期 ,
            d.出院日期 AS 病人出院日期 ,
            c.是否全程陪护 ,
            c.备注
    FROM    dbo.tfn_我的轮转(@人员类型, @人员编号) b
            JOIN dbo.教学管床病人 c ON b.编号 = c.教学轮转编号
            JOIN dbo.教学病人 d ON c.病人编号 = d.编号;

GO
/****** Object:  View [dbo].[v_tfn_教学请假申请]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_tfn_教学请假申请]
AS
    SELECT  *
    FROM    tfn_教学请假申请(NULL, NULL);


GO
/****** Object:  View [dbo].[v4_横向项目总览]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v4_横向项目总览]
AS
    SELECT  a.* ,
            b.名称 ,
            b.项目编号 ,
            b.路径 ,
            b.发起人编号 ,
            CONCAT(b.状态名称, '-', b.步骤状态说明) AS 审核进度
    FROM    v2_横向项目_列表 a
            JOIN dbo.v3_流程 b ON b.流程模板编号 = 450
                                AND a.编号 = b.项目编号
    UNION ALL
    SELECT  a.* ,
            c.名称 ,
            c.项目编号 ,
            c.路径 ,
            c.发起人编号 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
    FROM    v2_横向项目_列表 a
            JOIN dbo.横向项目变更 b ON a.编号 = b.横向项目编号
            JOIN dbo.v3_流程 c ON c.流程模板编号 = 460
                                AND b.编号 = c.项目编号
    UNION ALL
    SELECT  a.* ,
            c.名称 ,
            c.项目编号 ,
            c.路径 ,
            c.发起人编号 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度
    FROM    v2_横向项目_列表 a
            JOIN dbo.横向项目结题 b ON a.编号 = b.横向项目编号
            JOIN dbo.v3_流程 c ON c.流程模板编号 = 470
                                AND b.编号 = c.项目编号;




GO
/****** Object:  UserDefinedFunction [dbo].[tfn_横向项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_横向项目] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v2_横向项目_列表 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_横向项目变更]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_横向项目变更]
    (
      @人员编号 INT ,
      @横向项目申请流程模板编号 INT ,
      @横向项目变更流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.变更内容简介 ,
            b.变更事由 ,
            b.变更备注 ,
            b.变更时间 ,
            a.编号 AS 横向项目编号 ,
            a.合同编号 ,
            a.合同名称 ,
            a.合同金额 ,
            a.签订时间 ,
            a.项目负责人编号 ,
            a.项目负责人工号 ,
            a.项目负责人姓名 ,
            a.项目负责人部门编号 ,
            a.项目负责人部门名称 ,
            a.项目归属部门 ,
            IIF(c.状态 IS NULL, '未发起变更', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
			--按项目分组,是否有未完成的变更,有则不能发起;同时,如果登录人是申请流程发起人,也不能变更;
			--如果状态为null则表示还没有开始变更,如果=1则表示该变更已经结束,都不参与计数,否则+1,最后计算 = 0则可以发起变更
            CAST(IIF(COUNT(IIF(c.状态 IS NULL OR c.状态 = 1, NULL, 1)) OVER ( PARTITION BY a.编号 ) = 0 AND @人员编号 = a1.发起人编号, 1, 0) AS BIT) AS '是否可发起变更'
			
    FROM    dbo.v2_横向项目_列表 a
			JOIN dbo.流程 a1 ON a1.流程模板编号 = @横向项目申请流程模板编号
                            AND a.编号 = a1.项目编号
                            AND a1.状态 = 1
            LEFT JOIN dbo.横向项目变更 b ON a.编号 = b.横向项目编号
            OUTER APPLY dbo.tfn_流程(@横向项目变更流程模板编号, ISNULL(b.编号,0), @人员编号) c

    WHERE   --不存在已经任何状态的结题
            NOT EXISTS ( SELECT 1
                             FROM   dbo.横向项目结题
                             WHERE  横向项目编号 = a.编号 ); 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_横向项目结题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_横向项目结题]
    (
      @人员编号 INT ,
      @横向项目申请流程模板编号 INT ,
      @横向项目变更流程模板编号 INT ,
      @横向项目结题流程模板编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  b.编号 ,
            b.横向项目编号 ,
            b.结题验收编号 ,
            b.结题验收时间 ,
            b.结题验收是否合格 ,
            b.结题验收参与人数 ,
            b.结题资料路径 ,
            b.备注 ,
            b.建立时间 ,
            a.编号 AS 横向项目申请编号 ,
            a.合同编号 ,
            a.合同名称 ,
            a.合同金额 ,
            a.签订时间 ,
            a.项目负责人编号 ,
            a.项目负责人工号 ,
            a.项目负责人姓名 ,
            a.项目负责人部门编号 ,
            a.项目负责人部门名称 ,
            a.项目归属部门 ,
            IIF(c.状态 IS NULL, '未发起结题', CONCAT(c.状态名称, '-', c.步骤状态说明)) AS 审核进度 ,
            c.* ,
			--如果状态为null则表示还没有开始结题,则可发起结题,否则不能
            CAST(IIF(c.状态 IS NULL, 1, 0)AS BIT) AS '是否可发起结题'
    FROM    dbo.v2_横向项目_列表 a
            LEFT JOIN dbo.横向项目结题 b ON a.编号 = b.横向项目编号
            OUTER APPLY dbo.tfn_流程(@横向项目结题流程模板编号, ISNULL(b.编号,0), @人员编号) c
    WHERE   --申请流程已经完成
            EXISTS ( SELECT 1
                     FROM   dbo.流程
                     WHERE  流程模板编号 = @横向项目申请流程模板编号
                            AND a.编号 = 项目编号
                            AND 状态 = 1 )	
			--不存在未完成的变更
            AND NOT EXISTS ( SELECT 1
                             FROM   dbo.流程 m
                                    JOIN dbo.横向项目变更 n ON m.流程模板编号 = @横向项目变更流程模板编号
                                                         AND m.项目编号 = n.编号
                             WHERE  a.编号 = n.横向项目编号
                                    AND m.状态 <> 1 );
							

GO
/****** Object:  View [dbo].[v_教学人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学人员]
AS
    SELECT  a.编号 ,
            a.工号 ,
            --a.密码 ,
            a.姓名 ,
            a.部门编号 ,
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
            a.是否启用 ,
            b.名称 AS 部门名称,
			CONCAT(a.工号,'/',a.姓名,'/',b.名称) AS AllName
    FROM    dbo.人员 a
            LEFT JOIN dbo.部门 b ON a.部门编号 = b.编号
			-- WHERE a.编号 <> 2;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学角色中没有的人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学角色中没有的人员] ( @教学角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.v_教学人员 a
    WHERE   a.编号 NOT IN ( SELECT    b.人员编号
                          FROM      教学人员角色 b
                          WHERE     b.教学角色编号 = @教学角色编号 ); 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学角色中的人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学角色中的人员] ( @教学角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.v_教学人员 a
    WHERE   a.编号 IN ( SELECT    b.人员编号
                          FROM      教学人员角色 b
                          WHERE     b.教学角色编号 = @教学角色编号 ); 

GO
/****** Object:  View [dbo].[v_教学学员宿舍安排]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[v_教学学员宿舍安排]
AS
    WITH    cte
              AS ( SELECT   cte1.编号 ,
                            cte1.宿舍楼编号 ,
                            cte2.名称 AS 宿舍楼名称 ,
                            cte1.门禁卡卡号 ,
                            cte1.门牌号及床号 ,
                            cte1.职位 ,
                            cte1.水起数 ,
                            cte1.电起数 ,
                            cte1.气起数 ,
                            cte1.滞纳金比例 ,
                            cte1.入住日期 ,
                            cte1.退出日期 ,
                            cte1.退出原因 ,
                            cte1.宿舍安排说明 ,
                            cte1.建立时间 ,
                            cte1.备注
                   FROM     dbo.教学学员宿舍安排 cte1
                            JOIN dbo.教学宿舍楼 cte2 ON cte1.宿舍楼编号 = cte2.编号
                 )
    SELECT  a.编号 ,
            a.学员类型编号 ,
            a.学员类型名称 ,
            a.工号 ,
            a.头像路径 ,
            a.姓名 ,
            a.性别 ,
       --a.民族 ,
       --a.证件类型 ,
       --a.证件号码 ,
       --a.出生日期 ,
       --a.手机号码 ,
       --a.政治面貌 ,
       --a.电子邮箱 ,
       --a.QQ号码 ,
       --a.微信号 ,
       --a.家庭住址 ,
       --a.取得执业证书日期 ,
       --a.执业证书编号 ,
       --a.取得医师资格证书日期 ,
       --a.医师资格证书编号 ,
       --a.最高学历 ,
       --a.毕业年份 ,
       --a.毕业学校 ,
       --a.毕业专业 ,
       --a.毕业证编码 ,
       --a.学位证编码 ,
            a.学员培训年界 ,
            a.学员培训年限 ,
            a.往届应届 ,
            a.专业编号 ,
            a.专业名称 ,
            a.送培方式 ,
            CAST(IIF(cte.编号 IS NULL, 0, 1) AS BIT) AS 是否已安排宿舍 ,
           cte.宿舍楼编号 ,
            cte.宿舍楼名称 ,
            cte.门禁卡卡号 ,
            cte.门牌号及床号 ,
            cte.职位 ,
            cte.水起数 ,
            cte.电起数 ,
            cte.气起数 ,
            cte.滞纳金比例 ,
            cte.入住日期 ,
            cte.退出日期 ,
            cte.退出原因 ,
            cte.宿舍安排说明 ,
            cte.建立时间 ,
            cte.备注
    FROM    dbo.v_教学学员 a
            LEFT JOIN cte ON a.编号 = cte.编号;



GO
/****** Object:  View [dbo].[v_教学学员_当前在科科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_教学学员_当前在科科室] AS 
SELECT  a.* ,
        b.教学本院科室编号 AS 当前在科的科室编号
FROM    dbo.v_教学学员 a
        LEFT JOIN 教学轮转 b ON a.编号 = b.学员编号
                            AND b.实际出科日期 IS NULL
                            AND b.实际出科日期 IS NOT NULL;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_某横向项目变更之后的第一次成功变更详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[tfn_某横向项目变更之后的第一次成功变更详情]
    (
      @横向项目编号 INT ,
      @横向项目变更编号 INT
    )
RETURNS TABLE
AS
 RETURN
    SELECT TOP 1
            a.*
    FROM    dbo.v2_横向项目变更_详情 a
            JOIN 流程 b ON b.流程模板编号 = 460
                         AND a.编号 = b.项目编号
                         AND b.状态 = 1
    WHERE   横向项目编号 = @横向项目编号
            AND a.编号 > @横向项目变更编号; 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学某人员可查看的通知公告]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学某人员可查看的通知公告]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT
    )
RETURNS TABLE
AS RETURN
    WITH    cte
              AS ( SELECT   *
                   FROM     dbo.tfn_教学获取PersonTypeAndId(@PersonType, @PersonId)
                 )
    SELECT  a.* ,
            IIF(EXISTS ( SELECT 1
                         FROM   dbo.教学通知公告已接收人 b
                         WHERE  b.教学通知公告编号 = a.编号
                                AND b.接收人编号 = @PersonId ), 1, 0) AS 是否已接收
    FROM    v_教学通知公告_列表 a
    WHERE   EXISTS ( SELECT 1
                     FROM   cte
                            JOIN dbo.教学通知公告接收条件 c ON cte.PersonType = c.接收者类型
                                                     AND cte.PersonId = c.接收者编号
                                                     AND c.教学通知公告编号 = a.编号 );
					





GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某人可查看的文件夹]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某人可查看的文件夹]
    (
      @PersonType NVARCHAR(50) ,
      @PersonId INT
    )
RETURNS TABLE
AS RETURN
    WITH    cte
              AS ( SELECT   *
                   FROM     dbo.tfn_继教获取PersonTypeAndId(@PersonType, @PersonId)
                 )
    SELECT  *,CAST( IIF(a.归属人类型=@PersonType AND a.归属人编号=@PersonId,1,0) AS BIT) 是否归属自己
    FROM    dbo.继教文件夹 a
    WHERE   a.归属人类型 = @PersonType
            AND a.归属人编号 = @PersonId
            OR EXISTS ( SELECT  1
                        FROM    cte
                                JOIN dbo.继教文件夹可使用人 b ON cte.PersonType = b.可使用人类型
                                                        AND cte.PersonId = b.可使用人编号
                        WHERE   b.文件夹编号 = a.编号 );
GO
/****** Object:  View [dbo].[v_tfn_继教某人可查看的文件夹]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_继教某人可查看的文件夹] AS 
SELECT * FROM dbo.tfn_继教某人可查看的文件夹(NULL,NULL)
GO
/****** Object:  View [dbo].[v_tfn_教学管床病人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_tfn_教学管床病人] AS

SELECT * FROM dbo.tfn_教学管床病人(NULL,NULL)
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_步骤]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_步骤] ( @流程模板编号 INT, @项目编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  b.*
    FROM    流程 a
            JOIN dbo.v2_步骤 b ON a.流程模板编号 = @流程模板编号
                                AND a.项目编号 = @项目编号
                                AND a.编号 = b.流程编号;

GO
/****** Object:  View [dbo].[v4_成果总览]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v4_成果总览]
AS
--这个东西很渣,初步用意是提现所有成果的列表+审核状态的信息,但是不包括"当前登录人是否可以操作"也就是不需要tfn_流程,这样一个介于v2_xxx列表和tfn_xxx之间的东西
--但是union all或者如下这样语法很渣,而且前台完全可以分tab显示,也就是会分成四个xxx总览,但是效率很高;
   -- SELECT  a.编号 ,
   --         CASE WHEN a.流程模板编号 = 300
   --                   OR a.流程模板编号 = 310 THEN b.论文标题
   --              WHEN a.流程模板编号 = 301 THEN c.著作名称
   --              WHEN a.流程模板编号 = 302 THEN d.专利名称
   --              WHEN a.流程模板编号 = 303 THEN e.获奖名称
   --         END AS 成果名称 ,
			--a.项目编号 AS 成果编号,
			--a.名称 AS 成果类型,
   --         a.路径 ,
   --         a.工号 ,
			--a.发起人编号,
   --         a.姓名 AS 发起人姓名,
   --         a.部门名称 AS 发起人部门名称
   -- FROM    v3_流程 a
   --         LEFT JOIN 成果论文 b ON a.项目编号 = b.编号
   --         LEFT JOIN dbo.成果著作 c ON a.项目编号 = c.编号
   --         LEFT JOIN dbo.成果专利 d ON a.项目编号 = d.编号
   --         LEFT JOIN dbo.成果获奖 e ON a.项目编号 = e.编号
   -- WHERE   a.状态 = 1
   --         AND a.流程模板编号 BETWEEN 300 AND 399;

       
    WITH    cte
              AS ( SELECT   300 AS 流程模板编号 ,
                            编号 ,
                            论文标题 AS 成果名称 ,
                            年度
                   FROM     dbo.成果论文
                   UNION ALL
                   SELECT   301 AS 流程模板编号 ,
                            编号 ,
                            著作名称 AS 成果名称 ,
                            年度
                   FROM     dbo.成果著作
                   UNION ALL
                   SELECT   302 AS 流程模板编号 ,
                            编号 ,
                            专利名称 AS 成果名称 ,
                            年度
                   FROM     dbo.成果专利
                   UNION ALL
                   SELECT   303 AS 流程模板编号 ,
                            编号 ,
                            获奖名称 AS 成果名称 ,
                            年度
                   FROM     dbo.成果获奖
                 )
        SELECT  a.编号 ,
                cte.成果名称 ,
                cte.年度 ,
                a.项目编号 AS 成果编号 ,
                a.名称 AS 成果类型 ,
                a.路径 ,
                a.工号 ,
                a.发起人编号 ,
                a.姓名 AS 发起人姓名 ,
                a.部门名称 AS 发起人部门名称
        FROM    v3_流程 a
                LEFT JOIN cte ON a.流程模板编号 = cte.流程模板编号
                                 AND a.项目编号 = cte.编号
        WHERE   a.状态 = 1
                AND a.流程模板编号 BETWEEN 300 AND 399;


GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目经费到账_作废]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_项目经费到账_作废] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.编号 ,
            a.流程模板编号 ,
            a.项目编号 ,a.项目名称,
            a.拨款单位 ,
            a.到账日期 ,
            a.到账金额 ,
            a.技术交易额 ,
            a.管理费用 ,
            a.技术合同认定服务费 ,
            a.增值税 ,
            a.到账单位 ,
            a.经办人编号 ,
            a.到账凭证路径 ,
            a.建立时间 ,
            a.备注 ,
            a.经办人工号 ,
            a.经办人姓名 ,
            a.经办人部门编号 ,
            a.经办人部门名称 ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.流程编号 ,
            --c.流程模板编号 ,
            c.流程名称 ,
            c.流程相关项目路径 ,
            --c.项目编号 ,
            c.发起人编号 ,
            c.发起人工号 ,
            c.发起人姓名 ,
            c.发起人部门名称 ,
            c.状态 ,
            c.状态名称 ,
            c.流程创建时间 ,
            c.步骤编号 ,
            c.步骤名称 ,
            c.步骤状态 ,
            c.步骤链接名称 ,
            c.步骤链接路径 ,
			c.步骤链接样式 ,
            c.步骤操作人编号 ,
            c.步骤操作人工号 ,
            c.步骤操作人姓名 ,
            c.步骤操作人部门名称 ,
            c.步骤执行时间 ,
            c.步骤状态说明 ,
            c.是否可处理
    FROM    dbo.v2_项目经费到账 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_任职]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_任职] ( @人员编号 INT, @流程模板编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CONCAT(c.状态名称, '-', c.步骤状态说明) AS 审核进度 ,
            c.*
    FROM    dbo.v2_任职 a
            OUTER APPLY dbo.tfn_流程(@流程模板编号, a.编号, @人员编号) c;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_待办事宜]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_待办事宜]
    (
      @流程模板编号 INT ,
      @项目编号 INT ,
      @人员编号 INT
    )
RETURNS TABLE
AS RETURN
    SELECT  dbo.fn_获取项目名称(流程模板编号, 项目编号) AS 项目名称 ,
            *
    FROM    tfn_流程(@流程模板编号, @项目编号, @人员编号);
GO
/****** Object:  View [dbo].[v_继教活动项目分类]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_继教活动项目分类]
AS
    SELECT  a.* ,
            x.*
    FROM    dbo.继教活动项目分类 a
            OUTER APPLY ( SELECT   ISNULL(SUM(CASE WHEN m.状态 = '未发布' THEN 1
                                             ELSE 0
                                        END),0) AS '未发布活动数量' ,
                                    ISNULL(SUM(CASE WHEN m.状态 = '未开始' THEN 1
                                             ELSE 0
                                        END),0) AS '未开始活动数量' ,
                                    ISNULL(SUM(CASE WHEN m.状态 = '进行中' THEN 1
                                             ELSE 0
                                        END),0) AS '进行中活动数量' ,
                                    ISNULL(SUM(CASE WHEN m.状态 = '已结束' THEN 1
                                             ELSE 0
                                        END),0) AS '已结束活动数量'
                          FROM      dbo.v_继教活动 m
                          WHERE     m.项目分类编号 = a.编号
                        ) x;





GO
/****** Object:  View [dbo].[v_继教培训计划]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_继教培训计划]
AS
    SELECT  a.编号 ,
            a.名称 ,
            a.年份 ,
            a.所属部门编号 ,
            b.名称 AS 所属部门名称 ,
            a.简介 ,
            a.附件 ,
            a.备注 ,
            x.未发布活动数量 ,
            x.未开始活动数量 ,
            x.进行中活动数量 ,
            x.已结束活动数量
    FROM    dbo.继教培训计划 a
            LEFT JOIN 部门 b ON a.所属部门编号 = b.编号
            OUTER APPLY ( SELECT     ISNULL(SUM(CASE WHEN m.状态 = '未发布' THEN 1
                                             ELSE 0
                                        END),0) AS '未发布活动数量' ,
                                    ISNULL(SUM(CASE WHEN m.状态 = '未开始' THEN 1
                                             ELSE 0
                                        END),0) AS '未开始活动数量' ,
                                    ISNULL(SUM(CASE WHEN m.状态 = '进行中' THEN 1
                                             ELSE 0
                                        END),0) AS '进行中活动数量' ,
                                    ISNULL(SUM(CASE WHEN m.状态 = '已结束' THEN 1
                                             ELSE 0
                                        END),0) AS '已结束活动数量'
                          FROM      dbo.v_继教活动 m
                          WHERE     m.培训计划编号 = a.编号
                        ) x;





GO
/****** Object:  UserDefinedFunction [dbo].[tfn_步骤_可用操作]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*可能需要变成:@type 1-传入的是流程类型 2-传入的是步骤编号 @流程类型或步骤编号,
然后先获取步骤模板,或者该流程类型的第一个步骤模板,然后获取其步骤类型状态*/
CREATE FUNCTION [dbo].[tfn_步骤_可用操作] ( @步骤编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            c.状态值 ,
            c.操作说明 ,
            c.操作提示
    FROM    步骤 a
            JOIN dbo.步骤模板 b ON a.编号 = @步骤编号
                               AND a.步骤模板编号 = b.编号
            JOIN dbo.步骤类型状态 c ON b.步骤类型编号 = c.步骤类型编号
                                 AND c.状态值 <> 0; 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_成果项目]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_成果项目] ( @成果类型 INT, @成果编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.编号 ,
            a.项目编号 ,
			dbo.fn_根据流程模板编号获得项目类型名称(a.项目类型) AS 项目类型名称,
			dbo.fn_获取项目名称(a.项目类型,a.项目编号) AS 项目名称,
            a.是否项目带来成果
    FROM    成果项目 a
            --CROSS APPLY tfn_项目(a.项目类型, a.项目编号) b
    WHERE   a.成果类型 = @成果类型
            AND a.成果编号 = @成果编号;

    --SELECT  a.编号 ,
    --        a.项目编号 ,
    --        b.项目类型 ,
    --        b.项目名称 ,
    --        a.是否项目带来成果
    --FROM    成果项目 a
    --        CROSS APPLY tfn_项目(a.项目类型, a.项目编号) b
    --WHERE   a.成果类型 = @成果类型
    --        AND a.成果编号 = @成果编号;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_获取某步骤的可用操作_废弃]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_获取某步骤的可用操作_废弃] ( @步骤编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  d.状态值 ,
            d.操作说明
    FROM    步骤 a
            JOIN dbo.步骤模板 b ON a.编号 = @步骤编号
                               AND a.步骤模板编号 = b.编号
            JOIN 步骤类型 c ON b.步骤类型编号 = c.编号
            JOIN dbo.步骤类型状态 d ON c.编号 = d.步骤类型编号
                                 AND d.状态值 <> 0;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_获取下级字典_通过上级分类和名称]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





--这个tfn其实没有必要;
CREATE FUNCTION [dbo].[tfn_获取下级字典_通过上级分类和名称]
    (
      @分类 NVARCHAR(50) ,
      @值 NVARCHAR(50)
    )
RETURNS TABLE
AS RETURN
    SELECT  b.*
    FROM    字典 a
            JOIN 字典 b ON a.编号 = b.上级编号
    WHERE   a.分类 = @分类
            AND a.值 = @值; 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某次考试某试题答题统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                   CREATE FUNCTION [dbo].[tfn_继教某次考试某试题答题统计] ( @考试编号 INT, @试题编号 INT )
RETURNS TABLE
                   RETURN
                    SELECT  d.答题答案编码 ,
                            COUNT(1) AS 选择该答案次数
                    FROM    继教考试批次 a
                            JOIN 继教理论考试参与情况 b ON a.编号 = b.考试批次编号
                            JOIN 继教理论考试答题情况 c ON b.编号 = c.理论考试参与情况编号
                            JOIN 继教理论考试答题答案 d ON c.编号 = d.理论考试答题情况编号
                    WHERE   a.考试编号 = @考试编号
                            AND c.试题编号 = @试题编号
                    GROUP BY d.答题答案编码;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_继教某次考试评分表正确率统计]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_继教某次考试评分表正确率统计] ( @考试编号 INT, @评分表编号 INT )
RETURNS TABLE
RETURN
    WITH    cte
              AS ( SELECT   e.编号 AS 评分表项目编号 ,
                            e.名称 AS 评分表项目名称 ,
                            d.编号 AS 评分表项目要求编号 ,
                            d.要求 AS 评分表项目要求 ,
                            d.标准分 AS 评分表项目要求标准分 ,
                            COUNT(1) OVER ( PARTITION BY d.编号 ) AS 评分表项目要求打分次数 ,
                            AVG(c.打分) OVER ( PARTITION BY d.编号 ) AS 评分表项目要求平均打分 ,
                            SUM(CASE WHEN c.打分 = d.标准分 THEN 1
                                     ELSE 0
                                END) OVER ( PARTITION BY d.编号 ) AS 评分表项目要求满分次数 ,
                            ROW_NUMBER() OVER ( PARTITION BY d.编号 ORDER BY b.编号 ) AS r_n
                   FROM     继教考试批次 a
                            JOIN 继教操作考试参与情况 b ON a.编号 = b.考试批次编号
                            JOIN 继教操作考试打分情况 c ON b.编号 = c.操作考试参与情况编号
                            JOIN 继教评分表项目要求 d ON c.操作考试评分项目要求编号 = d.编号
                            JOIN 继教评分表项目 e ON d.评分表项目编号 = e.编号
                   WHERE    a.考试编号 = @考试编号
                            AND e.评分表编号 = @评分表编号
                 )
    SELECT  *
    FROM    cte
    WHERE   cte.r_n = 1;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_角色的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_角色的权限] ( @角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*,IIF(b.编号 IS NULL,0,1) AS 拥有
    FROM    dbo.权限 a LEFT JOIN  角色权限 b ON a.编号 = b.权限编号 and b.角色编号=@角色编号

    --WHERE   a.编号 IN ( SELECT    b.权限编号
    --                  FROM      dbo.角色权限 b
    --                  WHERE     b.角色编号 = @角色编号 ); 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_角色没有的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_角色没有的权限] ( @角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.权限 a
    WHERE   a.编号 not IN ( SELECT    b.权限编号
                      FROM      dbo.角色权限 b
                      WHERE     b.角色编号= @角色编号 ); 
 

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学360评价评分_作废]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[tfn_教学360评价评分_作废]
    (
      @教学360评价目标类型编号 INT ,
      @教学360评价编号 INT 
    )
RETURNS TABLE
AS RETURN
    SELECT  c.编号 ,
            c.教学360评价编号 ,
            b.编号 AS 教学360评价项目编号 ,
            b.名称 AS 教学360评价项目名称 ,
            b.标准分 ,
            b.备注 AS 教学360评价项目备注 ,
            c.评分 ,
            c.备注
    FROM    教学360评价分类 a
            JOIN 教学360评价项目 b ON a.目标类型 = @教学360评价目标类型编号
                                AND a.编号 = b.教学360评价分类编号
            LEFT JOIN 教学360评价评分 c ON c.教学360评价编号 = @教学360评价编号
                                     AND b.编号 = c.教学360评价项目编号;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学角色的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学角色的权限] ( @教学角色编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.* ,
            CAST(IIF(b.教学权限编号 IS NULL, 0, 1) AS BIT) AS 拥有
    FROM    dbo.教学权限 a
            LEFT JOIN 教学角色权限 b ON a.编号 = b.教学权限编号
                                  AND b.教学角色编号 = @教学角色编号;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_教学人员的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[tfn_教学人员的权限] ( @工号 NVARCHAR(50) )
RETURNS TABLE
AS RETURN
    SELECT DISTINCT
            c.*
    FROM    人员 a1
            JOIN dbo.教学人员角色 a ON a1.编号 = a.人员编号
            JOIN dbo.教学角色权限 b ON a.教学角色编号 = b.教学角色编号
            JOIN 教学权限 c ON b.教学权限编号 = c.编号
    WHERE   a1.工号 = @工号;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_人员的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[tfn_人员的权限] ( @工号 NVARCHAR(50) )
RETURNS TABLE
AS RETURN
    SELECT DISTINCT
            c.*
    FROM    人员 a1
            JOIN dbo.人员角色 a ON a1.编号 = a.人员编号
            JOIN dbo.角色权限 b ON a.角色编号 = b.角色编号
            JOIN 权限 c ON b.权限编号 = c.编号
    WHERE   a1.工号 = @工号;
GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目计划]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_项目计划] ( @流程模板编号 INT, @项目编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.项目计划 a
    WHERE   a.流程模板编号 = @流程模板编号
            AND a.项目编号 = @项目编号;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目经费预算]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_项目经费预算] ( @流程模板编号 INT, @项目编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.项目经费预算 a
    WHERE   a.流程模板编号 = @流程模板编号
            AND a.项目编号 = @项目编号;

GO
/****** Object:  UserDefinedFunction [dbo].[tfn_项目预期成果]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[tfn_项目预期成果] ( @流程模板编号 INT, @项目编号 INT )
RETURNS TABLE
AS RETURN
    SELECT  a.*
    FROM    dbo.项目预期成果 a
    WHERE   a.流程模板编号 = @流程模板编号
            AND a.项目编号 = @项目编号;

GO
/****** Object:  View [dbo].[v_继教操作考试批次]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教操作考试批次]
AS
    SELECT  a.* ,
            b.及格分数 ,
            b.描述 ,
            c.活动编号
    FROM    dbo.继教考试批次 a
            JOIN dbo.继教操作考试 b ON a.考试编号 = b.编号
            JOIN 继教活动内容 c ON b.编号 = c.编号;



GO
/****** Object:  View [dbo].[v_继教活动可参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教活动可参与人] AS 
SELECT 活动编号 ,
       可参与人类型 ,
       可参与人编号,dbo.FNGetPersonInfoByType(可参与人类型,可参与人编号) AS 可参与人称谓 FROM dbo.继教活动可参与人
GO
/****** Object:  View [dbo].[v_继教活动可参与人OpenId]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教活动可参与人OpenId] AS 
SELECT a.活动编号 ,
       a.可参与人类型 ,
       a.可参与人编号 ,
       b.编号 ,
       b.OpenId ,
       b.DbKey  FROM dbo.继教活动可参与人 a JOIN  ScientificResearch_Manage.dbo.人员OpenId  b ON a.可参与人编号 = b.人员编号
	   WHERE a.可参与人类型='人员'
	   UNION all
SELECT a.活动编号 ,
       a.可参与人类型 ,
       a.可参与人编号 ,
       b.编号 ,
       b.OpenId ,
       b.DbKey  FROM dbo.继教活动可参与人 a JOIN  ScientificResearch_Manage.dbo.教学学员OpenId  b ON a.可参与人编号 = b.教学学员编号
	   WHERE a.可参与人类型='教学学员'

GO
/****** Object:  View [dbo].[v_继教角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教角色]
AS
    SELECT  *
    FROM    继教角色 a
            OUTER APPLY ( SELECT    COUNT(1) AS 人数
                          FROM      继教人员角色 b
                          WHERE     b.继教角色编号 = a.编号
                        ) c
            OUTER APPLY ( SELECT    COUNT(1) AS 功能数
                          FROM      dbo.继教角色权限 d
                                    JOIN 继教权限 d1 ON d.继教权限编号 = d1.编号
                          WHERE     d.继教角色编号 = a.编号
                        ) e
						OUTER APPLY ( SELECT    COUNT(1) AS 微信功能数
                          FROM      dbo.继教微信角色权限 f
                                    JOIN 继教微信权限 f1 ON f.继教微信权限编号 = f1.编号
                          WHERE     f.继教角色编号 = a.编号
                        ) g




GO
/****** Object:  View [dbo].[v_继教角色权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_继教角色权限] AS

SELECT a.*,b.编号 AS 角色编号,CAST( IIF( c.继教角色编号 IS NULL, 0,1) AS BIT ) AS 该角色是否拥有该权限
FROM 继教权限 a 
FULL JOIN 继教角色 b ON 1=1 
LEFT JOIN dbo.继教角色权限 c ON a.编号 = c.继教权限编号 AND b.编号 = c.继教角色编号


GO
/****** Object:  View [dbo].[v_继教考试批次可参与人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教考试批次可参与人]
AS
    SELECT c.活动编号, b.考试编号 ,
            a.考试批次编号 ,
            a.可参与人类型 ,
            a.可参与人编号 ,
            dbo.FNGetPersonInfoByType(a.可参与人类型, a.可参与人编号) AS 可参与人称谓
    FROM    继教考试批次可参与人 a
            JOIN dbo.继教考试批次 b ON a.考试批次编号 = b.编号 JOIN 继教活动内容 c ON b.考试编号 = c.编号;

GO
/****** Object:  View [dbo].[v_继教科室]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教科室]
AS
    SELECT  a.编号 ,
            a.上级部门编号 ,
            a.名称 ,
            a.负责人编号 ,
            b.姓名 AS 负责人姓名 ,
            a.排序值 ,
            a.备注 ,
            a.是否启用 ,
            IIF(EXISTS ( SELECT 1
                         FROM   部门 b
                         WHERE  b.上级部门编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            CAST(IIF(a1.编号 IS NULL, 0, 1) AS BIT) AS 是否教学科室 ,
            a1.科室管理员编号 ,
            b1.姓名 AS 科室管理员姓名 ,
            x.助教老师数量
    FROM    dbo.部门 a
            LEFT JOIN dbo.继教科室 a1 ON a.编号 = a1.编号
            LEFT JOIN dbo.人员 b ON a.负责人编号 = b.编号
            LEFT JOIN dbo.人员 b1 ON a1.科室管理员编号 = b1.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 助教老师数量
                          FROM      继教助教老师
                          WHERE     科室编号 = a.编号
                        ) x;







GO
/****** Object:  View [dbo].[v_继教理论考试批次]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_继教理论考试批次]
AS
    SELECT  a.* ,
            b.试卷编号 ,
            b.时长 ,
            b.及格分数,c.活动编号
    FROM    dbo.继教考试批次 a
            JOIN dbo.继教理论考试 b ON a.考试编号 = b.编号 JOIN 继教活动内容 c ON b.编号 = c.编号;


GO
/****** Object:  View [dbo].[v_继教慕课素材]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教慕课素材] as
SELECT *,CAST(IIF(EXISTS(SELECT 1 FROM 继教慕课 b WHERE b.慕课素材编号 = a.编号 ),1,0)AS BIT) AS 是否被引用 FROM dbo.继教慕课素材 a;

GO
/****** Object:  View [dbo].[v_继教签到参与情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教签到参与情况]
AS
    SELECT 
	
    b.签到编号 ,
	b.编号 AS 签到规定编号,
    b.名称 AS 签到规定名称,
    b.签到开始时间 AS 签到规定开始时间,
    b.签到结束时间 AS 签到规定结束时间,
    b.二维码变化秒数 ,
    b.备注 AS 签到规定备注,

            a.参与人类型 ,
            a.参与人编号 ,
            dbo.FNGetPersonInfoByType(a.参与人类型, a.参与人编号) AS 参与人称谓 ,
            a.签到时间 
    FROM    dbo.继教签到参与情况 a
            JOIN dbo.继教签到规定 b ON a.签到规定编号 = b.编号



GO
/****** Object:  View [dbo].[v_继教签到规定]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教签到规定] AS 
SELECT b.活动编号,a.* FROM dbo.继教签到规定 a JOIN 继教活动内容 b ON a.签到编号 = b.编号
GO
/****** Object:  View [dbo].[v_继教人员的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE VIEW [dbo].[v_继教人员的权限]
    AS
        SELECT DISTINCT
                a1.编号 AS 人员编号 ,
                c.*
        FROM    人员 a1
                JOIN dbo.继教人员角色 a ON a1.编号 = a.人员编号
                JOIN dbo.继教角色权限 b ON a.继教角色编号 = b.继教角色编号
                JOIN dbo.继教权限 c ON b.继教权限编号 = c.编号;
GO
/****** Object:  View [dbo].[v_继教人员微信的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
    CREATE VIEW [dbo].[v_继教人员微信的权限]
    AS
        SELECT DISTINCT
                a1.编号 AS 人员编号 ,
                c.*
        FROM    人员 a1
                JOIN dbo.继教人员角色 a ON a1.编号 = a.人员编号
                JOIN dbo.继教微信角色权限 b ON a.继教角色编号 = b.继教角色编号
                JOIN dbo.继教微信权限 c ON b.继教微信权限编号 = c.编号;
GO
/****** Object:  View [dbo].[v_继教试卷]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_继教试卷]
AS
    SELECT  *
    FROM    dbo.继教试卷 a
            OUTER APPLY ( SELECT    COUNT(1) AS 被引用次数
                          FROM      dbo.继教理论考试 m
                          WHERE     m.试卷编号 = a.编号
                        ) x
            OUTER APPLY ( SELECT    MAX(p.得分) AS 最高得分 ,
                                    MIN(p.得分) AS 最低得分 ,
                                    COUNT(1) AS 答卷次数 ,
                                    SUM(p.得分) AS 总得分
                          FROM      dbo.继教理论考试 n
                                    JOIN dbo.继教考试批次 o ON n.编号 = o.考试编号
                                    JOIN dbo.继教理论考试参与情况 p ON o.编号 = p.考试批次编号
                          WHERE     n.试卷编号 = a.编号
                        ) y 
						OUTER APPLY (SELECT SUM(r.分值) AS 总分值,COUNT(1) AS 试题数量 FROM 继教试卷结构 q JOIN 继教试卷试题 r ON q.编号 = r.试卷结构编号 WHERE q.试卷编号 = a.编号) z;


GO
/****** Object:  View [dbo].[v_继教试卷结构]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_继教试卷结构]
AS
    SELECT  *
    FROM    dbo.继教试卷结构 a
            OUTER APPLY ( SELECT  SUM(m.分值) AS 总分值,  COUNT(1) AS 试题数量
                          FROM      dbo.继教试卷试题 m
                          WHERE     m.试卷结构编号 = a.编号
                        ) x;


GO
/****** Object:  View [dbo].[v_继教试卷中试题]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教试卷中试题]
AS
    SELECT  a.* ,
            c.试卷编号 ,
            b.试卷结构编号,b.分值
    FROM    dbo.继教试题 a
            JOIN dbo.继教试卷试题 b ON a.编号 = b.试题编号
            JOIN 继教试卷结构 c ON b.试卷结构编号 = c.编号;

GO
/****** Object:  View [dbo].[v_继教试卷中试题正确答案]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE VIEW [dbo].[v_继教试卷中试题正确答案] as
 SELECT  a.*,c.试卷编号,b.试卷结构编号 FROM dbo.继教试题正确答案 a JOIN dbo.继教试卷试题 b ON a.试题编号 = b.试题编号 
 JOIN 继教试卷结构 c ON b.试卷结构编号 = c.编号
GO
/****** Object:  View [dbo].[v_继教试题_考试时]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教试题_考试时]
AS
    SELECT  c.编号 ,
            c.类型编号 ,
            c.题干 ,
            b.试卷编号 ,
            a.试卷结构编号 ,
            a.试题编号 ,
            a.分值 ,
            a.排序值
    FROM    继教试卷试题 a
            JOIN dbo.继教试卷结构 b ON a.试卷结构编号 = b.编号
            JOIN dbo.继教试题 c ON a.试题编号 = c.编号;


GO
/****** Object:  View [dbo].[v_继教试题标签]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
                    
					CREATE VIEW [dbo].[v_继教试题标签] as

					SELECT a.试题编号 ,a.标签编号 
                           ,
                           b.名称 AS 标签名称,
                           b.首字母  AS 标签首字母 FROM dbo.继教试题标签 a JOIN 继教标签 b ON a.标签编号 = b.编号
GO
/****** Object:  View [dbo].[v_继教微信角色权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教微信角色权限] AS

SELECT a.*,b.编号 AS 角色编号,CAST( IIF( c.继教角色编号 IS NULL, 0,1) AS BIT ) AS 该角色是否拥有该权限
FROM 继教微信权限 a 
full JOIN 继教角色 b ON 1=1 
LEFT JOIN dbo.继教微信角色权限 c ON a.编号 = c.继教微信权限编号 AND b.编号 = c.继教角色编号
GO
/****** Object:  View [dbo].[v_继教文件夹可使用人]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_继教文件夹可使用人] AS 
SELECT *,dbo.FNGetPersonInfoByType(a.可使用人类型,a.可使用人编号) AS 可使用人 FROM dbo.继教文件夹可使用人 a 
GO
/****** Object:  View [dbo].[v_继教助教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_继教助教老师]
AS
    SELECT  a.科室编号 ,
            a.助教老师编号 ,
            
            b.姓名 ,
            b.部门编号 ,
            b.英文名 ,
            b.性别 ,
            b.手机 ,
            b.是否启用
    FROM    继教助教老师 a
            JOIN dbo.人员 b ON a.助教老师编号 = b.编号;


GO
/****** Object:  View [dbo].[v_教学360评价]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学360评价]
AS
    SELECT  a.编号 ,
       --a.教学360评价方向编号 ,
        --b.名称 AS 教学360评价方向名称 ,
            a.来源类型 ,
            dbo.fn_教学获取360评价人类型名称(a.来源类型) AS 评价人类型 ,
            a.评价人编号 ,
            dbo.fn_教学获取360评价人名称(a.来源类型, a.评价人编号) AS 评价人姓名 ,
            a.目标类型 ,
            dbo.fn_教学获取360评价人类型名称(a.目标类型) AS 被评价人类型 ,
            a.被评价人编号 ,
            dbo.fn_教学获取360评价人名称(a.目标类型, a.被评价人编号) AS 被评价人姓名 ,
            a.评价内容 ,
            a.评价时间 ,
            a.备注 ,
            z.所有项目满分 ,
            z.所有项目总得分 ,
            z.得分星数

       --b.编号 ,
       --b.备注	
    FROM    dbo.教学360评价 a --JOIN dbo.教学360评价方向 b ON a.教学360评价方向编号 = b.编号
            OUTER APPLY ( SELECT    SUM(z2.标准分) AS 所有项目满分 ,
                                    SUM(z1.评分) AS 所有项目总得分 ,
		--SUM(z1.评分) / COUNT(z1.评分) AS 平均评分
                                    CEILING(SUM(z1.评分) / ( SUM(z2.标准分) / 5.0 )) AS 得分星数
                          FROM      dbo.教学360评价评分 z1
                                    JOIN dbo.教学360评价项目 z2 ON z1.教学360评价项目编号 = z2.编号
                          WHERE     z1.教学360评价编号 = a.编号
                        ) z;


GO
/****** Object:  View [dbo].[v_教学360评价方向]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_教学360评价方向] AS
SELECT a.编号 ,
       a.名称 ,
       a.来源类型 ,
	   dbo.fn_教学获取360评价人类型名称(a.来源类型) AS 评价人类型,
       a.目标类型 ,
	   dbo.fn_教学获取360评价人类型名称(a.目标类型) AS 被评价人类型,
       a.备注 FROM dbo.教学360评价方向 a

GO
/****** Object:  View [dbo].[v_教学360评价分类]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[v_教学360评价分类] AS
SELECT 编号 ,
       目标类型 ,
	   dbo.fn_教学获取360评价人类型名称(目标类型) AS 被评价人类型,
       名称 ,
       备注 FROM dbo.教学360评价分类;


GO
/****** Object:  View [dbo].[v_教学360评价目标类型]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_教学360评价目标类型] AS
SELECT DISTINCT 目标类型 AS 目标类型编号,dbo.fn_教学获取360评价人类型名称(目标类型) AS 目标类型名称 FROM dbo.教学360评价方向
GO
/****** Object:  View [dbo].[v_教学本院策略]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_教学本院策略]
AS
    SELECT  a.编号 ,
            a.名称 ,
            a.教学专业编号 ,
            b.名称 AS 教学专业名称 ,
            b.年份 AS 教学专业年份 ,
            a.专业基地管理员编号 ,
            d.教学本院科室数量 ,
            d.培训总时长 ,
			--d.最大培训时长,
            --d.可容纳人数 ,
			--d.可重复次数,
			--d.最大学员人数,
            a.是否启用 ,
            a.建立日期 ,
            a.备注
    FROM    dbo.教学本院策略 a
            JOIN dbo.教学专业 b ON a.教学专业编号 = b.编号
            OUTER APPLY ( SELECT    COUNT(1) AS 教学本院科室数量 ,
			--MAX(c.培训时长) AS 最大培训时长,
                                    SUM(c.培训时长) AS 培训总时长 
			--MAX(c.培训时长)/SUM(c.培训时长) AS 可重复次数,
			--MIN(c1.最大学员人数) AS 最大学员人数 ,
			--可容纳人数这么计算不对.
                                    --( SUM(c.培训时长) / MAX(c.培训时长) )
                                    --* MIN(c1.最大学员人数) AS 可容纳人数
                          FROM      教学本院科室 c
                                    LEFT JOIN 教学科室 c1 ON c.本院科室编号 = c1.编号
                          WHERE     c.教学本院策略编号 = a.编号
                        ) d;

GO
/****** Object:  View [dbo].[v_教学带教老师]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学带教老师]
AS
    SELECT  a.教学科室编号 ,
            a.带教老师编号 ,
            a.备注 ,
            b.姓名 ,
            b.部门编号 ,
            b.英文名 ,
            b.性别 ,
            b.手机 ,
            b.是否启用
    FROM    教学带教老师 a
            JOIN dbo.人员 b ON a.带教老师编号 = b.编号;

GO
/****** Object:  View [dbo].[v_教学活动反馈]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_教学活动反馈] AS
SELECT a.编号 ,
       a.教学活动编号 ,
       a.学员编号 ,
	   b.姓名 AS 学员姓名,
       a.反馈内容 ,
       a.附件 ,
       a.建立时间 ,
       a.备注 FROM dbo.教学活动反馈 a JOIN 教学学员 b ON a.学员编号 = b.编号
GO
/****** Object:  View [dbo].[v_教学活动可参与者]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学活动可参与者]
AS
    SELECT  a.编号 ,
            a.教学活动编号 ,
			a.学员编号,
            IIF(a.学员编号 = 0, '所有人', b.姓名) AS 学员姓名
    FROM    dbo.教学活动可参与者 a
            LEFT JOIN 教学学员 b ON a.学员编号 = b.编号;


GO
/****** Object:  View [dbo].[v_教学角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_教学角色]
AS
    SELECT  *
    FROM    教学角色 a
            OUTER APPLY ( SELECT    COUNT(1) AS 人数
                          FROM      教学人员角色 b
                          WHERE     b.教学角色编号 = a.编号
                        ) c
            OUTER APPLY ( SELECT    COUNT(1) AS 功能数
                          FROM      dbo.教学角色权限 d
                                    JOIN 教学权限 d1 ON d.教学权限编号 = d1.编号
                          WHERE     d.教学角色编号 = a.编号
                        ) e;



GO
/****** Object:  View [dbo].[v_教学考勤情况]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_教学考勤情况]
AS
    SELECT  a.编号 ,
            c.学员编号 ,
            a.教学轮转编号 ,
            a.考勤日期 ,
            a.教学考勤类型编号 ,
            b.名称 AS 教学考勤类型名称 ,
            a.说明 ,
            a.建立人 ,
            a.建立时间 ,
            a.备注
    FROM    dbo.教学考勤情况 a
            JOIN dbo.教学考勤类型 b ON a.教学考勤类型编号 = b.编号
            JOIN 教学轮转 c ON a.教学轮转编号 = c.编号;


GO
/****** Object:  View [dbo].[v_教学通知公告接收条件]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学通知公告接收条件] as
SELECT *,dbo.FNGetPersonInfoByType(a.接收者类型,a.接收者编号) AS 接收者名称 FROM dbo.教学通知公告接收条件 a
GO
/****** Object:  View [dbo].[v_教学专业科室要求]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_教学专业科室要求] AS 
SELECT 编号 ,
       教学专业科室编号 ,
       项目名称 ,
       说明 ,
       最低评分要求 ,
	   dbo.fn_根据分值获取教学评分等级(最低评分要求) AS 最低评分等级 ,
       备注 FROM dbo.教学专业科室要求
GO
/****** Object:  View [dbo].[v1_步骤模板]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_步骤模板]
AS
    SELECT  * ,
            STUFF(( SELECT  ',' + CASE b.角色编号
                                    WHEN 0 THEN '发起人或负责人'
                                    ELSE c.名称
                                  END
                    FROM    步骤角色 AS b
                            LEFT JOIN 角色 c ON b.角色编号 = c.编号
                    WHERE   b.步骤模板编号 = a.编号
                  FOR
                    XML PATH('')
                  ), 1, 1, '') AS 可操作人 ,
            STUFF(( SELECT  ',' + e.操作说明
                    FROM    步骤类型 AS d
                            LEFT JOIN dbo.步骤类型状态 e ON d.编号 = e.步骤类型编号
                    WHERE   d.编号 = a.步骤类型编号
                  FOR
                    XML PATH('')
                  ), 1, 1, '') AS 可用操作
    FROM    dbo.步骤模板 a;  

GO
/****** Object:  View [dbo].[v1_部门]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[v1_部门]
AS
    SELECT  a.编号 ,
            a.上级部门编号 ,
            a.名称 ,
            a.负责人编号 ,
            b.姓名 AS 负责人姓名 ,
            a.排序值 ,
            a.备注 ,
            a.是否启用 ,
            IIF(EXISTS ( SELECT 1
                         FROM   部门 b
                         WHERE  b.上级部门编号 = a.编号 ), 1, 0) AS 是否存在下级
    FROM    dbo.部门 a
            LEFT JOIN dbo.人员 b ON a.负责人编号 = b.编号; 



GO
/****** Object:  View [dbo].[v1_成果获奖_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [dbo].[v1_成果获奖_详情]
AS
    SELECT  a.*
    FROM    dbo.成果获奖 a;







GO
/****** Object:  View [dbo].[v1_成果论文_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_成果论文_详情]
AS
    SELECT  a.编号 ,
            a.认领人编号 ,
            a.论文标题 ,
            a.论文标题类型 ,
            a.论文Online日期 ,
            a.论文正式出版日期 ,
            a.他引次数 ,
            a.年度 ,
            a.收稿日期 ,
            a.论文所属栏目 ,
            a.版面费 ,
            a.超额版面费 ,
            a.超额费用来源 ,
            a.奖励情况 ,
            a.论文字数 ,
            a.计划来源 ,
            a.论文版面 ,
            a.学科门类 ,
            a.一级学科 ,
            a.二级学科 ,
            a.三级学科 ,
            a.作者人数 ,
            a.关键字 ,
            a.论文摘要 ,
            a.备注 ,
            a.刊物编号 ,
            a.卷号 ,
            a.期号 ,
            a.页码范围起 ,
            a.页码范围止 ,
            a.论文类型 ,
            a.是否与行业联合发表 ,
            a.是否与地方联合发表 ,
            a.是否与国际联合发表 ,
            a.是否跨学科 ,
            a.是否与本专业相关 ,
            a.检索信息页相关文件路径 ,
            a.论文正文路径 ,
            a.其他相关文件路径 ,a.通讯作者,a.文献类型,
            b.代码 ,
            ISNULL(b.名称, b.英文刊名) AS 刊物名称 ,b.PMID,b.DOI,b.UT,
            b.主办单位 ,
            b.期刊系列 ,
            b.JCR分区 ,
            b.编目名称 ,
            b.编目类别 ,
            b.创刊日期 ,
            b.被引用次数 ,
            b.影响因子 ,
            b.特征因子分值 ,
            b.ISSN号 ,
            b.CN号
    FROM    dbo.成果论文 a
            LEFT JOIN dbo.期刊 b ON a.刊物编号 = b.编号;





GO
/****** Object:  View [dbo].[v1_成果著作_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_成果著作_详情]
AS
    SELECT  a.编号 ,
            a.著作名称 ,
            a.出版社名称 ,
            a.著作形式 ,
            a.年度 ,
            a.著作出版日期 ,
            a.ISBN号 ,
            a.著作字数 ,
            a.奖励情况 ,
            a.出版地 ,
            a.出版社级别 ,
            a.著作类型 ,
            a.是否译为外文 ,
            a.语种 ,
            a.学科门类 ,
            a.一级学科 ,
            a.二级学科 ,
            a.三级学科 ,
            a.作者人数 ,
            a.发行价 ,
            a.备注 ,
            a.封面相关文件路径 ,
            a.版权页相关文件路径 ,
            a.前言页相关文件路径 ,
            a.完整目录页相关文件路径 ,
            a.其他相关文件路径
    FROM    dbo.成果著作 a;





GO
/****** Object:  View [dbo].[v1_成果专利_详情]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v1_成果专利_详情]
AS
    SELECT  a.*
    FROM    dbo.成果专利 a;






GO
/****** Object:  View [dbo].[v1_国民行业代码]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v1_国民行业代码]
AS
    SELECT  a.编号 ,
            a.上级编号 ,
            a.名称 ,
            a.代码 ,
            a.级别 ,
            a.排序 ,
            IIF(EXISTS ( SELECT 1
                         FROM   国民行业代码 b
                         WHERE  b.上级编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            a.备注
    FROM    dbo.国民行业代码 a;

GO
/****** Object:  View [dbo].[v1_合同买方性质]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_合同买方性质]
AS
    SELECT  a.编号 ,
            a.上级编号 ,
            a.名称 ,
            a.级别 ,
            a.排序 ,
            IIF(EXISTS ( SELECT 1
                         FROM   合同买方性质 b
                         WHERE  b.上级编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            a.备注
    FROM    dbo.合同买方性质 a;


GO
/****** Object:  View [dbo].[v1_技术领域]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_技术领域]
AS
    SELECT  a.编号 ,
            a.上级编号 ,
            a.名称 ,
            a.级别 ,
            a.排序 ,
            IIF(EXISTS ( SELECT 1
                         FROM   技术领域 b
                         WHERE  b.上级编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            a.备注
    FROM    dbo.技术领域 a;


GO
/****** Object:  View [dbo].[v1_角色]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_角色]
AS
    SELECT  *
    FROM    角色 a
            OUTER APPLY ( SELECT    COUNT(1) AS 人数
                          FROM      人员角色 b
                          WHERE     b.角色编号 = a.编号
                        ) c
            OUTER APPLY ( SELECT    COUNT(1) AS 功能数
                          FROM      dbo.角色权限 d JOIN 权限 d1 ON d.权限编号=d1.编号
                          WHERE     d.角色编号 = a.编号
                        ) e;

GO
/****** Object:  View [dbo].[v1_角色的权限]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW  [dbo].[v1_角色的权限] AS
SELECT *,CAST(1 AS BIT) AS 拥有 FROM dbo.权限;
GO
/****** Object:  View [dbo].[v1_经费模版支出内容]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v1_经费模版支出内容]
AS
    SELECT  b.编号 AS 项目支出类型编号,
	b.所属经费模版编号 ,
            b.项目支出类型 ,
            b.经费占比 ,
			c.编号 AS 项目支出内容编号,
            c.项目支出内容 ,
            c.财务科目
    FROM    dbo.经费模版项目支出类型 b
            JOIN dbo.经费模版项目支出内容 c ON b.编号 = c.所属经费模版项目支出类型编号
GO
/****** Object:  View [dbo].[v1_期刊]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v1_期刊]
AS
    SELECT  * ,
            CONCAT(名称, '/', 英文刊名, '/', 主办单位, '/', 年度,'/',PMID,'/',DOI,'/',UT) AS AllName
    FROM    期刊;

GO
/****** Object:  View [dbo].[v1_区域]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_区域]
AS
    SELECT  a.编号 ,
            a.上级编号 ,
            a.名称 ,
            a.级别 ,
            a.排序 ,
            IIF(EXISTS ( SELECT 1
                         FROM   区域 b
                         WHERE  b.上级编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            a.备注
    FROM    dbo.区域 a;


GO
/****** Object:  View [dbo].[v1_人员]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v1_人员]
AS
    SELECT  编号 ,
            工号 ,
        --密码 ,
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
    FROM    人员;

GO
/****** Object:  View [dbo].[v1_通知公告接收条件]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v1_通知公告接收条件] as
SELECT  编号 ,
        通知公告编号 ,
        接收者类型 ,
        CASE 接收者类型
          WHEN 0 THEN '所有人'
          WHEN 10 THEN '人员'
          WHEN 20 THEN '部门'
          WHEN 30 THEN '角色'
        END AS 接收者类型名称 ,
        接收者编号 ,
        CASE 接收者类型
          WHEN 0 THEN '所有人'
          WHEN 10 THEN ( SELECT 姓名
                         FROM   dbo.人员
                         WHERE  编号 = 接收者编号
                       )
          WHEN 20 THEN ( SELECT 名称
                         FROM   dbo.部门
                         WHERE  编号 = 接收者编号
                       )
          WHEN 30 THEN ( SELECT 名称
                         FROM   dbo.角色
                         WHERE  编号 = 接收者编号
                       )
        END AS 接收者名称
FROM    dbo.通知公告接收条件;


GO
/****** Object:  View [dbo].[v1_项目分类]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v1_项目分类]
AS
    SELECT  a.编号 ,
            a.上级编号 ,
            a.名称 ,
            a.级别 ,
            a.排序 ,
            a.备注 ,
            IIF(EXISTS ( SELECT 1
                         FROM   项目分类 b
                         WHERE  b.上级编号 = a.编号 ), 1, 0) AS 是否存在下级
    FROM    dbo.项目分类 a;

GO
/****** Object:  View [dbo].[v1_学科]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v1_学科]
AS
    SELECT  a.编号 ,
            a.上级编号 ,
            a.名称 ,
            a.级别 ,
            a.排序 ,
            IIF(EXISTS ( SELECT 1
                         FROM   学科 b
                         WHERE  b.上级编号 = a.编号 ), 1, 0) AS 是否存在下级 ,
            a.备注
    FROM    dbo.学科 a;
GO
/****** Object:  View [dbo].[VStepTemplate]    Script Date: 2020/3/9 9:00:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VStepTemplate]
AS
    SELECT  * ,
            STUFF(( SELECT  ',' + dbo.FNGetPersonInfoByType(b.StepAssignedPersonType,b.StepAssignedPersonId)
                    FROM    dbo.StepTemplateAssignedPerson AS b
                    WHERE   b.StepTemplateId = a.id
                  FOR
                    XML PATH('')
                  ), 1, 1, '') AS 可操作人 ,
            STUFF(( SELECT  ',' + d.Name
                    FROM    StepTemplateState AS d
                    WHERE   d.StepTemplateId = a.id
                  FOR
                    XML PATH('')
                  ), 1, 1, '') AS 可用操作
    FROM    dbo.StepTemplate as a;  


GO
/****** Object:  Index [IX_继教标签]    Script Date: 2020/3/9 9:00:34 ******/
CREATE NONCLUSTERED INDEX [IX_继教标签] ON [dbo].[继教标签]
(
	[编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_通知公告接收条件]    Script Date: 2020/3/9 9:00:34 ******/
CREATE NONCLUSTERED INDEX [IX_通知公告接收条件] ON [dbo].[通知公告接收条件]
(
	[通知公告编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_通知公告已接收人]    Script Date: 2020/3/9 9:00:34 ******/
CREATE NONCLUSTERED INDEX [IX_通知公告已接收人] ON [dbo].[通知公告已接收人]
(
	[通知公告编号] ASC,
	[接收人编号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF__Flow__State__027D5126]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Flow] ADD  CONSTRAINT [DF__Flow__CreateDate__0371755F]  DEFAULT (getdate()) FOR [CreateDateTime]
GO
ALTER TABLE [dbo].[Step] ADD  CONSTRAINT [DF__Step__State__6E765879]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[Step] ADD  CONSTRAINT [DF__Step__CreateDate__6F6A7CB2]  DEFAULT (getdate()) FOR [CreateDatetime]
GO
ALTER TABLE [dbo].[部门] ADD  CONSTRAINT [DF_部门_排序值]  DEFAULT ((0)) FOR [排序值]
GO
ALTER TABLE [dbo].[部门] ADD  CONSTRAINT [DF_部门_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[成果项目] ADD  CONSTRAINT [DF_项目成果_是否项目带来成果]  DEFAULT ((1)) FOR [是否项目带来成果]
GO
ALTER TABLE [dbo].[继教操作考试] ADD  CONSTRAINT [DF_Table_1_是否允许考试查看成绩]  DEFAULT ((1)) FOR [是否允许考生查看成绩]
GO
ALTER TABLE [dbo].[继教操作考试] ADD  CONSTRAINT [DF_继培操作考试_是否允许考生查看评分]  DEFAULT ((1)) FOR [是否允许考生查看评分]
GO
ALTER TABLE [dbo].[继教操作考试参与情况] ADD  CONSTRAINT [DF_继培操作考试参与情况_得分]  DEFAULT ((0)) FOR [得分]
GO
ALTER TABLE [dbo].[继教活动] ADD  CONSTRAINT [DF_继培活动_学分]  DEFAULT ((0)) FOR [学分]
GO
ALTER TABLE [dbo].[继教活动] ADD  CONSTRAINT [DF_继培活动_必须按顺序学习]  DEFAULT ((1)) FOR [必须按顺序学习]
GO
ALTER TABLE [dbo].[继教活动] ADD  CONSTRAINT [DF_继教活动_建立时间]  DEFAULT (getdate()) FOR [建立时间]
GO
ALTER TABLE [dbo].[继教活动内容] ADD  CONSTRAINT [DF_继培活动内容_排序值]  DEFAULT ((0)) FOR [排序值]
GO
ALTER TABLE [dbo].[继教活动项目分类] ADD  CONSTRAINT [DF_继培活动项目分类_父编号]  DEFAULT ((0)) FOR [父编号]
GO
ALTER TABLE [dbo].[继教角色] ADD  CONSTRAINT [DF_继培角色_能否直接配置人员]  DEFAULT ((1)) FOR [能否直接配置人员]
GO
ALTER TABLE [dbo].[继教课后练习参与情况] ADD  CONSTRAINT [DF_继教课后练习参与情况_得分]  DEFAULT ((0)) FOR [得分]
GO
ALTER TABLE [dbo].[继教课后练习试题] ADD  CONSTRAINT [DF_继培课后练习试题_分值]  DEFAULT ((1)) FOR [分值]
GO
ALTER TABLE [dbo].[继教课后练习试题] ADD  CONSTRAINT [DF_继培课后练习试题_排序值]  DEFAULT ((0)) FOR [排序值]
GO
ALTER TABLE [dbo].[继教理论考试] ADD  CONSTRAINT [DF_继培理论考试_是否允许任何人参与]  DEFAULT ((0)) FOR [是否允许任何人参与]
GO
ALTER TABLE [dbo].[继教理论考试] ADD  CONSTRAINT [DF_继培理论考试_是否试题乱序]  DEFAULT ((0)) FOR [是否试题乱序]
GO
ALTER TABLE [dbo].[继教理论考试] ADD  CONSTRAINT [DF_继培理论考试_是否允许考生查看成绩]  DEFAULT ((1)) FOR [是否允许考生查看成绩]
GO
ALTER TABLE [dbo].[继教理论考试] ADD  CONSTRAINT [DF_继培理论考试_是否允许考生查看答案]  DEFAULT ((1)) FOR [是否允许考生查看答案]
GO
ALTER TABLE [dbo].[继教慕课] ADD  CONSTRAINT [DF_继培慕课课时课件_是否允许下载]  DEFAULT ((0)) FOR [是否允许下载]
GO
ALTER TABLE [dbo].[继教慕课] ADD  CONSTRAINT [DF_继培慕课课时课件_通过时长]  DEFAULT ((0)) FOR [通过时长]
GO
ALTER TABLE [dbo].[继教慕课参与情况] ADD  CONSTRAINT [DF_继培慕课课时课件学习情况_学习时长]  DEFAULT ((0)) FOR [学习时长]
GO
ALTER TABLE [dbo].[继教慕课素材] ADD  CONSTRAINT [DF_继培慕课素材_大小]  DEFAULT ((0)) FOR [大小]
GO
ALTER TABLE [dbo].[继教慕课素材] ADD  CONSTRAINT [DF_继培慕课素材_时长]  DEFAULT ((0)) FOR [时长]
GO
ALTER TABLE [dbo].[继教签到规定] ADD  CONSTRAINT [DF_继培签到规定_二维码变化秒数]  DEFAULT ((0)) FOR [二维码变化秒数]
GO
ALTER TABLE [dbo].[继教权限] ADD  CONSTRAINT [DF_继培权限_是否菜单]  DEFAULT ((1)) FOR [是否菜单]
GO
ALTER TABLE [dbo].[继教设置] ADD  CONSTRAINT [DF_继培设置_最大允许离开界面次数]  DEFAULT ((3)) FOR [最大允许离开界面次数]
GO
ALTER TABLE [dbo].[继教试卷结构] ADD  CONSTRAINT [DF_继培试卷结构_排序值]  DEFAULT ((0)) FOR [排序值]
GO
ALTER TABLE [dbo].[继教试卷试题] ADD  CONSTRAINT [DF_继培试卷试题_正确得分]  DEFAULT ((1)) FOR [分值]
GO
ALTER TABLE [dbo].[继教试卷试题] ADD  CONSTRAINT [DF_继培试卷试题_排序值]  DEFAULT ((0)) FOR [排序值]
GO
ALTER TABLE [dbo].[继教试题类型] ADD  CONSTRAINT [DF_继培试题类型_分值]  DEFAULT ((1)) FOR [分值]
GO
ALTER TABLE [dbo].[继教文件夹] ADD  CONSTRAINT [DF_继培文件夹_父编号]  DEFAULT ((0)) FOR [父编号]
GO
ALTER TABLE [dbo].[继教文件夹] ADD  CONSTRAINT [DF_继培文件夹_排序值]  DEFAULT ((0)) FOR [排序值]
GO
ALTER TABLE [dbo].[继教文件夹] ADD  CONSTRAINT [DF_继培文件夹_层级]  DEFAULT ((1)) FOR [层级]
GO
ALTER TABLE [dbo].[教学360评价项目] ADD  CONSTRAINT [DF_教学360评价项目_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[教学本院策略] ADD  CONSTRAINT [DF_教学本院策略_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_排序值]  DEFAULT ((1)) FOR [排序值]
GO
ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_是否必选]  DEFAULT ((1)) FOR [是否必选]
GO
ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_培训时长]  DEFAULT ((1)) FOR [培训时长]
GO
ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_Table_1_管床要求]  DEFAULT ((0)) FOR [最低管床数量]
GO
ALTER TABLE [dbo].[教学本院科室] ADD  CONSTRAINT [DF_教学本院科室_最低全程管理数量]  DEFAULT ((0)) FOR [最低全程管理数量]
GO
ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊]
GO
ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否病房]  DEFAULT ((0)) FOR [是否病房]
GO
ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_是否医技]  DEFAULT ((0)) FOR [是否医技]
GO
ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求]
GO
ALTER TABLE [dbo].[教学本院科室任务] ADD  CONSTRAINT [DF_教学本院科室任务_数量要求]  DEFAULT ((0)) FOR [数量要求]
GO
ALTER TABLE [dbo].[教学管床病人] ADD  CONSTRAINT [DF_教学管床病人_是否全程陪护]  DEFAULT ((0)) FOR [是否全程陪护]
GO
ALTER TABLE [dbo].[教学活动评价项目] ADD  CONSTRAINT [DF_教学活动评价项目_是否有效]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[教学角色] ADD  CONSTRAINT [DF_教学角色_能否直接配置人员]  DEFAULT ((1)) FOR [能否直接配置人员]
GO
ALTER TABLE [dbo].[教学科室] ADD  CONSTRAINT [DF_教学科室_最大学员人数]  DEFAULT ((5)) FOR [最大学员人数]
GO
ALTER TABLE [dbo].[教学轮转] ADD  CONSTRAINT [DF_教学轮转_最低管床数量]  DEFAULT ((0)) FOR [最低管床数量]
GO
ALTER TABLE [dbo].[教学轮转] ADD  CONSTRAINT [DF_教学轮转_最低全程管理数量]  DEFAULT ((0)) FOR [最低全程管理数量]
GO
ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊]
GO
ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_是否病房]  DEFAULT ((0)) FOR [是否病房]
GO
ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_是否医技]  DEFAULT ((0)) FOR [是否医技]
GO
ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求]
GO
ALTER TABLE [dbo].[教学轮转任务] ADD  CONSTRAINT [DF_教学轮转任务_数量要求]  DEFAULT ((0)) FOR [数量要求]
GO
ALTER TABLE [dbo].[教学权限] ADD  CONSTRAINT [DF_教学权限_是否菜单]  DEFAULT ((1)) FOR [是否菜单]
GO
ALTER TABLE [dbo].[教学通知公告] ADD  CONSTRAINT [DF_教学通知公告_已接收人数]  DEFAULT ((0)) FOR [已接收人数]
GO
ALTER TABLE [dbo].[教学通知公告] ADD  CONSTRAINT [DF_教学通知公告_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[教学专业科室] ADD  CONSTRAINT [DF_教学专业科室_最低管床数量]  DEFAULT ((0)) FOR [最低管床数量]
GO
ALTER TABLE [dbo].[教学专业科室] ADD  CONSTRAINT [DF_教学专业科室_全程管理数量]  DEFAULT ((0)) FOR [最低全程管理数量]
GO
ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_是否门诊]  DEFAULT ((0)) FOR [是否门诊]
GO
ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_Table_1_是否]  DEFAULT ((0)) FOR [是否病房]
GO
ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_是否医技]  DEFAULT ((0)) FOR [是否医技]
GO
ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_最低评分要求]  DEFAULT ((0)) FOR [最低评分要求]
GO
ALTER TABLE [dbo].[教学专业科室任务] ADD  CONSTRAINT [DF_教学专业科室任务_数量要求]  DEFAULT ((0)) FOR [数量要求]
GO
ALTER TABLE [dbo].[权限] ADD  CONSTRAINT [DF_权限_排序]  DEFAULT ((0)) FOR [排序]
GO
ALTER TABLE [dbo].[人员] ADD  CONSTRAINT [DF_人员_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[任职] ADD  CONSTRAINT [DF_任职_建立时间]  DEFAULT (getdate()) FOR [建立时间]
GO
ALTER TABLE [dbo].[通知公告] ADD  CONSTRAINT [DF_通知公告_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[下载中心] ADD  CONSTRAINT [DF_下载中心_是否启用]  DEFAULT ((1)) FOR [是否启用]
GO
ALTER TABLE [dbo].[项目经费到账] ADD  CONSTRAINT [DF_项目经费到账_到账金额]  DEFAULT ((0)) FOR [到账金额]
GO
ALTER TABLE [dbo].[项目经费到账] ADD  CONSTRAINT [DF_项目经费到账_技术交易额]  DEFAULT ((0)) FOR [技术交易额]
GO
ALTER TABLE [dbo].[项目经费到账] ADD  CONSTRAINT [DF_项目经费到账_管理费用]  DEFAULT ((0)) FOR [管理费用]
GO
ALTER TABLE [dbo].[项目经费到账] ADD  CONSTRAINT [DF_项目经费到账_技术合同认定服务费]  DEFAULT ((0)) FOR [技术合同认定服务费]
GO
ALTER TABLE [dbo].[项目经费到账] ADD  CONSTRAINT [DF_项目经费到账_增值税]  DEFAULT ((0)) FOR [增值税]
GO
ALTER TABLE [dbo].[专家评分] ADD  CONSTRAINT [DF_专家评分_专家编号]  DEFAULT ((2)) FOR [专家编号]
GO
ALTER TABLE [dbo].[字典] ADD  CONSTRAINT [DF_字典_上级编号]  DEFAULT ((0)) FOR [上级编号]
GO
ALTER TABLE [dbo].[字典] ADD  CONSTRAINT [DF_字典_级别]  DEFAULT ((1)) FOR [级别]
GO
ALTER TABLE [dbo].[字典] ADD  CONSTRAINT [DF_字典_排序]  DEFAULT ((0)) FOR [排序]
GO
ALTER TABLE [dbo].[纵向项目申报] ADD  CONSTRAINT [DF_纵向项目申报_是否立项]  DEFAULT ((0)) FOR [是否立项]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板编号,可以理解为sourceType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'FlowTemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关工作对象的id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'SourceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'发起人类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'CreatorType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'此流程的发起人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'CreatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'CreateDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程
   
   状态有: 0-未完成;1-已完成;-2 被终止;-3 已过期
   保留-1是为了和步骤类型状态匹配,-1在步骤类型状态里面为退回到某一个' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Flow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowTemplate', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'来源表名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowTemplate', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowTemplate', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowTemplate', @level2type=N'COLUMN',@level2name=N'ComponentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowTemplate', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板
   
   一个流程往往以一个表为"工作的对象";
   但是一个表可以作为多个流程的"工作的对象"
   例如:请假单
   
   该流程模板的某流程,其详情页面的组件名称
   固定一个参数是其"工作的对象"的Id
   如:请假单详情?id=1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FlowTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'FlowId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'StepTemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作人类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'OperatorType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'OperatorId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'执行时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'OperatorDatetime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'CreateDatetime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤
   状态:默认0,操作后由操作的状态值填写,具体对应stempTemplateState表里面的State值
   
   当前步骤的状态用了"步骤模板编号+状态编号+排序"来说明
   虽然可以用"步骤模板状态"id来指定,但变换其状态来比较麻烦;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Step'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自增编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepAssignedPerson', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepAssignedPerson', @level2type=N'COLUMN',@level2name=N'StepId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指定人类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepAssignedPerson', @level2type=N'COLUMN',@level2name=N'StepAssignedPersonType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'指定人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepAssignedPerson', @level2type=N'COLUMN',@level2name=N'StepAssignedPersonId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤指定人
   这个已经是流程业务里面的数据了
   不是流程模板,步骤模板里面的预定义' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepAssignedPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'FlowTemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查看组件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'ViewComponentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编辑组件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'EditComponentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'Style'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤模板
   编号=流程模板编号的,为该流程模板的第一步骤
   比如流程模板为100,那么步骤为100的就是该流程的第一步,
   步骤模板的编号规则为:
   100  -第一步
   101 -做第二步,当然也可以是110大于100的就可以' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateState', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateState', @level2type=N'COLUMN',@level2name=N'StepTemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateState', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateState', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateState', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤模板中的某一步骤模板的状态
   某个具体的步骤模板,可以有多种状态;
   新生成一个步骤时,状态为0,比如提交一个请假到审核步骤,这个状态叫"待审核"
   又比如审核步骤时,可以有"通过"和"不通过操作"
   
   其中约定,1为进入下一步或者完成整个流程,-1为退回第一步,-2为终止整个流程;
   
   主键:步骤模板编号+状态编号
   编号:101(步骤模板编号) 1(状态编号) 则此状态为1011,
   如果状态编号是-1,则整个编号为-
   
   状态说明,如:
   审核步骤中:
   0:待审核
   1:审核通过
   -1:审核不通过' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateState'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选择名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤状态编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice', @level2type=N'COLUMN',@level2name=N'StepTemplateStateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下一步骤模板编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice', @level2type=N'COLUMN',@level2name=N'NextStepTemplateId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一个审核步骤的通过选择有多种可能的走向;
   state=0的没有下一步
   最后一步也应该没有下一步
   这个Sort其实就是不同的choice
   编号: 步骤模板编号+状态编号+sort
   10111这样的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤模板状态选择编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoiceCondition', @level2type=N'COLUMN',@level2name=N'StepTemplateStateChoiceId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'属性名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoiceCondition', @level2type=N'COLUMN',@level2name=N'PropName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'运算符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoiceCondition', @level2type=N'COLUMN',@level2name=N'Operator'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'预定义的值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoiceCondition', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoiceCondition', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'进入哪个步骤模板状态的准入条件
   
   一个StepTemplateState 可能没有 StepTemplateStateConditions;
          则表示这个状态的转变,没有准入条件,
   
   也可能一或多条;
         则表示这个状态的转变,有这样那样的准入条件
         只有"相关数据"满足了所有这些准入条件,这个转变才是有效的;
   
   总的来看:一个审核通过的后续步骤可能是多个,但他们的操作状态其实是一样的都是0->1;
   那么在StepTemplateState里面选取哪个,就看着多个StepTemplateState各自对应的准入条件是否能被满足;
   可能剩下一个或多个满足的StepTemplateState,那么取第一个中的NextStepTemplateId,
   
   此为多入多出的关键;没有主键哈;
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StepTemplateStateChoiceCondition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'600' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'报销'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'这个应该由选择的经费模版为基础,填写报销金额
   财务科目这个一般都没显示,
   判断一个项目对应的多个报销的更多个报销详情中某个项目支出内容已经报销了多少,
   就按项目支出类型+项目支出内容分组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'报销详情'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暂时也不用这个' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'步骤指定人'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'210' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'参加会议'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'211' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'参加会议反馈'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果获奖', @level2type=N'COLUMN',@level2name=N'获奖等级'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关项目,相关论文,都用关联表来表示
   论文获奖先不管
   完成单位数量默认1,前台在1的时候加上备注(独立申报)
   303
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果获奖'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Title' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果论文', @level2type=N'COLUMN',@level2name=N'论文标题'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'科研管理员一次审核即可;
   是否与项目相关是和项目关联表决定
   注意:导入时刊物必须已经存在;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果论文'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 项目带来成果 0 成果引发项目' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果项目', @level2type=N'COLUMN',@level2name=N'是否项目带来成果'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目类型 1-纵向 2-横向
   成果类型 1-论文 2 著作 3 专利 4文体 5 获奖
   是否项目带来成果:
   1项目得到成果
   2成果引发项目
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果项目'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'302' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'成果专利'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院内or院外' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目', @level2type=N'COLUMN',@level2name=N'合作方关系'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'甲乙方' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目', @level2type=N'COLUMN',@level2name=N'合作方契约关系'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'350
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'院内or院外' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目变更', @level2type=N'COLUMN',@level2name=N'合作方关系'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'甲乙方' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目变更', @level2type=N'COLUMN',@level2name=N'合作方契约关系'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'360
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目变更'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'470' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'横向项目结题'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教操作考试打分情况', @level2type=N'COLUMN',@level2name=N'操作考试参与情况编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教操作考试评分表', @level2type=N'COLUMN',@level2name=N'操作考试编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教操作考试助教老师', @level2type=N'COLUMN',@level2name=N'操作考试编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教活动可参与人', @level2type=N'COLUMN',@level2name=N'活动编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教角色权限', @level2type=N'COLUMN',@level2name=N'继教角色编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教考试批次可参与人', @level2type=N'COLUMN',@level2name=N'考试批次编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教课后练习试题', @level2type=N'COLUMN',@level2name=N'课后练习编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教评分表项目要求', @level2type=N'COLUMN',@level2name=N'评分表项目编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教签到规定', @level2type=N'COLUMN',@level2name=N'签到编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教人员角色', @level2type=N'COLUMN',@level2name=N'继教角色编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教试卷结构', @level2type=N'COLUMN',@level2name=N'试卷编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教试卷试题', @level2type=N'COLUMN',@level2name=N'试卷结构编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教试题备选答案', @level2type=N'COLUMN',@level2name=N'试题编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教试题标签', @level2type=N'COLUMN',@level2name=N'试题编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教试题正确答案', @level2type=N'COLUMN',@level2name=N'试题编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教微信角色权限', @level2type=N'COLUMN',@level2name=N'继教角色编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教文件夹可使用人', @level2type=N'COLUMN',@level2name=N'文件夹编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'继教助教老师', @level2type=N'COLUMN',@level2name=N'科室编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学360评价评分', @level2type=N'COLUMN',@level2name=N'教学360评价编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学360评价项目', @level2type=N'COLUMN',@level2name=N'教学360评价分类编号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'以周为单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学本院科室', @level2type=N'COLUMN',@level2name=N'编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学本院科室', @level2type=N'COLUMN',@level2name=N'教学本院策略编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学本院科室任务', @level2type=N'COLUMN',@level2name=N'教学本院科室编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学带教老师', @level2type=N'COLUMN',@level2name=N'教学科室编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学活动可参与者', @level2type=N'COLUMN',@level2name=N'教学活动编号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Obsolete' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学活动评价项目', @level2type=N'COLUMN',@level2name=N'教学活动类型编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学活动评价项目', @level2type=N'COLUMN',@level2name=N'教学活动类型编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学角色权限', @level2type=N'COLUMN',@level2name=N'教学角色编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学考勤情况', @level2type=N'COLUMN',@level2name=N'教学轮转编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学轮转手册完成任务', @level2type=N'COLUMN',@level2name=N'教学轮转手册编号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'不是菜单就是按钮之类的;' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学权限', @level2type=N'COLUMN',@level2name=N'是否菜单'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学人员角色', @level2type=N'COLUMN',@level2name=N'教学角色编号'
GO
EXEC sys.sp_addextendedproperty @name=N'obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学通知公告', @level2type=N'COLUMN',@level2name=N'已接收人数'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学通知公告接收条件', @level2type=N'COLUMN',@level2name=N'教学通知公告编号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目前只可能是人员或学员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学通知公告已接收人', @level2type=N'COLUMN',@level2name=N'接收人类型'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学学员', @level2type=N'COLUMN',@level2name=N'来源学校编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学学员', @level2type=N'COLUMN',@level2name=N'来源学生编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学学员', @level2type=N'COLUMN',@level2name=N'密码'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位是周,前台显示可以做别的格式.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学专业', @level2type=N'COLUMN',@level2name=N'最低培训时长'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学专业科室', @level2type=N'COLUMN',@level2name=N'教学专业编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学专业科室任务', @level2type=N'COLUMN',@level2name=N'教学专业科室编号'
GO
EXEC sys.sp_addextendedproperty @name=N'Obsolete', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'教学专业科室要求', @level2type=N'COLUMN',@level2name=N'教学专业科室编号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0-100 %' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'经费模版项目支出类型', @level2type=N'COLUMN',@level2name=N'经费占比'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其实就是自顶一个表的objectid
   流程模板编号也完全可以用这个id
   更高层次的sourcetype也可以用;
   
   10-人员
   20-部门
   30-角色
   
   100-任职
   200-主办讲座
   201 讲座反馈
   210 参加会议
   211 参加会议反馈
   
   300 成果论文
   310 论文认领   这里的论文认领完全不必新开一个流程,其实就是成果论文的流程,只不过附加动作不是新增一个论文而已;
   301 成果著作
   302成果专利
   303成果获奖
   
   400纵向项目申报
   410纵向项目立项
   420纵向项目中检
   430纵向项目变更
   440纵向项目结题
   
   450横向项目
   460横向项目变更
   470横向项目结题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'来源表'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'编号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'代码'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称(不加书名号;名称或英文刊名至少提供一个)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'名称'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文刊名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'英文刊名'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主办单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'主办单位'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'期刊系列' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'期刊系列'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'收录情况' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'收录情况'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'语种' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'语种'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'JCR分区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'JCR分区'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编目名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'编目名称'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'编目类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'编目类别'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'年度'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创刊日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'创刊日期'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被引用次数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'被引用次数'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'影响因子' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'影响因子'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'特征因子分值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'特征因子分值'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISSN号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'ISSN号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CN号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'CN号'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出版周期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'出版周期'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'出版地' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'出版地'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'开本'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'备注'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'PMID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'PMID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DOI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'DOI'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UT' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'期刊', @level2type=N'COLUMN',@level2name=N'UT'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 菜单 1-各种input' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'权限', @level2type=N'COLUMN',@level2name=N'类型'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'500
   对于纵向项目: 技术交易额,管理费用,技术合同认定服务费,增值税可以都不管不显示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'项目经费到账'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'除了"纵向项目立项编号"对应纵向项目立项里面的编号,
   其他在"纵向项目立项"里面的字段,和本表都一一对应;
   430
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'纵向项目变更'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'440' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'纵向项目结题'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类: 1-科研项目 2-重点学科 3-人才培养
   
   名称好像都可以重复,??
   项目编号可以没有????
   
   项目登记情况,不知道什么意思
   这里的"项目分类"还没有基础数据支撑
   这里的经办人也不知道什么意思
   资助类别???
   批准经费和配套经费应该根据预算来计算得出.放到view里面去
   410' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'纵向项目立项'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分类: 1-科研项目 2-重点学科 3-人才培养
   经办人没啥用吧?
   项目子类也不知道什么用
   300' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'纵向项目申报'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'420' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'纵向项目中检'
GO

