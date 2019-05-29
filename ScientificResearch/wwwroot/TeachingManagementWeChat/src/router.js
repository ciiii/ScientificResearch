import Vue from 'vue'
import Router from 'vue-router'
// import TeachingManagementWeChat from './views/index.vue'

Vue.use(Router)

export default new Router({
    routes: [{
            path: '/TeachingManagementWeChat',
            name: 'TeachingManagementWeChat',
            component: () =>
                import('./views/index.vue'),
            meta: { title: '教学管理' }
        },
        {
            path: '/login',
            name: 'login',
            component: () =>
                import('./views/login.vue'),
            meta: { title: '登录' }
        },
        {
            path: '/noticeList',
            name: 'noticeList',
            component: () =>
                import('./views/notice/noticeList.vue'),
            meta: { title: '公告列表' }
        },
        {
            path: '/noticeDetails',
            name: 'noticeDetails',
            component: () =>
                import('./views/notice/noticeDetails.vue'),
            meta: { title: '公告详情' }
        },
        {
            path: '/downloadCenter',
            name: 'downloadCenter',
            component: () =>
                import('./views/personal/downloadCenter/downloadCenter.vue'),
            meta: { title: '下载中心' }
        },
        {
            path: '/downloadDetails',
            name: 'downloadDetails',
            component: () =>
                import('./views/personal/downloadCenter/downloadDetails.vue'),
            meta: { title: '文档详情' }
        },
        {
            path: '/allStudentsList',
            name: 'allStudentsList',
            component: () =>
                import('./views/students/allStudentsList.vue'),
            meta: { title: '带教学员情况列表' }
        },
        {
            path: '/studentInformation',
            name: 'studentInformation',
            component: () =>
                import('./views/students/studentInformation.vue'),
            meta: { title: '学员个人信息' }
        },
        {
            path: '/personal',
            name: 'personal',
            component: () =>
                import('./views/personal/personal.vue'),
            meta: { title: '个人中心' }
        },
        {
            path: '/personalData',
            name: 'personalData',
            component: () =>
                import('./views/personal/personalData.vue'),
            meta: { title: '个人资料' }
        },
        {
            path: '/changePWD',
            name: 'changePWD',
            component: () =>
                import('./views/personal/changePWD.vue'),
            meta: { title: '密码修改' }
        },
        {
            path: '/trainingManagementList',
            name: 'trainingManagementList',
            component: () =>
                import('./views/trainingManagement/trainingManagementList.vue'),
            meta: { title: '培训管理' }
        },
        {
            path: '/studentsReport',
            name: 'studentsReport',
            component: () =>
                import('./views/trainingManagement/studentsReport/studentsReport.vue'),
            meta: { title: '学员报到' }
        },
        {
            path: '/addStudentsReport',
            name: 'addStudentsReport',
            component: () =>
                import('./views/trainingManagement/studentsReport/addStudentsReport.vue'),
            meta: { title: '添加学员报到' }
        },
        {
            path: '/studentsDormitoryArrangeList',
            name: 'studentsDormitoryArrangeList',
            component: () =>
                import('./views/trainingManagement/studentsDormitoryArrange/studentsDormitoryArrangeList.vue'),
            meta: { title: '已安排宿舍列表' }
        },
        {
            path: '/ModifyDormitoryArrange',
            name: 'ModifyDormitoryArrange',
            component: () =>
                import('./views/trainingManagement/studentsDormitoryArrange/ModifyDormitoryArrange.vue'),
            meta: { title: '修改学员宿舍安排' }
        },
        {
            path: '/addDormitoryArrange',
            name: 'addDormitoryArrange',
            component: () =>
                import('./views/trainingManagement/studentsDormitoryArrange/addDormitoryArrange.vue'),
            meta: { title: '学员宿舍安排' }
        },
        {
            path: '/studentsExitTraining',
            name: 'studentsExitTraining',
            component: () =>
                import('./views/trainingManagement/studentsExitTraining/studentsExitTraining.vue'),
            meta: { title: '学员退培管理' }
        },
        {
            path: '/studentsTestScores',
            name: 'studentsTestScores',
            component: () =>
                import('./views/trainingManagement/studentsTestScores/studentsTestScores.vue'),
            meta: { title: '学员考试成绩' }
        },
        {
            path: '/teachingManagementList',
            name: 'teachingManagementList',
            component: () =>
                import('./views/teachingManagement/teachingManagementList.vue'),
            meta: { title: '教学管理' }
        },
        {
            path: '/toStudentEvaluation',
            name: 'toStudentEvaluation',
            component: () =>
                import('./views/teachingManagement/360Evaluate/toStudentEvaluation.vue'),
            meta: { title: '学员日常行为评价' }
        }
    ]
})
