import Vue from 'vue'
import Router from 'vue-router'
import TeachingManagementWeChat from './views/index.vue'

Vue.use(Router)

export default new Router({
    routes: [{
            path: '/TeachingManagementWeChat',
            name: 'TeachingManagementWeChat',
            component: TeachingManagementWeChat,
            meta: { title: '教学管理' }
        },
        {
            path: '/login',
            name: 'login',
            component: () =>
                import('./views/login.vue'),
            meta: { title: '登录', requireAuth: true }
        },
        {
            path: '/personal',
            name: 'personal',
            component: () =>
                import('./views/personal/personal.vue'),
            meta: { title: '个人中心', requireAuth: true }
        }
    ]
})
