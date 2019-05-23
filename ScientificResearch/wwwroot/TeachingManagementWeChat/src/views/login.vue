
<template>
  <section class="box">
    <div class="nav">
      <img v-if="this.HospitalInformation!==null"
           :src="url+this.HospitalInformation.Logo">
      <img v-else
           :src="this.defaultImg">
    </div>
    <form action="/"
          onsubmit="return false">
      <div class="input">
        <input type="text"
               placeholder="登录号码"
               v-model="工号"
               :maxlength="max"
               :minlength="min"
               @blur="name"
               prop="工号">
        <input type="password"
               placeholder="登录密码"
               v-model="密码"
               :maxlength="max"
               :minlength="min"
               @input="pwd"
               prop="密码">
      </div>
      <van-button class="btn"
                  :disabled="disabled"
                  @click="bind">登 录</van-button>
    </form>
  </section>
</template>
<script>
import { _debounce } from '@/assets/js/common/debounce.js'
export default {
  data () {
    return {
      max: 20,
      min: 3,
      工号: '',
      密码: '',
      stateA: false,
      stateB: false,
      // personnel: JSON.parse(
      //   localStorage.getItem('personnel')
      // ),
      HospitalInformation: JSON.parse(
        localStorage.getItem('HospitalInformation')
      ),
      url:
        process.env.NODE_ENV === 'development'
          ? 'http://192.168.0.99:63739'
          : '',
      Dbkey: process.env.NODE_ENV === 'development'
        ? 'ScientificResearch_Test'
        : this.HospitalInformation.名称,
      defaultImg: require('@/assets/images/logo/logo.png')
    }
  },
  computed: {
    disabled () {
      if (this.stateA && this.stateB) {
        return false
      }
      return true
    }
  },
  created () {
    if (this.HospitalInformation === null) {
      this.getLogo()
    }
  },
  mounted () {
  },
  methods: {
    async getLogo () {
      let para = {
        k: 'ScientificResearch_Test'
      }
      let res = await this.$http.getHospitalInformation(para)
      console.log(res, 'rrr')
      // this.Logo = res.data.Logo
      this.HospitalInformation = res.data
      localStorage.HospitalInformation = JSON.stringify(res.data)
    },
    name () {
      if (!/^.{3,20}$/.test(this.工号)) {
        this.$notify('账号不能少于3位或大于20位！')
        return (this.stateA = false)
      } else {
        return (this.stateA = true)
      }
    },
    pwd () {
      if (!/^.{3,20}$/.test(this.密码)) {
        this.$notify('密码不能少于3位或大于20位！')
        return (this.stateB = false)
      } else {
        return (this.stateB = true)
      }
    },
    // 登录 防抖
    bind: _debounce(function () {
      let para = {
        工号: this.工号,
        密码: this.密码,
        // DbKey: this.HospitalInformation.名称
        DbKey: this.Dbkey
      }
      this.$http
        .Login(para)
        .then(res => {
          if (!res.error) {
            // 登录成功 储存 token
            localStorage.personnel = JSON.stringify(res.data.人员)
            localStorage.token = `${res.data.token_type} ${
              res.data.access_token
              }`
            this.$router.push('/TeachingManagementWeChat')
          } else {
            this.$notify('登录信息错误！')
          }
        })
    }, 500)
  }
}
</script>
<style lang="less" scoped>
.box {
  height: 100vh;
  background-color: #fff;
  .nav {
    img {
      width: 250px;
      height: 60px;
      margin: 50px 0 20px 0;
    }
  }

  .input {
    input {
      display: block;
      margin: 0 auto;
      line-height: 2;
      margin-top: 5px;
      border: none;
      border-bottom: 1px solid #57d4ce;
      width: 250px;
      outline-style: none;
      font-size: 14px;
    }
  }
  .btn {
    margin-top: 40px;
    background-color: #57d4ce;
    color: #fff;
    font-size: 16px;
    width: 260px;
    height: 40px;
    border-radius: 20px;
  }
}
</style>
