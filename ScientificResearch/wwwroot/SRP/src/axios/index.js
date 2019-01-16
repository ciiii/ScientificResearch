import axios from "axios";
import Vue from "vue";
import router from "../router";
axios.defaults.timeout = 5000; // 响应时间
axios.defaults.headers.post["Content-Type"] =
    "application/x-www-form-urlencoded;charset=UTF-8"; // 配置请求头
axios.defaults.baseURL = "/api"; // 配置接口地址
// axios.defaults.baseURL = 'http://192.168.0.99:63739' // 配置接口地址

// req interceptor
axios.interceptors.request.use(
    config => {

        // 在什么时候存储 token
        if (localStorage.token) {
            console.log(localStorage.token, "44444444444");
            config.headers.Authorization = "JWT" + localStorage.token;
        }
        //  else {
        // 	window.location.replace("/#/login")
        // }
        return config;
    },
    error => {
        alert("错误的传参", "fail");
        return Promise.reject(error);
    }
);

//返回状态判断(添加响应拦截器)
axios.interceptors.response.use(
    res => {
        console.log(res, "`````````")
            //对响应数据做些事
        if (!res.data.success) {
            // alert(res.data.error);
            return Promise.reject(res);
        }
        return res;
    },
    error => {
        if (error.response.status === 401) {
            // 401 说明 token 验证失败
            // 可以直接跳转到登录页面，重新登录获取 token
            location.href = "/login";
        } else if (error.response.status === 500) {
            // 服务器错误
            // do something
            return Promise.reject(error.response.data);
        }
        // 返回 response 里的错误信息
        return Promise.reject(error.response.data);
    }
);

const get = (url, params) => {
    return new Promise((resolve, reject) => {
        axios
            .get(url, {
                params
            })
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

const post = (url, params) => {
    return new Promise((resolve, reject) => {
        axios
            .post(url, params)
            .then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

// 接口方法
const api = {
    /**
     * 登录
     */
    BindOpenId(code, 工号, 密码, DbKey) {
        return post("/Manage/Access/BindOpenId", {
            code,
            工号,
            密码,
            DbKey
        });
    }
};

export default api;