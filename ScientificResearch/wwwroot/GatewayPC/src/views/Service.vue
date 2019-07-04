<template>
    <div class="page-news page-common page-service">
        <div class="main wrapper">
            <div class="btn-back-box">
                <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)" icon="el-icon-back"> 返回
                </el-button>
            </div>
            <h4 class="title">文献数据库 Links</h4>
            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="服务名称">
                    <template slot-scope="scope">
                        <a :href="scope.row.电脑链接地址?scope.row.电脑链接地址:'javascript:;'" class="a-title"
                           @click="clickUrl(scope.row)" target="_blank">
                            <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                            <img class="img-logo" v-if="scope.row.Logo" :src="http+scope.row.Logo" alt="服务logo"
                                 height="20">
                            <img class="img-logo" v-else src="@/assets/images/moren.png" alt="服务logo"
                                 height="20">
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
    import {HTTP_URL_HOST, URL_HOSPITAL} from "../assets/js/connect/ConSysUrl";

    export default {
        name: 'service',
        data() {
            return {
                tableData: [],
                isLogin: false,
                http: HTTP_URL_HOST,
                key:''
            }
        },
        mounted() {
            if (localStorage.getItem('myUserInfo')) {
                this.isLogin = true;
                this.getHospitalService();
            } else {
                this.isLogin = false;
            }
            this.key = sessionStorage.getItem('myKey');
        },
        methods: {
            clickUrl(el) {
                if (this.isLogin) {
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
                postData.医院名称 = JSON.parse(localStorage.myUserInfo).人员.DbKey
                this.tableData = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_BUY_SERVICE, postData);
            },
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    @import "../assets/less/Common";
    @import "../assets/less/News";

    .zw-search-box {
        display: none !important;
    }

    .page-service {
        .main {
            .el-table {
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

                .img-logo {
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
