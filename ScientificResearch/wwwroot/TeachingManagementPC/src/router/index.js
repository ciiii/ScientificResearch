import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

/* Layout */
import Layout from '../views/layout/Layout';

export const constantRouterMap = [
  { path: '/login', component: () => import('@/views/login/index'), hidden: true },
  { path: '/404', component: () => import('@/views/404'), hidden: true },

  {
    path: '/',
    component: Layout,
    meta: { title: '首页', icon: 'home' },
    redirect: '/home',
    children: [
      {
      path: 'home',
      name: 'Home',
      component: () => import('@/views/home/index')
    },
      {
        path: '/todoList',
        name: 'TodoList',
        component: () => import('@/views/home/todoList'),
        meta: { title: '我的待办事宜' }
      },
      {
        path: '/myNoticeList',
        name: 'MyNoticeList',
        component: () => import('@/views/home/myNoticeList'),
        meta: { title: '我的通知公告' }
      },
    ]
  },
  {
    path: '/teachingOffice',
    component: Layout,
    name: 'TeachingOffice',
    meta: { title: '教学办公', icon: 'office' },
    children: [
      {
        path: '/notice',
        name: 'Notice',
        component: () => import('@/views/teachingOffice/notice/index'),
        redirect: '/noticeList',
        meta: { title: '通知公告' },
        children: [
          {
            path: '/noticeList',
            name: 'NoticeList',
            component: () => import('@/views/teachingOffice/notice/noticeList')
          },
          {
            path: '/addNotice',
            name: 'AddNotice',
            component: () => import('@/views/teachingOffice/notice/addNotice'),
            meta: { title: '添加通知' }
          },
          {
            path: '/noticeDetails',
            name: 'NoticeDetails',
            component: () => import('@/views/teachingOffice/notice/noticeDetails'),
            meta: { title: '通知详情' }

          }
        ]
      },
      {
        path: '/download',
        name: 'Download',
        component: () => import('@/views/teachingOffice/download/index'),
        meta: { title: '下载中心' }
      },
      {
        path: '/personal',
        name: 'Personal',
        component: () => import('@/views/teachingOffice/personal/index'),
        meta: { title: '个人资料' }
      },
      {
        path: '/editPassWord',
        name: 'EditPassWord',
        component: () => import('@/views/teachingOffice/personal/editPassWord'),
        meta: { title: '修改密码' }
      }
    ]
  },
  {
    path: '/auditManage',
    component: Layout,
    redirect: 'leaveAudit',
    name: 'AuditManage',
    meta: { title: '审核管理', icon: 'audit' },
    children: [
      {
        path: '/leaveAudit',
        name: 'LeaveAudit',
        component: () => import('@/views/auditManage/leaveAudit/index'),
        meta: { title: '请假审核' }
      },
      {
        path: '/auditSection',
        name: 'AuditSection',
        component: () => import('@/views/auditManage/outDepartment/index'),
        meta: { title: '出科审核' }
      },
      {
        path: '/rotationAudit',
        name: 'RotationAudit',
        component: () => import('@/views/auditManage/rotationAudit/index'),
        meta: { title: '轮转手册审核' }
      },
      {
        path: '/completionAudit',
        name: 'CompletionAudit',
        component: () => import('@/views/auditManage/graduationAudit/index'),
        meta: { title: '结业审核' }
      },
      {
        path: '/activityFeedbackAudit',
        name: 'ActivityFeedbackAudit',
        component: () => import('@/views/auditManage/activityFeedbackAudit/index'),
        meta: { title: '教学活动反馈审核' }
      },
    ]
  },
  {
    path: '/trainingManage',
    component: Layout,
    redirect: 'addStudent',
    name: 'TrainingManage',
    meta: { title: '培训管理', icon: 'trainingManage' },
    children: [
      {
        path: '/addStudent',
        name: 'AddStudent',
        component: () => import('@/views/trainingManage/addStudent/index'),
        meta: { title: '导录学员' }
      },
      {
        path: '/myStudent',
        name: 'MyStudent',
        component: () => import('@/views/trainingManage/myStudent/index'),
        meta: { title: '我的学员' }
      },
      {
        path: '/studentReport',
        name: 'StudentReport',
        component: () => import('@/views/trainingManage/studentReport/index'),
        meta: { title: '学员报到' }
      },
      {
        path: '/dormitoryArrangement',
        name: 'DormitoryArrangement',
        component: () => import('@/views/trainingManage/dormitoryArrangement/index'),
        meta: { title: '学员宿舍安排' }
      },
      {
        path: '/studentRotationManage',
        name: 'StudentRotationManage',
        component: () => import('@/views/trainingManage/studentRotationManage/index'),
        redirect: '/rotationList',
        meta: { title: '学员轮转管理' },
        children: [
          {
            path: '/rotationList',
            name: 'RotationList',
            component: () => import('@/views/trainingManage/studentRotationManage/rotationList')
          },
          {
            path: '/editRotation',
            name: 'EditRotation',
            component: () => import('@/views/trainingManage/studentRotationManage/editRotation'),
            meta: { title: '修改学员轮转' }
          },
          {
            path: '/automaticRotation',
            name: 'AutomaticRotation',
            component: () => import('@/views/trainingManage/studentRotationManage/automaticRotation'),
            meta: { title: '自动分配轮转' }
          },
          {
            path: '/departmentReportStatistics',
            name: 'DepartmentReportStatistics',
            component: () => import('@/views/trainingManage/studentRotationManage/departmentReportStatistics'),
            meta: { title: '按科室统计轮转' }
          }
        ]
      },
      {
        path: '/repairRotation',
        name: 'RepairRotation',
        component: () => import('@/views/trainingManage/repairRotation/index'),
        redirect: '/repairRotationList',
        meta: { title: '学员补轮转' },
        children: [
          {
            path: '/repairRotationList',
            name: 'RepairRotationList',
            component: () => import('@/views/trainingManage/repairRotation/repairRotationList')
          },
          {
            path: '/addRepairRotation',
            name: 'AddRepairRotation',
            component: () => import('@/views/trainingManage/repairRotation/addRepairRotation'),
            meta: { title: '添加补轮转' }
          }
        ]
      },
      {
        path: '/retireTraining',
        name: 'RetireTraining',
        component: () => import('@/views/trainingManage/retireTraining/index'),
        meta: { title: '学员退培' }
      },
      {
        path: '/testScores',
        name: 'TestScores',
        component: () => import('@/views/trainingManage/testScores/index'),
        meta: { title: '学员考试成绩' }
      },
      {
        path: '/medicalErrorRecord',
        name: 'MedicalErrorRecord',
        component: () => import('@/views/trainingManage/medicalErrorRecord/index'),
        redirect: '/recordList',
        meta: { title: '医疗差错及事故记录' },
        children: [
          {
            path: '/recordList',
            name: 'RecordList',
            component: () => import('@/views/trainingManage/medicalErrorRecord/recordList')
          },
          {
            path: '/addEditRecord',
            name: 'AddEditRecord',
            component: () => import('@/views/trainingManage/medicalErrorRecord/addEditRecord'),
            meta: { title: '添加事故记录' }
          }
        ]
      },
      {
        path: '/studentEntry',
        name: 'StudentEntry',
        component: () => import('@/views/trainingManage/studentEntry/index'),
        meta: { title: '学员入科' }
      },
      {
        path: '/changeTeacher',
        name: 'ChangeTeacher',
        component: () => import('@/views/trainingManage/changeTeacher/index'),
        meta: { title: '更换带教老师' }
      },
      {
        path: '/signIn',
        name: 'SignIn',
        component: () => import('@/views/trainingManage/signIn/index'),
        redirect: '/signInList',
        meta: { title: '考勤统计' },
        children: [
          {
            path: '/signInList',
            name: 'SignInList',
            component: () => import('@/views/trainingManage/signIn/signInList')
          },
          {
            path: '/addEditSignIn',
            name: 'AddEditSignIn',
            component: () => import('@/views/trainingManage/signIn/addEditSignIn'),
            meta: { title: '学员考勤' }
          },
          {
            path: '/todaySignIn',
            name: 'TodaySignIn',
            component: () => import('@/views/trainingManage/signIn/todaySignIn'),
            meta: { title: '当天学员考勤' }
          }
        ]
      }
    ]
  },
  {
    path: '/360Evaluate',
    component: Layout,
    redirect: '/evaluate360',
    name: '360Evaluate',
    meta: { title: '360评价', icon: '360Evaluate' },
    children: [
      {
        path: '/evaluate360',
        name: 'Evaluate360',
        component: () => import('@/views/360Evaluate/evaluate360/index'),
        redirect: '/evaluateList',
        children: [
          {
            path: '/evaluateList',
            name: 'EvaluateList',
            component: () => import('@/views/360Evaluate/evaluate360/evaluateList'),
            meta: { title: '学员互评' }
          },
          {
            path: '/addEvaluate',
            name: 'AddEvaluate',
            component: () => import('@/views/360Evaluate/evaluate360/addEvaluate'),
            meta: { title: '添加评价' }
          },
          {
            path: '/evaluateDetails',
            name: 'EvaluateDetails',
            component: () => import('@/views/360Evaluate/evaluate360/evaluateDetails'),
            meta: { title: '评价详情' }
          }
        ]
      },
      {
        path: '/evaluateQuery',
        name: 'EvaluateQuery',
        component: () => import('@/views/360Evaluate/evaluateQuery/index'),
        meta: { title: '评价查询' }
      },
      {
        path: '/teacherToDepartmentAdmin',
        name: 'TeacherToDepartmentAdmin',
        component: () => import('@/views/360Evaluate/evaluateMe/index'),
        meta: { title: '对我的评价' }
      }
    ]
  },
  {
    path: '/teachingActivities',
    component: Layout,
    redirect: '/activities',
    name: 'TeachingActivities',
    meta: { title: '教学活动', icon: 'teachingActivities' },
    children: [
      {
        path: '/activities',
        name: 'Activities',
        component: () => import('@/views/teachingActivities/activities/index'),
        redirect: '/activitiesList',
        children: [
          {
            path: '/activitiesList',
            name: 'ActivitiesList',
            component: () => import('@/views/teachingActivities/activities/activitiesList'),
            meta: { title: '小讲课' }
          },
          {
            path: '/addActivity',
            name: 'AddActivity',
            component: () => import('@/views/teachingActivities/activities/addActivities'),
            meta: { title: '添加活动' }
          },
          {
            path: '/activityDetails',
            name: 'ActivityDetails',
            component: () => import('@/views/teachingActivities/activities/activitiesDetails'),
            meta: { title: '活动详情' }
          },
          {
            path: '/activityEvaluate',
            name: 'ActivityEvaluate',
            component: () => import('@/views/teachingActivities/activities/activityEvaluate'),
            meta: { title: '活动评价' }
          },
          {
            path: '/activityFeedback',
            name: 'ActivityFeedback',
            component: () => import('@/views/teachingActivities/activities/activityFeedback'),
            meta: { title: '活动反馈' }
          }
        ]
      },
      {
        path: '/activitiesQuery',
        name: 'ActivitiesQuery',
        component: () => import('@/views/teachingActivities/activitiesQuery/index'),
        meta: { title: '教学活动查询' },
        redirect: '/activitiesQueryList',
        children: [
          {
            path: '/activitiesQueryList',
            name: 'ActivitiesQueryList',
            component: () => import('@/views/teachingActivities/activitiesQuery/activitiesQueryList')
          }
        ]
      }
    ]
  },
  {
    path: '/queryStatistics',
    component: Layout,
    redirect: 'studentRecruitingStatistics',
    name: 'QueryStatistics',
    meta: { title: '查询统计', icon: 'statistics' },
    children: [
      {
        path: '/studentRecruitingStatistics',
        name: 'StudentRecruitingStatistics',
        component: () => import('@/views/queryStatistics/studentRecruitingStatistics/index'),
        meta: { title: '学员招录统计' }
      },
      {
        path: '/studentTrainingStatistics',
        name: 'StudentTrainingStatistics',
        component: () => import('@/views/queryStatistics/studentTrainingStatistics/index'),
        meta: { title: '学员培训统计' }
      },
      {
        path: '/teachingActivitiesStatistics',
        name: 'TeachingActivitiesStatistics',
        component: () => import('@/views/queryStatistics/teachingActivitiesStatistics/index'),
        meta: { title: '教学活动统计' }
      },
      {
        path: '/360EvaluateStatistics',
        name: '360EvaluateStatistics',
        component: () => import('@/views/queryStatistics/360EvaluateStatistics/index'),
        meta: { title: '360评价统计' }
      }
    ]
  },
  {
    path: '/organization',
    component: Layout,
    redirect: '/departmentInfo',
    name: 'Organization',
    meta: { title: '组织机构', icon: 'organization' },
    children: [
      {
        path: '/departmentInfo',
        name: 'DepartmentInfo',
        component: () => import('@/views/organization/departmentInfo/index'),
        meta: { title: '部门人员信息维护' }
      },
      {
        path: '/student',
        name: 'Student',
        component: () => import('@/views/organization/studentFiles/index'),
        redirect: '/studentFiles',
        meta: { title: '学员档案' },
        children: [
          {
            path: '/studentFiles',
            name: 'StudentFiles',
            component: () => import('@/views/organization/studentFiles/studentFiles')
          },
          {
            path: '/addOrEditStudent',
            name: 'AddOrEditStudent',
            component: () => import('@/views/organization/studentFiles/addStudent'),
            meta: { title: '添加学员' }
          }
        ]
      }
    ]
  },
  {
    path: '/setting',
    component: Layout,
    redirect: 'log',
    name: 'Setting',
    meta: { title: '系统设置', icon: 'set' },
    children: [
      {
        path: '/log',
        name: 'Log',
        component: () => import('@/views/setting/log'),
        meta: { title: '登录日志' }
      },
      {
        path: '/jurisdictionManage',
        name: 'JurisdictionManage',
        component: () => import('@/views/setting/jurisdictionManage/index'),
        redirect: 'roleJurisdiction',
        meta: { title: '权限管理' },
        children: [
          {
            path: '/roleJurisdiction',
            name: 'RoleJurisdiction',
            component: () => import('@/views/setting/jurisdictionManage/roleJurisdiction/index'),
            meta: { title: '角色及权限' }
          }
        ]
      },
      {
        path: '/flowPath',
        name: 'FlowPath',
        component: () => import('@/views/setting/workFlow/index'),
        meta: { title: '流程一览' }
      },
      {
        path: '/trainingSettings',
        name: 'TrainingSettings',
        component: () => import('@/views/setting/trainingSettings/index'),
        redirect: '/trainingMajorSettings',
        meta: { title: '培训设置' },
        children: [
          {
            path: '/trainingMajorSettings',
            name: 'TrainingMajorSettings',
            component: () => import('@/views/setting/trainingSettings/trainingMajorSettings/index'),
            redirect: '/majorList',
            meta: { title: '标准培训专业设置' },
            children: [
              {
                path: '/majorList',
                name: 'majorList',
                component: () => import('@/views/setting/trainingSettings/trainingMajorSettings/majorList')
              },
              {
                path: '/addOrEditMajor',
                name: 'AddOrEditMajor',
                component: () => import('@/views/setting/trainingSettings/trainingMajorSettings/addOrEditMajor'),
                meta: { title: '添加专业' }
              },
              {
                path: '/majorDetails',
                name: 'MajorDetails',
                component: () => import('@/views/setting/trainingSettings/trainingMajorSettings/majorDetails'),
                meta: { title: '专业详情' }
              }
            ]
          },
          {
            path: '/trainingDepartmentSettings',
            name: 'TrainingDepartmentSettings',
            component: () => import('@/views/setting/trainingSettings/trainingDepartmentSettings/index'),
            redirect: '/trainingDepartment',
            meta: { title: '标准规培科室设置' },
            children: [
              {
                path: '/trainingDepartment',
                name: 'TrainingDepartment',
                component: () => import('@/views/setting/trainingSettings/trainingDepartmentSettings/trainingDepartment')
              },
              {
                path: '/addOrEditMajorDepartment',
                name: 'AddOrEditMajorDepartment',
                component: () => import('@/views/setting/trainingSettings/trainingDepartmentSettings/addOrEditMajorDepartment'),
                meta: { title: '添加专业科室' }
              },
              {
                path: '/setAsk',
                name: 'SetAsk',
                component: () => import('@/views/setting/trainingSettings/trainingDepartmentSettings/setAsk'),
                meta: { title: '设置科室基本要求' }
              },
              {
                path: '/taskList',
                name: 'TaskList',
                component: () => import('@/views/setting/trainingSettings/trainingDepartmentSettings/taskList'),
                meta: { title: '设置专业科室任务' }
              },
              {
                path: '/majorDepartmentDetails',
                name: 'MajorDepartmentDetails',
                component: () => import('@/views/setting/trainingSettings/trainingDepartmentSettings/majorDepartmentDetails'),
                meta: { title: '专业科室详情' }
              }
            ]
          },
          {
            path: '/teachingStrategies',
            name: 'TeachingStrategies',
            component: () => import('@/views/setting/trainingSettings/teachingStrategies/index'),
            meta: { title: '教学策略' }
          },
          {
            path: '/departmentMatching',
            name: 'DepartmentMatching',
            component: () => import('@/views/setting/trainingSettings/departmentMatching/index'),
            redirect: '/departmentMatchingSet',
            meta: { title: '本院科室对应' },
            children: [
              {
                path: '/departmentMatchingSet',
                name: 'DepartmentMatchingSet',
                component: () => import('@/views/setting/trainingSettings/departmentMatching/departmentMatchingSet')
              },
              {
                path: '/setCorresponding',
                name: 'SetCorresponding',
                component: () => import('@/views/setting/trainingSettings/departmentMatching/setCorresponding'),
                meta: { title: '设置本院科室对应' }
              },
              {
                path: '/departmentTaskList',
                name: 'DepartmentTaskList',
                component: () => import('@/views/setting/trainingSettings/departmentMatching/departmentTaskList'),
                meta: { title: '设置本院科室任务' }
              }
            ]
          }
        ]
      },
      {
        path: '/teachingActivitiesSettings',
        name: 'TeachingActivitiesSettings',
        component: () => import('@/views/setting/teachingActivitiesSettings/index'),
        redirect: '/activitiesClassify',
        meta: { title: '教学活动设置' },
        children: [
          {
            path: '/activitiesClassify',
            name: 'ActivitiesClassify',
            component: () => import('@/views/setting/teachingActivitiesSettings/activitiesClassify/index'),
            meta: { title: '教学活动分类' }
          },
          {
            path: '/activitiesEvaluateSettings',
            name: 'ActivitiesEvaluateSettings',
            component: () => import('@/views/setting/teachingActivitiesSettings/activitiesEvaluateSettings/index'),
            meta: { title: '教学活动评价项目设置' }
          }
        ]
      },
      {
        path: '/360EvaluateSettings',
        name: '360EvaluateSettings',
        component: () => import('@/views/setting/360EvaluateSettings/index'),
        redirect: '/360EvaluateDirection',
        meta: { title: '360评价设置' },
        children: [
          {
            path: '/360EvaluateDirection',
            name: '360EvaluateDirection',
            component: () => import('@/views/setting/360EvaluateSettings/360EvaluateDirection/index'),
            meta: { title: '360评价方向' }
          },
          {
            path: '/360EvaluateClassify',
            name: '360EvaluateClassify',
            component: () => import('@/views/setting/360EvaluateSettings/360EvaluateClassify/index'),
            meta: { title: '360评价分类' }
          },
          {
            path: '/360EvaluateProject',
            name: '360EvaluateProject',
            component: () => import('@/views/setting/360EvaluateSettings/360EvaluateProject/index'),
            meta: { title: '360评价项目' }
          }
        ]
      },
      {
        path: '/basicInfoSettings',
        name: 'BasicInfoSettings',
        component: () => import('@/views/setting/basicInfoSettings/index'),
        redirect: '/basicInfo',
        meta: { title: '基础信息设置' },
        children: [
          {
            path: '/basicInfo',
            name: 'BasicInfo',
            component: () => import('@/views/setting/basicInfoSettings/basicInfo/index'),
            meta: { title: '学历' }
          },
          {
            path: '/studentType',
            name: 'StudentType',
            component: () => import('@/views/setting/basicInfoSettings/studentType/index'),
            meta: { title: '学员类型' }
          },
          {
            path: '/dormitory',
            name: 'Dormitory',
            component: () => import('@/views/setting/basicInfoSettings/dormitory/index'),
            meta: { title: '宿舍' }
          }
        ]
      },
    ]
  }
  // { path: '*', redirect: '/404', hidden: true }
];

export default new Router({
  // mode: 'history', //需要后端配合
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRouterMap
});

