<template>
  <div class="box">
    <div class="title" v-html="this.list.标题" :class="{active:active==this.list.标题}"></div>
    <div class="content" v-html="this.list.内容" :class="{active:active==this.list.内容}"></div>
    <div class="time" v-html="this.list.建立时间" :class="{active:active==this.list.建立时间}"></div>
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
  mounted() {
    this.getDetails();
  },
  methods: {
    getDetails() {
      this.list = this.$route.params.item;
      // console.log(this.list, "4455");
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  padding: 10px 20px;
  .title {
    font-size: 16px;
    
  }
  .content,
  .time {
    color: rgb(51, 51, 51);
    letter-spacing: 0;
    font-size: 14px;
    line-height: 25px;
  }
}
/deep/ img {
  max-width: 100%;
  height: auto;
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
}
/deep/ p{
  text-align: left;
}
</style>
