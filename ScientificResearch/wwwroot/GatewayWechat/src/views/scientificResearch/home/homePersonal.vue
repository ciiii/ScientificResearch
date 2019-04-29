<template>
  <div>
    <div class="box">
      <div class="content" @click="toAccountChange">
        <img src="@/assets/images/6b9321ffgw.jpg" alt="头像">
        <p>
          {{this.list.姓名}} -
          <small>（{{this.list.工号}}）</small>
        </p>
        <span>{{this.list.部门名称}}</span>
      </div>
      <div class="account">
        <van-cell title="账户修改" icon="manager-o" is-link to="/accountChange"/>
        <van-cell title="密码修改" icon="closed-eye" is-link to="/changePWD"/>
      </div>
      <div class="account" @click="outLogin">
        <van-cell title="退出登录" icon="close"/>
      </div>
    </div>
    <HomeFooter/>
  </div>
</template>
<script>
import HomeFooter from "@/components/footer/homeFooter";
export default {
  components: {
    HomeFooter
  },
  data() {
    return {
      list: {}
    };
  },
  mounted() {
    this.list = JSON.parse(localStorage.getItem("personnel"));
  },
  methods: {
    toAccountChange() {
      this.$router.push("/accountChange");
    },
    outLogin() {
      this.$dialog
        .confirm({
          message: "确认退出吗？"
        })
        .then(() => {
          localStorage.clear();
          //  this.$router.push('/');
          this.$router.push({
            path: "/",
            name: "home",
            params: {
              item: false
            }
          });
        })
        .catch(() => {
          // on cancel
        });
    }
  }
};
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
