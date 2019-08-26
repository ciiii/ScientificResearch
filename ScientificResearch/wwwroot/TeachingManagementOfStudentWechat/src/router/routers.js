export default [{
        path: '/login',
        name: 'login',
        component: () =>
            import ('@/view/login'),
        meta: {
            title: '登录'
        }
    },
    {
        path: '/home',
        name: 'home',
        component: () =>
            import ('@/view/home'),
        meta: {
            title: '首页'
        }
    },
    {
        path: '/myPatient',
        name: 'myPatient',
        component: () =>
            import ('@/view/myPatient'),
        meta: {
            title: '我的管床病人'
        }
    },
    {
        path: '/myPatient/edit',
        name: 'myPatientedit',
        component: () =>
            import ('@/view/myPatient/edit'),
        meta: {
            title: '我的管床病人-编辑'
        }
    },
    {
        path: '/leave',
        name: 'leave',
        component: () =>
            import ('@/view/leave'),
        meta: {
            title: '请假申请'
        }
    },
    {
        path: '/leave/detail',
        name: 'leavedetail',
        component: () =>
            import ('@/view/leave/detail'),
        meta: {
            title: '请假详情'
        }
    },
    {
        path: '/leave/edit',
        name: 'leaveedit',
        component: () =>
            import ('@/view/leave/edit'),
        meta: {
            title: '请假详情'
        }
    },
    {
        path: '/rotaryManual',
        name: 'rotaryManual',
        component: () =>
            import ('@/view/rotaryManual'),
        meta: {
            title: '轮转手册'
        }
    },
    {
        path: '/rotaryManual/detail',
        name: 'rotaryManualdetail',
        component: () =>
            import ('@/view/rotaryManual/detail'),
        meta: {
            title: '轮转手册详情'
        }
    },
    {
        path: '/rotaryManual/edit',
        name: 'rotaryManualedit',
        component: () =>
            import ('@/view/rotaryManual/edit'),
        meta: {
            title: '编辑轮转手册'
        }
    },
    {
        path: '/outDepartment',
        name: 'outDepartment',
        component: () =>
            import ('@/view/outDepartment'),
        meta: {
            title: '出科申请'
        }
    },
    {
        path: '/outDepartment/detail',
        name: 'outDepartmentdetail',
        component: () =>
            import ('@/view/outDepartment/detail'),
        meta: {
            title: '出科详情'
        }
    },
    {
        path: '/outDepartment/edit',
        name: 'loutDepartmentedit',
        component: () =>
            import ('@/view/outDepartment/edit'),
        meta: {
            title: '编辑出科申请'
        }
    },
    {
        path: '/graduation',
        name: 'graduation',
        component: () =>
            import ('@/view/graduation'),
        meta: {
            title: '结业申请'
        }
    },
    {
        path: '/graduation/detail',
        name: 'graduationdetail',
        component: () =>
            import ('@/view/graduation/detail'),
        meta: {
            title: '结业申请详情'
        }
    },
    {
        path: '/graduation/edit',
        name: 'graduationedit',
        component: () =>
            import ('@/view/graduation/edit'),
        meta: {
            title: '编辑结业申请'
        }
    },
    {
        path: '/do',
        name: 'do',
        component: () =>
            import ('@/view/do'),
        meta: {
            title: '待办事宜'
        }
    },
    {
        path: '/360Evaluate',
        name: '360Evaluate',
        component: () =>
            import ('@/view/360Evaluate'),
        meta: {
            title: '360°评价'
        }
    },
    {
        path: '/360Evaluate/evaluate360',
        name: '360Evaluateevaluate360',
        component: () =>
            import ('@/view/360Evaluate/evaluate360.vue'),
        meta: {
            title: '360°评价-评价列表'
        }
    },
    {
        path: '/360Evaluate/evaluate360/edit',
        name: '360Evaluateedit',
        component: () =>
            import ('@/view/360Evaluate/edit.vue'),
        meta: {
            title: '360°评价-编辑'
        }
    },
    {
        path: '/360Evaluate/teacherToDepartmentAdmin',
        name: '360EvaluateteacherToDepartmentAdmin',
        component: () =>
            import ('@/view/360Evaluate/evaluateToMe.vue'),
        meta: {
            title: '360°评价-对我的评价'
        }
    },
    {
        path: '/activities',
        name: 'activities',
        component: () =>
            import ('@/view/activities'),
        meta: {
            title: '教学活动'
        }
    },
    {
        path: '/activities/list',
        name: 'activitieslist',
        component: () =>
            import ('@/view/activities/list.vue'),
        meta: {
            title: '教学活动-列表'
        }
    },
    {
        path: '/activities/list/detail',
        name: 'activitiesdetail',
        component: () =>
            import ('@/view/activities/detail.vue'),
        meta: {
            title: '教学活动-详情'
        }
    },
    {
        path: '/activities/list/feedback',
        name: 'activitiesfeedback',
        component: () =>
            import ('@/view/activities/feedback.vue'),
        meta: {
            title: '教学活动-反馈'
        }
    },
    {
        path: '/activities/list/evaluation',
        name: 'activitiesevaluation',
        component: () =>
            import ('@/view/activities/evaluation.vue'),
        meta: {
            title: '教学活动-评价'
        }
    },

    {
        path: '/message',
        name: 'message',
        component: () =>
            import ('@/view/message'),
        meta: {
            title: '通知公告'
        }
    },
    {
        path: '/message/list',
        name: 'messagesList',
        component: () =>
            import ('@/view/message/list.vue'),
        meta: {
            title: '通知公告-列表'
        }
    },
    {
        path: '/message/list/detail',
        name: 'messagesDetail',
        component: () =>
            import ('@/view/message/detail.vue'),
        meta: {
            title: '通知公告-详情'
        }
    },

    {
        path: '/mine',
        name: 'mine',
        component: () =>
            import ('@/view/mine'),
        meta: {
            title: '我的'
        }

    },

    {
        path: '/mine/personal',
        name: 'personal',
        component: () =>
            import ('@/view/mine/personal.vue'),
        meta: {
            title: '个人信息'
        }
    },
    {
        path: '/mine/training',
        name: 'training',
        component: () =>
            import ('@/view/mine/training.vue'),
        meta: {
            title: '我的轮转计划'
        }
    },
    {
        path: '/mine/updatePassword',
        name: 'updatePassword',
        component: () =>
            import ('@/view/mine/updatePassword.vue'),
        meta: {
            title: '修改密码'
        }
    },



    {
        path: '/401',
        name: 'error_401',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/error-page/401.vue')
    },
    {
        path: '/500',
        name: 'error_500',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/error-page/500.vue')
    },
    {
        path: '*',
        name: 'error_404',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/error-page/404.vue')
    },
    {
        path: '/',
        name: 'home',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/home')
    },
    {
        path: '/TeachingManagementWeChat/dist/index.html',
        name: 'index',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/home')
    }


];