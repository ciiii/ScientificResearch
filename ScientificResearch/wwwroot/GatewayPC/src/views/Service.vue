<template>
    <div class="page-news page-common page-service">
        <div class="main wrapper">
            <el-breadcrumb separator="/" class="nav">
                <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
                <el-breadcrumb-item>文献数据库</el-breadcrumb-item>
            </el-breadcrumb>
            <h4 class="title">文献数据库 Links</h4>
            <el-table class="tableone" border :data="serviceList" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="服务名称">
                    <template slot-scope="scope">
                        <a :href="scope.row.电脑链接地址?scope.row.电脑链接地址:'javascript:;'" class="a-title" @click="clickUrl(scope.row)" target="_blank">
                            <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                            <img class="img-logo" v-if="scope.row.Logo" :src="scope.row.Logo" alt="服务logo" height="20">
                            <img class="img-logo" v-else src="../assets/images/service-logo.jpg" alt="服务logo" height="20">
                            <span class="title">{{scope.row.名称}}</span>
                            <span class="time"><i class="icon iconfont icon-right"></i></span>
                        </a>
                    </template>
                </el-table-column>
            </el-table>
        </div>
    </div>
</template>
<script>
    import {URL_HOSPITAL} from "../assets/js/connect/ConSysUrl";

    export default {
        name: 'service',
        data() {
            return {
                serviceList: []
            }
        },
        mounted() {
            this.getHospitalService();
        },
        methods: {
            clickUrl(el) {
                if (localStorage.myUserInfo) {
                    if (!el.电脑链接地址) {
                        this.$message.warning('您没有订购该服务！');
                    }
                } else {
                    this.$message.error('请先登录！');
                    this.$router.push({path: '/login'});
                }
            },
            getHospitalService: async function () {
                let postData = {
                    医院名称: ''
                }
                if (localStorage.myUserInfo) {
                    postData.医院名称 = JSON.parse(localStorage.myUserInfo).人员.DbKey
                }
                this.serviceList = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_BUY_SERVICE, postData);
            },
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    @import "../assets/less/Common";
    @import "../assets/less/News";

    .page-service {
        .main {
            .el-table{
                .a-title {
                    position: relative;
                    overflow: hidden;
                    display: block;
                }

                i {
                    margin-right: 5px;
                }

                .btn-icon {
                    color: #ccc;
                    margin-right: 5px;
                    float: left;
                }
                .img-logo{
                    float: left;
                    margin-right: 8px;
                }

                .time {
                    position: absolute;
                    right: 0;
                    text-align: right;

                    i {
                        margin-left: 10px;
                    }
                }
            }
        }
    }
</style>
