const getApiHost = 'http://192.168.0.99:63739';

const Code = {

    //用户登录
    URL_POST_LOGIN: getApiHost + '/Access/Login',

    //用户注销
    URL_POST_LOG_OUT: getApiHost + '/Access/Logout',

    //修改密码
    URL_POST_CHANGE_PASSWORD:getApiHost + '/Access/ChangePassword',


    //获取全部部门
    URL_GET_DEPARTMENT: getApiHost + '/BaseInfo/GetDepartmentList',


}

export default Code;