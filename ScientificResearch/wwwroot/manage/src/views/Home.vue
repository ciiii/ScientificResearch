<template>
    <div class="home">
        <div class="mian" :gutter="24">
            <el-row :gutter="24" class="items news-items">
                <div class="wrapper">
                    <el-col class="item" span="12">
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
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="name">{{el.名称}}</span>
                                        <span class="time">
                                            <template>
                                                <el-switch class="switch"
                                                           style="display: block"
                                                           v-model="el.是否启用"
                                                           active-color="#13ce66"
                                                           inactive-color="#ff4949"
                                                           @change="hospitalChange(el.是否启用)"
                                                           active-text="启用">
                                                </el-switch>
                                            </template>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                    <el-col class="item" span="12">
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
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="name">{{el.标题}}</span>
                                        <span class="time">{{el.建立时间|dataFormat('yyyy-mm-hh')}}<i
                                                class="icon iconfont icon-right"></i></span></a>
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
                        <el-card :body-style="{ padding: '10px' }">
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
            <!-- <el-row :gutter="24" class="items hospital-items">
                 <div class="wrapper">
                     <h4 class="title">医院列表 Hospital</h4>
                     <el-table class="tableone" border :data="tableData" stripe
                               :header-cell-style="{'text-align':'center'}">
                         <el-table-column label="序号" type="index" show-overflow-tooltip width="50"
                                          align="center"></el-table-column>
                         <el-table-column prop="名称" label="名称"></el-table-column>
                         <el-table-column prop="代码" label="代码" align="center"></el-table-column>
                         <el-table-column prop="联系人" label="联系人" align="center"></el-table-column>
                         <el-table-column prop="联系电话" label="联系电话" align="center"></el-table-column>
                         <el-table-column prop="地址" label="地址" align="center"></el-table-column>
                         <el-table-column label="是否启用" property="是否启用" align="center">
                             <template slot-scope="scope">
                                 <el-switch class="switch"
                                            style="display: block"
                                            v-model="scope.row.是否启用"
                                            active-color="#13ce66"
                                            inactive-color="#ff4949"
                                            @change="switchChange(scope.row.是否启用)"
                                            active-text="启用">
                                 </el-switch>
                             </template>
                         </el-table-column>
                         <el-table-column label="操作" align="center" width="100">
                             <template slot-scope="scope">
                                 <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
                             </template>
                         </el-table-column>
                     </el-table>
                 </div>
             </el-row>-->

        </div>
    </div>
</template>
<script>
    import {Service, News, Hospital} from "@/assets/js/connect/ReturnData";

    export default {
        name: 'Home',
        data() {
            return {
                isOpen: true,
                serviceList: [],
                newsList: [],
                hospitalList: [],
                req: {
                    Index: 1,
                    Size: 10,
                    OrderType: false
                }
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
            handleClick(aaa) {
                console.info('aaa');
                console.info(aaa);
            },
            getService: async function () {
                Service.getServiceList('get', '', (success, strErro, obj) => {
                    if (success) {
                        this.serviceList = obj.data;

                    }
                })
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
                Service.disableService('post', data, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('禁用成功！');
                    } else {
                        el.是否启用 = !el.是否启用;
                    }
                })
            },
            enableService: async function (el) {
                let data = {
                    编号: el.编号
                }
                Service.enableService('post', data, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('启用成功！');
                    } else {
                        el.是否启用 = !el.是否启用;
                    }
                })
            },
            getNews: async function () {
                News.getPagingNewsList('get', this.req, (success, strErro, obj) => {
                    if (success) {
                        this.newsList = obj.data.list;
                    }
                })
            },
            getHospital: async function () {
                Hospital.getHospitalAll('get', '', (success, strErro, obj) => {
                    if (success) {
                        this.hospitalList = obj.data;
                    }
                })
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
                let data = {
                    编号: el.编号
                }
                Hospital.disableHospital('post', data, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('禁用成功！');
                    } else {
                        el.是否启用 = !el.是否启用;
                    }
                })
            },
            enableHospital: async function (el) {
                let data = {
                    编号: el.编号
                }
                Hospital.enableHospital('post', data, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('启用成功！');
                    } else {
                        el.是否启用 = !el.是否启用;
                    }
                })
            },
            LogOut() {
                localStorage.removeItem('myUserInfo');
                sessionStorage.removeItem('Authorization');
                this.$router.push({path: '/login'});
            },
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
    @import '../assets/less/Home';
</style>
