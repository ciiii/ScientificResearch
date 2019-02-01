<template>
    <form action="/">
        <van-search
          v-model="search"
          placeholder="请输入搜索关键词"
          show-action
          @search="onSearch"
          @cancel="onCancel"
        />
      </form>
</template>
<script>
export default {
    data() {
        return {
            search: null
        }
    },
    mounted() {
        
    },
    methods: {
        // 用户点击键盘回车/搜索触发事件
        onSearch() {
            console.log("点击键盘回车");
        },
        // 用户点击取消触发事件
        onCancel() {
            console.log("点击右边取消");
        },
    },
}
</script>
<style lang="less" scoped>

</style>
