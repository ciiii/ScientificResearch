<template>
  <div>
    <van-nav-bar :title="title" left-text left-arrow fixed class="navbar" @click-left="onClickLeft">
      <van-icon name="search" v-show="isSearch" slot="right" @click="search" />
    </van-nav-bar>
    <return-btn v-if="isBackBtn" :callback="onClickLeft"/>
  </div>
</template>
<script>
import { NavBar } from "vant";
import { mapState } from "vuex";
import ReturnBtn from "@/components/returnBtn";

export default {
  name: "navbar",
  computed: {
    ...mapState({
      title: state => state.vux.title
    })
  },
  props: {
    path: {
      type: String,
      default: ""
    },
    isSearch: {
      type: Boolean,
      default: false
    },
    isBackBtn: {
      type: Boolean,
      default: true
    },
    search: {
      type: Function,
      default: function() {}
    }
  },
  components: {
    [NavBar.name]: NavBar,
    [ReturnBtn.name]: ReturnBtn
  },
  methods: {
    onClickLeft() {
      //this.$router.CurrentRouter;
     //this.$router.go(-1);
      if (this.path == "") {
        this.$router.go(-1);
      } else {
        this.$router.push({ path: this.path });
      }
    }
  }
};
</script>
<style lang="less">
.navbar {
  margin-bottom: 10px;
}
</style>


