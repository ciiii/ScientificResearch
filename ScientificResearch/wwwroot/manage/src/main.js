import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import {Message} from 'element-ui'
import {Notification} from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
import 'babel-polyfill';
import VueWechatTitle from 'vue-wechat-title'
import Echarts from 'echarts';
import Axios from './assets/js/connect/MyAxios.js';
import MyCommon from './assets/js/Common.js';
import './assets/libs/iconfont/iconfont.css';

Axios.interceptors.response.use(response => {
    if (response.data.error) {
        Notification.error({
            title: '错误',
            message: response.data.error
        });
        return
    }
    return response;
}, function (error) {
    Notification.error({
        title: '错误',
        message: error
    });
});

Vue.use(VueWechatTitle);

Vue.filter('dataFormat', function (value, fmt) {
    let getDate = new Date(value);
    let o = {
        'M+': getDate.getMonth() + 1,
        'd+': getDate.getDate(),
        'h+': getDate.getHours(),
        'm+': getDate.getMinutes(),
        's+': getDate.getSeconds(),
        'q+': Math.floor((getDate.getMonth() + 3) / 3),
        'S': getDate.getMilliseconds()
    };
    if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (getDate.getFullYear() + '').substr(4 - RegExp.$1.length))
    }
    for (let k in o) {
        if (new RegExp('(' + k + ')').test(fmt)) {
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
        }
    }
    return fmt;
});

Vue.prototype.$http = Axios;
Vue.prototype.$myCommon = MyCommon;
Vue.prototype.$echarts = Echarts;

Vue.config.productionTip = false
let myApp = Vue.use(ElementUI);

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')


router.beforeEach((to, from, next) => {
    /*if (to.matched.some(m => m.meta.auth)) {
        if (sessionStorage.Authorization) {
            next()
        } else if (to.path !== '/') {
            next({path: '/'})
            Vue.prototype.$message.warning('检测到您还未登录,请登录后操作！')
        }
    } else {
        next()
    }*/
    let token = sessionStorage.getItem('Authorization');
    let needAuth = to.matched.some(item => item.meta.login);
    if (!token && needAuth) {
        Vue.prototype.$message.warning('检测到您还未登录,请登录后操作！')
        return next({path: "/login"})
    };
    next();

})
