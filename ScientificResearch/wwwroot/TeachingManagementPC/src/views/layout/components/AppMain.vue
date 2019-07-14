<template>
  <section class="app-main">
    <transition name="fade-transform" mode="out-in">
      <router-view/>
    </transition>
  </section>
</template>

<script>
  export default {
    name: 'AppMain',
    computed: {
    }
  }
</script>

<style type="text/scss" lang="scss">
  .app-main {
    .panel-group {
      margin-top: 0 !important;
    }
  }
</style>
<style scoped type="text/scss" lang="scss">
  .app-main {
    /*50 = navbar  */
    min-height: calc(100vh - 60px);
    position: relative;
    overflow: hidden;
  }

  .fixed-header + .app-main {
    padding-top: 60px;
  }

  .hasTagsView {
    .app-main {
      /* 84 = navbar + tags-view = 50 + 34 */
      min-height: calc(100vh - 84px);
    }

    .fixed-header + .app-main {
      padding-top: 84px;
    }
  }
</style>
