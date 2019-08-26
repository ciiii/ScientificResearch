import axios from '@/libs/api.request'

export const GetList = ({ index, size, typeid, title, speaker, start, end }) => {
    typeid = typeid == 0 ? undefined : typeid;
    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "教学活动类型编号": typeid,
        "Like活动主题": title,
        "Like主讲人姓名": speaker,
        "Begin活动开始时间": start,
        "End活动开始时间": end
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/分页获取我的教学活动',
        params,
        method: 'GET'
    })
}

export const GetEvaluationItem = (typeid) => {
    let params = {
        教学活动类型编号: typeid
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/获取某教学活动分类下的评价项目',
        params,
        method: 'GET'
    })
};
export const GetDetail = (id) => {
    const params = {
        "教学活动编号": id
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/获取教学活动详情',
        params,
        method: 'GET'
    })
}


export const GetFeedBack = ({ index, size, id, }) => {

    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "教学活动编号": id
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/获取我对某个教学活动的反馈',
        params,
        method: 'GET'
    })
}

export const GetEvaluation = ({ typeid, id, studentId }) => {

    const params = {
        "教学活动类型编号": typeid,
        "教学活动编号": id,
        "教学学员编号": studentId
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/获取我对某个教学活动的评价',
        params,
        method: 'GET'
    })
}
export const SaveEvaluation = (form) => {
    const data = form;
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/增改教学活动评价',
        data,
        method: 'POST'
    })
}
export const GetFeedback = ({ id, studentId }) => {

    const params = {

        "教学活动编号": id,
        "教学学员编号": studentId
    }
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/获取我对某个教学活动的反馈',
        params,
        method: 'GET'
    })
}
export const SaveFeedback = (form) => {
    const data = form;
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/增改教学活动反馈',
        data,
        method: 'POST'
    })
}

export const upload = (file) => {
    const data = new FormData();
    data.append("file", file);
    let headers = {
        "Content-Type": "multipart/form-data"
    };
    return axios.request({
        url: '/TeachingManagementOfStudent/Activity/上传教学活动反馈附件',
        data,
        headers,
        method: 'POST'
    });
}