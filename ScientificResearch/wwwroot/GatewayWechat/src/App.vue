<template>
  <div id="app">
    <router-view v-wechat-title='$route.meta.title'/>
  </div>
</template>

<style lang="scss">
@import url("//at.alicdn.com/t/font_1026868_lybqwjxz2x.css");
html {
  height: 100%;
  background-color: #f5f3fb;
}
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}
</style>
