import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    routes: [{ // 入口
            path: "/",
            name: "home",
            component: () =>
                import ("./views/Home.vue")
        },
        { //主页
            path: "/index",
            name: "index",
            component: () =>
                import ("./views/index.vue")
        },
        { // 空页面
            path: "/alternative",
            name: "alternative",
            component: () =>
                import ("./views/alternative.vue")
        },
        { // 待办
            path: "/backlog",
            name: "backlog",
            component: () =>
                import ("./views/scientificResearch/backlog/backlog.vue")
        },
        { // 我的
            path: "/personal",
            name: "personal",
            component: () =>
                import ("./views/scientificResearch/personal/personal.vue")
        },
        { // 修改密码
            path: "/changePWD",
            name: "changePWD",
            component: () =>
                import ("./views/scientificResearch/personal/changePWD.vue")
        },
        { // 修改账户
            path: "/accountChange",
            name: "accountChange",
            component: () =>
                import ("./views/scientificResearch/personal/accountChange.vue")
        },
        { // 登录
            path: "/login",
            name: "login",
            component: () =>
                import ("./views/login.vue")
        },
        { // 总库更多新闻列表
            path: "/ZKMoreList",
            name: "ZKMoreList",
            component: () =>
                import ("./views/scientificResearch/newsContent/ZKNews/ZKMoreList.vue")
        },
        { // 总库新闻详情
            path: "/ZKNewsDetails",
            name: "ZKNewsDetails",
            component: () =>
                import ("./views/scientificResearch/newsContent/ZKNews/ZKNewsDetails.vue")
        },
        { // 科研更多新闻列表
            path: "/KYMoreList",
            name: "KYMoreList",
            component: () =>
                import ("./views/scientificResearch/newsContent/KYNews/KYMoreList.vue")
        },
        { // 科研新闻详情
            path: "/KYNewsDetails",
            name: "KYNewsDetails",
            component: () =>
                import ("./views/scientificResearch/newsContent/KYNews/KYNewsDetails.vue")
        },
        { // 主办讲座列表
            path: "/lectureList",
            name: "lectureList",
            component: () =>
                import ("./views/scientificResearch/activity/lecture/lectureList.vue")
        },
        { // 讲座反馈列表
            path: "/feedbackList",
            name: "feedbackList",
            component: () =>
                import ("./views/scientificResearch/activity/lecture/feedbackList.vue")
        },
        { // 参会信息列表
            path: "/meetingInformation",
            name: "meetingInformation",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/meetingInformation.vue")
        }, ,
        { // 参会反馈列表
            path: "/meetingFeedbackList",
            name: "meetingFeedbackList",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/meetingFeedbackList.vue")
        },
        { // 参会经费报销列表
            path: "/expenseList",
            name: "expenseList",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/expenseList.vue")
        },
        { // 某参加会议报销列表
            path: "/someExpenseList",
            name: "someExpenseList",
            component: () =>
                import ("./views/scientificResearch/activity/meetingInformation/someExpenseList.vue")
        },
        { // 导入认领
            path: "/paperClaim",
            name: "paperClaim",
            component: () =>
                import ("./views/scientificResearch/backlog/paper/paperClaim.vue")
        },
        { // 论文管理
            path: "/paperManagement",
            name: "paperManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/paper/paperManagement.vue")
        },
        { // 论文详情
            path: "/paperDetails",
            name: "paperDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/paper/paperDetails.vue")
        },
        { // 著作管理
            path: "/workManagement",
            name: "workManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/work/workManagement.vue")
        },
        { // 著作详情
            path: "/workDetails",
            name: "workDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/work/workDetails.vue")
        },
        { // 专利管理
            path: "/patentManagement",
            name: "patentManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/patent/patentManagement.vue")
        },
        { // 专利详情
            path: "/patentDetails",
            name: "patentDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/patent/patentDetails.vue")
        },
        { // 获奖管理
            path: "/resultsManagement",
            name: "resultsManagement",
            component: () =>
                import ("./views/scientificResearch/backlog/results/resultsManagement.vue")
        },
        { // 获奖详情
            path: "/resultsDetails",
            name: "resultsDetails",
            component: () =>
                import ("./views/scientificResearch/backlog/results/resultsDetails.vue")
        },
        { // 成果总览
            path: "/achievementAll",
            name: "achievementAll",
            component: () =>
                import ("./views/scientificResearch/backlog/achievementAll/achievementAll.vue")
        },
        { // 纵向项目申报详情
            path: "/YDeclarationDetails",
            name: "YDeclarationDetails",
            component: () =>
                import ("./views/scientificResearch/YProjectDeclaration/YDeclarationDetails.vue")
        },
        { // 纵向项目中检详情
            path: "/YProcessInspectionDetails",
            name: "YProcessInspectionDetails",
            component: () =>
                import ("./views/scientificResearch/YProjectDeclaration/YProcessInspectionDetails.vue")
        },
        { // 纵向项目经费到账
            path: "/YFundsToTheAccount",
            name: "YFundsToTheAccount",
            component: () =>
                import ("./views/scientificResearch/YProjectDeclaration/YFundsToTheAccount.vue")
        },
        { // 横向项目详情
            path: "/XDetails",
            name: "XDetails",
            component: () =>
                import ("./views/scientificResearch/XProjectDeclaration/XDetails.vue")
        },
        { // 横向项目经费到账
            path: "/XFundsToTheAccount",
            name: "XFundsToTheAccount",
            component: () =>
                import ("./views/scientificResearch/XProjectDeclaration/XFundsToTheAccount.vue")
        },

    ]
});