<template>
  <van-list v-model="loading"
            :finished="finished"
            finished-text="没有更多了"
            @load="onLoad">
    <div class="backlogBox">
      <div class="backlog">
        <span>
          <i class="icon iconfont icondaiban"></i>
          <span>待办列表</span>
        </span>
      </div>
    </div>
  </van-list>
</template>
<script>
export default {
  data () {
    return {
      loading: false,
      finished: false
    }
  },
  created () {

  },
  mounted () {

  },
  methods: {
    onLoad () {
      this.loading = false
      this.finished = true
      console.log('加载更多!')
    }
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
      .icondaiban {
        padding-right: 8px;
        color: rgb(25, 186, 235);
      }
    }
  }
}
</style>
