import axios from '@/libs/api.request'

export const GetNotes = ({ index, size, type, title, sendman }) => {
    type = type == 0 ? undefined : type;
    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "通知类型": type,
        "Like通知名称": title,
        "Like发送人姓名": sendman
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/HomePage/分页获取可查看的教学通知公告',
        params,
        method: 'GET'
    })
}
export const GetDetail = (id) => {
    const params = {
        "编号": id
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/HomePage/获取教学通知公告详情',
        params,
        method: 'GET'
    })
}