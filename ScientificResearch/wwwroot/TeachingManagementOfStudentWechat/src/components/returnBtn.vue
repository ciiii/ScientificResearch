<template>
  <div class="backtrack" @click="callback" :style="{'left':left+'px','top':top+'px'}">
    <i class="icon iconfont icon-fanhui1"></i> 返回
  </div>
</template>
<script>
export default {
  name:'ReturnBtn',
   props:{
    callback:{
      type:Function,
      default:function(){
        $router.back(-1);
      }
    }
  },
  data() {
    return {
      timer: null,
      currentTop: 0,
      left: 0,
      top: 0
    };
  },
  created() {
    this.left = document.documentElement.clientWidth - 80;
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
        this.left = document.documentElement.clientWidth - 80;
        clearTimeout(this.timer);
      }
    }
  }
};
</script>

<style lang="less" scoped>
.backtrack {
  line-height: 1.6;
  font-size: 13px;
  color: #fff;
  z-index: 99999999999999999;
  width: 60px;
  padding: 6px;
  text-align: center;
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
  transition: all 0.3s;
  position: fixed;
  border-radius: 20px;
  background-color: rgba(28, 134, 238, 0.5);
  background-color: #000;
  opacity: 0.3;
  i{
    margin-right: 2px;
    font-size: 14px;
  }
}
</style>
