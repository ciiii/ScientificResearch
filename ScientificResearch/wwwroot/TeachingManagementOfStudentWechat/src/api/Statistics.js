import axios from '@/libs/api.request'


export const GetMineTask = () => {
    return axios.request({
        url: '/TeachingManagementOfStudent/HomePage/获取学员培训任务统计',
        method: 'GET'
    })
}