let HTTP_URL_HOST = 'http://localhost:63739';
// let HTTP_URL_HOST = 'http://192.168.0.99:63739';
if (process.env.NODE_ENV === 'production') {
  HTTP_URL_HOST = '';
}
const URL_TAST = {
  TEST: '/Ldar/SysUser/LoginSysUser'
};

const URL_USER = {

  //用户登录
  POST_LOGIN: '/Manage/Access/Login',

  POST_EDIT_PASS_WORD: '/TeachingManagement/Office/ChangePassword',

  GET_MENU_LIST: '/TeachingManagement/HomePage/获取教学权限菜单',

  GET_PAGING_ALL_USER: '/People/分页获取人员列表',

  GET_ENABLE_PAGING_ALL_USER: '/People/分页获取启用的人员列表',

  GET_ALL_USER: '/People/获取所有人员列表',

  GET_USER_DETAILS: '/People/获取某人员详情',

  POST_ADD_OR_EDIT_USER: '/People/增改人员',

  POST_IMPORT_USER: '/People/导入人员',

  POST_ENABLE_USER: '/People/启用人员',

  POST_DISABLE_USER: '/People/禁用人员',

  URL_GET_DOWNLOAD_USER_TEMPLET: '/upload/基础信息/导入人员/导入人员模板.xlsx',

  URL_POST_IMPORT_USERS: '/People/导入人员'

};
const URL_PERMISSION = {
  GET_LOGIN_LOG: '/TeachingManagement/Permission/获取登录日志',

  GET_FLOW_PATH_LIST: '/TeachingManagement/WorkFlow/分页获取办事流程列表',

  GET_LOW_PATH_DETAILS: '/TeachingManagement/WorkFlow/获取某办事流程步骤列表',

  GET_ROLE_LIST: '/TeachingManagement/Permission/获取教学角色列表',

  POST_ADD_EDIT_ROLE: '/TeachingManagement/Permission/增改教学角色',

  GET_ROLE_USERS: '/TeachingManagement/Permission/获取教学角色中的人员',

  GET_PAGING_ROLE_USERS: '/TeachingManagement/Permission/分页获取教学角色中的人员',

  POST_ADD_EDIT_ROLE_USER: '/TeachingManagement/Permission/增改某教学角色中的人员',

  GET_ROLE_JURISDICTION: '/TeachingManagement/Permission/获取教学角色的权限',

  POST_ADD_EDIT_ROLE_JURISDICTION: '/TeachingManagement/Permission/增改某教学角色的权限'
};

const URL_BASE_INFO = {
  GET_TYPE_DICTIONARY: '/BaseInfo/获取某类字典',

  GET_PAGING_TYPE_DICTIONARY: '/BaseInfo/分页获取某类字典',

  POST_ADD_DICTIONARY: '/BaseInfo/新增字典',

  POST_EDIT_DICTIONARY: '/BaseInfo/修改字典',

  POST_DELETE_DICTIONARY: '/BaseInfo/删除字典',

  GET_STUDENT_TYPE: '/TeachingManagement/BaseInfo/获取教学学员类型',

  GET_DORMITORY_LIST: '/TeachingManagement/BaseInfo/获取教学宿舍楼',

  POST_ADD_OR_EDIT_DORMITORY: '/TeachingManagement/BaseInfo/增改教学宿舍楼',

  GET_TEACHING_GRADING_SCALE: '/TeachingManagement/BaseInfo/获取教学评分等级'

};

