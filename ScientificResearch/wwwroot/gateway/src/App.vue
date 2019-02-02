<template>
    <div id="app">
        <div class="top">
            <div class="wrapper">
                <div class="left">
                    <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                    <router-link to="/">
                    <span>LOGO 数据库门户入口网站</span>
                    </router-link>
                </div>
                <div class="right">
                    <router-link to="/login">
                        <a href="javascript:;">登录</a>
                    </router-link>
                    |
                    <router-link to="/about">
                        <a href="javascript:;"> 测试</a>
                    </router-link>
                </div>
            </div>
        </div>
        <div class="content">
            <router-view/>
        </div>
    </div>
</template>
<style lang="less" type='text/less'>
    @import 'assets/less/Common';

</style>
<style lang="less" type='text/less' scoped>
    #app {
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
