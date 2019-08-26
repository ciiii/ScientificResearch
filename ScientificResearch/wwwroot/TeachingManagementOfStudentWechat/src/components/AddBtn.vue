<template>
  <div class="track" @click="callback" :style="{'left':left+'px','top':top+'px'}">
    
    <van-icon name="plus" />
  </div>
</template>
<script>
import { Icon } from 'vant';
export default {
  name:'AddBtn',
  components:{
    Icon
  },
  props:{
    callback:{
      type:Function,
      default:function(){

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
    this.left = document.documentElement.clientWidth - 70;
    this.top = document.documentElement.clientHeight * 0.75;
  },
  mounted() {
    //window.addEventListener("scroll", this.handleScrollStart);
  },
  beforeDestroy() {
    //window.removeEventListener("scroll", this.handleScrollStart);
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
        this.left = document.documentElement.clientWidth - 100;
        clearTimeout(this.timer);
      }
    }
  }
};
</script>

<style lang="less" scoped>
.track {
  line-height: 40px;
  font-size: 30px;
  color: #fff;
  z-index: 99999999999999999;
  width: 50px;
  height: 50px;
  
  text-align: center;
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
  transition: all 0.3s;
  position: fixed;
  border-radius: 50px;
  background-color: #000;
  opacity: 0.5;
  i{
    
    font-size: 26px;
    line-height: 50px;
  }
}
</style>
