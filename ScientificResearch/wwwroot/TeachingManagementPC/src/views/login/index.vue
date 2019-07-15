<template>
  <div class="login-container">
    <div class="logo-box">
      <img src="@/assets/images/logo.png" alt="logo">
    </div>
    <el-form ref="ruleForm" :model="account" :rules="loginRules" class="login-form" auto-complete="on"
             label-position="left">
      <h3 class="title"><img src="@/assets/images/logo-3.png"></h3>
      <el-form-item prop="userId">
        <span class="svg-container">
          <svg-icon icon-class="user"/>
        </span>
        <el-input v-model="account.userId" name="userId" type="text" auto-complete="on" placeholder="请输入账号"/>
      </el-form-item>
      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password"/>
        </span>
        <el-input
          :type="pwdType"
          v-model="account.password"
          name="password"
          auto-complete="on"
          placeholder="请输入密码"
          @keyup.enter.native="handleLogin"/>
        <span class="show-pwd" @click="showPwd">
          <svg-icon :icon-class="pwdType === 'password' ? 'eye' : 'eye-open'"/>
        </span>
      </el-form-item>
      <el-form-item class="remember">
        <el-checkbox-group v-model="checked">
          <el-checkbox label="记住密码" name="type">记住密码</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" style="width:100%;"
                   @click.native.prevent="handleLogin">

          <i class="el-icon-loading" v-if="isLoading"></i> 登 录
        </el-button>
      </el-form-item>
      <p class="support">技术支持：上海路炳通信息技术有限公司</p>
    </el-form>
  </div>
</template>

<script>
  // import { isvalidUsername } from '@/utils/validate';
  import { URL_USER } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, setObjArr, getObjArr, removeLocalStorage,getQueryString } from '@/assets/js/Common';

  export default {
    name: 'Login',
    data() {
      return {
        account: {
          userId: '',
          password: ''
        },
        loginRules: {
          userId: [{ required: true, trigger: 'blur', message: '请输入账号！' }],
          password: [{ required: true, trigger: 'blur', message: '请输入密码！' }]
        },
        pwdType: 'password',
        checked: false,
        loading: false,
        isLoading: false
      };
    },
    mounted() {
      this.getlocalStorage();
    },
    methods: {
      showPwd() {
        if (this.pwdType === 'password') {
          this.pwdType = '';
        } else {
          this.pwdType = 'password';
        }
      },
      handleLogin: _debounce(function() {
        this.isLoading = true;
        this.$refs.ruleForm.validate((valid) => {
          if (valid) {
            (this.dataPost(), 2000);
          } else {
            this.isLoading = false;
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      dataPost: async function() {
        let postData = {
          工号: this.account.userId,
          密码: this.account.password,
          dbKey: getQueryString('name')//'ScientificResearch_Test' 
        };
        let data = await this.$http.myPost(URL_USER.POST_LOGIN, postData);
        this.$message.success('登录成功！');
        this.isLoading = false;

        setObjArr('userInfo', data);
        sessionStorage.mUserId = data.人员.编号;
        localStorage.setItem('Authorization', data.token_type + ' ' + data.access_token);

        if (this.checked) {
          setObjArr('myLoginInfo', this.account);
        } else {
          removeLocalStorage('myLoginInfo');
        }
        localStorage.setItem('loginUrl', this.$route.path);
        localStorage.setItem('isEntryLogin', false);

        this.$router.push({ path: '/' });
      },
      getlocalStorage() {
        if (localStorage.getItem('myLoginInfo')) {
          let loginInfo = getObjArr('myLoginInfo');
          this.account.userId = loginInfo.userId;
          this.account.password = loginInfo.password;
          this.checked = true;
        }
      }
    }
  };
</script>

<style type="text/scss" lang="scss">
  $bg: #2d3a4b;
  $light_gray: #eee;

  /* reset element-ui css */
  .login-container {
    .el-input {
      display: inline-block;
      height: 47px;
      width: 85%;

      input {
        background: transparent;
        border: 0px;
        -webkit-appearance: none;
        border-radius: 0px;
        padding: 12px 5px 12px 15px;
        color: $light_gray;
        height: 47px;

        &:-webkit-autofill {
          -webkit-box-shadow: 0 0 0px 1000px $bg inset !important;
          -webkit-text-fill-color: #fff !important;
        }
      }
    }

    .el-form-item {
      border: 1px solid rgba(255, 255, 255, 0.1);
      background: rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      color: #454545;
    }

    .el-checkbox__label {
      color: #fff;
    }
  }

</style>

<style type="text/scss" lang="scss" scoped>
  $bg: #2d3a4b;
  $dark_gray: #889aa4;
  $light_gray: #eee;
  .login-container {
    position: fixed;
    height: 100%;
    width: 100%;
    background-color: $bg;

    .logo-box {
      position: fixed;
      left: 0;
      top: 0;
      width: 100%;
      height: 60px;
      padding: 12px 20px;
      background: #fff;

      img {
        height: 35px;
      }
    }

    .login-form {
      position: absolute;
      left: 0;
      right: 0;
      width: 450px;
      max-width: 100%;
      padding: 35px 35px 15px 35px;
      margin: 120px auto;
      border: 1px solid #323f50;
      box-shadow: 0 5px 20px #0d1f31;
      border-radius: 10px;
    }

    .remember {
      border: none;
      background: none;

      .el-checkbox-group {
        line-height: 0;
      }
    }

    .tips {
      font-size: 14px;
      color: #fff;
      margin-bottom: 10px;

      span {
        &:first-of-type {
          margin-right: 16px;
        }
      }
    }

    .svg-container {
      padding: 6px 5px 6px 15px;
      color: $dark_gray;
      vertical-align: middle;
      width: 30px;
      display: inline-block;
    }

    .title {
      margin: 0px auto 40px auto;
      overflow: hidden;
      text-align: center;

      img {
        height: 52px;
      }

      span {
        font-size: 26px;
        font-weight: 400;
        color: $light_gray;
        font-weight: bold;
        float: left;
      }
    }

    .show-pwd {
      position: absolute;
      right: 10px;
      top: 7px;
      font-size: 16px;
      color: $dark_gray;
      cursor: pointer;
      user-select: none;
    }

    .support {
      font-size: 14px;
      color: #868788;
      margin-top: 40px;
      position: absolute;
      bottom: -100px;
      left: 50%;
      margin-left: -126px;
    }
  }
</style>
