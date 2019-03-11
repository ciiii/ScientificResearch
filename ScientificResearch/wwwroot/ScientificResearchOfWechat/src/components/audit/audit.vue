<template>
  <van-panel title="审核" class="box">
    <i class="icon iconfont icon-guanbi" @click="back"></i>
    <van-cell-group>
      <van-field
        v-model="value"
        label="审核说明："
        type="textarea"
        placeholder="请输入审核说明···"
        rows="5"
        :autosize="maxHeight"
      />
      <div class="btn">
        <van-button type="primary" size="small">通过</van-button>
        <van-button type="warning" size="small">不通过</van-button>
        <van-button type="danger" size="small">终止</van-button>
      </div>
    </van-cell-group>
  </van-panel>
</template>
<script>
export default {
  props:['show'],
  data() {
    return {
      value: "",
      maxHeight: {
        maxHeight: 90
      }
    };
  },
  mounted() {},
  methods: {
    back(){
      console.log(this.show,"ddd") 
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  i {
    position: absolute;
    top: 25px;
    right: 20px;
  }
  padding: 10px 0;
  .btn {
    display: flex;
    justify-content: space-evenly;
    padding: 10px 0;
  }
}
</style>
