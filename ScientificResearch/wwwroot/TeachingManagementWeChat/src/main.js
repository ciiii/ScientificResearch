import Vue from 'vue';
import App from './App';
import router from './router';
import store from './store';
import config from '@/config';
import Vuerify from 'vuerify';
import '@/libs/var.less';
import {
    Toast,
    Dialog,
    Icon,
    Button,
    Cell,
    CellGroup,
    Row,
    Col
} from 'vant';
/*
vant 文档
https://youzan.github.io/vant/#/zh-CN/intro
*/
Vue.use(Toast)
    .use(Dialog)
    .use(Icon)
    .use(Button)
    .use(Cell)
    .use(CellGroup)
    .use(Row).use(Col);
Vue.use(Vuerify);
// 实际打包时应该不引入mock
/* eslint-disable */
if (process.env.NODE_ENV !== 'production') require('@/mock')
    //Vue.prototype.$api = api;
    /**
     * @description 全局注册应用配置
     */
Vue.prototype.$config = config;

import FastClick from 'fastclick';
FastClick.attach(document.body);

const history = window.sessionStorage
history.clear()
let historyCount = history.getItem('count') * 1 || 0
history.setItem('/', 0)
let isPush = false
let isTouchStart = false
let endTime = Date.now()
let methods = ['push', 'go', 'replace', 'forward', 'back']

document.addEventListener('touchend', () => {
    isTouchStart = false
    endTime = Date.now()
})
document.addEventListener('touchstart', () => {
    isTouchStart = true
})
methods.forEach(key => {
    let method = router[key].bind(router)
    router[key] = function(...args) {
        isPush = true
        method.apply(null, args)
    }
})

router.beforeEach(function(to, from, next) {
    store.commit('updateLoadingStatus', { isLoading: true })
    store.commit('updateShowTabnav', to.path);
    store.commit('updateTitle', to.meta.title);
    const toIndex = history.getItem(to.path)
    const fromIndex = history.getItem(from.path)
    let direction

    if (toIndex) {
        if (!fromIndex || parseInt(toIndex, 10) > parseInt(fromIndex, 10) || (toIndex === '0' && fromIndex === '0')) {
            direction = 'forward'
        } else {
            direction = 'reverse'
        }
    } else {
        ++historyCount
        history.setItem('count', historyCount)
        to.path !== '/' && history.setItem(to.path, historyCount)
        direction = 'forward'
    }

    // 判断是否是ios左滑返回 或者 右滑前进
    if (toIndex && toIndex !== '0' && !isPush && (((Date.now() - endTime) < 377) || isTouchStart)) {
        store.commit('updateDirection', { direction: '' })
    } else {
        store.commit('updateDirection', { direction: direction })
    }
    isTouchStart = false

    if (/\/http/.test(to.path)) {
        let url = to.path.split('http')[1]
        window.location.href = `http${url}`
    } else {
        next()
    }
})

router.afterEach(function(to) {
    isPush = false
    store.commit('updateLoadingStatus', { isLoading: false })
    if (process.env.NODE_ENV === 'production') {
        ga && ga('set', 'page', to.fullPath)
        ga && ga('send', 'pageview')
    }
})

new Vue({
    router,
    store,
    el: '#app',
    render: h => h(App)
});
