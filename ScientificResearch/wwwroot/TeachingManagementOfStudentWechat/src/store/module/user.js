import {
    login,
    logout,
    getUserInfo
} from '@/api/user'
import { setToken, getlocalStorage } from '@/libs/util'

export default {
    state: {
        userName: '',
        userId: '',
        avatorImgPath: '',
        access: '',
        hasGetInfo: false,
    },
    mutations: {
        setAvator(state, avatorPath) {
            state.avatorImgPath = avatorPath
        },
        setUserId(state, id) {
            state.userId = id
        },
        setUserName(state, name) {
            state.userName = name
        },
        setAccess(state, access) {
            state.access = access
        },
        setToken(state, data) {
            setToken(data)
        },
        setHasGetInfo(state, status) {
            state.hasGetInfo = status
        },

    },
    getters: {

    },
    actions: {
        // 登录
        handleLogin({ commit }, { userName, password, dbkey }) {
            //userName = userName.trim()
            return new Promise((resolve, reject) => {
                login({
                    userName,
                    password,
                    dbkey
                }).then(res => {
                    const data = res.data.data;

                    commit('setToken', data)
                    resolve(data)

                }).catch(err => {
                    reject(err)
                })
            })
        },
        // 退出登录
        handleLogOut({ state, commit }) {
            commit('setToken', '');
            return new Promise((resolve, reject) => {
                localStorage.clear();

                // logout(state.token).then(() => {
                //         commit('setToken', '')
                //         commit('setAccess', [])
                //         resolve()
                //     }).catch(err => {
                //         reject(err)
                //     })
                // 如果你的退出登录无需请求接口， 则可以直接使用下面三行代码而无需使用logout调用接口
                commit('setToken', '')
                commit('setAccess', [])
                resolve()
            })
        },
        // 获取用户相关信息
        getUserInfo() {
            return new Promise((resolve, reject) => {
                try {
                    // var person = JSON.parse(getlocalStorage('personnel'));
                    getUserInfo().then(res => {
                        const data = res.data
                        resolve(data)
                    }).catch(err => {
                        reject(err)
                    })
                } catch (error) {
                    reject(error)
                }
            })
        },

    }
}