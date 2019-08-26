<template>
  <div>
    <navbar :path="path" />
    <div class="content">
      <van-cell-group>
        <van-cell
          v-for="item in list"
          :title="item.菜单.名称"
          :key="item.菜单.编号"
          icon="star-o"
          is-link
          :to="'/360Evaluate/'+item.菜单.移动端组件名+'&name='+item.菜单.名称"
        ></van-cell>
      </van-cell-group>
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { Row, Col, Icon, Cell, CellGroup } from "vant";

import { mapGetters } from "vuex";

export default {
  components: {
    Row,
    Col,
    Icon,
    Cell,
    CellGroup,
    navbar
  },
  computed: {
    ...mapGetters(["menuList"])
  },
  data() {
    return {
      list: [],
      path: "/home"
    };
  },
  mounted() {
    // this.menuList(4, menu => {
    //   for (let i = 0; i < menu.子级菜单.length; i++) {
    //     let item = menu.子级菜单[i].菜单;
    //     if (item.移动端组件名.indexOf("?") < 0) {
    //       item.移动端组件名 += "?";
    //     }
    //   }

    // });
    this.list = [
      {
        菜单: {
          编号: 1,
          名称: "对管理员评价",
          移动端组件名: "evaluate360?from=0&to=2"
        }
      },
      {
        菜单: {
          编号: 2,
          名称: "对科室管理员评价",
          移动端组件名: "evaluate360?from=0&to=3"
        }
      },
      {
        菜单: {
          编号: 2,
          名称: "对带教老师的评价",
          移动端组件名: "evaluate360?from=0&to=4"
        }
      },
      {
        菜单: {
          编号: 2,
          名称: "对学员评价",
          移动端组件名: "evaluate360?from=0&to=0"
        }
      }
    ];
  }
};
</script>
<style lang="less">
.content {
  margin-top: 50px;
}
</style>


