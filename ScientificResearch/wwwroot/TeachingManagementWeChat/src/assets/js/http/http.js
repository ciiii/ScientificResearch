import { get, post } from '../axios/index'

// 接口方法
const http = {
    /**
     * 根据DbKey获取医院信息
     */
    getHospitalInformation (para) {
        return get('/Manage/Service/根据dbkey获取某医院信息', para)
    },

    /**
     * 登录
     */
    Login (para) {
        return post('/Manage/Access/Login', para)
    },
    /**
     * 修改密码
     */
    ChangePassword (para) {
        return post('/TeachingManagement/Office/ChangePassword', para)
    },
    /**
     * 分页获取可查看的教学通知公告
     */
    getNoticeInformation (para) {
        return get(
            '/TeachingManagement/HomePage/分页获取可查看的教学通知公告',
            para
        )
    },
    /**
     * 获取教学通知公告详情
     */
    getNoticeDetails (para) {
        return get('/TeachingManagement/HomePage/获取教学通知公告详情', para)
    },
    /**
     * 分页获取可查看的下载中心
     */
    getDownload (para) {
        return get('/Office/分页获取可查看的下载中心', para)
    },
    /**
     * 获取某人员详情 ???
     */
    getSomePersonnelDetails (code) {
        return get('/People/获取某人员详情', code)
    },
    /**
     * 分页获取教学学员
     */
    getStudents (code) {
        return get('/TeachingManagement/Organization/分页获取教学学员', code)
    },
    /**
     * 分页获取学员宿舍楼安排
     */
    getDormitoryarrange (code) {
        return get('/TeachingManagement/TeachingManagement/分页获取学员宿舍楼安排', code)
    },

    /**
     * 获取教学活动类型
     */
    getTeachingType (code) {
        return get('/TeachingManagement/Setting/获取教学活动类型', code)
    },
    /**
     * 获取教学360评价方向
     */
    getEvaluateDirection (code) {
        return get('/TeachingManagement/Setting/获取教学360评价方向', code)
    },
    /**
     * 获取某目标类型的教学360评价分类
     */
    getEvaluatioClassification (code) {
        return get(
            '/TeachingManagement/Setting/获取某目标类型的教学360评价分类',
            code
        )
    },
    /**
     * 获取某教学360评价分类下的评价项目
     */
    getEvaluatioProject (code) {
        return get(
            '/TeachingManagement/Setting/获取某教学360评价分类下的评价项目',
            code
        )
    }
}

export default http
