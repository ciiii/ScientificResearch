<template>
  <div>
    <div
      v-for="(item,index) in list"
      :key="index"
      @click="edite(index,item)"
      v-html="item"
      :class="{active:active==index}"
    ></div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      index: 1,
      size: 15,
      total: 0,
      list: [],
      active:0
    };
  },
  created() {
    document.title = "新闻详情";
  },
  mounted() {
    this.getPrimaryNews();
  },
  methods: {
    getPrimaryNews() {
      this.$http.getNewsList(this.index, this.size).then(res => {
        console.log(res, "res````66666");
        this.list = res.data.list;
        this.total = res.data.total;
      });
    }
  }
};
</script>
<style lang="less" scoped>
</style>
