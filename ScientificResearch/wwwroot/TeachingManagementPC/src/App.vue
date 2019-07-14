<template>
  <div id="app">
    <router-view v-wechat-title='$route.meta.title'/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>
<style>
  @import url("//at.alicdn.com/t/font_1148078_k5ltfn1p72i.css");
  path{
    fill: currentColor !important
  }
</style>
