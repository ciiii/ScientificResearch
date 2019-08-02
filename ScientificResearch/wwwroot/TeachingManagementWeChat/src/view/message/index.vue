<template>
  <div>
    <van-cell-group>
      <van-cell title="即时消息" icon="chat-o" is-link></van-cell>
      <van-cell title="教学活动" icon="desktop-o" is-link></van-cell>
      <van-cell title="新闻信息" icon="orders-o" is-link></van-cell>
      <van-cell title="公告信息" icon="volume-o" is-link></van-cell>
      <van-cell title="本院动态" icon="hotel-o" is-link></van-cell>
      <van-cell title="政策法规" icon="newspaper-o" is-link></van-cell>
    </van-cell-group>
    <!-- <tabbar :index="1"></tabbar> -->
  </div>
</template>
<script>
import { Row, Col, Icon, Cell, CellGroup, Image } from "vant";
import tabbar from "@/components/tabbar.vue";

export default {
  components: {
    Row,
    Col,
    Icon,
    Cell,
    CellGroup,
    [Image.name]: Image,
    tabbar
  },
  data() {
    return {};
  }
};
</script>
<style lang="less">
</style>


