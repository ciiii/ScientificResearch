import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';
import Login from './views/Login.vue';
import NotFoundView from './views/404/404.vue';

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home,
            // meta: {
            //     requireAuth: true   //添加该字段，表示这个路由是需要登录的
            // },
        },

        {
            path: '/login',
            name: 'login',
            component: Login
        },
        {
            path: '/about',
            name: 'about',
            // route level code-splitting
            // this generates a separate chunk (about.[hash].js) for this route
            // which is lazy-loaded when the route is visited.
            component: () => import(/* webpackChunkName: "about" */ './views/About.vue')
        },
        {path: '*', component: NotFoundView}
    ]
})
