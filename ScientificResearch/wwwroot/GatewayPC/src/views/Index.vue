<template>
    <div class="index page-common">
        <IEunder10 v-if="isDownload"/>
        <div v-else>
            <div class="top">
                <div class="wrapper">
                    <div class="left">
                        <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                        <router-link to="/">
                            <span>LOGO 门户入口网站</span>
                        </router-link>
                    </div>
                    <div class="right">
                        <router-link to="/login" v-if="!isLogin">
                            <a href="javascript:;">登录 </a>
                        </router-link>
                        <template v-if="isLogin">
                            {{name}} |
                            <a href="javascript:;" @click="logOut"> 退出</a>
                        </template>
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
                name: ''
            }
        },
        mounted() {
            this.$nextTick(function () {
                if (this.IEVersion()) {
                    this.isDownload = true;
                } else {
                    if (localStorage.myUserInfo) {
                        let myUserInfo = JSON.parse(localStorage.getItem('myUserInfo'));
                        this.name = myUserInfo.人员.姓名;
                        this.isLogin = true;
                    } else {
                        this.isLogin = false;
                    }
                }
            });
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
            logOut() {
                localStorage.removeItem('myUserInfo');
                sessionStorage.removeItem('Authorization');
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
            top:0;
            background: #fff;
            z-index: 99;

            .left {
                float: left;
                overflow: hidden;

                img {
                    width: auto;
                    height: 38px;
                    margin-top: 13px;
                    float: left;

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
        .el-main{
            margin-top: 60px;
            padding: 0 0 40px;
            overflow: hidden;
        }

    }
</style>
