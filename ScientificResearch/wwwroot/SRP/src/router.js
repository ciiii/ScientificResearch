import Vue from 'vue'
import Router from 'vue-router'
import Index from './views/index.vue'

Vue.use(Router)

export default new Router({
    routes: [{
            path: '/',
            name: 'index',
            component: Index
        },
        {
            path: '/login',
            name: 'login',
            component: () =>
                import ('./views/login.vue')
        },
        {
            path: '/backlog',
            name: 'backlog',
            component: () =>
                import ('./views/backlog.vue')
        }
    ]
})