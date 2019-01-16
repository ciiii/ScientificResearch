<template>
  <section>
    <img src="../assets/logo.png" alt="logo" class="img">
    <form action>
      <div class="input">
        <input type="text" placeholder="医院">
        <input type="text" placeholder="用户名">
        <input type="text" placeholder="密码">
      </div>
      <div class="btn" @click="onLogin">
        <span>登 录</span>
      </div>
    </form>
  </section>
</template>
<script>
export default {
  name: "login",
  data() {
    return {
        code:null,
        工号:null,
        密码:null,
        DbKey:'ScientificResearch_Test'
    };
  },
  methods: {
    onLogin() {
    //   const { 工号, 密码 } = this;
    //   const data = {
    //     code:this.code,
    //     工号:this.工号,
    //     密码:this.密码,
    //     DbKey:this.DbKey
    //   };

    //   this.$api.BindOpenId(data).then(res => {
    //       console.log(res,"res")
    //       // 登录成功
    //       if (res.token) {
    //         // 储存 token
    //         localStorage.token = res.token;
    //       }
    //     })
    //     .catch(error => {
    //         console.log(error)
    //       // 登录失败
    //       // 验证后端返回的错误字段，如果匹配，提示用户
    //       // axios 配置里必须要 return Promise.reject(error.response.data) 才能拿到错误字段
    //       if (error.xxx == "xxx") {
    //         alert("用户名或密码错误！");
    //       }
    //     });
    }
  }
};
</script>
<style scoped>
.img {
  width: 18rem;
  height: 18rem;
  margin-top: 5rem;
}

.input > input {
  display: block;
  margin: 0 auto;
  padding: 0.6rem 0.5rem;
  margin-top: 0.5rem;
  border: none;
  border-bottom: 1px solid #57d4ce;
  width: 18rem;
  outline-style: none;
  font-size: 1.2rem;
}
.btn {
  margin: auto;
  margin-top: 3rem;
  padding: 0.8rem 0.5rem;
  border-radius: 2rem;
  background-color: #57d4ce;
  color: #fff;
  width: 18rem;
}
</style>
