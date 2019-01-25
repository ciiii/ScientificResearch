import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import api from './axios'
import 'amfe-flexible';
// import VueCookies from 'vue-cookies'

// import './auto-size'
Vue.config.productionTip = false

import {
    Field,
    Popup,
    Picker,
    Notify,
    Search,
    Tabbar,
    TabbarItem,
    NoticeBar,
    Button,
    Card,
    List,
    Cell,
    CellGroup
} from 'vant';

Vue.use(Field);
Vue.use(Popup);
Vue.use(Picker);
Vue.use(Notify);
Vue.use(Search);
Vue.use(Tabbar).use(TabbarItem);
Vue.use(NoticeBar);
Vue.use(Button);
Vue.use(Card);
Vue.use(List);
Vue.use(Cell).use(CellGroup);

// //自动给同一个vue项目的所有请求添加请求头
axios.interceptors.request.use(function(config) {
    let token = localStorage.getItem('token');
    if (token) {
        config.headers['Authorization'] = token;
    }
    console.log(config, "vvvvvvvvv")
    return config;
})

Vue.prototype.$api = api
    // Vue.prototype.$cookies = VueCookies

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')