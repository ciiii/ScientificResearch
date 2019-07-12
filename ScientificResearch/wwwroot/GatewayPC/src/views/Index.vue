<template>
    <div class="index page-common">
        <IEunder10 v-if="isDownload"/>
        <div v-else>
            <div class="top">
                <div class="wrapper">
                    <div class="left">
                        <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                        <router-link to="/">
                            <img v-if="logo" :src="http+logo"/>
                            <span v-else><img src="@/assets/images/logo.png"/>爱医生图书馆</span>
                        </router-link>
                    </div>
                    <div class="right" v-if="isDbk">
                        <template v-if="isLogin">
                            {{name}} |
                            <a href="javascript:;" @click="logOut"> 退出</a>
                        </template>
                        <router-link to="/login" v-else>
                            <a href="javascript:;">登录 </a>
                        </router-link>
                    </div>
                </div>
            </div>
            <el-main>
                <router-view></router-view>
            </el-main>
        </div>
    </div>
</template>

<script>
    import Home from './Home';
    import IeUnderTen from '../views/IeUnderTen';
    import {HTTP_URL_HOST, URL_HOSPITAL} from "@/assets/js/connect/ConSysUrl";

    export default {
        name: 'index',
        components: {
            Home,
            IeUnderTen
        },
        data() {
            return {
                isDownload: false,
                isLogin: false,
                name: '',
                logo: '',
                key: '',
                myUserInfo: {},
                http: HTTP_URL_HOST,
                isDbk: false,
                newDbk: ''
            }
        },
        mounted() {
            this.$nextTick(function () {
                if (this.IEVersion()) {
                    this.isDownload = true;
                } else {
                    if (sessionStorage.getItem('isLogin')) {
                        this.isLogin = true;
                    } else {
                        this.isLogin = false;
                    }
                    this.key = this.$route.query.name
                    sessionStorage.setItem('myKey', this.key);
                    this.getHospitalLogo();
                }
            });
        },
        watch: {
            $route(to, from) {
                if(to.query.name != from.query.name){
                    this.key = to.query.name;
                    sessionStorage.setItem('myKey', this.key);
                    this.getHospitalLogo();//重新加载数据
                }
                console.log(this.getStatus(this.$route.path))
            }
        },
        methods: {
            IEVersion: function () {
                let userAgent = navigator.userAgent;
                let isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;
                if (isIE) {
                    let reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                    reIE.test(userAgent);
                    let fIEVersion = parseFloat(RegExp["$1"]);
                    if (fIEVersion < 10) {
                        return true;
                    }
                } else {
                    return false;
                }
            },
            getStatus(urlStr) {
                let urlStrArr = urlStr.split('/')
                return urlStrArr[urlStrArr.length - 1]
            },
            getHospitalLogo: async function () {
                let postData = {
                    k: this.key
                }
                if (this.key && this.key != '') {
                    let data = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_LOGO, postData);
                    if (data) {
                        this.logo = data.Logo;
                        this.isDbk = true;
                        this.name = data.名称;
                    } else {
                        this.isDbk = false;
                        this.$message.error({
                            showClose: true,
                            duration: 4000,
                            message: '地址栏医院名称错误！'
                        });
                    }
                } else {
                    this.logo = '';
                    this.isDbk = false;
                    this.$message.error({
                        showClose: true,
                        duration: 4000,
                        message: '请在地址栏输入医院名称！'
                    });
                }
            },
            logOut() {
                localStorage.removeItem('myUserInfo');
                localStorage.removeItem('Authorization');
                sessionStorage.removeItem('isLogin');
                this.$router.go(0);
            },
        },
    }
</script>
<style lang="less" type='text/less'>
    @import '../assets/less/Common';
</style>
<style lang="less" type='text/less' scoped>
    .index {
        .top {
            width: 100%;
            height: 60px;
            line-height: 60px;
            background: #fff;
            overflow: hidden;
            border-bottom: 1px solid #eee;
            position: fixed;
            left: 0;
            top: 0;
            background: #fff;
            z-index: 99;

            .left {
                float: left;
                overflow: hidden;

                img {
                    width: auto;
                    height: 30px;
                    margin-top: 15px;
                    float: left;
                    margin-right: 10px;
                }

                span {
                    font-size: 18px;
                    margin-left: 5px;
                    float: left;
                }
            }

            .right {
                float: right;

                img {
                    width: 30px;
                    height: 34px;
                    float: left;
                    margin-top: 5px;
                }

                span {
                    float: left;
                }
            }
        }

        .el-main {
            margin-top: 60px;
            padding: 0 0 40px;
            overflow: hidden;
        }

    }
</style>
