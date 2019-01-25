import Vue from 'vue';
import Router from 'vue-router';
import Index from './views/Index.vue';
import Home from './views/Home.vue';
import Login from './views/Login.vue';
import News from './views/news/News.vue';
import NewsDetails from './views/news/NewsDetails.vue';
import NotFoundView from './views/404/404.vue';
import Service from './views/service/Service.vue';
import About from './views/About.vue';
import IeUnderTen from './views/IeUnderTen.vue';
import Hospital from './views/hospital/Hospital.vue';

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'login',
            component: Login,
            meta:{ title: '总库登录' },
        },
        {
            path: '/index',
            name: 'index',
            component: Index,
            children: [
                {
                    path: '/home',
                    name: 'home',
                    component: Home,
                    meta: { title: '首页' },
                },
                {
                    path: '/news',
                    name: 'news',
                    component: News,
                    children: [
                        {
                            path: '/newsDetails',
                            name: 'newsDetails',
                            component: NewsDetails,
                        }
                    ],
                    meta:{ title: '新闻' },
                },
                {
                    path: '/hospital',
                    name: 'hospital',
                    component: Hospital,
                    children: [
                        {
                            path: '/newsDetails',
                            name: 'newsDetails',
                            component: NewsDetails,
                        }
                    ],
                    meta: { title: '医院' },
                },
                {
                    path: '/service',
                    name: 'service',
                    component: Service,
                    children: [
                        {
                            path: '/newsDetails',
                            name: 'newsDetails',
                            component: NewsDetails,
                        }
                    ],
                    meta: { title: '服务' },
                },
                {
                    path: '/about',
                    name: 'about',
                    component: About
                },
                {
                    path: '/ieUnderTen',
                    name: 'ieUnderTen',
                    component: IeUnderTen
                },
            ],
            meta: {
                requireAuth: true   //添加该字段，表示这个路由是需要登录的
            },
        },
        {path: '*', component: NotFoundView}
    ]
})
