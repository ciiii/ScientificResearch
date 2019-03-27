<template>
  <div @click="backTop" v-show="isShow">
    <i class="icon iconfont icon-xiaohuojian"></i>
    <p>返回顶部</p>
  </div>
</template>
<script>
export default {
  data() {
    return {
      isShow: false
    };
  },

  mounted() {
    window.addEventListener("scroll", this.scrollToTop);
  },
  destroyed() {
    window.removeEventListener("scroll", this.scrollToTop);
  },

  methods: {
    // 点击图片回到顶部方法，加计时器是为了过渡顺滑
    backTop() {
      let that = this;
      let timer = setInterval(() => {
        let ispeed = Math.floor(-that.scrollTop / 5);
        document.documentElement.scrollTop = document.body.scrollTop =
          that.scrollTop + ispeed;
        if (that.scrollTop === 0) {
          clearInterval(timer);
        }
      }, 16);
    },

    // 为了计算距离顶部的高度，当高度大于60显示回顶部图标，小于60则隐藏
    scrollToTop() {
      let that = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      that.scrollTop = scrollTop;
      if (that.scrollTop > 30) {
        that.isShow = true;
      } else {
        that.isShow = false;
      }
    }
  }
};
</script>
<style lang="less" scoped>
div {
  line-height: 1.3;
  font-size: 14px;
  color: #fff;
  width: 35px;
  height: 35px;
  padding: 6px;
  text-align: center;
  position: fixed;
  bottom: 110px;
  right: 40px;
  border-radius: 50%;
  background-color: rgba(0, 0, 0, 0.5);
  p{
    margin: 0;
    font-size: 8px;
  }
}
</style>
