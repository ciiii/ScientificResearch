<template>
  <div>
    <!-- <form action="/" v-if="isShow" class="search">
      <van-search
        v-model="search"
        placeholder="请输入搜索关键词"
        show-action
        @search="onSearch"
        @cancel="onCancel"
      />
    </form>-->
    <ul class="logo" v-show="condition">
      <li>
        <a href="/">
          <img src="@/assets/images/iocn/homeLogo.jpg" alt="科研logo">
        </a>
      </li>
      <!-- <li @click="searchText">
        <i class="icon iconfont icon-sou-suo"></i>
        <span>检索</span>
      </li>-->
    </ul>
  </div>
</template>
<script>
export default {
  data() {
    return {
      // search: null,
      // isShow: false,
      condition: true
    };
  },
  mounted() {},
  methods: {
    // searchText() {
    //   if (localStorage.token) {
    //     this.condition = false;
    //     this.isShow = true;
    //   } else {
    //     this.$notify({
    //       message: "请先登录",
    //       duration: 1500,
    //       background: "rgba(0,0,0,0.8)"
    //     });
    //     this.$router.push("/login");
    //   }
    // },
    // // 用户点击键盘回车/搜索触发事件
    // onSearch() {
    //   console.log("点击键盘回车");
    // },
    // // 用户点击取消触发事件
    // onCancel() {
    //   this.isShow = false;
    //   this.condition = true;
    // }
  }
};
</script>
<style lang="less" scoped>
div {
  background-color: #fff;
  .search {
    height: 55px;
  }
  .logo {
    font-size: 18px;
    display: flex;
    li:nth-child(1) {
      flex-grow: 1;
      img {
        height: 50px;
      }
    }
    li:nth-child(2) {
      display: flex;
      flex-direction: column;
      font-size: 14px;
      padding: 8px;
    }
  }
}
</style>
