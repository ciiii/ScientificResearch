import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import http from './assets/js/http/http'
import 'amfe-flexible';
import './assets/iconfont/iconfont.css';

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
    List,
    PullRefresh,
    Toast,
    Swipe,
    SwipeItem
} from 'vant';

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


Vue.prototype.$http = http

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')