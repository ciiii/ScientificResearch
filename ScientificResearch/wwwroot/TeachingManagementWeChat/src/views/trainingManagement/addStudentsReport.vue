<template>
  <div class="box">
    <div class="title">
      <i class="icon iconfont icontianjia"></i>
      <span>添加学员报到</span>
    </div>

    <div class="searchBox">
      <div class="searchTitle"
           @click="showAddType">
        <span>登录号码</span>
        <i class="icon iconfont iconxiala1"></i>
      </div>
      <input type="text"
             placeholder="请输入">
    </div>
    <van-actionsheet v-model="show"
                     title="请选择">
      <van-radio-group v-model="radio">
        <van-cell-group>
          <van-cell title="登录号码"
                    clickable
                    @click="radio = '1'">
            <van-radio name="1" />
          </van-cell>
          <van-cell title="学员姓名"
                    clickable
                    @click="radio = '2'">
            <van-radio name="2" />
          </van-cell>
          <van-cell title="专业"
                    clickable
                    @click="radio = '3'">
            <van-radio name="3" />
          </van-cell>
          <van-cell title="年届"
                    clickable
                    @click="radio = '4'">
            <van-radio name="4" />
          </van-cell>
        </van-cell-group>
      </van-radio-group>
    </van-actionsheet>
  </div>
</template>
<script>
export default {
  data () {
    return {
      show: false,
      radio: '1'
    }
  },
  created () {

  },
  mounted () {

  },
  methods: {
    showAddType () {
      this.show = true
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  background-color: #fff;
  padding: 10px;
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
    justify-content: space-between;
    .searchTitle {
      font-size: 14px;
      .iconxiala1 {
        font-size: 12px;
        padding-left: 5px;
      }
    }
    input {
      border: none;
      line-height: 2;
      width: 70%;
    }
  }
}
</style>
