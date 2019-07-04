let HTTP_URL_HOST = 'http://192.168.0.99:63739';
if (process.env.NODE_ENV === 'production') {
    HTTP_URL_HOST = '';
}

const URL_USER = {

    //用户登录
    POST_LOGIN: '/Manage/Access/LoginManage',

}
const URL_NEWS = {

    GET_PANGING_NEWS: '/Manage/News/分页获取总库新闻',

    GET_NEWS_TYPE: '/Manage/News/获取总库新闻分类',

    GET_NEWS_TAGS: '/Manage/News/获取总库标签',

    GET_NEWS_DETAILS: '/Manage/News/获取总库新闻详情',

    POST_ADD_OR_EDIT_NEWS: '/Manage/News/增改总库新闻',

    POST_DELETE_NEWS: '/Manage/News/删除总库新闻',

    POST_UPLOAD_NEWS_IMG: '/Manage/News/上传总库新闻图片',

    POST_UPLOAD_LOGO_IMG: '/Manage/News/上传总库Logo图片',


}

const URL_SERVICE = {

    //获取服务列表
    GET_SERVICE_ALL: '/Manage/Service/获取服务列表',

    //获取可用的服务列表
    GET_ENABLE_SERVICE: '/Manage/Service/获取可用的服务列表',

    //增改服务
    POST_ADD_OR_EDIT_SERVICE: '/Manage/Service/增改服务',

    //禁用服务
    POST_DISABLE_SERVICE: '/Manage/Service/禁用服务',

    //启用服务
    POST_ENABLE_SERVICE: '/Manage/Service/启用服务',

}

const URL_HOSPITAL = {

    //获取医院列表
    GET_HOSPITAL_ALL: '/Manage/Service/获取医院列表',

    //获取可用的医院列表
    GET_ENABLE_HOSPITA: '/Manage/Service/获取可用的医院列表',

    //增改医院
    POST_ADD_OR_EDIT_HOSPITA: '/Manage/Service/增改医院',

    //禁用医院
    POST_DISABLE_HOSPITA: '/Manage/Service/禁用医院',

    //启用医院
    POST_ENABLE_HOSPITA: '/Manage/Service/启用医院',

    //获取医院服务
    GET_HOSPITAL_SERVICE: '/Manage/Service/获取医院服务',

    //增改医院服务
    POST_ADD_OR_EDIT_HOSPITAL_SERVICE: '/Manage/Service/增改医院服务',

    //上传医院Logo图片
    POST_UPLOAD_HOSPITAL_LOGO_IMG: '/Manage/Service/上传医院Logo图片',

}


export {
    HTTP_URL_HOST,
    URL_USER,
    URL_NEWS,
    URL_SERVICE,
    URL_HOSPITAL
};
