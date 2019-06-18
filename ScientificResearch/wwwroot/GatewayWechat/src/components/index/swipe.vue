<template>
  <div class="swipe">
    <van-swipe :autoplay="3000" indicator-color="white">
      <van-swipe-item>
        <img src="@/assets/images/banner-1.jpg" alt>
      </van-swipe-item>
      <van-swipe-item>
        <img src="@/assets/images/banner-2.jpg" alt>
      </van-swipe-item>
      <van-swipe-item>
        <img src="@/assets/images/banner-3.jpg" alt>
      </van-swipe-item>
    </van-swipe>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
};
</script>
<style lang="less" scoped>
.swipe {
  width: 100%;
  img {
    width: 100%;
    height: 155px;
  }
}
</style>
