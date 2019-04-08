const HTTP_URL_HOST = 'http://a.ttz.cn:89';
// const HTTP_URL_HOST = 'http://oa.meinolf.net.cn:20003';
// const HTTP_URL_HOST = 'http://192.168.0.72:20003';
// const HTTP_URL_HOST = 'http://192.168.0.22:20001';
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

    //下载文件
    GET_DOWNURL_FILE: HTTP_URL_HOST +'/Lib/WFController/DownWfFile',

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

    //下载文件
    GET_DOWNURL_FILE: HTTP_URL_HOST + '/Lib/ZWController/DownZwFile',

}


export {
    HTTP_URL_HOST,
    URL_DOWNLOAD_FILE,
    URL_WAN_FANG,
    URL_ZHI_WANG,

};
