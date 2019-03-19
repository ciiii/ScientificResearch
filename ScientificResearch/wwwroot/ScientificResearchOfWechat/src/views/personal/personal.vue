<template>
  <div>
    <div class="box">
      <div class="content" @click="toAccountChange">
        <img src="../../assets/images/6b9321ffgw.jpg" alt="头像">
        <p>这里是显示用户名的</p>
      </div>
      <div class="account">
        <van-cell title="账户修改" icon="manager-o" is-link to="/accountChange"/>
        <van-cell title="密码修改" icon="closed-eye" is-link to="/changePWD"/>
      </div>
      <div class="account">
        <van-cell title="参加会议次数" icon="bar-chart-o" value="12" to='/'/>
      </div>
      <div class="account">
        <van-cell title="我的项目数" icon="apps-o" value="10"/>
        <van-cell title="我的文章数" icon="notes-o" value="10"/>
      </div>
    </div>
    <navFooter/>
  </div>
</template>
<script>
import navFooter from "@/../src/components/footer/footer";
export default {
  components: {
    navFooter
  },
  data() {
    return {};
  },
  created() {
    document.title = "科研管理 - 个人中心";
  },
  mounted() {},
  methods: {
    toAccountChange() {
      this.$router.push("/accountChange");
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  background-color: #f5f3fb;
  .content {
    padding: 35px 0;
    margin: 0 auto;
    margin-bottom: 10px;
    background-color: #01b4fe;
    img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
    }
    p {
      margin: 0;
      font-size: 14px;
      color: #fff;
    }
  }
  .account {
    margin: 0 10px;
    padding-bottom: 10px;
    text-align: left;
  }
}
</style>
