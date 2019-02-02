<template>
    <div class="page-login">
        <div class="login-top">
            <div class="left">
                <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                <span>LOGO 总库管理系统</span>
            </div>
        </div>
        <div class="content">
            <el-form :model="account" :rules="rules" ref="ruleForm" class="ruleForm">
                <h3 class="form-title">账号密码登录</h3>
                <el-form-item prop="userId">
                    <img src="../assets/images/login-user.png"/>
                    <el-input v-model="account.userId" type="text" placeholder="用户名"></el-input>
                </el-form-item>
                <el-form-item prop="password" class="password">
                    <img src="../assets/images/login-key.png"/>
                    <el-input v-model="account.password" type="password" placeholder="密码"
                              @keyup.enter.native="isLogin"></el-input>
                </el-form-item>
                <el-form-item class="remember">
                    <el-checkbox-group v-model="checked">
                        <el-checkbox label="记住密码" name="type"></el-checkbox>
                    </el-checkbox-group>
                </el-form-item>
                <el-form-item>
                    <el-button class="btn-login" type="primary" height="30" @click="isLogin">立即登录
                    </el-button>
                </el-form-item>
            </el-form>
            <p class="support">技术支持：上海路炳通信息技术有限公司</p>
        </div>
    </div>
</template>
<script>
    import {URL_USER} from "@/assets/js/connect/ConSysUrl";
    import {_debounce} from "@/assets/js/Common";

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
        mounted() {
            this.getlocalStorage();
            this.IeVersion();
        },
        methods: {
            IeVersion: function () {
                let userAgent = navigator.userAgent;
                let isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;
                if (isIE) {
                    let reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                    reIE.test(userAgent);
                    let fIEVersion = parseFloat(RegExp["$1"]);
                    if (fIEVersion < 10) {
                        this.$router.push({path: '/IeUnderTen'});
                    }
                } else {
                    return false;
                }
            },
            isLogin: _debounce(function () {
                this.$refs.ruleForm.validate((valid) => {
                    if (valid) {
                        (this.dataPost(), 2000);
                    } else {
                        this.$message.error('信息有误！');
                        return false;
                    }
                });
            }, 300),
            dataPost: async function () {
                let postData = {
                    工号: this.account.userId,
                    密码: this.account.password,
                    dbKey: 'ScientificResearch_Manage'
                }
                let data = await this.$http.myPost(URL_USER.POST_LOGIN, postData);
                this.$message.success('登录成功！');

                localStorage.setItem('myUserInfo', JSON.stringify(data));
                sessionStorage.setItem('Authorization', data.token_type + ' ' + data.access_token);

                if (this.checked) {
                    localStorage.setItem('myLoginInfo', JSON.stringify(this.account));
                } else {
                    localStorage.removeItem('myLoginInfo');
                }
                this.$router.push({path: '/homeContent'});

                // this.$store.commit('isLogin', true);
                // this.$store.commit('authorization', data.token_type + ' ' + data.access_token);
            },
            getlocalStorage() {
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

            .el-form-item__error {
                left: 50px;
            }
        }
    }
</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/Login';
</style>
