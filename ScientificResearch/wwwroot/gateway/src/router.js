import Vue from 'vue';
import Router from 'vue-router';
import Index from './views/Index.vue';
import Home from './views/Home.vue';
import Login from './views/Login.vue';
import Service from './views/Service';
import News from './views/News';
import IMISNews from './views/IMISNews.vue';
import IeUnderTen from './views/IeUnderTen.vue';
import NotFoundView from './views/404/404.vue';

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'index',
            component: Index,
            meta: {title: '首页'},
            redirect: 'home',
            children: [
                {
                    path: '/home',
                    name: 'home',
                    component: Home,
                    meta: {title: '首页'},
                },
                {
                    path: '/service',
                    name: 'service',
                    component: Service,
                    meta: {title: '服务'},
                },
                {
                    path: '/news',
                    name: 'news',
                    component: News,
                    meta: {title: '新闻'},
                },
                {
                    path: '/IMISNews',
                    name: 'IMISNews',
                    component: IMISNews,
                    meta: {title: '科研新闻'},
                },
            ]
        },

        {
            path: '/login',
            name: 'login',
            component: Login,
            meta: {title: '用户登录'},
        },
        {
            path: '/ieUnderTen',
            name: 'ieUnderTen',
            component: IeUnderTen
        },
        {path: '*', component: NotFoundView}
    ]
})