const URL_SETTING = {
  GET_TEACHING_ACTIVITIES_CLASSIFY: '/TeachingManagement/Setting/获取教学活动类型',

  POST_ADD_OR_EDIT_ACTIVITIES_CLASSIFY: '/TeachingManagement/Setting/增改教学活动类型',

  GET_TEACHING_ACTIVITIES_PROJDECT: '/TeachingManagement/Setting/获取某教学活动分类下的评价项目',

  POST_ADD_EDIT_ACTIVITIES_PROJDECT: '/TeachingManagement/Setting/增改某教学活动类型下的评价项目',

  POST_ENABLE_ACTIVITIES_PROJDECT: '/TeachingManagement/Setting/启用某些教学活动评价项目',

  POST_DISABLE_ACTIVITIES_PROJDECT: '/TeachingManagement/Setting/禁用某些教学活动评价项目',

  GET_360_EVALUATE_TYPES: '/TeachingManagement/Setting/获取教学360评价目标类型',

  GET_360_EVALUATE_DIRECTION: '/TeachingManagement/Setting/获取教学360评价方向',

  GET_360_EVALUATE_CLASSIFY: '/TeachingManagement/Setting/获取某目标类型的教学360评价分类',

  GET_360_EVALUATE_PROJECT: '/TeachingManagement/Setting/获取某教学360评价分类下的评价项目',

  GET_360_EVALUATE_CLASSIFY_AND_PROJECT: '/TeachingManagement/Setting/获取某目标类型的教学360评价分类和项目',

  POST_ADD_EDIT_EVALUATE_PROJDECT: '/TeachingManagement/Setting/增改某教学360评价分类下的评价项目',

  POST_ENABLE_EVALUATE_PROJDECT: '/TeachingManagement/Setting/启用某些教学360评价项目',

  POST_DISABLE_EVALUATE_PROJDECT: '/TeachingManagement/Setting/禁用某些教学360评价项目',

  GET_TRAINING_MAJOR_LIST: '/TeachingManagement/Setting/获取教学专业',

  POST_ADD_EDIT_TRAINING_MAJOR: '/TeachingManagement/Setting/增改教学专业',

  GET_MAJOR_DEPARTMENT: '/TeachingManagement/Setting/获取某教学专业下的科室',

  GET_PAGING_MAJOR_DEPARTMENT: '/TeachingManagement/Setting/分页获取某教学专业下的科室',

  POST_ADD_EDIT_MAJOR_DEPARTMENT: '/TeachingManagement/Setting/增改某教学专业下的科室',

  GET_PAGING_MAJOR_DEPARTMENT_ASK: '/TeachingManagement/Setting/分页获取某个教学专业科室的教学要求',

  GET_MAJOR_DEPARTMENT_ASK: '/TeachingManagement/Setting/获取某个教学专业科室的教学要求',

  POST_ADD_EDIT_MAJOR_DEPARTMENT_ASK: '/TeachingManagement/Setting/批量增改教学专业科室要求',

  POST_DELETE_MAJOR_DEPARTMENT_ASK: '/TeachingManagement/Setting/批量删除教学专业科室要求',

  GET_MAJOR_DEPARTMENT_TASK_TYPE: '/TeachingManagement/Setting/获取教学专业科室任务类型',

  GET_PAGING_MAJOR_DEPARTMENT_TASK: '/TeachingManagement/Setting/分页获取某个教学专业科室的教学任务',

  GET_MAJOR_EPARTMENT_TASK: '/TeachingManagement/Setting/获取某个教学专业科室的教学任务',

  POST_ADD_EDIT_MAJOR_DEPARTMENT_TASK: '/TeachingManagement/Setting/增改某个教学专业科室的教学任务',

  POST_DELETE_MAJOR_DEPARTMENT_TASK: '/TeachingManagement/Setting/批量删除教学专业科室任务',

  GET_HOSPITAL_STRATEGY_LIST: '/TeachingManagement/Setting/获取教学本院策略',

  POST_ADD_EDIT_HOSPITAL_STRATEGY: '/TeachingManagement/Setting/增改教学本院策略',

  POST_ENABLE_HOSPITAL_STRATEGY: '/TeachingManagement/Setting/启用某些教学本院策略',

  POST_DISABLE_HOSPITAL_STRATEGY: '/TeachingManagement/Setting/禁用某些教学本院策略',

  GET_HOSPITAL_DEPARTMENT: '/TeachingManagement/Setting/获取某教学本院策略下的科室',

  POST_ADD_EDIT_STRATEGY_DEPARTMENT: '/TeachingManagement/Setting/增改某教学本院策略下的科室',

  POST_DELETE_STRATEGY_DEPARTMENT: '/TeachingManagement/Setting/批量删除教学本院科室',

  GET_PAGING_HOSPITAL_DEPARTMENT_TASK: '/TeachingManagement/Setting/分页获取某教学本院科室下的任务',

  POST_ADD_EDIT_HOSPITAL_DEPARTMENT_TASK: '/TeachingManagement/Setting/增改某教学本院科室下的任务',

  POST_DELETE_HOSPITAL_DEPARTMENT_TASK: '/TeachingManagement/Setting/批量删除教学本院科室任务',

  GET_PAGING_PATIENT: '/TeachingManagement/Setting/分页获取病人',

  POST_ADD_OR_EDIT_PATIENT: '/TeachingManagement/Setting/增改病人',

};

