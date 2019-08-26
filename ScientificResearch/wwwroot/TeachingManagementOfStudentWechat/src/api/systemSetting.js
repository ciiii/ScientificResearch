import axios from '@/libs/api.request'

export const GetDictionaryByType = ({ type }) => {
    const params = {
        "分类": type
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/BaseInfo/获取某类字典',
        params,
        method: 'GET'
    })
};
export const GetActivitiesType = () => {
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/获取教学活动类型',
        method: 'GET'
    })
};

export const GetMenu = () => {
    return axios.request({
        url: '/TeachingManagement/HomePage/获取教学权限菜单',
        method: 'GET'
    })
};
export const saveErrorLogger = info => {
    return axios.request({
        url: 'save_error_logger',
        data: info,
        method: 'post'
    })
}
export const GetDirection = ({ from, to }) => {

    const params = {
        "来源类型": from,
        "目标类型": to,

    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Evaluation360/获取教学360评价方向',
        params,
        method: 'GET'
    })
}
export const GetEvaluateItem = ({ to }) => {

    const params = {
        "目标类型": to
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Evaluation360/获取某目标类型的教学360评价分类和项目',
        params,
        method: 'GET'
    })
}

export const Get360EvaluateTargetType = () => {
    return axios.request({
        url: '/TeachingManagement/Setting/获取教学360评价目标类型',
        method: 'GET'
    })
}
export const GetStudentType = () => {
    return axios.request({
        url: '/TeachingManagement/BaseInfo/获取教学学员类型',
        method: 'GET'
    })
}
export const GetTearchType = ({ id, name }) => {
    let params = {
        教学专业编号: id,
        Like名称: name,
        是否启用: true
    };
    return axios.request({
        url: '/TeachingManagement/Setting/获取教学本院策略',
        params,
        method: 'GET'
    })
}

export const GetProfessional = () => {

    return axios.request({
        url: '/TeachingManagement/Setting/获取教学专业',
        method: 'GET'
    })
}

export const GetStudentStatus = () => {
    return axios.request({
        url: '/TeachingManagement/Statistical/获取教学学员培训状态列表',

        method: 'GET'
    })
}

export const GetTeacherRoomTaskType = () => {
    return axios.request({
        url: '/TeachingManagementOfStudent/BaseInfo/获取教学专业科室任务类型',

        method: 'GET'
    })
}