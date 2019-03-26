<template>
  <footer class="footer_nav">
    <van-tabbar v-model="active" active-color="#1296db">
      <van-tabbar-item icon="home-o" to="/alternative">首页</van-tabbar-item>
      <van-tabbar-item icon="hot-o" to="/alternative">前沿</van-tabbar-item>
      <van-tabbar-item icon="service-o" to="/alternative">视听</van-tabbar-item>
      <van-tabbar-item icon="volume-o" to="/alternative">公告</van-tabbar-item>
      <van-tabbar-item icon="user-o" to="/alternative">我的</van-tabbar-item>
    </van-tabbar>
    <div class="empty"></div>
  </footer>
</template>

<script>
export default {
  data() {
    return {
      footerlist: [],
      active: 0
    };
  },
  mounted() {},
  methods: {}
};
</script>

<style lang="less" scoped>
.empty {
  height: 50px;
}
</style>

