<template>
  <div>
    <navbar :path="path" />
    <div class="content">
      <van-cell-group>
        <van-cell
          v-for="item in list"
          :title="item.名称"
          :key="item.编号"
          icon="point-gift"
          is-link
          :to="'/activities/list?typeid='+item.编号+'&name='+item.名称"
        ></van-cell>
      </van-cell-group>
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { Row, Col, Icon, Cell, CellGroup } from "vant";
import { GetActivitiesType } from "@/api/systemSetting";

export default {
  components: {
    Row,
    Col,
    Icon,
    Cell,
    CellGroup,
    navbar
  },
  data() {
    return {
      list: [],
      path: "/home"
    };
  },
  mounted() {
    GetActivitiesType().then(res => {
      this.list = res.data.data;
    });
  }
};
</script>
<style lang="less">
.content {
  margin-top: 50px;
}
</style>


