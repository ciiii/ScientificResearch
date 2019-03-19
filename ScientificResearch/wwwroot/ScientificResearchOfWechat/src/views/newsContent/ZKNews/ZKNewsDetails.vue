<template>
  <div class="box">
    <div v-for="(item,key) in list" :key="key" v-html="item" :class="{active:active==key}"></div>
    <ReturnBtn/>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list: [],
      active: 1
    };
  },
  created() {
    document.title = "总库新闻详情";
  },
  mounted() {
    this.getDetails();
  },
  methods: {
    getDetails() {
      this.list = this.$route.params.item;
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  padding: 10px 20px;
}
/deep/ img {
  max-width: 100%;
  height: auto;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
}
</style>
