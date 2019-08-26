import axios from '@/libs/api.request'



export const errorReq = () => {
    return axios.request({
        url: 'error_url',
        method: 'post'
    })
}

export const saveErrorLogger = info => {
    return axios.request({
        url: 'save_error_logger',
        data: info,
        method: 'post'
    })
}

export const uploadImg = formData => {
    return axios.request({
        url: 'image/upload',
        data: formData
    })
}

export const getOrgData = () => {
    return axios.request({
        url: 'get_org_data',
        method: 'get'
    })
}

export const getTreeSelectData = () => {
    return axios.request({
        url: 'get_tree_select_data',
        method: 'get'
    })
}

export const STUDENT_STATE = ['未报到', '退培', '已报到', '轮转计划已安排', '在培', '待结业', '结业'];
export const ROTATION_STATE = ['未入科', '在科', '已出科'];
export const WORK_FLOW_STATE = ['未完成', '已完成', '作废'];