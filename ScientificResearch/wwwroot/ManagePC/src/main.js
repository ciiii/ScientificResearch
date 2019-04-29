import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import {Message,Notification} from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css';
import 'babel-polyfill';
import VueWechatTitle from 'vue-wechat-title';
import Axios from './assets/js/connect/MyAxios.js';
import './assets/libs/iconfont/iconfont.css';
import './assets/less/Quill.less';


import tinymce from 'vue-tinymce-editor'
Vue.component('tinymce', tinymce);


Vue.use(VueWechatTitle);

Vue.prototype.$http = Axios;
Vue.prototype.Message = Message;
Vue.prototype.Notification = Notification;

Vue.config.productionTip = false
let myApp = Vue.use(ElementUI);


new Vue({
    router,
    store,
    render: h => h(App),
}).$mount('#app')

router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requireAuth)) {
        if (sessionStorage.getItem('Authorization')) {
            next();
        } else {
            Vue.prototype.$message.error('登录信息已过期,请登重新登录！')
            next({
                path: '/',
                query: {redirect: to.fullPath}
            })
        }
    } else {
        next();
    }
})
