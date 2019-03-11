import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';
import Login from './views/Login.vue';
import News from './views/News';
// import IMISNews from './views/IMISNews.vue';
import IeUnderTen from './views/IeUnderTen.vue';
import NotFoundView from './views/404/404.vue';

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'home',
            component: Home,
            meta: {title: '入口首页'},
            children: [
                {
                    path: '/news',
                    name: 'news',
                    component: News,
                    meta: {title: '新闻', requireAuth: true},
                },
                /*{
                    path: '/IMISNews',
                    name: 'IMISNews',
                    component: IMISNews,
                    meta: {title: '科研新闻', requireAuth: true},
                },*/
                {
                    path: '/ieUnderTen',
                    name: 'ieUnderTen',
                    component: IeUnderTen
                },
            ]
        },
        {
            path: '/login',
            name: 'login',
            component: Login,
            meta: {title: '用户登录'},
        },
        {path: '*', component: NotFoundView}
    ]
})