const URL_ORGANIZATION = {

  GET_DEPARTMENT_LIST: '/BaseInfo/获取部门列表',

  GET_ENABLE_DEPARTMENT_LIST: '/BaseInfo/获取启用的部门列表',

  POST_ADD_OR_EDIT_DEPARTMENT: '/BaseInfo/增改部门',

  POST_ENABLE_DEPARTMENT: '/BaseInfo/启用部门',

  POST_DISABLE_DEPARTMENT: '/BaseInfo/禁用部门',

  GET_TEACHING_DEPARTMENT_LIST: '/TeachingManagement/Organization/获取部门带教学科室信息',

  GET_DEPARTMENT_TEACHING_TEACHER: '/TeachingManagement/Organization/获取某科室的教学带教老师',

  POST_ADD_EDIT_TEACHING_DEPARTMENT: '/TeachingManagement/Organization/增改教学科室',

  POST_ADD_EDIT_TEACHING_TEACHER: '/TeachingManagement/Organization/增改某教学科室的带教老师',

  POST_ADD_EDIT_TEACHING_DEPARTMENT_AND_TEACHER: '/TeachingManagement/Organization/增改教学科室以及带教老师',

  GET_PAGING_ALL_STUDENT: '/TeachingManagement/Organization/分页获取教学学员',

  POST_ADD_OR_EDIT_STUDENT: '/TeachingManagement/Organization/增改教学学员',

  POST_UPLOAD_STUDENT_IMG: '/TeachingManagement/Organization/上传教学学员头像',

  URL_POST_IMPORT_STUDENT: '/TeachingManagement/Organization/导入教学学员',

  URL_GET_DOWNLOAD_STUDENT_TEMPLET: '/upload/教学/组织机构/导入学员/导入学员模板.xlsx'
};

const URL_OFFICE = {
  GET_PAGING_NOTICE_LIST: '/TeachingManagement/Office/分页获取教学通知公告',

  GET_NOTICE_DETAILS: '/TeachingManagement/Office/获取教学通知公告详情',

  POST_ADD_OR_EDIT_NOTICE: '/TeachingManagement/Office/增改教学通知公告',

  POST_UPLOAD_NOTICE_IMG: '/TeachingManagement/Office/上传教学通知公告文件或图片',

  POST_ENABLE_NOTICE: '/TeachingManagement/Office/启用教学通知公告',

  POST_DISABLE_NOTICE: '/TeachingManagement/Office/禁用教学通知公告',

  URL_POST_UPLOAD_DOWNLOAD_FILE: '/Office/上传下载文件',

  URL_GET_DOWNLOAD_CENTER: '/Office/分页获取下载中心',

  URL_GET_ENABLE_DOWNLOAD_CENTER: '/Office/分页获取可查看的下载中心',

  URL_POST_ADD_OR_EDIT_DOWNLOAD: '/Office/增改下载',

  URL_POST_ENABLE_OR_DISABLE_DOWNLOAD: '/Office/启禁下载'
};

