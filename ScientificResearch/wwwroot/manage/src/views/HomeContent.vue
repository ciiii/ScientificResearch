<template>
    <div class="homeContent">
        <div class="mian">
            <el-row :gutter="24" class="items news-items">
                <div class="wrapper">
                    <el-col class="item" :span="12">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-yiyuan"></i> 医院列表</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <router-link to="/service">
                                        <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                    </router-link>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in hospitalList" :key="el.编号">
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="name" @click="btnService(el)">{{el.名称}}</span>
                                        <span class="time">
                                            <template>
                                                <el-switch class="switch"
                                                           style="display: block"
                                                           v-model="el.是否启用"
                                                           active-color="#13ce66"
                                                           inactive-color="#ff4949"
                                                           @change="hospitalChange(el)"
                                                           active-text="启用">
                                                </el-switch>
                                            </template>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                    <el-col class="item" :span="12">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-quanbuxinwen"></i> 总库新闻</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <router-link to="/news">
                                        <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                    </router-link>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in newsList" :key="el.编号">
                                    <a href="javascript:;" @click="btnDetails(el)">
                                        <span class="btn-icon">
                                            <i class="icon iconfont icon-yuandianxiao"></i>
                                        </span>
                                        <span class="name">{{el.标题}}</span>
                                        <span class="time">
                                            {{el.建立时间|dataFormat('yyyy-mm-hh')}}<i class="icon iconfont icon-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                </div>
            </el-row>
            <el-row :gutter="24" class="items services-items">
                <div class="wrapper">
                    <h4 class="title">服务列表 Services</h4>
                    <el-col :span="6" v-for="el in serviceList" :key="el.编号" class="card-box">
                        <el-card>
                            <div class="icon">{{el.名称.slice(0,1)}}</div>
                            <div class="item-content">
                                <span align="center" class="name">{{el.名称}}</span>
                                <p class="content">{{el.备注}}</p>
                                <el-switch class="switch"
                                           style="display: block"
                                           v-model="el.是否启用"
                                           active-color="#13ce66"
                                           inactive-color="#ff4949"
                                           @change="serviceChange(el)"
                                           active-text="启用"
                                >
                                </el-switch>
                            </div>
                        </el-card>
                    </el-col>
                </div>
            </el-row>
        </div>
        <el-dialog :title="title" :visible.sync="isAddDialog" width="30%" v-if='isAddDialog' :close-on-click-modal="false">
            <div v-if="isService">
                <HospitalService ref="child" @myEvent="getMyEvent" :item="item"></HospitalService>
            </div>
        </el-dialog>
        <el-dialog class="big-dialog" :title="title" :visible.sync="isDetailsDialog" v-if='isDetailsDialog' :close-on-click-modal="false">
            <NewsDetails ref="child" @myEvent="getMyEvent" :item="item"></NewsDetails>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_SERVICE, URL_NEWS, URL_HOSPITAL} from "@/assets/js/connect/ConSysUrl";
    import HospitalService from "@/components/hospital/HospitalService";
    import NewsDetails from "@/components/news/NewsDetails";

    export default {
        name: 'Home',
        components: {
            HospitalService,
            NewsDetails
        },
        data() {
            return {
                isOpen: true,
                serviceList: [],
                newsList: [],
                hospitalList: [],
                req: {
                    Index: 1,
                    Size: 6,
                    OrderType: false
                },
                item: {},
                isService: false,
                isAddDialog: false,
                title: '',
                isDetailsDialog: false
            }
        },
        mounted() {
            this.getService();
            this.getHospital();
            this.getNews();
        },
        methods: {
            serviceChange(el) {
                let title;
                if (el.是否启用) {
                    title = '启用';
                } else {
                    title = '禁用';
                }
                this.enableDisableService(title, el);
            },
            hospitalChange(el) {
                let title;
                if (el.是否启用) {
                    title = '启用';
                } else {
                    title = '禁用';
                }
                this.enableDisableHospital(title, el);

            },
            btnService(data) {
                this.title = '服务订购';
                this.isService = true;
                this.item = data;
                this.isAddDialog = true;
            },
            getMyEvent(val) {
                this.getHospital();
                this.isAddDialog = val;
            },
            getService: async function () {
                this.serviceList = await this.$http.myGet(URL_SERVICE.GET_SERVICE_ALL, '');
            },
            enableDisableService(title, el) {
                this.$confirm('您确定要【' + title + '】此服务吗', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    if (el.是否启用) {
                        this.enableService(el);
                    } else {
                        this.disableService(el);
                    }
                }).catch(() => {
                    el.是否启用 = !el.是否启用;
                });
            },
            disableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_SERVICE.POST_DISABLE_SERVICE, data);
                this.$message.success('禁用成功！');
            },
            enableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_SERVICE.POST_ENABLE_SERVICE, data);
                this.$message.success('启用成功！');
            },
            getNews: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_PANGING_NEWS, this.req);
                this.newsList = data.list;
            },
            getHospital: async function () {
                let data = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_ALL, '');
                this.hospitalList = data;
            },
            enableDisableHospital(title, el) {
                this.$confirm('您确定要【' + title + '】此医院吗', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    if (el.是否启用) {
                        this.enableHospital(el);
                    } else {
                        this.disableHospital(el);
                    }
                }).catch(() => {
                    el.是否启用 = !el.是否启用;
                });
            },
            disableHospital: async function (el) {
                let postData = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_HOSPITAL.POST_DISABLE_HOSPITA, postData);
                this.$message.success('禁用成功！');
            },
            enableHospital: async function (el) {
                let data = {
                    编号: el.编号
                }
                await this.$http.myPost(URL_HOSPITAL.POST_ENABLE_HOSPITA, data);
                this.$message.success('启用成功！');
            },
            btnDetails(data) {
                this.title = '新闻详情';
                this.item = data;
                this.isDetailsDialog = true;
            },
            closeDialog(val) {
                this.isDetailsDialog = val;
            }
        }
    }
</script>
<style lang="less" type='text/less'>
    .home {
        .el-switch__label * {
            font-size: 13px;
        }
    }

    .el-card__body {
        padding: 15px !important;
    }
</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/homeContent';
</style>
