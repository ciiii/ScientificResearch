import axios from "axios";
import qs from 'qs' //用来序列化post类型的数据
axios.defaults.timeout = 5000; // 响应时间
axios.defaults.headers.post["Content-Type"] =
    "application/x-www-form-urlencoded;charset=UTF-8"; // 配置请求头
// axios.defaults.baseURL = "/api"; // 配置接口地址
// const api = '';
// const api = 'http://192.168.0.99:63739'
const api = 'http://132.232.14.244'
    // 132.232.14.244
    // a.ttz.cn
    //自动给同一个vue项目的所有请求添加请求头
function setHeader() {
    axios.interceptors.request.use(config => {
        let token = localStorage.getItem('token');
        if (token) {
            config.headers['Authorization'] = token;
        }
        return config;
    })
}

// axios.defaults.headers.common['Authorization'] = localStorage.getItem('token');

//返回状态判断(添加响应拦截器)
// axios.interceptors.response.use(
//     res => {
//         console.log(res, "rrrrr")
//             //对响应数据做些事
//         if (res.status != 200 || res.statusText != "OK") {
//             // alert(res.data.error);
//             return Promise.reject(res, '333');
//         }
//         return res;
//     },
//     error => {
//         if (error.response.status === 401) {
//             // 401 说明 token 验证失败
//             // 可以直接跳转到登录页面，重新登录获取 token
//             location.href = getCodeApi("http://192.168.0.157:8080/#/login", '123');
//         } else if (error.response.status === 500) {
//             // 服务器错误
//             return Promise.reject(error.response.data);
//         }
//         // 返回 response 里的错误信息
//         return Promise.reject(error.response.data);
//     }
// );

export async function get(url, params) {
    setHeader();
    try {
        let res = await axios.get((api + url), { params })
        res = res.data
        return new Promise((resolve) => {
            resolve(res)
        })
    } catch (err) {
        console.log(err)
    }
}

export async function post(url, params) {
    setHeader();
    try {
        let res = await axios.post((api + url), params)
        res = res.data
        return new Promise((resolve) => {
            resolve(res)
        })
    } catch (err) {
        console.log(err)
    }
}