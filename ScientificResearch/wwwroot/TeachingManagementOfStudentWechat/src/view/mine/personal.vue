<template>
  <div>
    <navbar path="/mine"/>
    <van-cell-group>
      <van-cell title="学员类型" value="研究生" />
      <van-cell v-for="item in UserInfo" :title="item.title" :value="item.text"></van-cell>
    </van-cell-group>
  </div>
</template>

<script>
import { Icon, Cell, CellGroup } from "vant";
import navbar from "@/components/navbar.vue";
import { mapActions } from "vuex";

export default {
  components: {
    Icon,
    Cell,
    CellGroup,
    navbar
  },
  data() {
    return {
      UserInfo: []
    };
  },
  mounted() {
    var _this = this;
    _this.getUserInfo().then(data => {
      var userinfor = data.data.基本信息;
      for (var key in userinfor) {
        if (
          userinfor[key] &&
          key != "AllName" &&
          key != "编号" &&
          key != "密码" &&
          key != "部门编号"&&
          key != "是否启用" &&
           key.indexOf( "编号")<0
        ) {
          _this.UserInfo.push({ title: key, text: userinfor[key] });
        }
      }
    });
  },
  methods: {
    ...mapActions(["handleLogOut", "getUserInfo"])
  }
};
</script>

<style lang="less">
</style>
