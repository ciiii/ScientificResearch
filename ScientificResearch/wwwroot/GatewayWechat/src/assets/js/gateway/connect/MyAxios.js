import Vue from 'vue';
import axios from 'axios';
import router from '@/router';
import { HTTP_URL_HOST } from "@/assets/js/gateway/connect/ConSysUrl";

Vue.use(router);
// import baseUrl from './setBaseUrl'
// axios.defaults.withCredentials = true;
// axios.defaults.baseURL = baseUrl;
// axios.defaults.baseURL = 'https://api.example.com';

// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';


//  响应拦截
// axios.interceptors.response.use(response => {
//     if (response.data.error) {
//         console.info(response.data.error)
//         return Promise.reject(response.data.error);
//     }
//     if (response.status == 401) {
//         router.push({path: '/'});
//         return Promise.reject('登录信息已过期，请重新登录！');
//     }
//     return response;

// }, function (error) {
//     return Promise.reject(error)
// });

axios.myGet = async(url, data) => {
    return await axios.get(HTTP_URL_HOST + url, { params: data }).then(response => response.data.data)
};

axios.myPost = async(url, data) => {
    return await axios.post(HTTP_URL_HOST + url, data).then(response => response.data.data);
};
export default axios;