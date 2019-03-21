<template>
  <div class="backtrack" @click="$router.back(-1)">
    <i class="icon iconfont icon-fanhui1"></i> 返回
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {}
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
  bottom: 60px;
  right: 20px;
  border-radius: 20px;
  background-color: rgba(28, 134, 238, 0.5);
}
</style>