const URL_TEACHING_MANAGEMENT = {
  GET_PAGING_MY_STUDENT: '/TeachingManagement/TeachingManagement/分页获取我的学员',

  GET_PAGING_STUDENT_REPORT: '/TeachingManagement/TeachingManagement/分页获取学员报到情况',

  URL_POST_ADD_OR_EDIT_STUDENT_REPORT: '/TeachingManagement/TeachingManagement/增改学员报到',

  URL_POST_BATCH_ADD_EDIT_STUDENT_REPORT: '/TeachingManagement/TeachingManagement/批量增改学员报到',

  GET_PAGING_STUDENT_DORMITORY_ARRANGEMENT: '/TeachingManagement/TeachingManagement/分页获取学员宿舍楼安排',

  URL_POST_ADD_OR_EDIT_STUDENT_DORMITORY: '/TeachingManagement/TeachingManagement/增改学员宿舍安排',

  URL_POST_BATCH_ADD_EDIT_STUDENT_DORMITORY: '/TeachingManagement/TeachingManagement/批量增改学员宿舍安排',

  GET_AUTOMATIC_ROTATION: '/TeachingManagement/TeachingManagement/获取轮转自动设置临时结果',

  POST_ADD_OR_EDIT_ROTATION: '/TeachingManagement/TeachingManagement/增改教学轮转',

  POST_BATCH_DELETE_ROTATION: '/TeachingManagement/TeachingManagement/批量删除教学轮转',

  POST_ADD_OR_EDIT_ROTATION_TASK: '/TeachingManagement/TeachingManagement/增改教学轮转任务',

  POST_BATCH_DELETE_ROTATION_TASK: '/TeachingManagement/TeachingManagement/批量删除教学轮转任务',

  GET_STUDENT_ROTATION: '/TeachingManagement/TeachingManagement/获取某学员的教学轮转',

  GET_PAGING_MY_STUDENT_ROTATION: '/TeachingManagement/TeachingManagement/分页获取我的学员的教学轮转',

  POST_BATCH_DELETE_ROTATION_ARRANGE: '/TeachingManagement/TeachingManagement/删除学员教学轮转安排',

  GET_DEPARTMENT_STATISTICS_ROTATION: '/TeachingManagement/TeachingManagement/按科室统计轮转',

  GET_PAGING_REPAIR_ROTATION: '/TeachingManagement/TeachingManagement/分页获取教学补轮转',

  POST_REPAIR_ROTATION: '/TeachingManagement/TeachingManagement/补轮转',

  GET_PAGING_TEST_SCORES: '/TeachingManagement/TeachingManagement/分页获取我的学员的教学考试成绩',

  POST_EDIT_TEST_SCORES: '/TeachingManagement/TeachingManagement/增改教学考试成绩',

  GET_PAGING_MEDICAL_ERROR_RECORD: '/TeachingManagement/TeachingManagement/分页获取我的学员的教学医疗差错及事故记录',

  POST_ADD_EDIT_MEDICAL_ERROR_RECORD: '/TeachingManagement/TeachingManagement/增改教学医疗差错及事故记录',

  POST_UPLOAD_MEDICAL_ERROR_RECORD: '/TeachingManagement/TeachingManagement/上传教学医疗差错及事故记录附件',

  POST_STUDENT_ENTRY: '/TeachingManagement/TeachingManagement/学员入科',

  GET_PAGING_CHANGE_TEACHER: '/TeachingManagement/TeachingManagement/分页获取我的教学更换带教老师',

  POST_ADD_EDIT_CHANGE_TEACHER: '/TeachingManagement/TeachingManagement/增改教学更换带教老师',

  GET_SING_IN_TYPES: '/TeachingManagement/TeachingManagement/获取教学考勤类型',

  GET_PAGING_SING_IN_STATISTICS: '/TeachingManagement/TeachingManagement/分页获取我的学员的考勤统计',

  GET_ROTATION_SING_IN: '/TeachingManagement/TeachingManagement/获取某教学轮转的考勤',

  POST_ADD_EDIT_SING_IN: '/TeachingManagement/TeachingManagement/增改教学考勤情况',

  GET_STUDENT_INFO: '/TeachingManagement/TeachingManagement/获取某教学学员档案',

};

