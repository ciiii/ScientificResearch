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
        {
            path: "/index",
            name: "index",
            component: () =>
                import ("./views/index.vue")
        },
        {
            path: "/login",
            name: "login",
            component: () =>
                import ("./views/login.vue")
        },
        {
            path: "/backlog",
            name: "backlog",
            component: () =>
                import ("./views/backlog/backlog.vue")
        }
    ]
});