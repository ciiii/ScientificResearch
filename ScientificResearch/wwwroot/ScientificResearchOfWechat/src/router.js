import Vue from "vue";
import Router from "vue-router";

Vue.use(Router);

export default new Router({
    routes: [{
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
        { // 待办
            path: "/backlog",
            name: "backlog",
            component: () =>
                import ("./views/backlog/backlog.vue")
        },
        { // 学习
            path: "/learning",
            name: "learning",
            component: () =>
                import ("./views/learning/learning.vue")
        },
        { // 我的
            path: "/personal",
            name: "personal",
            component: () =>
                import ("./views/personal/personal.vue")
        },
        { // 登录
            path: "/login",
            name: "login",
            component: () =>
                import ("./views/login.vue")
        },
        { // 新闻详情
            path: "/newsContent",
            name: "newsContent",
            component: () =>
                import ("./views/newsContent/newsContent.vue")
        },
        // { // 我的待办详情
        //     path: "/toDoDetails",
        //     name: "toDoDetails",
        //     component: () =>
        //         import ("./components/toDoDetails/toDoDetails.vue")
        // },
        { // 主办讲座列表
            path: "/lectureList",
            name: "lectureList",
            component: () =>
                import ("./views/lecture/lectureList.vue")
        },
        { // 讲座反馈列表
            path: "/feedbackList",
            name: "feedbackList",
            component: () =>
                import ("./views/feedbackList/feedbackList.vue")
        },
        { // 参会信息列表
            path: "/meetingInformation",
            name: "meetingInformation",
            component: () =>
                import ("./views/meetingInformation/meetingInformation.vue")
        }, ,
        { // 参会反馈列表
            path: "/meetingFeedbackList",
            name: "meetingFeedbackList",
            component: () =>
                import ("./views/meetingInformation/meetingFeedbackList.vue")
        },
        { // 参会经费报销列表
            path: "/expenseList",
            name: "expenseList",
            component: () =>
                import ("./views/meetingInformation/expenseList.vue")
        },
        { // 某参加会议报销列表
            path: "/someExpenseList",
            name: "someExpenseList",
            component: () =>
                import ("./views/meetingInformation/someExpenseList.vue")
        },
        { // 导入认领
            path: "/paperClaim",
            name: "paperClaim",
            component: () =>
                import ("./views/backlog/paper/paperClaim.vue")
        },
        { // 论文管理
            path: "/paperManagement",
            name: "paperManagement",
            component: () =>
                import ("./views/backlog/paper/paperManagement.vue")
        },
        { // 论文详情
            path: "/paperDetails",
            name: "paperDetails",
            component: () =>
                import ("./views/backlog/paper/paperDetails.vue")
        },
        { // 著作管理
            path: "/workManagement",
            name: "workManagement",
            component: () =>
                import ("./views/backlog/work/workManagement.vue")
        },
        { // 著作详情
            path: "/workDetails",
            name: "workDetails",
            component: () =>
                import ("./views/backlog/work/workDetails.vue")
        },
        { // 专利管理
            path: "/patentManagement",
            name: "patentManagement",
            component: () =>
                import ("./views/backlog/patent/patentManagement.vue")
        },
        { // 专利详情
            path: "/patentDetails",
            name: "patentDetails",
            component: () =>
                import ("./views/backlog/patent/patentDetails.vue")
        },
        { // 获奖管理
            path: "/resultsManagement",
            name: "resultsManagement",
            component: () =>
                import ("./views/backlog/results/resultsManagement.vue")
        },
        { // 获奖详情
            path: "/resultsDetails",
            name: "resultsDetails",
            component: () =>
                import ("./views/backlog/results/resultsDetails.vue")
        },
        { // 成果总览
            path: "/achievementAll",
            name: "achievementAll",
            component: () =>
                import ("./views/backlog/achievementAll/achievementAll.vue")
        },
        { // 审核
            path: "/audit",
            name: "audit",
            component: () =>
                import ("./views/audit/audit.vue")
        }
    ]
});