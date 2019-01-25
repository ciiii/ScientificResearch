import axios from "axios";
import Vue from "vue";
import router from "../router";
axios.defaults.timeout = 5000; // 响应时间
axios.defaults.headers.post["Content-Type"] =
    "application/x-www-form-urlencoded;charset=UTF-8"; // 配置请求头
axios.defaults.baseURL = "/api"; // 配置接口地址
// axios.defaults.baseURL = 'http://192.168.0.99:63739' // 配置接口地址

// req interceptor
// axios.interceptors.request.use(
//     config => {
//         // 在什么时候存储 token
//         if (localStorage.token) {
//             axios.defaults.headers.common['Authorization'] = localStorage.getItem("token");
//             // console.log(axios.defaults.headers.common['Authorization'], "token")
//         }
//         console.log(config, "config")
//         return config;
//     },
//     error => {
//         alert("错误的传参", "fail");
//         return Promise.reject(error);
//     }
// );

//返回状态判断(添加响应拦截器)
axios.interceptors.response.use(
    res => {
        console.log(res, "rrrrr")
            //对响应数据做些事
            // if (!res.data.success) {
            //     alert(res.data.error);
            //     return Promise.reject(res, '333');
            // }
        return res;
    },
    error => {
        if (error.response.status === 401) {
            // 401 说明 token 验证失败
            // 可以直接跳转到登录页面，重新登录获取 token
            location.href = getCodeApi("http://192.168.0.157:8080/#/login", '123');
        } else if (error.response.status === 500) {
            // 服务器错误
            // do something
            return Promise.reject(error.response.data);
        }
        // 返回 response 里的错误信息
        return Promise.reject(error.response.data);

    }
);

let getCodeApi = function(urlInit, state) {
    let urlNow = encodeURIComponent(urlInit);
    let scope = "snsapi_base"; //静默授权 用户无感知
    let appid = "wx5e45aca8fcb270f1";
    return `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
};

const get = (url, params) => {
    return new Promise((resolve, reject) => {
        axios.get(url, { params }).then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

const post = (url, params) => {
    return new Promise((resolve, reject) => {
        axios.post(url, params).then(response => {
                resolve(response.data);
            })
            .catch(error => {
                reject(error);
            });
    });
};

// 接口方法
const api = {
    /* 
     使用openID登录
      */
    LoginWithOpenId(code) {
        return post("/Manage/Access/LoginWithOpenId", {
            value: code
        });
    },
    /**
     * 绑定 登录
     */
    BindOpenId(code, 工号, 密码, DbKey) {
        return post("/Manage/Access/BindOpenId", {
            code,
            工号,
            密码,
            DbKey
        });
    },
    /* 
    获取医院名称列表
     */
    getHospitalList() {
        return get("/Manage/Service/获取可用的医院名称列表")
    },
    // 获取待办流程
    getBacklogProcess(index, size) {
        return get("/Office/获取待办流程", {
            index,
            size
        })
    },
};

export default api;