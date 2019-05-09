import Vue from 'vue'
import App from './App.vue'
import router from './router'
import http from './assets/js/http/http'
import 'amfe-flexible'
import VueWechatTitle from 'vue-wechat-title'

import { Tabbar, TabbarItem } from 'vant'

Vue.config.productionTip = false

Vue.use(Tabbar).use(TabbarItem)

Vue.use(VueWechatTitle)
Vue.prototype.$http = http

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')
