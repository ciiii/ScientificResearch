<template>
  <van-tabbar v-model="index">
    <van-tabbar-item icon="wap-home" to="/home">首页</van-tabbar-item>
    <van-tabbar-item info="3" icon="chat-o" to="/message">代办事项</van-tabbar-item>
    <van-tabbar-item icon="user-o" to="/mine">我的</van-tabbar-item>
  </van-tabbar>
</template>
<script>
import { Icon, Tabbar, TabbarItem } from "vant";
import {mapState} from "vuex"


export default {
  name: "tabbar",
  computed:{
    ...mapState({
      tabnavIndex:state=>state.vux.tabnavIndex
    }),
    index:{
      get(){
        return this.tabnavIndex
      },
      set(){           
            return this.tabnavIndex;
        }
    }
  },
  components: {
    [Icon.name]: Icon,
    [Tabbar.name]: Tabbar,
    [TabbarItem.name]: TabbarItem
  },
  
  created() {


  },
  data() {
    return {
      active: 0
    };
  }
};
</script>

