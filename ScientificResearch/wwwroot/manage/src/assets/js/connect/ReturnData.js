import {URL_USER, URL_SERVICE, URL_NEWS,URL_HOSPITAL} from "@/assets/js/connect/ConSysUrl";
import Axios from '@/assets/js/connect/MyAxios.js';

const User = {
    userLogin(type, options, userLoginListener) {
        Axios.$http.getDatas(URL_USER.POST_LOGIN, type, options, userLoginListener);
    },


}

const Service = {
    getServiceList(type, options, getServiceListListener) {
        Axios.$http.getDatas(URL_SERVICE.GET_SERVICE_ALL, type, options, getServiceListListener);
    },
    getEnableService(type, options, getEnableServiceListener) {
        Axios.$http.getDatas(URL_SERVICE.GET_ENABLE_SERVICE, type, options, getEnableServiceListener);
    },
    addOrEditService(type, options, addOrEditServiceListener) {
        Axios.$http.getDatas(URL_SERVICE.POST_ADD_OR_EDIT_SERVICE, type, options, addOrEditServiceListener);
    },
    disableService(type, options, disableServiceListener) {
        Axios.$http.getDatas(URL_SERVICE.POST_DISABLE_SERVICE, type, options, disableServiceListener);
    },
    enableService(type, options, enableServiceListener) {
        Axios.$http.getDatas(URL_SERVICE.POST_ENABLE_SERVICE, type, options, enableServiceListener);
    },

}

const News = {
    getPagingNewsList(type, options, getPagingNewsListListener) {
        Axios.$http.getDatas(URL_NEWS.GET_PANGING_NEWS, type, options, getPagingNewsListListener);
    },
    addOrEditNews(type, options, addOrEditNewsListener) {
        Axios.$http.getDatas(URL_NEWS.POST_ADD_OR_EDIT_NEWS, type, options, addOrEditNewsListener);
    },
    deleteNews(type, options, deleteNewsListener) {
        Axios.$http.getDatas(URL_NEWS.POST_DELETE_NEWS, type, options, deleteNewsListener);
    },


}

const Hospital = {
    getHospitalAll(type, options, getHospitalAllListener) {
        Axios.$http.getDatas(URL_HOSPITAL.GET_HOSPITAL_ALL, type, options, getHospitalAllListener);
    },
    getEnableHospital(type, options, getEnableHospitalListener) {
        Axios.$http.getDatas(URL_HOSPITAL.GET_ENABLE_HOSPITA, type, options, getEnableHospitalListener);
    },
    addOrEditHospital(type, options, addOrEditHospitalListener) {
        Axios.$http.getDatas(URL_HOSPITAL.POST_ADD_OR_EDIT_HOSPITA, type, options, addOrEditHospitalListener);
    },
    disableHospital(type, options, disableHospitalListener) {
        Axios.$http.getDatas(URL_HOSPITAL.POST_DISABLE_HOSPITA, type, options, disableHospitalListener);
    },
    enableHospital(type, options, enableHospitalListener) {
        Axios.$http.getDatas(URL_HOSPITAL.POST_ENABLE_HOSPITA, type, options, enableHospitalListener);
    },
    getHospitalService(type, options, getHospitalServiceListener) {
        Axios.$http.getDatas(URL_HOSPITAL.GET_HOSPITAL_SERVICE, type, options, getHospitalServiceListener);
    },
    addOrEditHospitalService(type, options, addOrEditHospitalServiceListener) {
        Axios.$http.getDatas(URL_HOSPITAL.POST_ADD_OR_EDIT_HOSPITAL_SERVICE, type, options, addOrEditHospitalServiceListener);
    },

}

export {
    User,
    Service,
    News,
    Hospital

};