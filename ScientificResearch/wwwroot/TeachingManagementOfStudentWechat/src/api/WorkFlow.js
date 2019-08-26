import axios from '@/libs/api.request';

export const GetAuditList = ({ index, size, name, StateName, type }) => {
    let url = '';
    switch (type) {
        case 1:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员分页查看请假申请';
                break;
            }
        case 2:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员分页查看出科申请';
                break;
            }
        case 3:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员分页查看轮转手册申请';
                break;
            }
        case 4:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员分页查看结业申请';
                break;
            }
        default:
            {
                url = '/TeachingManagementOfStudent/HomePage/分页获取待办事宜';
                break;
            }
    }

    const params = {
        "Index": index,
        "Size": size,
        "OrderType": false,
        "Like姓名": name,
        "StateName": StateName,

    };
    return axios.request({
        url,
        params,
        method: 'GET'
    });
};

export const GetAuditDetail = ({ id, type }) => {
    let url = '';
    let idName = '';
    switch (type) {
        case 1:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/获取请假详情';
                idName = '请假编号';
                break;
            }
        case 2:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/获取出科详情';
                idName = '出科编号';
                break;
            }
        case 3:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/获取轮转手册详情';
                idName = '轮转手册编号';
                break;
            }
        case 4:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/获取结业详情';
                idName = '结业编号';
                break;
            }


        default:
            {
                url = '';
                break;
            }
    }
    const params = {};
    params[idName] = id;
    return axios.request({
        url,
        params,
        method: 'GET'
    });
};

export const GetAuditRecord = ({ id }) => {
    let url = '/TeachingManagementOfStudent/WorkFlow/获取某流程审核记录';
    const params = {
        "流程编号": id
    };
    return axios.request({
        url,
        params,
        method: 'GET'
    });
};

export const SaveSend = ({ type, Data }) => {
    let url = '';
    switch (type) {
        case 1:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员发起请假申请';
                break;
            }
        case 2:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员发起出科申请';
                break;
            }
        case 3:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员发起轮转手册申请';
                break;
            }
        case 4:
            {
                url = '/TeachingManagementOfStudent/WorkFlow/学员发起结业申请';
                break;
            }


    }
    const data = {
        IsHold: false,
        Data: Data
    };
    return axios.request({
        url,
        data,
        method: 'POST'
    });
};

export const SaveAuditRecord = ({ type, StepId, IsHold, Remark, Data }) => {
    let url = '';
    switch (type) {
        case '11':
            {
                url = '/TeachingManagement/WorkFlow/通过请假申请';
                break;
            }
        case '10':
            {
                url = '/TeachingManagement/WorkFlow/不通过请假申请';
                break;
            }
        case '21':
            {
                url = '/TeachingManagement/WorkFlow/通过出科申请';
                break;
            }
        case '20':
            {
                url = '/TeachingManagement/WorkFlow/不通过出科申请';
                break;
            }
        case '31':
            {
                url = '/TeachingManagement/WorkFlow/通过轮转手册申请';
                break;
            }
        case '30':
            {
                url = '/TeachingManagement/WorkFlow/不通过轮转手册申请';
                break;
            }
        case '41':
            {
                url = '/TeachingManagement/WorkFlow/通过结业申请';
                break;
            }
        case '40':
            {
                url = '/TeachingManagement/WorkFlow/不通过结业申请';
                break;
            }
        case '51':
            {
                url = '/TeachingManagement/WorkFlow/通过退培申请';
                break;
            }
        case '50':
            {
                url = '/TeachingManagement/WorkFlow/不通过退培申请';
                break;
            }

    }
    const data = {
        StepId: StepId,
        IsHold: IsHold,
        Remark: Remark,
        Data: Data

    };
    return axios.request({
        url,
        data,
        method: 'POST'
    });
};

export const upload = (file) => {
    const data = new FormData();
    data.append("file", file);
    let headers = {
        "Content-Type": "multipart/form-data"
    };
    return axios.request({
        url: '/TeachingManagementOfStudent/WorkFlow/上传教学轮转手册附件',
        data,
        headers,
        method: 'POST'
    });
}

export const GetCheckTask = ({ 教学轮转编号, 教学轮转手册类型编号, 教学专业科室任务类型编号 }) => {
    let params = {
        教学轮转编号: 教学轮转编号,
        教学轮转手册类型编号: 教学轮转手册类型编号,
        教学专业科室任务类型编号: 教学专业科室任务类型编号
    };
    return axios.request({
        url: '/TeachingManagementOfStudent/WorkFlow/获取某教学轮转手册可选任务',
        params,
        method: 'GET'
    })
}
export const GetRolationType = () => {

    return axios.request({
        url: '/TeachingManagementOfStudent/WorkFlow/获取教学轮转手册类型',

        method: 'GET'
    })
}