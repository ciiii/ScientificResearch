import Vue from 'vue'
import App from './App.vue'
import router from './router'
import http from './assets/js/http/http'
import 'amfe-flexible'
import 'lib-flexible/flexible.js'
import './assets/iconfont/iconfont.css'
import VueWechatTitle from 'vue-wechat-title'

import {
    Icon,
    Tabbar,
    TabbarItem,
    Notify,
    Button,
    Cell,
    CellGroup,
    Dialog,
    Swipe,
    SwipeItem,
    List
} from 'vant'

Vue.config.productionTip = false

Vue.use(Icon)
Vue.use(Notify)
Vue.use(Button)
Vue.use(Tabbar).use(TabbarItem)
Vue.use(Cell).use(CellGroup)
Vue.use(Dialog)
Vue.use(Swipe).use(SwipeItem)
Vue.use(List)

Vue.use(VueWechatTitle)
Vue.prototype.$http = http

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')