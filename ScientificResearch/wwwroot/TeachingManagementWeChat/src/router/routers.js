export default [{
        path: '/login',
        name: 'login',
        component: () =>
            import ('@/view/login'),
        meta: {
            title: '登录'
        }
    },
    {
        path: '/home',
        name: 'home',
        component: () =>
            import ('@/view/home'),
        meta: {
            title: '首页'
        }
    },
    {
        path: '/message',
        name: 'message',
        component: () =>
            import ('@/view/message'),
        meta: {
            title: '消息'
        }
    },
    {
        path: '/mine',
        name: 'mine',
        component: () =>
            import ('@/view/mine'),
        meta: {
            title: '我的'
        }

    },
    {
        path: '/mine/training',
        name: 'training',
        component: () =>
            import ('@/view/mine/training.vue'),
        meta: {
            title: '培训信息'
        }
    },
    {
        path: '/mine/personal',
        name: 'personal',
        component: () =>
            import ('@/view/mine/personal.vue'),
        meta: {
            title: '个人信息'
        }
    },
    {
        path: '/mine/updatePassword',
        name: 'updatePassword',
        component: () =>
            import ('@/view/mine/updatePassword.vue'),
        meta: {
            title: '修改密码'
        }
    },

    {
        path: '/cart',
        name: 'cart',
        component: () =>
            import ('@/view/cart'),
        meta: {
            title: '购物车'
        }
    },
    {
        path: '/goods',
        name: 'goods',
        component: () =>
            import ('@/view/goods'),
        meta: {
            title: '商品详情'
        }
    },

    {
        path: '/401',
        name: 'error_401',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/error-page/401.vue')
    },
    {
        path: '/500',
        name: 'error_500',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/error-page/500.vue')
    },
    {
        path: '*',
        name: 'error_404',
        meta: {
            hideInMenu: true
        },
        component: () =>
            import ('@/view/error-page/404.vue')
    }
];
