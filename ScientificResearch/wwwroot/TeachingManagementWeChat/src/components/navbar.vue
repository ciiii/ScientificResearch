<template>
<van-nav-bar
  :title="title"
  left-text=""
  left-arrow
  class="navbar"
  @click-left="onClickLeft"
/>
</template>
<script>
import { NavBar } from 'vant';
import{mapState} from 'vuex'

export default {
  name: "navbar",
  computed:{
     ...mapState({
      title:state=>state.vux.title
    })},
  components: {
    [NavBar.name]: NavBar
  },
  methods:{
    onClickLeft() {
        this.$router.go(-1);
    }
  }
};
</script>
<style lang="less">
.navbar{margin-bottom: 10px;}
</style>


