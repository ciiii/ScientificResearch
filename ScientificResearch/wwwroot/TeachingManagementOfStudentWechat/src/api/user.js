import axios from '@/libs/api.request'

export const login = ({ userName, password, dbkey }) => {
    const data = {
        "工号": userName,
        "密码": password,
        "DbKey": dbkey

    }
    return axios.request({
        url: '/Manage/Access/LoginOfStudent',
        data,
        method: 'post'
    })
}


export const getUserInfo = (code) => {
    return axios.request({
        url: '/TeachingManagementOfStudent/HomePage/获取自己的教学学员档案',

        method: 'get'
    })
}

export const ChangePassword = (old, newpass) => {
    let data = {
        "旧密码": old,
        "新密码": newpass
    };
    return axios.request({
        url: '/TeachingManagementOfStudent/Office/ChangePassword',
        data,
        method: 'post'
    });
}
export const logout = () => {
    // return axios.request({
    //     url: 'logout',
    //     params: {
    //         token
    //     },
    //     method: 'post'
    // })
    localStorage.clear();
}