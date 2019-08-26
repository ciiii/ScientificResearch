import axios from '@/libs/api.request'

export const GetList = ({ index, size, from, to, EvaluationMan, ByEvaluationMan }) => {

    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "来源类型": from,
        "目标类型": to,
        "NotEqual来源类型": '',
        "Like评价人姓名": EvaluationMan,
        "Like被评价人姓名": ByEvaluationMan
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Evaluation360/分页获取评价',
        params,
        method: 'GET'
    })
}




export const Save = (form) => {
    const data = form;
    return axios.request({
        url: '/TeachingManagementOfStudent/Evaluation360/增改360评价',
        data,
        method: 'POST'
    })
}
export const GetInfo = (id) => {
    const params = {
        教学360评价编号: id
    };
    return axios.request({
        url: '/TeachingManagementOfStudent/Evaluation360/获取评价评分',
        params,
        method: 'get'
    })
}