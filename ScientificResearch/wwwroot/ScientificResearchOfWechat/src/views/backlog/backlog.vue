<template>
  <div class="backlog">
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>论文
      </div>
      <van-cell-group>
        <van-cell title="导入认领" icon="location-o" is-link to="/paperClaim"></van-cell>
        <van-cell title="论文管理" icon="location-o" is-link to="/paperManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>著作
      </div>
      <van-cell-group>
        <van-cell title="著作管理" icon="location-o" is-link to="/workManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>专利
      </div>
      <van-cell-group>
        <van-cell title="专利管理" icon="location-o" is-link to="/patentManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>获奖
      </div>
      <van-cell-group>
        <van-cell title="获奖管理" icon="location-o" is-link to="/resultsManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-gonghuijingfeibaoxiao"></i>成果总览
      </div>
      <van-cell-group>
        <van-cell title="成果总览" icon="location-o" is-link to="/achievementAll"></van-cell>
      </van-cell-group>
    </div>
    <navFooter/>
  </div>
</template>
<script>
import navFooter from "@/../src/components/footer/footer";
export default {
  components: {
    navFooter
  },
  data() {
    return {
      loading: false,
      finished: false
    };
  },
  created() {
    document.title = "科研管理 - 成果";
  },
  mounted() {},
  methods: {}
};
</script>
<style lang="less" scoped>
.backlog {
  text-align: left;
  background-color: #f5f3fb;
  .box {
    padding: 10px;
    .title {
      font-size: 14px;
      padding: 8px;
      background-color: #fff;
      i {
        font-weight: 800;
        color: #d4237a;
        margin-right: 5px;
      }
    }
  }
}
</style>
