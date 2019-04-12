<template>
  <div class="backtrack" @click="$router.back(-1)" :style="{'left':left+'px','top':top+'px'}">
    <i class="icon iconfont icon-fanhui1"></i> 返回
  </div>
</template>
<script>
export default {
  data() {
    return {
      // :style="{'left':left+'px','top':top+'px'}"
      timer: null,
      currentTop: 0
    };
  },
  created() {
    this.left = document.documentElement.clientWidth - 110;
    this.top = document.documentElement.clientHeight * 0.86;
  },
  mounted() {
    window.addEventListener("scroll", this.handleScrollStart);
  },
  beforeDestroy() {
    window.removeEventListener("scroll", this.handleScrollStart);
  },
  methods: {
    handleScrollStart() {
      this.timer && clearTimeout(this.timer);
      this.timer = setTimeout(() => {
        this.handleScrollEnd();
      }, 300);
      this.currentTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      this.left = document.documentElement.clientWidth - 110;
      console.log(this.currentTop,"111")
      console.log(this.left,"222")
    },
    handleScrollEnd() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      if (scrollTop === this.currentTop) {
        this.left = document.documentElement.clientWidth - 110;
        clearTimeout(this.timer);
      }
      console.log(scrollTop,"333")
    }
  }
};
</script>

<style lang="less" scoped>
.backtrack {
  line-height: 1.6;
  font-size: 14px;
  color: #fff;
  width: 80px;
  height: 26px;
  padding: 6px;
  text-align: center;
  position: fixed;
  //  transition: all 0.3s;
  bottom: 60px;
  // right: 20px;
  border-radius: 20px;
  background-color: rgba(28, 134, 238, 0.5);
}
</style>
