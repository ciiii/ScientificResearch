<template>
  <van-panel title="查看待办详情" class="panel">
    <ul>
      <li>{{item.发起人姓名}}</li>
      <li>{{item.发起人部门名称}}</li>
      <li>{{item.步骤名称}}</li>
      <li>{{item.步骤状态说明}}</li>
      <li>{{item.流程创建时间}}</li>
      <li>{{item.流程名称}}</li>
      <li>{{item.状态名称}}</li>
      <li>{{item.项目名称}}</li>
    </ul>
    <div slot="footer">
      <van-button size="small" @click="$router.back(-1)">返回</van-button>
    </div>
  </van-panel>
</template>
<script>
export default {
  data() {
    return {
      item: null
    };
  },
  created() {
    // document.title = "我的待办详情";
    this.getParams();
  },
  mounted() {},
  methods: {
    getParams() {
      var routerParams = this.$route.params.item;
      this.item = routerParams;
    }
  }
};
</script>
<style lang="less" scoped>
.panel {
  padding: 10px;
  ul {
    border: 1px dashed #ccc;
    box-shadow: 6px 6px 6px #888888;
    font-size: 16px;
    padding: 8px;
  }
}
</style>