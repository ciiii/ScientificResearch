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
    }]
})
