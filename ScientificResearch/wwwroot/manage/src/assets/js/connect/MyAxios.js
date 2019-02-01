import Vue from 'vue';
import axios from 'axios';
import router from '@/router';
import {Message, Notification} from 'element-ui'
import {HTTP_URL_HOST} from "@/assets/js/connect/ConSysUrl";
import {getUrl} from "@/assets/js/Common";

Vue.use(router);
// import baseUrl from './setBaseUrl'
// axios.defaults.withCredentials = true;
// axios.defaults.baseURL = baseUrl;
// axios.defaults.baseURL = 'https://api.example.com';

// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';


//  响应拦截
axios.interceptors.response.use(response => {
    if (response.data.error) {
        Notification.error({
            title: '错误',
            message: response.data.error
        });
        return Promise.reject(response.data.error);
    }
    if (response.status == 401) {
        Message.error({
            message: '登录信息已过期，请重新登录！'
        });
        // this.$router.push({path: '/'});
        router.replace({
            path: '/',
        })
        return Promise.reject('登录信息已过期，请重新登录！');
    }
    return response;

}, function (error) {
    Notification.error({
        title: '错误',
        message: error
    });
    return Promise.reject(error)
});


axios.myGet = async (url, data) => {
    if (sessionStorage.Authorization) {
        axios.defaults.headers.common['Authorization'] = sessionStorage.getItem('Authorization');
    }
    return await axios.get(getUrl(HTTP_URL_HOST + url), {params: data}).then(response => response.data.data)
};

axios.myPost = async (url, data) => {
    if (sessionStorage.Authorization) {
        axios.defaults.headers.common['Authorization'] = sessionStorage.getItem('Authorization');
    }
    return await axios.post(getUrl(HTTP_URL_HOST + url), data).then(response => response.data.data);
};
export default axios;
