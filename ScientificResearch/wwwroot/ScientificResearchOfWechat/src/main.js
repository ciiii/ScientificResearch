import Vue from 'vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import http from './assets/js/http/http'
import 'amfe-flexible';
import './assets/iconfont/iconfont.css';
import ReturnBtn from './components/popup/index'
Vue.use(ReturnBtn)

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
Vue.use(Cell);
Vue.use(Tab).use(Tabs);
Vue.use(CellGroup);
Vue.use(Collapse).use(CollapseItem);
Vue.use(SubmitBar);
Vue.use(Checkbox);

Vue.prototype.$http = http

new Vue({
    router,
    render: h => h(App)
}).$mount('#app')