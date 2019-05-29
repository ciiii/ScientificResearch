import Vue from 'vue'
import VeLine from 'v-charts/lib/line.common'
import App from './App.vue'
import router from './router'
import http from './assets/js/http/http'
import 'amfe-flexible'
import 'lib-flexible/flexible.js'
import './assets/iconfont/iconfont.css'
import VueWechatTitle from 'vue-wechat-title'
import ReturnBtn from './components/returnBtn/index'
import ReturnTop from './components/returnTop/index'

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
    List,
    Field,
    PullRefresh,
    Tab,
    Tabs,
    Toast,
    Actionsheet,
    RadioGroup,
    Radio,
    Checkbox
} from 'vant'
Vue.use(ReturnBtn)
Vue.use(ReturnTop)

Vue.component(VeLine.name, VeLine)

Vue.config.productionTip = false

Vue.use(Icon)
Vue.use(Notify)
Vue.use(Button)
Vue.use(Tabbar).use(TabbarItem)
Vue.use(Cell).use(CellGroup)
Vue.use(Dialog)
Vue.use(Swipe).use(SwipeItem)
Vue.use(List)
Vue.use(Field)
Vue.use(PullRefresh)
Vue.use(Tab).use(Tabs)
Vue.use(Toast)
Vue.use(Actionsheet)
Vue.use(RadioGroup)
Vue.use(Radio)
Vue.use(Checkbox)

Vue.use(VueWechatTitle)
Vue.prototype.$http = http

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')
