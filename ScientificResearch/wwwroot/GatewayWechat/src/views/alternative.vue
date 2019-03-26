<template>
  <div class="box">
    <img src="@/assets/images/nothing.png" alt="空空如也">
    <p>玩命开发中，去浏览一下其它信息吧...</p>
    <ReturnBtn/>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  created() {},
  mounted() {},
  methods: {}
};
</script>
<style lang="less" scoped>
.box {
  height: 100vh;
  margin: 30% auto;
  > img {
    width: 2.8rem;
    height: 1.9rem;
  }
  > p {
    font-size: 12px;
    text-align: center;
    color: #999;
  }
}
</style>
