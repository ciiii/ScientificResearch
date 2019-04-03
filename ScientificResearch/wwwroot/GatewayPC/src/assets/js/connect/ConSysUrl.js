const HTTP_URL_HOST = '';

const URL_USER = {

    //用户登录
    POST_LOGIN:'/Manage/Access/Login',
}
const URL_NEWS = {

    //分页获取总库新闻
    GET_PANGING_NEWS: '/Manage/News/分页获取总库新闻',

    //获取科研新闻
    GET_IMIS_NEWS: '/Office/分页获取通知公告',

    //获取科研新闻详情
    GET_IMIS_NEWS_DETAILS: '/Office/获取通知公告详情',
}

const URL_HOSPITAL = {

    //获取医院列表
    GET_HOSPITAL_ALL: '/Manage/Service/获取医院列表',

    //获取可用的医院名称列表
    GET_ENABLE_HOSPITA: '/Manage/Service/获取可用的医院名称列表',

    //获取某医院购买的服务
    GET_HOSPITAL_BUY_SERVICE: '/Manage/Service/获取某医院购买的服务',
}

export {
    HTTP_URL_HOST,
    URL_USER,
    URL_NEWS,
    URL_HOSPITAL
};
