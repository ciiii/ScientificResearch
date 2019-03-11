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
     * 获取某医院购买的服务
     */
    getServiceList(code) {
        return get("/Manage/Service/获取某医院购买的服务", code)
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
    },
    /**
     * 分页获取主办讲座列表
     */
    getLectureList(index, size) {
        return get("/AcademicActivities/分页获取主办讲座", {
            index,
            size
        })
    },
    /**
     * 获取主办讲座详情
     */
    getLectureDetails(code) {
        return get("/AcademicActivities/获取主办讲座详情", code)
    },
    /**
     * 分页获取讲座反馈列表
     */
    getFeedbackList(index, size) {
        return get("/AcademicActivities/分页获取讲座反馈", {
            index,
            size
        })
    },
    /**
     * 获取讲座反馈详情
     */
    getFeedbackDetails(code) {
        return get("/AcademicActivities/获取讲座反馈详情", code)
    },
    /**
     * 分页获取参会信息列表
     */
    getMeetingList(index, size) {
        return get("/AcademicActivities/分页获取参加会议", {
            index,
            size
        })
    },
    /**
     * 获取参加会议详情
     */
    getMeetingDetails(code) {
        return get("/AcademicActivities/获取参加会议详情", code)
    },
    /**
     * 分页获取参加会议反馈
     */
    getMeetingFeedbackList(index, size) {
        return get("/AcademicActivities/分页获取参加会议反馈", {
            index,
            size
        })
    },
    /**
     * 获取参加会议反馈详情
     */
    getMeetingFeedbackDetails(code) {
        return get("/AcademicActivities/获取参加会议反馈详情", code)
    },

    /**
     * 分页获取参加会议合计报销列表
     */
    getExpenseList(index, size) {
        return get("/Expense/分页获取参加会议合计报销列表", {
            index,
            size
        })
    },
    /**
     * 获取某参加会议报销列表
     */
    getSomeExpenseList(code) {
        return get("/Expense/获取某参加会议报销列表", code)
    },
    /**
     * 获取某报销详情
     */
    getSomeExpenseDetails(code) {
        return get("/Expense/获取某报销详情", code)
    },
    /**
     * 分页获取可领取论文
     */
    getPaperList(index, size) {
        return get("/Fruit/分页获取可领取论文", {
            index,
            size
        })
    },
    /**
     * 获取论文详情
     */
    getpaperDetails(code) {
        return get("/Fruit/获取论文详情", code)
    },
    /**
     * 分页获取论文
     */
    getPaperAllList(index, size) {
        return get("/Fruit/分页获取论文", {
            index,
            size
        })
    },
    /**
     * 分页获取著作
     */
    getWorkAllList(index, size) {
        return get("/Fruit/分页获取著作", {
            index,
            size
        })
    },
    /**
     * 获取著作详情
     */
    getWorkDetails(code) {
        return get("/Fruit/获取著作详情", code)
    },
    /**
     * 分页获取专利
     */
    getPatentAllList(index, size) {
        return get("/Fruit/分页获取专利", {
            index,
            size
        })
    },
    /**
     * 获取专利详情
     */
    getPatentDetails(code) {
        return get("/Fruit/获取专利详情", code)
    },
    /**
     * 分页获取获奖
     */
    getResultsAllList(index, size) {
        return get("/Fruit/分页获取获奖", {
            index,
            size
        })
    },
    /**
     * 获取获奖详情
     */
    getResultsDetails(code) {
        return get("/Fruit/获取获奖详情", code)
    },
    /**
     * 分页获取成果总览
     */
    getAchievementAllList(index, size) {
        return get("/Fruit/分页获取成果总览", {
            index,
            size
        })
    },
};

export default http;