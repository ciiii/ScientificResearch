import Vue from 'vue';
import axios from 'axios';
import router from '@/router';
import qs from 'qs';
import { Message, Notification } from 'element-ui';
import { HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
import { getUrl, getObjArr } from '@/assets/js/Common';

Vue.use(router);
Vue.prototype.$qs = qs;
let loginUserId;
// import baseUrl from './setBaseUrl'
// axios.defaults.withCredentials = true;
// axios.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded"; // 配置请求头
axios.defaults.headers.post['Content-Type'] = 'application/json'; // 配置请求头
// axios.defaults.baseURL = "/api";

// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;

//  响应拦截
axios.interceptors.response.use(response => {
  sessionStorage.mUserId = sessionStorage.mUserId;
  if (response.data.error) {
    Notification.error({
      title: '错误',
      message: response.data.error
    });
    return Promise.reject(response.data.error);
  }
  if (response.status === 401) {
    Message.error({
      message: '登录信息已过期，请重新登录！'
    });
    router.push({ path: '/login' });
    return Promise.reject('登录信息已过期，请重新登录！');
  }

  return response;

}, function(error) {
  Notification.error({
    title: '错误',
    message: '请求失败，请重新登录！'
  });
  router.push({ path: '/login' });
  return Promise.reject(error);
});

function setHeaders() {
  if (localStorage.getItem('Authorization')) {
    axios.defaults.headers.common['Authorization'] = localStorage.getItem('Authorization');
  }
}

axios.myGet = async(url, data) => {
  setHeaders();
  return await axios.get(getUrl(HTTP_URL_HOST + url), {
    params: data, paramsSerializer: params => {
      return qs.stringify(params, { indices: false });
    }
  }).then(response => response.data.data);
};

axios.myPost = async(url, data) => {
  setHeaders();
  return await axios.post(getUrl(HTTP_URL_HOST + url), data).then(response => response.data.data);
};
export default axios;
