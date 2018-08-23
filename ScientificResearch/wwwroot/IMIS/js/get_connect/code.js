// var getApiHost = 'http://192.168.0.126:63739';
var getApiHost = '';
var getUserImG = 'http://api3.meinolf.net.cn:9003';

var Code = {
    //用户登录
    URL_POST_LOGIN: getApiHost + '/Access/Login',

    //修改密码
    URL_POST_CHANGE_PASSWORD: getApiHost + '/Access/ChangePassword',

    //获取登录日志
    URL_GET_LOGIN_LOG: getApiHost + '/Access/获取登录日志',

    //获取角色列表
    URL_GET_ROLE_LIST: getApiHost + '/Permission/获取角色列表',

    //新增角色
    URL_POST_ADD_ROLE: getApiHost + '/Permission/新增角色',

    //修改某个角色
    URL_POST_EDIT_ROLE: getApiHost + '/Permission/修改角色',

    //分页获取角色中的人员
    URL_GET_ROLE_USERS: getApiHost + '/Permission/分页获取角色中的人员',

    //分页获取角色中没有的人员
    URL_GET_ROLE_NOT_USERS: getApiHost + '/Permission/分页获取角色中没有的人员',

    //保存修改角色中的人员
    URL_POST_EDIT_ROLE_USERS: getApiHost + '/Permission/保存角色中的人员',

    //增删角色人员
    URL_POST_ADD_AND_DEL_ROLE_USERS: getApiHost + '/Permission/增删角色人员',

    //获取某个角色的权限
    URL_GET_ROLE_JURISDICTION: getApiHost + '/Permission/获取角色的权限',

    //修改某个角色中的权限
    URL_POST_EDIT_ROLE_JURISDICTION: getApiHost + '/Permission/保存角色的权限',


    //获取启用的部门列表
    URL_GET_ENABLE_DEPARTMENT_LIST: getApiHost + '/BaseInfo/获取启用的部门列表',

    //获取全部部门列表
    URL_GET_DEPARTMENT_LIST: getApiHost + '/BaseInfo/获取部门列表',

    //新增或修改部门
    URL_POST_ADD_OR_EDIT_DEPARTMENT: getApiHost + '/BaseInfo/增改部门',

    //启用部门
    URL_POST_ENABLE_DEPARTMENT: getApiHost + '/BaseInfo/启用部门',

    //禁用部门
    URL_POST_DISABLE_DEPARTMENT: getApiHost + '/BaseInfo/禁用部门',


    //获取全部人员列表
    URL_GET_USERS_LIST: getApiHost + '/People/获取所有人员列表',

    //分页获取全部人员列表
    URL_GET_PAGING_USERS_LIST: getApiHost + '/People/分页获取人员列表',

    //分页获取启用人员列表
    URL_GET_PAGING_ENABLE_USERS_LIST: getApiHost + '/People/分页获取启用的人员列表',

    //新增或修改人员
    URL_POST_ADD_OR_EDIT_USERS: getApiHost + '/People/增改人员',

    //启用人员
    URL_POST_ENABLE_USERS: getApiHost + '/People/启用人员',

    //导入人员
    URL_POST_IMPORT_USERS: getApiHost + '/People/导入人员',

    //导入人员模板
    URL_GET_DOWNLOAD_USER_TEMPLET: getApiHost + '/upload/基础信息/导入人员/导入人员模板.xlsx',

    //禁用人员
    URL_POST_DISABLE_USERS: getApiHost + '/People/禁用人员',


    //获取某人员详情
    URL_GET_USER_DETAILS: getApiHost + '/People/获取某人员详情',

    //获取人员详情辅助数据
    URL_GET_USER_DETAILS_AUXILIARY_DATA: getApiHost + '/People/获取人员详情辅助数据',

    //分页获取学术任职
    URL_GET_PAGING_LEARNING: getApiHost + '/People/分页获取学术任职',

    //获取学术任职详情
    URL_GET_LEARNING_DETAILS: getApiHost + '/People/获取学术任职详情',

    //新增学术任职
    URL_POST_ADD_LEARNING_USER: getApiHost + '/People/新增学术任职',

    //修改学术任职
    URL_POST_EDIT_LEARNING_USER: getApiHost + '/People/完善学术任职',

    //上传学术任职相关文件
    URL_POST_UPLOAD_LEARNING_FILE: getApiHost + '/People/上传学术任职相关文件',


    //分页获取科研人员
    URL_GET_PAGING_SCIENTIFICRESARCH_USER: getApiHost + '/People/分页获取科研人员',

    //新增科研人员
    URL_POST_ADD_SCIENTIFICRESARCH_USER: getApiHost + '/People/新增科研人员',

    //删除科研人员
    URL_POST_DEL_SCIENTIFICRESARCH_USER: getApiHost + '/People/删除科研人员',

    //从现有人员增加科研人员
    URL_POST_HAVE_ADD_SCIENTIFICRESARCH_USER: getApiHost + '/People/从现有人员增加科研人员',


    //分页获取专家
    URL_GET_PAGING_EXPERTALENTS_USER: getApiHost + '/People/分页获取专家',

    //新增专家
    URL_POST_ADD_EXPERTALENTS_USER: getApiHost + '/People/新增专家',

    //删除专家
    URL_POST_DEL_EXPERTALENTS_USER: getApiHost + '/People/删除专家',

    //从现有人员增加专家
    URL_POST_HAVE_ADD_EXPERTALENTS_USER: getApiHost + '/People/从现有人员增加专家',


    //获取获取某上级编号下字典
    URL_GET_DICTIONARY_CHILD: getApiHost + '/BaseInfo/获取某上级编号下字典',

    //分页获取获取某上级编号下字典
    URL_GET_PAGING_DICTIONARY_CHILD: getApiHost + '/BaseInfo/分页获取某上级编号下字典',

    //分页获取某类字典
    URL_GET_PAGING_CATEGORY_DICTIONARY: getApiHost + '/BaseInfo/分页获取某类字典',

    //获取某类字典
    URL_GET_CATEGORY_DICTIONARY: getApiHost + '/BaseInfo/获取某类字典',

    //新增字典
    URL_POST_ADD_DICTIONARY: getApiHost + '/BaseInfo/新增字典',

    //修改某个字典
    URL_POST_EDIT_DICTIONARY: getApiHost + '/BaseInfo/修改字典',

    //批量删除字典
    URL_POST_DEL_DICTIONARY: getApiHost + '/BaseInfo/删除字典',

    //获取学科列表
    URL_GET_SUBJECT_LIST: getApiHost + '/BaseInfo/获取学科',

    //新增学科
    URL_POST_ADD_SUBJECT: getApiHost + '/BaseInfo/新增学科',

    //修改某个学科
    URL_POST_EDIT_SUBJECT: getApiHost + '/BaseInfo/修改学科',

    //批量删除学科
    URL_POST_DEL_SUBJECT: getApiHost + '/BaseInfo/删除学科',

    //获取项目分类列表
    URL_GET_PROJECT_TYPE_LIST: getApiHost + '/BaseInfo/获取项目分类',

    //增改项目分类
    URL_POST_ADD_OR_EDIT_PROJECT_TYPE: getApiHost + '/BaseInfo/增改项目分类',

    //批量删除项目分类
    URL_POST_DEL_PROJECT_TYPE: getApiHost + '/BaseInfo/删除项目分类',

    //获取国民行业代码列表
    URL_GET_INDUSTRY_CODE_LIST: getApiHost + '/BaseInfo/获取国民行业代码',

    //新增国民行业代码
    URL_POST_ADD_INDUSTRY_CODE: getApiHost + '/BaseInfo/新增国民行业代码',

    //修改某个国民行业代码
    URL_POST_EDIT_INDUSTRY_CODE: getApiHost + '/BaseInfo/修改国民行业代码',

    //批量删除国民行业代码
    URL_POST_DEL_INDUSTRY_CODE: getApiHost + '/BaseInfo/删除国民行业代码',

    //获取合同买方性质列表
    URL_GET_CONTRACT_BUYER_LIST: getApiHost + '/BaseInfo/获取合同买方性质',

    //新增合同买方性质
    URL_POST_ADD_CONTRACT_BUYER: getApiHost + '/BaseInfo/新增合同买方性质',

    //修改某个合同买方性质
    URL_POST_EDIT_CONTRACT_BUYER: getApiHost + '/BaseInfo/修改合同买方性质',

    //批量删除合同买方性质
    URL_POST_DEL_CONTRACT_BUYER: getApiHost + '/BaseInfo/删除合同买方性质',

    //获取技术领域列表
    URL_GET_TECHNICAL_FIELD_LIST: getApiHost + '/BaseInfo/获取技术领域',

    //新增技术领域
    URL_POST_ADD_TECHNICAL_FIELD: getApiHost + '/BaseInfo/新增技术领域',

    //修改某个技术领域
    URL_POST_EDIT_TECHNICAL_FIELD: getApiHost + '/BaseInfo/修改技术领域',

    //批量删除技术领域
    URL_POST_DEL_TECHNICAL_FIELD: getApiHost + '/BaseInfo/删除技术领域',

    //获取区域列表
    URL_GET_AREA_LIST: getApiHost + '/BaseInfo/获取区域',

    //新增区域
    URL_POST_ADD_AREA: getApiHost + '/BaseInfo/新增区域',

    //修改某个区域
    URL_POST_EDIT_AREA: getApiHost + '/BaseInfo/修改区域',

    //批量删除区域
    URL_POST_DEL_AREA: getApiHost + '/BaseInfo/删除区域',

    //获取经费模版列表
    URL_GET_EXPENDITURE_TEMPLATE_LIST: getApiHost + '/BaseInfo/获取经费模版',

    //获取某经费模版的支出类型以及支出内容
    URL_GET_EXPENDITURE_TEMPLATE_TYPES_AND_CONTENT: getApiHost + '/BaseInfo/获取某经费模版的支出类型以及支出内容',


    //增改经费模版
    URL_POST_ADD_OR_EDIT_EXPENDITURE_TEMPLATE: getApiHost + '/BaseInfo/增改经费模版',

    //批量删除删除经费模版
    URL_POST_DEL_EXPENDITURE_TEMPLATE: getApiHost + '/BaseInfo/删除经费模版',

    //获取经费模版项目支出类型列表
    URL_GET_EXPENDITURE_TYPE_LIST: getApiHost + '/BaseInfo/获取经费模版项目支出类型列表',

    //增改经费模版项目支出类型
    URL_POST_ADD_OR_EDIT_EXPENDITURE_TYPE: getApiHost + '/BaseInfo/增改经费模版项目支出类型',

    //批量删除经费模版项目支出类型
    URL_POST_DEL_EXPENDITURE_TYPE: getApiHost + '/BaseInfo/删除经费模版项目支出类型',

    //批量删除经费模版项目支出类型
    URL_GET_EXPENDITURE_TYPE_DETAIL: getApiHost + '/BaseInfo/获取经费模版项目支出类型详情',

    //分页获取期刊列表
    URL_GET_PERIODICAL_LIST: getApiHost + '/BaseInfo/分页获取期刊',

    //增改期刊
    URL_POST_ADD_OR_EDIT_PERIODICAL: getApiHost + '/BaseInfo/增改期刊',

    //批量删除期刊
    URL_POST_DEL_PERIODICAL: getApiHost + '/BaseInfo/删除期刊',

    //导入期刊
    URL_POST_IMPORT_PERIODICAL: getApiHost + '/BaseInfo/导入期刊',

    //导入期刊模板
    URL_GET_DOWNLOAD_PERIODICAL_TEMPLET: getApiHost + '/upload/基础信息/导入期刊/导入期刊模板.xlsx',


    //审核步骤
    URL_POST_WORKFLOW: getApiHost + '/WorkFlow/审核步骤',

    //分页获取办事流程列表
    URL_GET_WORKFLOW_TOTAL_LIST: getApiHost + '/WorkFlow/分页获取办事流程列表',

    //获取某办事流程步骤列表
    URL_GET_WORKFLOW_LIST: getApiHost + '/WorkFlow/获取某办事流程步骤列表',


    //分配步骤指定人
    URL_POST_WORKFLOW_ASSIGNOR: getApiHost + '/WorkFlow/分配步骤指定人',

    //获取科研详情
    URL_GET_SCIENTIFICRESARCH_DETAILS: getApiHost + '/Office/获取科研详情',

    //分页获取科研待办
    URL_GET_SCIENTIFICRESARCH_UNTREATED: getApiHost + '/Office/获取待办流程',

    //分页获取某人员可查看的通知公告
    URL_GET_PAGING_USER_NOTICE_LIST: getApiHost + '/Office/分页获取某人员可查看的通知公告',

    //分页获取通知公告
    URL_GET_PAGING_NOTICE_LIST: getApiHost + '/Office/分页获取通知公告',

    //获取通知公告详情
    URL_GET_NOTICE_DETAILS: getApiHost + '/Office/获取通知公告详情',

    //启禁通知公告
    URL_POST_ENABLE_OR_DISABLE_NOTICE: getApiHost + '/Office/启禁通知公告',

    //新增通知公告
    URL_POST_ADD_NOTICE: getApiHost + '/Office/新增通知公告',

    //上传通知公告文件
    URL_POST_UPLOAD_NOTICE_FILE: getApiHost + '/Office/上传通知公告文件',

    //上传下载文件
    URL_POST_UPLOAD_DOWNLOAD_FILE: getApiHost + '/Office/上传下载文件',

    //分页获取下载中心
    URL_GET_DOWNLOAD_CENTER: getApiHost + '/Office/分页获取下载中心',

    //分页获取可查看的下载中心
    URL_GET_ENABLE_DOWNLOAD_CENTER: getApiHost + '/Office/分页获取可查看的下载中心',

    //增改下载
    URL_POST_ADD_OR_DOWNLOAD: getApiHost + '/Office/增改下载',

    //启禁下载
    URL_POST_ENABLE_OR_DISABLE_DOWNLOAD: getApiHost + '/Office/启禁下载',

    //分页获取主办讲座
    URL_GET_HOST_LECTURE_LIST: getApiHost + '/AcademicActivities/分页获取主办讲座',

    //获取主办讲座详情
    URL_GET_HOST_LECTURE_DETAILS: getApiHost + '/AcademicActivities/获取主办讲座详情',

    //发起一个主办讲座流程
    URL_POST_ADD_HOST_LECTURE: getApiHost + '/AcademicActivities/发起一个主办讲座流程',

    //完善主办讲座申请资料
    URL_POST_EDIT_HOST_LECTURE: getApiHost + '/AcademicActivities/完善主办讲座申请资料',

    //上传主讲人简历
    URL_POST_UPLOAD_SPONSOR_RESUME: getApiHost + '/AcademicActivities/上传主讲人简历',

    //分页获取讲座反馈
    URL_GET_FEEDBACK_LECTURE: getApiHost + '/AcademicActivities/分页获取讲座反馈',

    //获取讲座反馈详情
    URL_GET_LECTURE_FEEDBACK_DETAILS: getApiHost + '/AcademicActivities/获取讲座反馈详情',

    //发起一个讲座反馈流程
    URL_POST_ADD_LECTURE_FEEDBACK: getApiHost + '/AcademicActivities/发起一个讲座反馈流程',

    //完善讲座反馈申请资料
    URL_POST_EDIT_LECTURE_FEEDBACK: getApiHost + '/AcademicActivities/完善讲座反馈申请资料',

    //上传讲座附件
    URL_POST_UPLOAD_LECTURE_ENCLOSURE: getApiHost + '/AcademicActivities/上传讲座附件',

    //分页获取参加会议
    URL_GET_MEETING_LIST: getApiHost + '/AcademicActivities/分页获取参加会议',

    //获取参加会议详情
    URL_GET_MEETING_DETAILS: getApiHost + '/AcademicActivities/获取参加会议详情',

    //发起一个参加会议流程
    URL_POST_ADD_MEETING: getApiHost + '/AcademicActivities/发起一个参加会议流程',

    //完善参加会议申请资料
    URL_POST_EDIT_MEETING: getApiHost + '/AcademicActivities/完善参加会议申请资料',

    //上传参会相关文件
    URL_POST_UPLOAD_MEETING_FILE: getApiHost + '/AcademicActivities/上传参会相关文件',

    //分页获取参加会议反馈
    URL_GET_MEETING_FEEDBACK_LIST: getApiHost + '/AcademicActivities/分页获取参加会议反馈',

    //获取参加会议反馈详情
    URL_GET_MEETING_FEEDBACK_DETAILS: getApiHost + '/AcademicActivities/获取参加会议反馈详情',

    //发起一个参加会议反馈流程
    URL_POST_ADD_MEETING_FEEDBACK: getApiHost + '/AcademicActivities/发起一个参加会议反馈流程',

    //完善参加会议反馈申请资料
    URL_POST_EDIT_MEETING_FEEDBACK: getApiHost + '/AcademicActivities/完善参加会议反馈申请资料',

    //上传会议反馈文件
    URL_POST_UPLOAD_MEETING_FEEDBACK_FILE: getApiHost + '/AcademicActivities/上传会议反馈文件',

    //分页获取论文
    URL_GET_PAPER_LIST: getApiHost + '/Fruit/分页获取论文',

    //获取论文详情
    URL_GET_PAPER_DETAILS: getApiHost + '/Fruit/获取论文详情',

    //获取论文辅助数据
    URL_GET_PAPER_AUXILIARY_DATA: getApiHost + '/Fruit/获取论文辅助数据',

    //新增论文
    URL_POST_ADD_PAPER: getApiHost + '/Fruit/新增论文',

    //完善论文资料
    URL_POST_EDIT_PAPER: getApiHost + '/Fruit/完善论文资料',

    //论文删除
    URL_POST_DEL_PAPER: getApiHost + '/Fruit/',

    //上传检索信息页相关文件
    URL_POST_UPLOAD_RETRIEVAL_INFO: getApiHost + '/Fruit/上传检索信息页相关文件',

    //上传论文正文
    URL_POST_UPLOAD_PAPER: getApiHost + '/Fruit/上传论文正文',

    //上传论文其他相关文件
    URL_POST_UPLOAD_PAPER_FILE: getApiHost + '/Fruit/上传论文其他相关文件',

    //导入自定义论文
    URL_POST_IMPORT_CUSTOM_PAPER: getApiHost + '/Fruit/导入自定义论文',

    //导入知网论文
    URL_POST_IMPORT_HOWNET_PAPER: getApiHost + '/Fruit/导入知网论文',

    //导入论文成果模板
    URL_GET_DOWNLOAD_CUSTOM_TEMPLET: getApiHost + '/upload/成果/论文/导入论文成果模板.xlsx',

    //分页获取可领取论文
    URL_GET_RECEIVE_PAPER_LIST: getApiHost + '/Fruit/分页获取可领取论文',

    //分页获取成果总览
    URL_GET_ALL_FRUIT_LIST: getApiHost + '/Fruit/分页获取成果总览',

    //分页获取著作
    URL_GET_WORK_LIST: getApiHost + '/Fruit/分页获取著作',

    //获取著作详情
    URL_GET_WORK_DETAILS: getApiHost + '/Fruit/获取著作详情',

    //获取著作辅助数据
    URL_GET_WORK_AUXILIARY_DATA: getApiHost + '/Fruit/获取著作辅助数据',

    //新增著作
    URL_POST_ADD_WORK: getApiHost + '/Fruit/新增著作',

    //完善著作资料
    URL_POST_EDIT_WORK: getApiHost + '/Fruit/完善著作资料',

    //上传封面相关文件
    URL_POST_UPLOAD_WORK_COVER: getApiHost + '/Fruit/上传封面相关文件',

    //上传版权页相关文件
    URL_POST_UPLOAD_WORK_COPYRIGHT: getApiHost + '/Fruit/上传版权页相关文件',

    //上传前言页相关文件
    URL_POST_UPLOAD_WORK_PREFACE: getApiHost + '/Fruit/上传前言页相关文件',

    //上传完整目录页相关文件
    URL_POST_UPLOAD_WORK_CATALOG: getApiHost + '/Fruit/上传完整目录页相关文件',

    //上传著作其他相关文件
    URL_POST_UPLOAD_WORK_OTHER: getApiHost + '/Fruit/上传著作其他相关文件',

    //分页获取专利
    URL_GET_PATENT_LIST: getApiHost + '/Fruit/分页获取专利',

    //获取专利详情
    URL_GET_PATENT_DETAILS: getApiHost + '/Fruit/获取专利详情',

    //获取专利辅助数据
    URL_GET_PATENT_AUXILIARY_DATA: getApiHost + '/Fruit/获取专利辅助数据',

    //新增专利
    URL_POST_ADD_PATENT: getApiHost + '/Fruit/新增专利',

    //完善专利资料
    URL_POST_EDIT_PATENT: getApiHost + '/Fruit/完善专利资料',

    //上传专利相关文件
    URL_POST_UPLOAD_PATENT_FILE: getApiHost + '/Fruit/上传专利相关文件',

    //分页获取获奖
    URL_GET_AWARD_LIST: getApiHost + '/Fruit/分页获取获奖',

    //获取获奖详情
    URL_GET_AWARD_DETAILS: getApiHost + '/Fruit/获取获奖详情',

    //获取获奖辅助数据
    URL_GET_AWARD_AUXILIARY_DATA: getApiHost + '/Fruit/获取获奖辅助数据',

    //新增获奖
    URL_POST_ADD_AWARD: getApiHost + '/Fruit/新增获奖',

    //完善获奖资料
    URL_POST_EDIT_AWARD: getApiHost + '/Fruit/完善获奖资料',

    //上传获奖相关文件
    URL_POST_UPLOAD_AWARD_FILE: getApiHost + '/Fruit/上传获奖相关文件',

    //上传获奖单位文件
    URL_POST_UPLOAD_AWARD_COMPANY: getApiHost + '/Fruit/上传获奖单位文件',

    //上传获奖批文
    URL_POST_UPLOAD_AWARD_COMMENT: getApiHost + '/Fruit/上传获奖批文',


    //分页获取科研项目申报
    URL_GET_Y_SR_DECLARE_LIST: getApiHost + '/YProject/分页获取科研项目申报',

    //分页获取重点学科申报
    URL_GET_Y_SUBJECT_DECLARE_LIST: getApiHost + '/YProject/分页获取重点学科申报',

    //分页获取人才培养申报
    URL_GET_Y_PERSONNEL_DECLARE_LIST: getApiHost + '/YProject/分页获取人才培养申报',

    //获取纵向项目申报详情
    URL_GET_Y_DECLARE_DETAILS: getApiHost + '/YProject/获取纵向项目申报详情',

    //获取纵向项目申报辅助数据
    URL_GET_Y_DECLARE_AUXILIARY_DATA: getApiHost + '/YProject/获取纵向项目申报辅助数据',

    //新增科研项目申报
    URL_POST_ADD_Y_SR_DECLARE: getApiHost + '/YProject/新增科研项目申报',

    //新增重点学科申报
    URL_POST_ADD_Y_SUBJECT_DECLARE: getApiHost + '/YProject/新增重点学科申报',

    //新增人才培养申报
    URL_POST_ADD_Y_PERSONNEL_DECLARE: getApiHost + '/YProject/新增人才培养申报',

    //完善纵向项目申报资料
    URL_POST_EDIT_Y_DECLARE: getApiHost + '/YProject/完善纵向项目申报资料',

    //上传伦理批文
    URL_POST_UPLOAD_Y_DECLARE_ETHIC: getApiHost + '/YProject/上传伦理批文',

    //上传项目申报书
    URL_POST_UPLOAD_Y_DECLARE_FILE: getApiHost + '/YProject/上传项目申报书',

    //专家评审纵向项目申报
    URL_POST_EXPERT_DECLARE_AUDITING: getApiHost + '/YProject/专家评审纵向项目申报',


    //分页获取可立项的科研项目申报
    URL_GET_Y_SR_CAN_DECLARE_LIST: getApiHost + '/YProject/分页获取可立项的科研项目申报',

    //分页获取可立项的重点学科申报
    URL_POST_ADD_Y_CAN_SUBJECT_DECLARE: getApiHost + '/YProject/分页获取可立项的重点学科申报',

    //分页获取可立项的人才培养申报
    URL_POST_ADD_Y_CAN_PERSONNEL_DECLARE: getApiHost + '/YProject/分页获取可立项的人才培养申报',

    //通过申报详情获取可用的纵向项目立项详情
    URL_GET_Y_CAN_DECLARE_DETAILS: getApiHost + '/YProject/通过申报详情获取可用的纵向项目立项详情',

    //新增纵向项目申报立项
    URL_POST_ADD_Y_CAN_DECLARE: getApiHost + '/YProject/新增纵向项目申报立项',


    //分页获取纵向项目立项
    URL_GET_Y_PROJECT_ESTABLISH_LIST: getApiHost + '/YProject/分页获取纵向项目立项',

    //分页获取科研项目立项
    URL_GET_Y_SR_PROJECT_ESTABLISH_LIST: getApiHost + '/YProject/分页获取科研项目立项',

    //分页获取重点学科立项
    URL_GET_Y_SUBJECT_PROJECT_ESTABLISH: getApiHost + '/YProject/分页获取重点学科立项',

    //分页获取人才培养立项
    URL_GET_Y_PERSONNEL_PROJECT_ESTABLISH: getApiHost + '/YProject/分页获取人才培养立项',

    //获取纵向项目立项详情
    URL_GET_Y_PROJECT_ESTABLISH_DETAILS: getApiHost + '/YProject/获取纵向项目立项详情',

    //获取纵向项目立项辅助数据
    URL_GET_Y_PROJECT_AUXILIARY_DATA: getApiHost + '/YProject/获取纵向项目立项辅助数据',

    //新增科研项目立项
    URL_POST_ADD_Y_SR_PROJECT_ESTABLISH: getApiHost + '/YProject/新增科研项目立项',

    //新增重点学科立项
    URL_POST_ADD_Y_SUBJECT_PROJECT_ESTABLISH: getApiHost + '/YProject/新增重点学科立项',

    //新增人才培养立项
    URL_POST_ADD_Y_PERSONNEL_PROJECT_ESTABLISH: getApiHost + '/YProject/新增人才培养立项',

    //完善纵向项目立项资料
    URL_POST_EDIT_Y_PROJECT_ESTABLISH: getApiHost + '/YProject/完善纵向项目立项资料',

    //上传立项文件
    URL_POST_UPLOAD_Y_PROJECT_ESTABLISH_FILE: getApiHost + '/YProject/上传立项文件',


    //分页获取纵向项目中检
    URL_GET_Y_PROJECT_MIDDLE_INSPECTION: getApiHost + '/YProject/分页获取纵向项目中检',

    //获取纵向项目中检详情
    URL_GET_Y_PROJECT_MIDDLE_INSPECTION_DETAILS: getApiHost + '/YProject/获取纵向项目中检详情',

    //新增纵向项目中检
    URL_POST_ADD_Y_PROJECT_MIDDLE_INSPECTION: getApiHost + '/YProject/新增纵向项目中检',

    //完善纵向项目中检资料
    URL_POST_EDIT_Y_PROJECT_MIDDLE_INSPECTION: getApiHost + '/YProject/完善纵向项目中检资料',

    //专家评审纵向项目中检
    URL_POST_EXPERT_PROJECT_MIDDLE_INSPECTION: getApiHost + '/YProject/专家评审纵向项目中检',

    //上传中检资料
    URL_POST_UPLOAD_Y_PROJECT_MIDDLE_INSPECTION_FILE: getApiHost + '/YProject/上传中检资料',


    //分页获取纵向项目变更
    URL_GET_Y_PROJECT_ALTERATION_LIST: getApiHost + '/YProject/分页获取纵向项目变更',

    //获取纵向项目变更详情
    URL_GET_Y_PROJECT_ALTERATION_DETAILS: getApiHost + '/YProject/获取纵向项目变更详情',

    //新增纵向项目变更
    URL_POST_ADD_Y_PROJECT_ALTERATION: getApiHost + '/YProject/新增纵向项目变更',

    //完善纵向项目变更资料
    URL_POST_EDIT_Y_PROJECT_ALTERATION: getApiHost + '/YProject/完善纵向项目变更资料',

    //审核并应用纵向项目变更
    URL_POST_AUDIT_Y_PROJECT_ALTERATION: getApiHost + '/YProject/审核并应用纵向项目变更',


    //分页获取纵向项目结题
    URL_GET_Y_PROJECT_CONCLUSION_LIST: getApiHost + '/YProject/分页获取纵向项目结题',

    //获取纵向项目结题详情
    URL_GET_Y_PROJECT_CONCLUSION_DETAILS: getApiHost + '/YProject/获取纵向项目结题详情',

    //新增纵向项目结题
    URL_POST_ADD_Y_PROJECT_CONCLUSION: getApiHost + '/YProject/新增纵向项目结题',

    //完善纵向项目结题资料
    URL_POST_EDIT_Y_PROJECT_CONCLUSION: getApiHost + '/YProject/完善纵向项目结题资料',

    //上传结题资料
    URL_POST_UPLOAD_Y_PROJECT_CONCLUSION_FILE: getApiHost + '/YProject/上传结题资料',


    //分页获取横向项目
    URL_GET_X_PROJECT_LIST: getApiHost + '/XProject/分页获取横向项目',

    //获取横向项目详情
    URL_GET_X_PROJECT_DETAILS: getApiHost + '/XProject/获取横向项目详情',

    //获取横向项目辅助数据
    URL_GET_X_PROJECT_AUXILIARY_DATA: getApiHost + '/XProject/获取横向项目辅助数据',

    //新增横向项目申请
    URL_POST_ADD_X_PROJECT: getApiHost + '/XProject/新增横向项目申请',

    //完善横向项目申请资料
    URL_POST_EDIT_X_PROJECT: getApiHost + '/XProject/完善横向项目申请资料',

    //上传合同认定登记承诺书
    URL_POST_UPLOAD_X_PROJECT_CONTRACT_REGISTER: getApiHost + '/XProject/上传合同认定登记承诺书',

    //上传合同文件
    URL_POST_UPLOAD_X_PROJECT_CONTRACT_FILE: getApiHost + '/XProject/上传合同文件',


    //分页获取横向项目变更
    URL_GET_X_PROJECT_ALTERATION_LIST: getApiHost + '/XProject/分页获取横向项目变更',

    //获取横向项目变更详情
    URL_GET_X_PROJECT_ALTERATION_DETAILS: getApiHost + '/XProject/获取横向项目变更详情',

    //新增横向项目变更
    URL_POST_ADD_X_PROJECT_ALTERATION: getApiHost + '/XProject/新增横向项目变更',

    //完善横向项目变更资料
    URL_POST_EDIT_X_PROJECT_ALTERATION: getApiHost + '/XProject/完善横向项目变更资料',

    //审核并应用横向项目变更
    URL_POST_AUDIT_X_PROJECT_ALTERATION: getApiHost + '/XProject/审核并应用横向项目变更',


    //分页获取横向项目结题
    URL_GET_X_PROJECT_CONCLUSION_LIST: getApiHost + '/XProject/分页获取横向项目结题',

    //获取横向项目结题详情
    URL_GET_X_PROJECT_CONCLUSION_DETAILS: getApiHost + '/XProject/获取横向项目结题详情',

    //新增横向项目结题
    URL_POST_ADD_X_PROJECT_CONCLUSION: getApiHost + '/XProject/新增横向项目结题',

    //完善横向项目结题资料
    URL_POST_EDIT_X_PROJECT_CONCLUSION: getApiHost + '/XProject/完善横向项目结题资料',

    //上传结题资料
    URL_POST_UPLOAD_X_PROJECT_CONCLUSION_FILE: getApiHost + '/XProject/上传结题资料',



    //分页获取纵向项目经费合计到账列表
    URL_GET_Y_FUNDS_INCOMING_TOTAL_LIST: getApiHost + '/Incoming/分页获取纵向项目经费合计到账列表',

    //分页获取纵向项目到账列表
    URL_GET_Y_FUNDS_INCOMING_PAGING_LIST: getApiHost + '/Incoming/分页获取纵向项目到账列表',

    //获取某纵向项目经费到账列表
    URL_GET_Y_FUNDS_INCOMING_LIST: getApiHost + '/Incoming/获取某纵向项目经费到账列表',

    //获取纵向项目到账详情
    URL_GET_Y_FUNDS_INCOMING_DETAILS: getApiHost + '/Incoming/获取纵向项目到账详情',

    //新增纵向项目经费到账
    URL_POST_ADD_Y_FUNDS_INCOMING: getApiHost + '/Incoming/新增纵向项目经费到账',

    //完善纵向项目经费到账
    URL_POST_EDIT_Y_FUNDS_INCOMING: getApiHost + '/Incoming/完善纵向项目经费到账',

    //上传到账凭证
    URL_POST_UPLOAD_FUNDS_INCOMING_FILE: getApiHost + '/Incoming/上传到账凭证',


    //分页获取横向项目经费合计到账列表
    URL_GET_X_FUNDS_INCOMING_TOTAL_LIST: getApiHost + '/Incoming/分页获取横向项目经费合计到账列表',

    //分页获取横向项目到账列表
    URL_GET_X_FUNDS_INCOMING_PAGING_LIST: getApiHost + '/Incoming/分页获取横向项目到账列表',

    //获取某横向项目经费到账列表
    URL_GET_X_FUNDS_INCOMING_LIST: getApiHost + '/Incoming/获取某横向项目经费到账列表',

    //获取横向项目到账详情
    URL_GET_X_FUNDS_INCOMING_DETAILS: getApiHost + '/Incoming/获取横向项目到账详情',

    //新增横向项目经费到账
    URL_POST_ADD_X_FUNDS_INCOMING: getApiHost + '/Incoming/新增横向项目经费到账',

    //完善横向项目经费到账
    URL_POST_EDIT_X_FUNDS_INCOMING: getApiHost + '/Incoming/完善横向项目经费到账',



    //分页获取纵向项目经费合计报销列表
    URL_GET_Y_FUNDS_REIMBURSEMENT_TOTAL_LIST: getApiHost + '/Expense/分页获取纵向项目经费合计报销列表',

    //获取某纵向项目经费报销列表
    URL_GET_Y_FUNDS_REIMBURSEMENT_LIST: getApiHost + '/Expense/获取某纵向项目经费报销列表',

    //获取某纵向项目预算已报销详情
    URL_GET_Y_FUNDS_REIMBURSEMENT_DETAILS: getApiHost + '/Expense/获取某纵向项目预算已报销详情',

    //获取某报销详情
    URL_GET_FUNDS_REIMBURSEMENT_DETAILS: getApiHost + '/Expense/获取某报销详情',

    //新增纵向项目经费报销
    URL_POST_ADD_Y_FUNDS_REIMBURSEMENT: getApiHost + '/Expense/新增纵向项目经费报销',

    //完善有预算的经费报销
    URL_POST_EDIT_FUNDS_REIMBURSEMENT: getApiHost + '/Expense/完善有预算的经费报销',

    //上传到账凭证
    URL_POST_UPLOAD_FUNDS_REIMBURSEMENT_FILE: getApiHost + '/Expense/上传相关文件',



    //分页获取横向项目经费合计报销列表
    URL_GET_X_FUNDS_REIMBURSEMENT_TOTAL_LIST: getApiHost + '/Expense/分页获取横向项目经费合计报销列表',

    //获取某横向项目经费报销列表
    URL_GET_X_FUNDS_REIMBURSEMENT_LIST: getApiHost + '/Expense/获取某横向项目经费报销列表',

    //获取某横向项目预算已报销详情
    URL_GET_X_FUNDS_REIMBURSEMENT_DETAILS: getApiHost + '/Expense/获取某横向项目预算已报销详情',

    //新增横向项目经费报销
    URL_POST_ADD_X_FUNDS_REIMBURSEMENT: getApiHost + '/Expense/新增横向项目经费报销',



    //分页获取参加会议合计报销列表
    URL_GET_MEETING_FUNDS_REIMBURSEMENT_TOTAL_LIST: getApiHost + '/Expense/分页获取参加会议合计报销列表',

    //获取某参加会议报销列表
    URL_GET_MEETING_FUNDS_REIMBURSEMENT_LIST: getApiHost + '/Expense/获取某参加会议报销列表',

    //获取某参加会议预算已报销详情
    URL_GET_MEETING_FUNDS_REIMBURSEMENT_DETAILS: getApiHost + '/Expense/获取某参加会议预算已报销详情',

    //新增参加会议报销
    URL_POST_ADD_MEETING_FUNDS_REIMBURSEMENT: getApiHost + '/Expense/新增参加会议报销',

    //完善没有预算的经费报销
    URL_POST_EDIT_MEETING_FUNDS_REIMBURSEMENT: getApiHost + '/Expense/完善没有预算的经费报销',




































}