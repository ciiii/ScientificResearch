<template>
  <van-tabbar v-model="active" >
    <van-tabbar-item icon="home-o">主页</van-tabbar-item>
    <van-tabbar-item icon="todo-list-o">待办</van-tabbar-item>
    <van-tabbar-item icon="newspaper-o">学习</van-tabbar-item>
    <van-tabbar-item icon="setting-o">我的</van-tabbar-item>
  </van-tabbar>
</template>

<script>
export default {
  data() {
    return {
      active: 0,
       
    };
  },
  mounted() {
    
  },
  methods: {
    change(){

    }
  },
};
</script>

<style scoped>
</style>