const URL_WORK_FLOW = {
  GET_FLOW_PATH_LIST: '/TeachingManagement/WorkFlow/分页获取办事流程列表',

  GET_LOW_PATH_DETAILS: '/TeachingManagement/WorkFlow/获取某办事流程步骤列表',

  GET_PAGING_STUDENT_EXIT: '/TeachingManagement/WorkFlow/分页查看退培申请',

  GET_STUDENT_EXIT_DETAILS: '/TeachingManagement/WorkFlow/获取退培详情',

  POST_PASS_STUDENT_EXIT: '/TeachingManagement/WorkFlow/通过退培申请',

  POST_NO_PASS_STUDENT_EXIT: '/TeachingManagement/WorkFlow/不通过退培申请',

  POST_STOP_STUDENT_EXIT: '/TeachingManagement/WorkFlow/终止退培申请',

  GET_PAGING_LEAVE_APPLY: '/TeachingManagement/WorkFlow/分页查看请假申请',

  GET_LEAVE_DETAILS: '/TeachingManagement/WorkFlow/获取请假详情',

  POST_PASS_LEAVE_APPLY: '/TeachingManagement/WorkFlow/通过请假申请',

  POST_NO_PASS_LEAVE_APPLY: '/TeachingManagement/WorkFlow/不通过请假申请',

  POST_STOP_LEAVE_APPLY: '/TeachingManagement/WorkFlow/终止请假申请',

  GET_PAGING_ROTATION_APPLY: '/TeachingManagement/WorkFlow/分页查看轮转手册申请',

  GET_ROTATION_DETAILS: '/TeachingManagement/WorkFlow/获取轮转手册详情',

  POST_PASS_ROTATION_APPLY: '/TeachingManagement/WorkFlow/通过轮转手册申请',

  POST_NO_PASS_ROTATION_APPLY: '/TeachingManagement/WorkFlow/不通过轮转手册申请',

  POST_STOP_ROTATION_APPLY: '/TeachingManagement/WorkFlow/终止轮转手册申请',

  GET_PAGING_OUT_DEPARTMENT: '/TeachingManagement/WorkFlow/分页查看出科申请',

  GET_OUT_DEPARTMENT_DETAILS: '/TeachingManagement/WorkFlow/获取出科详情',

  POST_PASS_OUT_DEPARTMENT: '/TeachingManagement/WorkFlow/通过出科申请',

  POST_NO_PASS_OUT_DEPARTMENT: '/TeachingManagement/WorkFlow/不通过出科申请',

  POST_STOP_OUT_DEPARTMENT: '/TeachingManagement/WorkFlow/终止出科申请',

  GET_PAGING_GRADUATION_APPLY: '/TeachingManagement/WorkFlow/分页查看结业申请',

  GET_GRADUATION_DETAILS: '/TeachingManagement/WorkFlow/获取结业详情',

  POST_PASS_GRADUATION_APPLY: '/TeachingManagement/WorkFlow/通过结业申请',

  POST_NO_PASS_GRADUATION_APPLY: '/TeachingManagement/WorkFlow/不通过结业申请',

  POST_STOP_GRADUATION_APPLY: '/TeachingManagement/WorkFlow/终止结业申请',

  GET_WORK_FLOW_RECORD: '/TeachingManagement/WorkFlow/获取某流程审核记录'

};

