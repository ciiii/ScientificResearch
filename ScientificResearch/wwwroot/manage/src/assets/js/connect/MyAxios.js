import axios from 'axios';
// import baseUrl from './setBaseUrl'
// axios.defaults.withCredentials = true;
// axios.defaults.baseURL = baseUrl;
// axios.defaults.baseURL = 'https://api.example.com';

// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

const HTTP_URL_HOST = 'http://192.168.0.99:63739';

axios.$http = {
    /**
     * @param url  接口地址,也就是除了ip+host和项目名剩下的地址 类似于/Module/AddModule
     * @param method 请求方式 GET POST
     * @param params 携带参数
     * @param resultListener  回调方法
     */
    getDatas(url, method, params, resultListener) {
        if (sessionStorage.Authorization) {
            axios.defaults.headers.common['Authorization'] = sessionStorage.getItem('Authorization');
        }
        let postUrl = HTTP_URL_HOST + url;
        if (method == null || method.toLowerCase() == 'get') {
            let thisParams = {
                params: params
            }
            axios.get(postUrl, thisParams).then(response => {
                resultListener(true, null, response.data);
            }).catch(function (error) {
                resultListener(false, error, null);
            })
        } else if (method.toLowerCase() == 'post') {
            axios.post(postUrl, params).then(function (response) {
                resultListener(true, null, response.data);
            }).catch(function (error) {
                resultListener(false, error, null);
            })
        } else {
            resultListener(false, '请求方式错误！', null);
        }
    },
}
export default axios;
