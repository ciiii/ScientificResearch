import axios from '@/libs/api.request';
export const GetList = ({ index, size, departmentid, typeid, name }) => {
    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "部门编号": departmentid,
        "教学角色编号": typeid,
        "LikeAllName": name
    };
    return axios.request({
        url: '/TeachingManagementOfStudent/BaseInfo/分页获取教学角色中的人员',
        params,
        method: 'GET'
    });
};