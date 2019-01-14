<template>
    <div class="page-login">
        <div class="login-top">
            <div class="left">
                <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                <span>LOGO 数据库门户入口网站</span>
            </div>
        </div>
        <div class="content">
            <el-form :model="account" :rules="rules" ref="ruleForm" class="ruleForm">
                <h3 class="form-title">账号密码登录</h3>
                <el-form-item prop="WorkNumber">
                    <img src="../assets/images/login-user.png"/>
                    <el-input v-model="account.userId" type="text" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="Password" class="password">
                    <img src="../assets/images/login-key.png"/>
                    <el-input v-model="account.password" type="password" placeholder="密码"></el-input>
                </el-form-item>
                <el-form-item class="remember">
                    <el-checkbox-group>
                        <el-checkbox @change="rememberPassword" v-model="checked">记住密码</el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
                <el-form-item>
                    <el-button class="btn-login" type="primary" height="30" @click="isLogin()" @keyup="isLogin()">立即登录
                    </el-button>
                </el-form-item>
            </el-form>
            <p class="support">技术支持：四川数域创意科技有限公司</p>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'LoginPage',
        data() {
            return {
                logining: false,
                account: {
                    userId: '',
                    password: ''
                },
                checked: false,
                rules: {  //表单验证
                    userId: [
                        {required: true, message: '请输入账号', trigger: 'blur'}
                    ],
                    password: [
                        {required: true, message: '请输入密码', trigger: 'blur'}
                    ]
                },
                isDownload: false
            }
        },
        computed: {
            user() {
                return this.$store.state.myUserInfo
            }
        },
        mounted() {
            this.getlocalStorage();
        },
        methods: {
            isLogin: async function () {
                if (this.account.userId != '' && this.account.password != '') {
                    await this.dataPost();
                    debugger;
                    if (this.checked) {
                        this.setlocalStorage(this.account);
                    } else {
                        localStorage.removeItem('myLoginInfo');
                    }
                    // this.$router.push({path: '/'});

                    /*if( this.$store.state.myUserInfo){
                        var myUserInfo = this.$store.state.myUserInfo;
                        this.list = myUserInfo.permission;
                        this.userInfo = myUserInfo.user;
                    }*/

                } else {
                    this.$message.error({
                        message: '错误，账号或密码不能为空！'
                    });
                }
            },
            dataPost: async function () {
                let postData = {
                    工号: this.account.userId,
                    密码: this.account.password,
                    dbKey: 'ScientificResearch_test'
                }
                let data = await this.$http.myPost(this.$code.URL_POST_LOGIN, postData);
                this.$message.success({
                    message: '登录成功！'
                });
//                var data = await this.$http.myGet(this.$code.URL_GET_DEPARTMENT);
                this.$store.commit('isLogin', true);
                this.$store.commit('myUserInfo', data);
                this.$store.commit('authorization', data.token_type + ' ' + data.access_token);
                if (window.localStorage) {
                    console.info('1111');
                    window.localStorage.setItem('myUserInfo', JSON.stringify(data))
                    sessionStorage.setItem('Authorization', data.token_type + ' ' + data.access_token);
                } else {
                    console.info('2222');
                }
            },
            rememberPassword() {
                if (this.checked) {
                    this.setlocalStorage(this.account);
                } else {
                    localStorage.removeItem('myLoginInfo');
                }
            },
            setlocalStorage(account) {
                localStorage.getItem('myLoginInfo', account);
            },
            getlocalStorage: function () {
                if (localStorage.myLoginInfo) {
                    let loginInfo = JSON.parse(localStorage.getItem('myLoginInfo'));
                    this.account.userId = loginInfo.userId;
                    this.account.password = loginInfo.password;
                    this.checked = true;
                }

            },

        },

    }
</script>
<style lang="less" type='text/less'>
    .page-login {
        .el-form-item {
            .el-input__inner {
                padding: 0 15px 0 38px;
            }
        }
    }
</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/Login';
</style>