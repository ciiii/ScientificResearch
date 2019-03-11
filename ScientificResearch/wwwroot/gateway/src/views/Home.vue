<template>
    <div class="home">
        <IEunder10 v-if="isDownload"/>
        <div v-else>
            <div class="top">
                <div class="wrapper">
                    <div class="left">
                        <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                        <router-link to="/">
                            <span>LOGO 数据库门户入口网站</span>
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
                        <router-link to="/about">
                            <a href="javascript:;">| 测试 </a>
                        </router-link>
                        <a href="javascript:;" @click="getNews"> | 新闻</a>
                    </div>
                </div>
            </div>
            <HomeContent/>
        </div>
    </div>
</template>

<script>
    import HomeContent from '../views/HomeContent';
    import IeUnderTen from '../views/IeUnderTen';

    export default {
        name: 'home',
        components: {
            HomeContent,
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
                this.$router.replace({path: '/login'});
            },
            getNews(){
                this.$router.push({path: '/news'});
            }
        },
    }
</script>
<style lang="less" type='text/less'>
    @import '../assets/less/Common';
</style>
<style lang="less" type='text/less' scoped>
    .home {
        .top {
            height: 60px;
            line-height: 60px;
            background: #fff;
            overflow: hidden;
            border-bottom: 1px solid #eee;

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

    }
</style>
