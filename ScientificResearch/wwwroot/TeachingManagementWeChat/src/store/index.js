import Vue from 'vue'
import Vuex from 'vuex'

import user from './module/user'
import app from './module/app'
import { mainPage } from '@/libs/util'

Vue.use(Vuex)
var store = new Vuex.Store({
    state: {
        //
    },
    mutations: {
        //
    },
    actions: {
        //
    },
    modules: {
        user,
        app
    }
});
const shouldUseTransition = !/transition=none/.test(location.href);

store.registerModule('vux', { // 名字自己定义
    state: {
        isLoading: false,
        direction: shouldUseTransition ? 'forward' : '',
        showTabnav: true,
        title: '',
        tabnavIndex: 0
    },
    mutations: {
        updateTitle(state, title) {
            state.title = title;
        },
        updateLoadingStatus(state, payload) {
            state.isLoading = payload.isLoading
        },
        updateDirection(state, payload) {
            if (!shouldUseTransition) {
                return
            }
            state.direction = payload.direction
        },
        updateShowTabnav(state, path) {
            state.tabnavIndex = mainPage.indexOf(path);
            state.showTabnav = state.tabnavIndex > -1;
        }
    }

});

export default store;
