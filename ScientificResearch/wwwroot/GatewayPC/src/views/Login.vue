<template>
    <div class="page-login">
        <div class="login-top">
            <div class="wrapper">
                <div class="left">
                    <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                    <span>爱医生图书馆</span>
                </div>
            </div>
        </div>
        <div class="content">
            <el-form :model="account" :rules="rules" ref="ruleForm" class="ruleForm">
                <h3 class="form-title">账号密码登录</h3>
                <el-form-item prop="dbKey">
                    <img src="../assets/images/login-hospital.png"/>
                    <el-select v-model="account.dbKey" placeholder="请选择医院">
                        <el-option
                                v-for="item in hospitaList"
                                :key="item" :label="item" :value="item">
                        </el-option>
                    </el-select>
                </el-form-item>
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
                        <el-checkbox label="记住密码" name="type">记住密码</el-checkbox>
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
    import {URL_USER, URL_HOSPITAL} from "../assets/js/connect/ConSysUrl";
    import {_debounce} from "@/assets/js/Common";

    export default {
        name: 'LoginPage',
        data() {
            return {
                logining: false,
                hospitaList: [],
                account: {
                    userId: '',
                    password: '',
                    dbKey: ''
                },
                checked: false,
                rules: {  //表单验证
                    userId: [
                        {required: true, message: '请输入账号！', trigger: 'blur'}
                    ],
                    password: [
                        {required: true, message: '请输入密码！', trigger: 'blur'}
                    ],
                    dbKey: [
                        {required: true, message: '请输选择医院！', trigger: 'blur'}
                    ]
                },
                isDownload: false
            }
        },
        mounted() {
            this.getlocalStorage();
            this.getHospita();
        },
        methods: {
            isLogin: _debounce(function () {
                this.$refs.ruleForm.validate((valid) => {
                    if (valid) {
                        this.dataPost();
                    } else {
                        this.$message.error('信息有误！');
                        return false;
                    }
                });
            }, 300),
            getHospita: async function () {
                this.hospitaList = await this.$http.myGet(URL_HOSPITAL.GET_ENABLE_HOSPITA, '');
            },
            dataPost: async function () {
                let postData = {
                    工号: this.account.userId,
                    密码: this.account.password,
                    dbKey: this.account.dbKey
                }
                let data = await this.$http.myPost(URL_USER.POST_LOGIN, postData);
                this.$message.success('登录成功！');

                localStorage.setItem('myUserInfo', JSON.stringify(data));
                localStorage.setItem('Authorization', JSON.stringify(data.token_type + ' ' + data.access_token));
                localStorage.setItem('gatewayUrl',window.location.href);
                console.info(JSON.parse(localStorage.getItem('myUserInfo')));
                if (this.checked) {
                    localStorage.setItem('myLoginInfo', JSON.stringify(this.account));
                } else {
                    localStorage.removeItem('myLoginInfo');
                }
                this.$router.push({path: '/'});
            },
            //获取html文件名
            getHtmlDocName() {
                let str = window.location.href;
                str = str.substring(str.lastIndexOf("/") + 1);
                str = str.substring(0, str.lastIndexOf("."));
                return str;
            },
            getlocalStorage() {
                if (localStorage.myLoginInfo) {
                    let loginInfo = JSON.parse(localStorage.getItem('myLoginInfo'));
                    this.account.userId = loginInfo.userId;
                    this.account.password = loginInfo.password;
                    this.account.dbKey = loginInfo.dbKey;
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
