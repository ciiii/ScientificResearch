import Vue from "vue";
import Router from "vue-router";
import { META_ONE } from "./assets/js/gateway/connect/ConSysUrl";
Vue.use(Router);

export default new Router({
    routes: [{ // 入口
            path: "/",
            name: "home",
            component: () =>
                import ("./views/Home.vue"),
            meta: { title: '爱医生图书馆' },
        },
        { // 入口我的
            path: "/homePersonal",
            name: "homePersonal",
            component: () =>
                import ("./views/scientificResearch/home/homePersonal.vue"),
            meta: { title: '个人中心', requireAuth: true },
        },
        {
            path: '/wanFangSearch',
            name: 'wanFangSearch',
            component: () =>
                import ('./views/gateway/wanFang/wanFangSearch.vue'),
            meta: { title: '万方检索' },
        },
        {
            path: '/wanFangList',
            name: 'wanFangList',
            component: () =>
                import ('./views/gateway/wanFang/wanFangList.vue'),
            meta: { title: '万方医学' },
        },
        {
            path: '/wanFangDetails',
            name: 'wanFangDetails',
            component: () =>
                import ('./components/gateway/wanFang/wanFangDetails.vue'),
            meta: { title: '文章详情' },
        },
        {
            path: '/zhiWangSearch',
            name: 'zhiWangSearch',
            component: () =>
                import ('./views/gateway/zhiWang/zhiWangSearch.vue'),
            meta: { title: '知网检索' },
        },
        {
            path: '/zhiWangList',
            name: 'zhiWangList',
            component: () =>
                import ('./views/gateway/zhiWang/zhiWangList.vue'),
            meta: { title: '知网数据' },
        },
        {
            path: '/pdfPreview',
            name: 'pdfPreview',
            component: () =>
                import ('./views/gateway/pdf/pdfPreview.vue'),
            meta: { title: 'PDF预览', content: META_ONE },
        },
        {
            path: '/zhiWangDetails',
            name: 'zhiWangDetails',
            component: () =>
                import ('./components/gateway/zhiWang/zhiWangDetails.vue'),
            meta: { title: '文章详情' },
        },
        { //主页
            path: "/index",
            name: "index",
            component: () =>
                import ("./views/index.vue"),
            meta: { title: '科研管理' }
        },
        { // 跳转引导页面
            path: "/guidance",
            name: "guidance",
            component: () =>
                import ("./components/guidance.vue")
        },
        { // 空页面
            path: "/alternative",
            name: "alternative",
            component: () =>
                import ("./views/alternative.vue"),
            meta: { requireAuth: true }
        },
        { // 待办
            path: "/backlog",
            name: "backlog",
            component: () =>
                import ("./views/scientificResearch/backlog/backlog.vue"),
            meta: { title: '科研管理 - 成果' }
        },
        { // 我的
            path: "/personal",
            name: "personal",
            component: () =>
                import ("./views/scientificResearch/personal/personal.vue"),
            meta: { title: '科研管理 - 个人中心' }
        },
        { // 修改密码
            path: "/changePWD",
            name: "changePWD",
            component: () =>
                import ("./views/scientificResearch/personal/changePWD.vue"),
            meta: { title: '修改密码' }
        },
        { // 修改账户
            path: "/accountChange",
            name: "accountChange",
            component: () =>
                import ("./views/scientificResearch/personal/accountChange.vue"),
            meta: { title: '个人资料' }
        },
        { // 登录
            path: "/login",
            name: "login",
            component: () =>
                import ("./views/login.vue"),
            meta: { title: '绑定用户' }
        },
        { // 总库更多新闻列表
            path: "/ZKMoreList",
            name: "ZKMoreList",
            component: () =>
                import ("./views/scientificResearch/newsContent/ZKNews/ZKMoreList.vue"),
            meta: { title: '总库新闻列表' }
        },
        { // 总库新闻详情
            path: "/ZKNewsDetails",
            name: "ZKNewsDetails",
            component: () =>
                import ("./views/scientificResearch/newsContent/ZKNews/ZKNewsDetails.vue"),
            meta: { title: '总库新闻详情' }
        },
        { // 科研更多新闻列表
            path: "/KYMoreList",
            name: "KYMoreList",
            component: () =>
                import ("./views/scientificResearch/newsContent/KYNews/KYMoreList.vue"),
            meta: { title: '科研新闻列表' }
        },
        { // 科研新闻详情
            path: "/KYNewsDetails",
            name: "KYNewsDetails",
            component: () =>
                import ("./views/scientificResearch/newsContent/KYNews/KYNewsDetails.vue"),
            meta: { title: '科研新闻详情' }
        },
        { // 主办讲座列表
            path: "/lectureList",
            name: "lectureList",
            component: () =>
                import ("./views/scientificResearch/activity/lecture/lectureList.vue"),
            meta: { title: '主办讲座列表' }
        },
        { // 主办讲座详情
            path: "/lectureDetails",
            name: "lectureDetails",
            component: () =>
                import ("./views/scientificResearch/activity/lecture/lectureDetails.vue"),
            meta: { title: '主办讲座详情' }
        },
        { // 讲座反馈列表
            path: "/feedbackList",
            name: "feedbackList",
            component: () =>
                import ("./views/scientificResearch/activity/lecture/feedbackList.vue"),
            meta: { title: '讲座反馈列表' }
        },
        { // 参会信息列表
            path: "/meetingInformation",
            name: "meetingInformation",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/meetingInformation.vue"),
            meta: { title: '参会信息' }
        },
        { // 参会信息详情
            path: "/meetingDetails",
            name: "meetingDetails",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/meetingDetails.vue"),
            meta: { title: '参会详情' }
        },
        { // 参会反馈列表
            path: "/meetingFeedbackList",
            name: "meetingFeedbackList",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/meetingFeedbackList.vue"),
            meta: { title: '参会反馈列表' }
        },
        { // 参会经费报销管理
            path: "/expenseList",
            name: "expenseList",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/expenseList.vue"),
            meta: { title: '参会经费报销管理' }
        },
        { // 某参加会议报销列表
            path: "/someExpenseList",
            name: "someExpenseList",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/someExpenseList.vue"),
            meta: { title: '参会经费报销列表' }
        },
        { // 报销详情
            path: "/reimbursementDetails",
            name: "reimbursementDetails",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/reimbursementDetails.vue"),
            meta: { title: '报销详情' }
        },
        { // 导入认领 
            path: "/paperClaim",
            name: "paperClaim",
            component: () =>
                import ("./views/scientificResearch/backlog/paper/paperClaim.vue"),
            meta: { title: '导入认领' }
        },
        { // 论文管理
            path: "/paperManagement",
            name: "paperManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/paper/paperManagement.vue"),
            meta: { title: '论文管理' }
        },
        { // 论文详情
            path: "/paperDetails",
            name: "paperDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/paper/paperDetails.vue"),
            meta: { title: '论文详情' }
        },
        { // 著作管理
            path: "/workManagement",
            name: "workManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/work/workManagement.vue"),
            meta: { title: '著作管理' }
        },
        { // 著作详情
            path: "/workDetails",
            name: "workDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/work/workDetails.vue"),
            meta: { title: '著作详情' }
        },
        { // 专利管理
            path: "/patentManagement",
            name: "patentManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/patent/patentManagement.vue"),
            meta: { title: '专利管理' }
        },
        { // 专利详情
            path: "/patentDetails",
            name: "patentDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/patent/patentDetails.vue"),
            meta: { title: '专利详情' }
        },
        { // 获奖管理
            path: "/resultsManagement",
            name: "resultsManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/results/resultsManagement.vue"),
            meta: { title: '获奖管理' }
        },
        { // 获奖详情
            path: "/resultsDetails",
            name: "resultsDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/results/resultsDetails.vue"),
            meta: { title: '获奖详情' }
        },
        { // 成果总览
            path: "/achievementAll",
            name: "achievementAll",
            component: () =>
                import ("./views/scientificResearch/backlog/achievementAll/achievementAll.vue"),
            meta: { title: '成果总览' }
        },
        { // 纵向项目申报详情
            path: "/YDeclarationDetails",
            name: "YDeclarationDetails",
            component: () =>
                import ("./views/scientificResearch/YProjectDeclaration/YDeclarationDetails.vue"),
            meta: { title: '纵向申报详情' }
        },
        { // 纵向项目中检详情
            path: "/YProcessInspectionDetails",
            name: "YProcessInspectionDetails",
            component: () =>
                import ("./views/scientificResearch/YProjectDeclaration/YProcessInspectionDetails.vue"),
            meta: { title: '纵向项目中检详情' }
        },
        { // 纵向项目经费到账
            path: "/YFundsToTheAccount",
            name: "YFundsToTheAccount",
            component: () =>
                import ("./views/scientificResearch/YProjectDeclaration/YFundsToTheAccount.vue"),
            meta: { title: '纵向项目经费到账' }
        },
        { // 横向项目详情
            path: "/XDetails",
            name: "XDetails",
            component: () =>
                import ("./views/scientificResearch/XProjectDeclaration/XDetails.vue"),
            meta: { title: '横向项目详情' }
        },
        { // 横向项目经费到账
            path: "/XFundsToTheAccount",
            name: "XFundsToTheAccount",
            component: () =>
                import ("./views/scientificResearch/XProjectDeclaration/XFundsToTheAccount.vue"),
            meta: { title: '横向项目经费到账' }
        },
    ],
    scrollBehavior(to, from, savedPosition) {
        if (savedPosition) {
            return savedPosition
        } else {
            if (from.meta.keepAlive) {
                from.meta.savedPosition = document.body.scrollTop
            }
            return { x: 0, y: to.meta.savedPosition || 0 }
        }
    }
});