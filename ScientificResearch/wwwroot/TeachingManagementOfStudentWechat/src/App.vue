<template>
  <div id="app">
    <transition :name="viewTransition" :css="!!direction">
      <router-view class="router-view"></router-view>
    </transition>
    <tabbar :index="0" v-show="showTabnav"></tabbar>
  </div>
</template>
<script>
import { mapState } from "vuex";
import tabbar from "@/components/tabbar.vue";
import navbar from "@/components/navbar.vue";
export default {
  components: {
    tabbar,
    navbar
  },

  methods: {},
  computed: {
    ...mapState({
      isLoading: state => state.vux.isLoading,
      direction: state => state.vux.direction,
      showTabnav: state => state.vux.showTabnav,
      title: state => state.vux.title
    }),
    viewTransition() {
      if (!this.direction) return "";
      return "vux-pop-" + (this.direction === "forward" ? "in" : "out");
    }
  }
};
</script>
<style lang="less" scoped>
.actions {
  border-top: 1px solid #ebedf0;
  text-align: right;
  margin-top: 5px;
  padding-top: 10px;
  button {
    margin: 0px 30px;
  }
}
</style>
<style>
* {
  padding: 0px;
  margin: 0px;
}
html,
body {
  font: 12px/22px 宋体, Arial, Helvetica, sans-serif;
  font-family: "宋体", "Microsoft YaHei", SimSun, "Segoe UI", Verdana, Arial,
    Sans-Serif;
}

a,
a:visited {
  text-decoration: none;
  color: #656565;
}
a:hover,
a:active {
  color: red;
}
body {
  font-size: 16px;
  line-height: 28px;
  background-color: #f8f8f8;
  overflow-x: hidden;
  -webkit-font-smoothing: antialiased;
}

.router-view {
  width: 100%;
  top: 0px;
}
.vux-pop-out-enter-active,
.vux-pop-out-leave-active,
.vux-pop-in-enter-active,
.vux-pop-in-leave-active {
  will-change: transform;
  transition: all 500ms;
  height: 100%;
  top: 0px;
  position: absolute;
  backface-visibility: hidden;
  perspective: 1000;
}
.vux-pop-out-enter {
  opacity: 0;
  transform: translate3d(-100%, 0, 0);
}
.vux-pop-out-leave-active {
  opacity: 0;
  transform: translate3d(100%, 0, 0);
}
.vux-pop-in-enter {
  opacity: 0;
  transform: translate3d(100%, 0, 0);
}
.vux-pop-in-leave-active {
  opacity: 0;
  transform: translate3d(-100%, 0, 0);
}
.content {
  margin: 50px 10px 5px;
}
</style>
