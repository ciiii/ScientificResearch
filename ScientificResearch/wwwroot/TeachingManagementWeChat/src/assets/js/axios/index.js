import axios from 'axios'
axios.defaults.timeout = 5000 // 响应时间
axios.defaults.headers.post['Content-Type'] =
    'application/x-www-form-urlencoded;charset=UTF-8' // 配置请求头
    // axios.defaults.baseURL = "/api"; // 配置接口地址

let api = 'http://192.168.0.99:63739'
if (process.env.NODE_ENV === 'production') {
    api = ''
}
// 132.232.14.244
// a.ttz.cn
// 自动给同一个vue项目的所有请求添加请求头
function setHeader () {
    axios.interceptors.request.use(config => {
        let token = localStorage.getItem('token')
        if (token) {
            config.headers['Authorization'] = token
        }
        return config
    })
}
export async function get (url, params) {
    setHeader()
    try {
        let res = await axios.get(api + url, { params })
        res = res.data
        return new Promise(resolve => {
            resolve(res)
        })
    } catch (err) {
        console.log(err)
    }
}

export async function post (url, params) {
    setHeader()
    try {
        let res = await axios.post(api + url, params)
        res = res.data
        return new Promise(resolve => {
            resolve(res)
        })
    } catch (err) {
        console.log(err)
    }
}
