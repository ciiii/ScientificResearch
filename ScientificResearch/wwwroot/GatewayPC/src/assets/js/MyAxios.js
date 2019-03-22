import axios from 'axios';
// import baseUrl from './setBaseUrl'
// axios.defaults.withCredentials = true;
// axios.defaults.baseURL = baseUrl;
// axios.defaults.baseURL = 'https://api.example.com';

// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
// axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
let Authorization = '';
if (sessionStorage.Authorization) {
    Authorization = sessionStorage.getItem('Authorization');
}
axios.defaults.headers.common['Authorization'] = Authorization;


axios.myGet = async (url, data) => await axios.get(url, {params: data}).then(response => response.data).catch(error => error);
axios.myPost = async (url, data) => await axios.post(url, data).then(response => response.data).catch(error => error);
export default axios;

// //返回一个Promise(发送post请求)
// export function fetchPost(url, params) {
//     return new Promise((resolve, reject) => {
//         axios.post(url, params)
//             .then(response => {
//                 resolve(response.data);
//             }, err => {
//                 reject(err);
//             })
//             .catch((error) => {
//                reject(error)
//             })
//     })
// }
// ////返回一个Promise(发送get请求)
// export function fetchGet(url, param) {
//     return new Promise((resolve, reject) => {
//         axios.get(url, {params: param})
//             .then(response => {
//                 resolve(response.data)
//             }, err => {
//                 reject(err)
//             })
//             .catch((error) => {
//                 reject(error)
//             })
//     })
// }