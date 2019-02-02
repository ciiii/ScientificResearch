import Vue from 'vue';
import Router from 'vue-router';
import Index from './views/Index.vue';
import HomeContent from './views/HomeContent.vue';
import Login from './views/Login.vue';
import News from './views/news/News.vue';
import NotFoundView from './views/404/404.vue';
import Service from './views/service/Service.vue';
import IeUnderTen from './views/IeUnderTen.vue';
import Hospital from './views/hospital/Hospital.vue';

Vue.use(Router)

export default new Router({
    routes: [
        {
            path: '/',
            name: 'login',
            component: Login,
            meta: {title: '总库登录'},
        },
        {
            path: '/index',
            name: 'index',
            component: Index,
            meta: {requireAuth: true}, //添加该字段，表示这个路由是需要登录的
            children: [
                {
                    path: '/homeContent',
                    name: 'homeContent',
                    component: HomeContent,
                    meta: {title: '首页', requireAuth: true},
                },
                {
                    path: '/news',
                    name: 'news',
                    component: News,
                    meta: {title: '新闻', requireAuth: true},
                },
                {
                    path: '/hospital',
                    name: 'hospital',
                    component: Hospital,
                    meta: {title: '医院', requireAuth: true},
                },
                {
                    path: '/service',
                    name: 'service',
                    component: Service,
                    meta: {title: '服务', requireAuth: true},
                },
                {
                    path: '/ieUnderTen',
                    name: 'ieUnderTen',
                    component: IeUnderTen
                },
            ],
        },
        {path: '*', component: NotFoundView}
    ]
})
