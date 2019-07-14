<template>
  <div class="sidebar-logo-container" :class="{'collapse':collapse}">
    <transition name="sidebarLogoFade">
      <router-link v-if="collapse" class="sidebar-logo-link" to="/">
        <img src="@/assets/images/logo.png" class="sidebar-logo">
        <!--<h1 class="sidebar-title">{{ title }} </h1>-->
      </router-link>
      <router-link v-else class="sidebar-logo-link" to="/">
        <img src="@/assets/images/logo.png" class="sidebar-logo">
      </router-link>
    </transition>
  </div>
</template>

<script>
  export default {
    name: 'SidebarLogo',
    props: {
      collapse: {
        type: Boolean,
        required: true
      }
    },
    data() {
      return {
        title: '教学管理系统'
      }
    }
  }
</script>

<style lang="scss" scoped type="text/scss">
  .sidebarLogoFade-enter-active {
    transition: opacity 1.5s;
  }

  .sidebarLogoFade-enter,
  .sidebarLogoFade-leave-to {
    opacity: 0;
  }

  .sidebar-logo-container {
    position: relative;
    width: 100%;
    height: 60px;
    line-height: 60px;
    background: #dff1fb;
    text-align: center;
    overflow: hidden;
    & .sidebar-logo-link {
      height: 100%;
      width: 100%;

      & .sidebar-logo {
        height: 35px;
        vertical-align: middle;
        margin-right: 10px;
      }

      & .sidebar-title {
        display: inline-block;
        margin: 0;
        color: #fff;
        font-weight: normal;
        line-height: 50px;
        font-size: 18px;
        font-family: "Microsoft YaHei", "微软雅黑";
        vertical-align: middle;
      }
    }

    &.collapse {
      .sidebar-logo {
        margin-right: 0px;
        margin-left: 10px;
      }
    }
  }
</style>
