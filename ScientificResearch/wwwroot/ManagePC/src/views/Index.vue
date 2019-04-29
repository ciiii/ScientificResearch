<template>
    <div class="index page-common">
        <el-container>
            <el-header>
                <div class="left">
                    <div class="logo">
                        <router-link to="/home">LOGO 总库管理系统</router-link>
                    </div>
                    <el-menu class="el-menu-demo" :default-active="activIndex" mode="horizontal"
                             @select="handleSelect" :router="true">
                        <el-menu-item index="/index">首页</el-menu-item>
                        <el-menu-item index="/hospital">医院</el-menu-item>
                        <el-menu-item index="/service">服务</el-menu-item>
                        <el-menu-item index="/news">新闻</el-menu-item>
                    </el-menu>
                </div>
                <div class="right">
                    <span class="user-img"><img src="../assets/images/user.jpg"></span> {{myUserInfo.人员.DbKey}}
                    |
                    <a href="javascript:;" @click="logOut()">退出</a>
                </div>
            </el-header>
            <el-main>
                <router-view></router-view>
            </el-main>
        </el-container>
    </div>
</template>
<script>
    export default {
        name: 'index',
        data() {
            return {
                activIndex: '/index',
                myUserInfo: {},
            }
        },
        methods: {
            logOut() {
                this.$confirm('确认退出吗?', '提示', {
                    type: 'warning'
                }).then(() => {
                    localStorage.removeItem('myUserInfo');
                    sessionStorage.removeItem('Authorization');
                    this.$router.push({path: '/'});
                })
            },
            handleSelect(index, path) {
                this.activIndex = index;
            }
        },
        created() {
            if (localStorage.myUserInfo) {
                this.myUserInfo = JSON.parse(localStorage.getItem('myUserInfo'));
            }
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    @import "../assets/less/Index.less";
</style>
