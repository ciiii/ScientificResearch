import axios from 'axios'
import store from '@/store'
import sysConfig from '@/config'
import { Toast } from 'vant'
axios.defaults.timeout = 15000; //超时时间

const addErrorLog = errorInfo => {
    const { statusText, status, request: { responseURL } } = errorInfo
    let info = {
        type: 'ajax',
        code: status,
        mes: statusText,
        url: responseURL
    }
    if (!responseURL.includes('save_error_logger')) store.dispatch('addErrorLog', info)
}

class HttpRequest {
    constructor(baseUrl = sysConfig.baseURL) {
        this.baseUrl = baseUrl
        this.queue = {}
    }
    getInsideConfig() {
        let token = localStorage.getItem('student_token')
        const config = {
            baseURL: this.baseUrl,
            headers: {
                Authorization: token
            }
        }
        return config
    }
    destroy(url) {
        delete this.queue[url]
        if (!Object.keys(this.queue).length) {
            // Spin.hide()
        }
    }
    interceptors(instance, url) {
        // 请求拦截
        instance.interceptors.request.use(config => {
                // 添加全局的loading...
                if (!Object.keys(this.queue).length) {
                    // Spin.show() // 不建议开启，因为界面不友好
                }
                this.queue[url] = true
                return config
            }, error => {
                Toast.fail('请求超时!');
                return Promise.reject(error)
            })
            // 响应拦截
        instance.interceptors.response.use(res => {
            this.destroy(url)

            const { data, status } = res
            if (data.error) {
                Toast.fail(data.error);
                return { error: data.error };
            }
            return { data, status }

        }, error => {
            this.destroy(url);
            if (!error.response) {

                if (error.message == 'Network Error') {
                    Toast.fail({ message: '网络故障' });
                } else {
                    Toast.fail({ message: error.message });
                }
                return Promise.reject(error);


            }
            if (error.response.status == 504 || error.response.status == 404) {
                Toast.fail({ message: '服务器被吃了⊙﹏⊙∥' });
            } else if (error.response.status == 403) {
                Toast.fail({ message: '权限不足,请联系管理员!' });
            } else {
                Toast.fail({ message: '未知错误!' });
            }
            let errorInfo = error.response
            if (!errorInfo) {
                const { request: { statusText, status }, config } = JSON.parse(JSON.stringify(error))
                errorInfo = {
                    statusText,
                    status,
                    request: { responseURL: config.url }
                }
            }
            addErrorLog(errorInfo)
            return Promise.reject(error)
        })
    }
    request(options) {
        const instance = axios.create();
        let option = this.getInsideConfig();
        if (options.headers) {
            for (let key in option.headers) {
                options.headers[key] = option.headers[key];
            }
        }
        options = Object.assign(option, options);

        this.interceptors(instance, options.url)
        return instance(options)
    }
}
export default HttpRequest