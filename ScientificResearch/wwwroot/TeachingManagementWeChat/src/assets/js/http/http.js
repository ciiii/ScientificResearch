import { get, post } from '../axios/index'

// 接口方法
const http = {
    /**
     * 登录
     */
    Login (para) {
        return post('/Manage/Access/Login', para)
    },
    /**
     * 根据DbKey获取医院信息
     */
    getHospitalInformation (para) {
        return get('/Manage/Service/根据dbkey获取某医院信息', para)
    }
}

export default http