const URL_ACTIVITY = {
  GET_PAGING_ACTIVITY: '/TeachingManagement/Activity/分页获取教学活动',

  GET_ACTIVITY_EVALUATE: '/TeachingManagement/Activity/获取某教学活动的评价',

  GET_PAGING_ACTIVITY_FEEDBACK: '/TeachingManagement/Activity/分页获取某教学活动的反馈',

  POST_ADD_EDIT_ACTIVITY: '/TeachingManagement/Activity/增改教学活动',

  POST_UPLOAD_ACTIVITY_FILE: '/TeachingManagement/Activity/上传教学活动附件',

  GET_ACTIVITY_DETAILS: '/TeachingManagement/Activity/获取教学活动详情',

  GET_PAGING_MY_ACTIVITY: '/TeachingManagement/Activity/分页获取我的教学活动',

  GET_PAGING_MY_ACTIVITY_EVALUATE: '/TeachingManagement/Activity/获取我对某个教学活动的评价',

  GET_MY_ACTIVITY_FEEDBACK: '/TeachingManagement/Activity/获取我对某个教学活动的反馈',

  POST_ADD_EDIT_ACTIVITY_FEEDBACK: '/TeachingManagement/Activity/增改教学活动反馈',

  POST_ADD_EDIT_ACTIVITY_EVALUATE: '/TeachingManagement/Activity/增改教学活动评价',

  POST_UPLOAD_ACTIVITY_FEEDBACK: '/TeachingManagement/Activity/上传教学活动反馈附件',

};

const URL_360EVALUATE = {
  GET_PAGING_EVALUATE: '/TeachingManagement/Evaluation360/分页获取评价',

  GET_EVALUATE_SCORE: '/TeachingManagement/Evaluation360/获取评价评分',

  POST_ADD_EDIT_360EVALUATE: '/TeachingManagement/Evaluation360/增改360评价',
}

const URL_STATISTICS = {
  GET_STUDENT_TRAIN_STATE_STATISTICS: '/TeachingManagement/Statistical/获取教学学员培训状态列表',

  GET_STUDENT_RECRUITING_STATISTICS: '/TeachingManagement/Statistical/获取学员招录统计',

  GET_STUDENT_TRAIN_STATISTICS: '/TeachingManagement/Statistical/获取学员培训统计',

  GET_STUDENT_TRAIN_TASK_STATISTICS: '/TeachingManagement/Statistical/获取学员培训任务统计',

  GET_ACTIVITY_STATISTICS: '/TeachingManagement/Statistical/获取教学活动统计',

  GET_360EVALUATE_STATISTICS: '/TeachingManagement/Statistical/获取360评价统计',
}

const URL_HOME = {
  GET_PAGING_TODO: '/TeachingManagement/HomePage/分页获取待办事宜',

  GET_PAGING_NOTICE: '/TeachingManagement/HomePage/分页获取可查看的教学通知公告',

  GET_NOTICE_DETAILS: '/TeachingManagement/HomePage/获取教学通知公告详情'
}





const STUDENT_STATE = ['未报到', '退培', '已报到', '轮转计划已安排', '在培', '待结业', '结业'];
const ROTATION_STATE = ['未入科', '在科', '已出科'];
const WORK_FLOW_STATE = ['未完成', '已完成', '作废'];

export {
  URL_TAST,
  HTTP_URL_HOST,
  URL_USER,
  URL_PERMISSION,
  URL_BASE_INFO,
  URL_SETTING,
  URL_ORGANIZATION,
  URL_OFFICE,
  URL_TEACHING_MANAGEMENT,
  URL_WORK_FLOW,
  URL_ACTIVITY,
  URL_360EVALUATE,
  URL_STATISTICS,
  URL_HOME,
  STUDENT_STATE,
  ROTATION_STATE,
  WORK_FLOW_STATE
};
