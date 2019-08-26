import axios from '@/libs/api.request';

export const GetStudentList = ({ index, size, studentType, name }) => {

    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "Like学员类型名称": studentType,
        "是否启用": '',
        "Like姓名": name

    }
    return axios.request({
        url: '/TeachingManagementOfStudent/BaseInfo/分页获取教学学员',
        params,
        method: 'GET'
    })
}
export const GetTeachingTeachers = (id) => {
    const params = {
        "科室编号": id,
    }
    return axios.request({
        url: '/TeachingManagement/Organization/获取某科室的教学带教老师',
        params,
        method: 'GET'
    })
}