import Vue from 'vue';

import 'normalize.css/normalize.css'; // A modern alternative to CSS resets

import ElementUI from 'element-ui';
import { Message, Notification } from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// import locale from 'element-ui/lib/locale/lang/en' // lang i18n

import '@/styles/index.scss'; // global css
import 'babel-polyfill';
import Axios from '@/assets/js/connect/MyAxios';
import VueWechatTitle from 'vue-wechat-title';

import App from './App';
import store from './store';
import router from './router';

import '@/icons'; // icon
import '@/permission'; // permission control
import '../mock'; // simulation data
import '@/assets/js/Common';
import '@/assets/scss/Common.scss';
import { URL_USER } from '@/assets/js/connect/ConSysUrl';
import { getObjArr } from '@/assets/js/Common';
// Vue.use(ElementUI, { locale })
Vue.use(ElementUI);
Vue.use(VueWechatTitle);
Vue.prototype.$http = Axios;
Vue.prototype.Message = Message;
Vue.prototype.Notification = Notification;
Vue.config.productionTip = false;

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
});

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requireAuth)) {
    if (localStorage.getItem('Authorization')) {
      next();
    } else {
      Vue.prototype.$message.error('登录信息已过期,请登重新登录！');
      console.info('meiyou ');
      next({
        path: '/login',
        query: { redirect: to.fullPath }
      });
    }
  } else {
    next();
  }
});
/*
export const initMenu = (router, menu) => {
  if (menu.length === 0) {
    return
  }
  let menus = formatRoutes(menu);
  // 最后添加
  let unfound = { path: '*', redirect: '/404', hidden: true }
  menus.push(unfound)
  router.addRoutes(menus)
  store.commit('ADD_ROUTERS',menus)
}
export const formatRoutes = (aMenu) => {
  const aRouter = []
  aMenu.forEach(oMenu => {
    const {
      path,
      component,
      name,
      icon,
      childrens
    } = oMenu
    if (!validatenull(component)) {
      let filePath;
      const oRouter = {
        path: PC端组件名,
        component(resolve) {
          let componentPath = ''
          if (component === 'Layout') {
            require(['../views/layout/Layout'], resolve)
            return
          } else {
            componentPath = component
          }
          require([`../${componentPath}.vue`], resolve)
        },
        name: 名称,
        icon: 图标,
        children: validatenull(子级菜单) ? [] : formatRoutes(子级菜单)
      }
      aRouter.push(oRouter)
    }

  })
  return aRouter
}
*/
