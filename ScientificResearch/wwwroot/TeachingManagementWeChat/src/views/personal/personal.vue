<template>
  <div>
    <div class="box">
      <div class="content">
        <img src="@/assets/images/default_avatar.png">
        <p>
          {{this.list.姓名}} -
          <small>（{{this.list.工号}}）</small>
        </p>
        <span>{{this.list.部门名称}}</span>
      </div>
      <div class="account">
        <van-cell title="个人资料"
                  icon="contact"
                  is-link />
      </div>
      <div class="account">
        <van-cell title="查询统计"
                  icon="bar-chart-o"
                  is-link />
        <van-cell title="360评价"
                  icon="flower-o"
                  is-link />
      </div>
      <div class="account"
           @click="outLogin">
        <van-cell title="退出登录"
                  icon="close" />
      </div>
    </div>
    <Footer />
  </div>
</template>
<script>
import Footer from '@/components/footer/footer'
export default {
  components: {
    Footer
  },
  data () {
    return {
      list: {}
    }
  },
  mounted () {
    this.list = JSON.parse(localStorage.getItem('teachingPersonnel'))
  },
  methods: {
    outLogin () {
      this.$dialog
        .confirm({
          message: '确认退出吗？'
        })
        .then(() => {
          // localStorage.clear()
          this.$router.push('/TeachingManagementWeChat')
        })
        .catch(() => {
          // on cancel
        })
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  background-color: #f5f3fb;
  .content {
    padding: 25px 0 35px 0;
    margin: 0 auto;
    margin-bottom: 10px;
    background-color: #01b4fe;
    img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      background-color: #fff;
    }
    p {
      margin: 0;
      font-size: 14px;
      color: #fff;
    }
    span {
      font-size: 14px;
      color: #f5f3fb;
    }
  }
  .account {
    margin: 0 10px;
    padding-bottom: 10px;
    text-align: left;
  }
}
</style>
