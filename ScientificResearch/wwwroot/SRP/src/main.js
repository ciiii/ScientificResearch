import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import api from './axios'
import VueCookies from 'vue-cookies'
import './auto-size'
Vue.config.productionTip = false

//自动给同一个vue项目的所有请求添加请求头
axios.interceptors.request.use(function(config) {
    let token = localStorage.getItem('authorization');
    // console.log(token, "111")
    if (token) {
        config.headers['Authorization'] = token;
    }
    return config;
})

Vue.prototype.$api = api
Vue.prototype.$cookies = VueCookies
new Vue({
    router,
    render: h => h(App)
}).$mount('#app')