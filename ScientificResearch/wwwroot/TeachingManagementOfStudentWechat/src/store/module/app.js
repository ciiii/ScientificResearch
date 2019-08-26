import {
    getBreadCrumbList,
    setTagNavListInLocalstorage,

    getTagNavListFromLocalstorage,
    getHomeRoute,
    getNextRoute,
    routeHasExist,
    routeEqual,
    getRouteTitleHandled,

} from '@/libs/util'
import { saveErrorLogger, GetMenu } from '@/api/systemSetting'
import router from '@/router'

import config from '@/config'
const { homeName } = config

const closePage = (state, route) => {
    const nextRoute = getNextRoute(state.tagNavList, route)
    state.tagNavList = state.tagNavList.filter(item => {
        return !routeEqual(item, route)
    })
    router.push(nextRoute)
}

export default {
    state: {
        breadCrumbList: [],
        tagNavList: [],
        homeRoute: {},
        errorList: [],
        hasReadErrorPage: false,
        menu: []
    },
    getters: {
        menuList: (state) => (id, callback) => {
            if (state.menu.length > 0) {
                if (typeof callback == 'function') {
                    callback(state.menu.find(menu => menu.菜单.编号 === id))
                }
            } else {
                GetMenu().then((res) => {
                    state.menu = res.data.data;
                    if (typeof callback == 'function') {
                        callback(state.menu.find(menu => menu.菜单.编号 === id))
                    }
                });
            }
        },
        errorCount: state => state.errorList.length
    },
    mutations: {
        setMenu(state, menu) {
            state.menu = menu;
        },
        setBreadCrumb(state, route) {
            state.breadCrumbList = getBreadCrumbList(route, state.homeRoute)
        },
        setHomeRoute(state, routes) {
            state.homeRoute = getHomeRoute(routes, homeName)
        },
        setTagNavList(state, list) {
            let tagList = []
            if (list) {
                tagList = [...list]
            } else tagList = getTagNavListFromLocalstorage() || []
            if (tagList[0] && tagList[0].name !== homeName) tagList.shift()
            let homeTagIndex = tagList.findIndex(item => item.name === homeName)
            if (homeTagIndex > 0) {
                let homeTag = tagList.splice(homeTagIndex, 1)[0]
                tagList.unshift(homeTag)
            }
            state.tagNavList = tagList
            setTagNavListInLocalstorage([...tagList])
        },
        closeTag(state, route) {
            let tag = state.tagNavList.filter(item => routeEqual(item, route))
            route = tag[0] ? tag[0] : null
            if (!route) return
            closePage(state, route)
        },
        addTag(state, { route, type = 'unshift' }) {
            let router = getRouteTitleHandled(route)
            if (!routeHasExist(state.tagNavList, router)) {
                if (type === 'push') state.tagNavList.push(router)
                else {
                    if (router.name === homeName) state.tagNavList.unshift(router)
                    else state.tagNavList.splice(1, 0, router)
                }
                setTagNavListInLocalstorage([...state.tagNavList])
            }
        },

        addError(state, error) {
            state.errorList.push(error)
        },
        setHasReadErrorLoggerStatus(state, status = true) {
            state.hasReadErrorPage = status
        }
    },
    actions: {
        addErrorLog({ commit, rootState }, info) {
            if (!window.location.href.includes('error_logger_page')) commit('setHasReadErrorLoggerStatus', false)
            const { user: { token, userId, userName } } = rootState
            let data = {
                ...info,
                time: Date.parse(new Date()),
                token,
                userId,
                userName
            }
            saveErrorLogger(info).then(() => {
                commit('addError', data)
            })
        }
    }
}