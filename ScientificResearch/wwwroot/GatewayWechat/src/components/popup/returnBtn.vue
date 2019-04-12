<template>
  <div class="backtrack" @click="$router.back(-1)" :style="{'left':left+'px','top':top+'px'}">
    <i class="icon iconfont icon-fanhui1"></i> 返回
  </div>
</template>
<script>
export default {
  data() {
    return {
      timer: null,
      currentTop: 0,
      left:0
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
      }, 200); 
      this.currentTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      this.left = document.documentElement.clientWidth - 40;
    },
    handleScrollEnd() {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop;
      if (scrollTop === this.currentTop) {
        this.left = document.documentElement.clientWidth - 110;
        clearTimeout(this.timer);
      }
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
  padding: 6px;
  text-align: center;
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
  transition: all 0.3s;
  position: fixed;
  border-radius: 20px;
  background-color: rgba(28, 134, 238, 0.5);
}
</style>
