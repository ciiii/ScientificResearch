<template>
  <div class="backlog">
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-lunwentimu"></i>论文
      </div>
      <van-cell-group>
        <van-cell title="导入认领" icon="award-o" is-link to="/paperClaim"></van-cell>
        <van-cell title="论文管理" icon="label-o" is-link to="/paperManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-shouquanicon"></i>著作
      </div>
      <van-cell-group>
        <van-cell title="著作管理" icon="bookmark-o" is-link to="/workManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-zhuanli"></i>专利
      </div>
      <van-cell-group>
        <van-cell title="专利管理" icon="records" is-link to="/patentManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-gerenhuojiang"></i>获奖
      </div>
      <van-cell-group>
        <van-cell title="获奖管理" icon="flower-o" is-link to="/resultsManagement"></van-cell>
      </van-cell-group>
    </div>
    <div class="box">
      <div class="title">
        <i class="icon iconfont icon-overview"></i>成果总览
      </div>
      <van-cell-group>
        <van-cell title="成果总览" icon="apps-o" is-link to="/achievementAll"></van-cell>
      </van-cell-group>
    </div>
    <navFooter/>
  </div>
</template>
<script>
import navFooter from "@/components/footer/footer";
export default {
  components: {
    navFooter
  },
  data() {
    return {};
  },
  created() {
    document.title = "科研管理 - 成果";
  }
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
        color: #1296db;
        margin-right: 5px;
      }
    }
  }
}
</style>
