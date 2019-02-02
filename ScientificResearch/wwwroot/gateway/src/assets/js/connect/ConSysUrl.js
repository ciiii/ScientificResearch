const HTTP_URL_HOST = 'http://192.168.0.99:63739';

const URL_USER = {

    //用户登录
    POST_LOGIN:'/Manage/Access/Login',


}
const URL_NEWS = {

    //分页获取总库新闻
    GET_PANGING_NEWS: '/Manage/News/分页获取总库新闻',
}
const URL_SERVICE = {

    //获取服务列表
    GET_SERVICE_ALL: '/Manage/Service/获取服务列表',

    //获取可用的服务列表
    GET_ENABLE_SERVICE: '/Manage/Service/获取可用的服务列表',
}

const URL_HOSPITAL = {

    //获取医院列表
    GET_HOSPITAL_ALL: '/Manage/Service/获取医院列表',

    //获取可用的医院列表
    GET_ENABLE_HOSPITA: '/Manage/Service/获取可用的医院列表',

    //获取某医院购买的服务
    GET_HOSPITAL_BUY_SERVICE: '/Manage/Service/获取某医院购买的服务',
}

export {
    HTTP_URL_HOST,
    URL_USER,
    URL_NEWS,
    URL_SERVICE,
    URL_HOSPITAL
};
