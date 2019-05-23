<template>
  <div @click="backTop"
       v-show="isShow"
       :style="{'left':left+'px','top':top+'px'}">
    <i class="icon iconfont iconxiaohuojian"></i>
    <p>返回顶部</p>
  </div>
</template>
<script>
export default {
  data () {
    return {
      isShow: false,
      currentTop: 0,
      left: 0
    }
  },
  created () {
    this.left = document.documentElement.clientWidth - 65
    this.top = document.documentElement.clientHeight * 0.85
  },
  mounted () {
    window.addEventListener('scroll', this.scrollToTop)
  },
  destroyed () {
    window.removeEventListener('scroll', this.scrollToTop)
  },

  methods: {
    // 点击图片回到顶部方法，加计时器是为了过渡顺滑
    backTop () {
      let that = this
      let timer = setInterval(() => {
        let ispeed = Math.floor(-that.scrollTop / 5)
        document.documentElement.scrollTop = document.body.scrollTop =
          that.scrollTop + ispeed
        if (that.scrollTop === 0) {
          clearInterval(timer)
        }
      }, 16)
    },

    // 为了计算距离顶部的高度，当高度大于60显示回顶部图标，小于60则隐藏
    scrollToTop () {
      let that = this
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop
      that.scrollTop = scrollTop
      if (that.scrollTop > 60) {
        that.isShow = true
        this.timer && clearTimeout(this.timer)
        this.timer = setTimeout(() => {
          this.handleScrollEnd()
        }, 200)
        this.currentTop =
          document.documentElement.scrollTop || document.body.scrollTop
        this.left = document.documentElement.clientWidth - 20
      } else {
        that.isShow = false
      }
    },
    handleScrollEnd () {
      let scrollTop =
        document.documentElement.scrollTop || document.body.scrollTop
      if (scrollTop === this.currentTop) {
        this.left = document.documentElement.clientWidth - 65
        clearTimeout(this.timer)
      }
    }
  }
}
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
  box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
  transition: all 0.3s;
  position: fixed;
  border-radius: 50%;
  background-color: rgba(0, 0, 0, 0.5);
  p {
    margin: 0;
    font-size: 8px;
  }
}
</style>
