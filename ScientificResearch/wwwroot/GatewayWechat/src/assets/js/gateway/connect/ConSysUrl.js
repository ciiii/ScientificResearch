// let HTTP_URL_HOST = 'http://192.168.0.22:20001';
let HTTP_URL_HOST = 'http://192.168.0.72:20003';
if (process.env.NODE_ENV === 'production') {
    HTTP_URL_HOST = 'http://a.aiyisheng.com:89';
}
const META_ONE = 'width=device-width,initial-scale=1.0';
const META_TWO = 'width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no';

const URL_DOWNLOAD_FILE = HTTP_URL_HOST + '/Lib/FileMgrController/DownLoadFile';

const URL_WAN_FANG = {

    //获取检索配置文件
    GET_DATA_CONFIGS: '/Lib/SelectDataController/GetSelectDataConfigs',

    //获取文章列表
    GET_PANGING_LIST: '/Lib/WFController/GetPaperList',

    //获取文章详情
    GET_ARTICLE_DETAILS: '/Lib/WFController/GetWfDataDetail',

    //获取文章下载地址
    GET_ARTICLE_DOWNURL: '/Lib/WFController/GetWfDataDownUrl',
}

const URL_ZHI_WANG = {

    //获取检索配置文件
    GET_DATA_CONFIGS: '/Lib/SelectDataController/GetSelectDataConfigs',

    //获取文章列表
    GET_ARTICLE_LIST: '/Lib/ZWController/GetPaperList',

    //分页获取文章列表
    GET_PANGING_LIST: '/Lib/ZWController/GetPaperListByPage',

    //获取文章排序列表
    GET_SCREEN_LIST: '/Lib/ZWController/GetPageListBySort',

    //获取文章详情
    GET_ARTICLE_DETAILS: '/Lib/ZWController/GetDataDetail',

    //获取文章下载地址
    GET_ARTICLE_DOWNURL: '/Lib/ZWController/GetZwDataDownUrl',
}

const URL_ZHI_WANG_CHKD = {

    //获取知网医学文章列表
    GET_CHKD_ARTICLE_LIST: '/Lib/ZWMedicalController/GetMedicalPaperList',

    //获取知网医学文章排序列表
    GET_CHKD_SCREEN_LIST: '/Lib/ZWMedicalController/GetMedicalPageListBySort',

    //分页获取知网医学文章列表
    GET_CHKD_PANGING_LIST: '/Lib/ZWMedicalController/GetMedicalPaperListByPage',

    //获取知网医学文章详情
    GET_CHKD_ARTICLE_DETAILS: '/Lib/ZWMedicalController/GetMedicalDataDetail',

    //获取知网医学文章下载地址
    GET_CHKD_ARTICLE_DOWNURL: '/Lib/ZWMedicalController/GetZwMedicalDataDownUrl',
}




export {
    HTTP_URL_HOST,
    META_ONE,
    META_TWO,
    URL_DOWNLOAD_FILE,
    URL_WAN_FANG,
    URL_ZHI_WANG,
    URL_ZHI_WANG_CHKD

};
