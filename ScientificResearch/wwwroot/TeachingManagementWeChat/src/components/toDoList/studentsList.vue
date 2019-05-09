<template>
  <div>
    <div class="backlogBox">
      <div class="backlog">
        <span>
          <i class="icon iconfont iconxueyuanliebiao-copy"></i>
          <span>带教学员情况表</span>
        </span>
      </div>
    </div>
    <div class="backlogBox">
      <div class="backlog">
        <span>
          <i class="icon iconfont iconxueyuanliebiao-copy"></i>
          <span>待办事务</span>
        </span>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data () {
    return {

    }
  },
  created () {

  },
  mounted () {

  },
  methods: {

  }
}
</script>
<style lang="less" scoped>
.backlogBox {
  padding: 10px;
  background-color: #fff;
  margin: 10px 0;
  .backlog {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    margin-bottom: 10px;
    span {
      padding: 5px 0;
      .iconxueyuanliebiao-copy {
        padding-right: 8px;
        color: rgb(25, 186, 235);
      }
    }
  }
}
</style>
