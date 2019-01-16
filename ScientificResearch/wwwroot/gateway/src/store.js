import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        myUserInfo: null,
        isLogin: null,
    },
    mutations: {
        myUserInfo(state, data) {
            state.myUserInfo = data;
            localStorage.setItem('myUserInfo', JSON.stringify(data));
        },
        isLogin(state, data) {
            state.isLogin = data;

            localStorage.setItem('isLogin',JSON.stringify(data));

        }
    },
    actions: {}
})