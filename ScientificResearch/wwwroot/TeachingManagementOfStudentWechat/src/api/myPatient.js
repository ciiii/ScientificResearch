import axios from '@/libs/api.request'

export const GetMineList = ({ index, size }) => {
    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/TeachingManagement/分页获取我的教学管床病人',
        params,
        method: 'GET'
    })
}

export const SaveMine = (form) => {
    const data = form;
    return axios.request({
        url: '/TeachingManagementOfStudent/TeachingManagement/增改教学管床病人',
        data,
        method: 'POST'
    })
}
export const GetList = ({ index, size, name }) => {
    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        Like姓名: name,
        Like住院号: '',
        Like住院床号: ''

    }
    return axios.request({
        url: '/TeachingManagementOfStudent/TeachingManagement/分页获取病人',
        params,
        method: 'GET'
    })
}




export const Save = (form) => {
    const data = form;
    return axios.request({
        url: '/TeachingManagementOfStudent/TeachingManagement/增改病人',
        data,
        method: 'POST'
    })
}