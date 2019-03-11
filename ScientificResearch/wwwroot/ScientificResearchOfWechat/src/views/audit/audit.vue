<template>
  <!-- <van-popup v-model="show"> -->
    <van-panel title="审核">
      <van-cell-group>
        <van-field
          v-model="message"
          label="审核说明："
          type="textarea"
          placeholder="请输入审核说明："
          rows="1"
          autosize
        />
        <div class="btn">
          <van-button type="primary" size="small">通过</van-button>
          <van-button type="warning" size="small">不通过</van-button>
          <van-button type="danger" size="small">终止</van-button>
        </div>
      </van-cell-group>
    </van-panel>
  <!-- </van-popup> -->
</template>
<script>
export default {
  data() {
    return {
      message: "123",
    //   show:true,
    };
  },
  mounted() {},
  methods: {}
};
</script>
<style lang="less" scoped>
.btn {
  display: flex;
  justify-content: space-evenly;
}
</style>
