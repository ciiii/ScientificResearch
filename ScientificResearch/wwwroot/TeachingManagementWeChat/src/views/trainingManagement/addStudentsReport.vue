<template>
  <div class="box">
    <div class="title">
      <i class="icon iconfont icontianjia"></i>
      <span>添加学员报到</span>
    </div>
    <div class="searchBox">
      <div class="searchTitle">
        <span>登录号码</span>
      </div>
      <input type="text"
             placeholder="请输入关键字">
      <i @click="search"
         class="icon iconfont iconsousuo"></i>
    </div>
    <van-button class="sumitBtn"
                v-show="isOriginHei"
                type="primary"
                size="large">提 交</van-button>
  </div>
</template>
<script>
export default {
  data () {
    return {
      isOriginHei: true,
      screenHeight: document.documentElement.clientHeight,
      originHeight: document.documentElement.clientHeight
    }
  },
  created () {

  },
  mounted () {
    let self = this
    window.onresize = function () {
      return (() => {
        self.screenHeight = document.documentElement.clientHeight
      })()
    }
  },
  watch: {
    screenHeight (val) {
      if (this.originHeight > val + 100) { // 加100为了兼容华为的返回键
        this.isOriginHei = false
      } else {
        this.isOriginHei = true
      }
    }
  },
  methods: {
    search () {
      this.$toast('你点了搜索!')
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  background-color: #fff;
  padding: 10px 20px;
  text-align: left;
  .title {
    font-size: 14px;
    padding-bottom: 2px;
    margin-bottom: 10px;
    border-bottom: 2px solid rgb(25, 186, 235);
    .icontianjia {
      color: #ff976a;
    }
    span {
      padding-left: 10px;
    }
  }
  .searchBox {
    display: flex;
    align-items: center;
    border-bottom: 1px solid #f5f3fb;
    margin-top: 20px;
    .searchTitle {
      font-size: 14px;
      padding-right: 10px;
    }
    input {
      border: none;
      line-height: 2;
      width: 70%;
      font-size: 14px;
      flex-grow: 1;
    }
    .iconsousuo {
      padding-left: 10px;
    }
  }
  .sumitBtn {
    position: fixed;
    bottom: 0;
    left: 0;
    z-index: -1;
  }
}
</style>
