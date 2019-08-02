<template>
  <div>
    <navbar/>
    <van-cell-group>
      <van-cell title="学员类型" value="研究生"  />
      <van-cell title="培训专业" value="通科培训阶段"  />
      <van-cell title="当前科室" value="骨科（花园山）"  />
      <van-cell title="责任导师" value="13564487654"  />
      <van-cell title="当前科室管理员" value="文峰"  />
      <van-cell title="当前代缴老师" value="陈大伟"  />
    </van-cell-group>
  </div>
</template>

<script>
import {  Icon, Cell, CellGroup } from "vant";
import navbar from "@/components/navbar.vue";


export default {
  components: {
    Icon,
    Cell,
    CellGroup,
    navbar
  },
  data() {
    return {};
  }
};
</script>

<style lang="less">
</style>
