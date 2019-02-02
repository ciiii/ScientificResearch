<template>
  <div class="swipe">
    <van-swipe :autoplay="3000" indicator-color="white">
      <van-swipe-item>
        <img src="@/assets/images/2230625_03.png" alt>
      </van-swipe-item>
      <van-swipe-item>
        <img src="@/assets/images/2607599.jpg" alt>
      </van-swipe-item>
      <van-swipe-item>
        <img src="@/assets/images/2607601.jpg" alt>
      </van-swipe-item>
      <van-swipe-item>
        <img src="@/assets/images/2852659.jpg" alt>
      </van-swipe-item>
    </van-swipe>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  mounted() {},
  methods: {}
};
</script>
<style lang="less" scoped>
.swipe {
  width: 100%;
  img {
    width: 100%;
    height: 200px;
  }
}
</style>
