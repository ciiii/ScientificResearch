<template>
  <div class="home">
    <div class="banner"></div>
    <van-notice-bar
      left-icon="volume-o"
      color="red"
      background="#fff"
      mode="link"
    >足协杯战线连续第2年上演广州德比战，上赛季半决赛上恒大以两回合5-3的总比分淘汰富力。</van-notice-bar>
   <div class="subnav">
      <van-grid :border="true" :column-num="4"  clickable>
      <van-grid-item v-for="item in subnav" :key="item.title"  :to='item.path' >
        <div  slots="ico" :style="'background-color:'+item.color" class="gridIcon"> <van-icon size="6vw" color="#fff"  :name="item.ico" /></div>

        <p slots="text">{{item.title}}</p>
      </van-grid-item>
    </van-grid>
   </div>
  </div>
</template>
<script>
import { NoticeBar, Grid, GridItem, Icon } from "vant";

export default {
  components: {
    [NoticeBar.name]: NoticeBar,
    [Grid.name]: Grid,
    [GridItem.name]: GridItem,
    [Icon.name]: Icon
  },
  data() {
    return {
      subnav:[
        {
          title:'审核管理',
          path:'/mine',
          ico:'eye-o',
          color:'#04B8F5',
        },
        {
          title:'360°评价',
          path:'',
          ico:'star',
          color:'#36C877',
        },
        {
          title:'教学活动',
          path:'',
          ico:'point-gift',
          color:'#F5920D',
        },
        {
          title:'科研登记',
          path:'',
          ico:'records',
          color:'#A94490',
        },
        {
          title:'综合查询',
          path:'',
          ico:'search',
          color:'#DB3A40',
        },
        {
          title:'考核管理',
          path:'',
          ico:'edit',
          color:'#02D6F9',
        }
      ]
    };
  }
};
</script>
<style lang="less">
.home{
.banner {
  height: 180px;
  background: #3879cd;
}
.subnav{
  background-color: #fff;
  .gridIcon{
    border-radius: 40px;
    width: 40px;
    height: 40px;
    text-align: center;
    line-height: 55px;
  }
}

}
</style>


