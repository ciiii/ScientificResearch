import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Echarts from 'echarts';
import Axios from './assets/js/MyAxios.js';
import Code from './assets/js/Code.js';
import MyCommon from './assets/js/Common.js';
import './assets/libs/iconfont/iconfont.css';

Axios.interceptors.response.use(function (response) {
    if (response.data.error) {
        this.$message.error({
            message: response.data.error
        });
        return
    }
    return response;
}, function (error) {
    myApp.$notify.error({
        title: '错误',
        message: error
    });
});
Vue.directive('title', {
    inserted: function (el, binding) {
        document.title = binding.value;
    }
});

Vue.prototype.$http = Axios;
Vue.prototype.$code = Code;
Vue.prototype.$myCommon = MyCommon;
Vue.prototype.$echarts = Echarts;

Vue.config.productionTip = false
let myApp = Vue.use(ElementUI);
new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
