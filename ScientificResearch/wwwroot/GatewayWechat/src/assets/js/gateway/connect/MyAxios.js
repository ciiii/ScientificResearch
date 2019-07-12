import Vue from 'vue';
import axios from 'axios';
import router from '@/router';
import {HTTP_URL_HOST} from "@/assets/js/gateway/connect/ConSysUrl";

Vue.use(router);

axios.myGet = async (url, data) => {
    return await axios.get(HTTP_URL_HOST + url, {params: data}).then(response => response.data.data)
};

axios.myPost = async (url, data) => {
    return await axios.post(HTTP_URL_HOST + url, data).then(response => response.data.data);
};

axios.myPostServe = async (url, data) => {
    return await axios.post( url, data).then(response => response.data);
};
export default axios;
