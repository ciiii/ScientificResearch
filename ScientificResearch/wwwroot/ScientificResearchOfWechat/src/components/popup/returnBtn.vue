<template>
  <div class="backtrack" @click="$router.back(-1)">
    <i class="icon iconfont icon-fanhui"></i> 返回
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
  font-size: 14px;
  color: #fff;
  width: 60px;
  height: 20px;
  padding: 5px;
  text-align: center;
  position: fixed;
  bottom: 80px;
  right: 20px;
  border-radius: 20px;
  background-color: rgba(28, 134, 238, 0.5);
}
</style>
