import Vue from 'vue'
import App from './App.vue'
import router from './router'
import http from './assets/js/http/http'
import 'amfe-flexible';
import 'lib-flexible'
import 'babel-polyfill';
import './assets/iconfont/iconfont.css';
import Axios from './assets/js/gateway/connect/MyAxios';
import VueWechatTitle from 'vue-wechat-title';
import { META_TWO } from "./assets/js/gateway/connect/ConSysUrl";
import ReturnBtn from './components/popup/index'
Vue.use(ReturnBtn)
import ReturnTop from './components/returnTop/index'
Vue.use(ReturnTop)

Vue.config.productionTip = false

import {
    Icon,
    Field,
    Popup,
    Picker,
    Notify,
    Search,
    Tabbar,
    TabbarItem,
    NoticeBar,
    Button,
    List,
    PullRefresh,
    Toast,
    Swipe,
    SwipeItem,
    Panel,
    Cell,
    Tab,
    Tabs,
    CellGroup,
    Collapse,
    CollapseItem,
    SubmitBar,
    Checkbox,
    CheckboxGroup,
    NavBar,
    RadioGroup,
    Radio,
    Dialog

} from 'vant';
Vue.use(Icon);
Vue.use(Field);
Vue.use(Popup);
Vue.use(Picker);
Vue.use(Notify);
Vue.use(Search);
Vue.use(Tabbar).use(TabbarItem);
Vue.use(NoticeBar);
Vue.use(Button);
Vue.use(List);
Vue.use(PullRefresh);
Vue.use(Toast);
Vue.use(Swipe).use(SwipeItem);
Vue.use(Panel);
Vue.use(Cell).use(CellGroup);
Vue.use(Tab).use(Tabs);
Vue.use(Collapse).use(CollapseItem);
Vue.use(SubmitBar);
Vue.use(Checkbox).use(CheckboxGroup);
Vue.use(NavBar);
Vue.use(RadioGroup);
Vue.use(Radio);
Vue.use(Dialog);

Vue.use(VueWechatTitle);
Vue.prototype.$http = http;
Vue.prototype.$myHttp = Axios;
// 跳转后返回顶部
router.afterEach((to, from, next) => {
    window.scrollTo(0, 0)
})
router.beforeEach((to, from, next) => {
    /* 路由发生变化修改页面meta */
    let meta = document.getElementsByTagName("meta");
    if (to.meta.content) {
        meta[2]["content"] = to.meta.content;
    } else {
        meta[2]["content"] = META_TWO;
    }
    next()
});

router.beforeEach((to, from, next) => {
    if (to.matched.some(record => record.meta.requireAuth)) { // 判断该路由是否需要登录权限
        var personnel = localStorage.getItem("personnel");
        if (personnel) { // 判断当前的token是否存在
            next();
        } else {
            Vue.prototype.$toast('请先登录')
            next({
                path: '/'
            })
        }
    } else {
        next();
    }
});
new Vue({
    router,
    render: h => h(App)
}).$mount('#app')