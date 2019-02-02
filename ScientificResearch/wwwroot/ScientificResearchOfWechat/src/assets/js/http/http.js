import {get, post } from '../axios/index'

// 接口方法
const http = {
    /**
     * 使用openID登录
     */
    LoginWithOpenId(code) {
        return post("/Manage/Access/LoginWithOpenId", {
            value: code
        });
    },
    /**
     * 绑定 登录
     */
    BindOpenId(code, 工号, 密码, DbKey) {
        return post("/Manage/Access/BindOpenId", {
            code,
            工号,
            密码,
            DbKey
        });
    },
    /**
     * 获取医院名称列表
     */

    getHospitalList() {
        return get("/Manage/Service/获取可用的医院名称列表")
    },
    /**
     * 获取待办流程
     */
    getBacklogProcess(index, size) {
        return get("/Office/获取待办流程", {
            index,
            size
        })
    },

    /**
     * 分页获取总库新闻
     */
    getNewsList(index, size) {
        return get("/Manage/News/分页获取总库新闻", {
            index,
            size
        })
    }
};

export default http;