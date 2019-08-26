<template>
  <div class="user">
    <!-- <img
      class="user-poster"
      src="https://img.yzcdn.cn/public_files/2017/10/23/8690bb321356070e0b8c4404d087f8fd.png"
    />-->
    <van-cell-group class="user-group">
      <div class="head">
        <img :src="defaulthead" />
      </div>
      <div class="info">
        <p>{{UserInfo.姓名}}</p>
        <p>
          <label>学员类型:</label>
          {{UserInfo.学员类型名称}}
        </p>
        <p v-if="UserInfo.专业名称">
          <label>专业:</label>
          {{UserInfo.专业名称}}
        </p>
        <p>
          <label v-if="UserInfo.手机号码">联系方式:</label>
          {{UserInfo.手机号码}}
        </p>
      </div>
    </van-cell-group>
    <!-- <van-cell-group class="user-group">
      <van-cell title="培训专业" value="通科培训阶段" icon="records" />
      <van-cell title="当前科室" value="骨科" icon="location-o" />
      <van-cell title="联系方式" value="13564487654" icon="phone-o" />
    </van-cell-group>-->

    <van-cell-group>
      <van-cell icon="user-o" title="个人信息" is-link to="/mine/personal" />
      <van-cell icon="records" title="我的轮转计划" is-link to="/mine/training" />
      <van-cell icon="edit" title="修改密码" is-link to="/mine/updatePassword" />
    </van-cell-group>
    <!-- <van-cell-group class="loginout">
      <van-button size="large" @click="loginout">退出登录</van-button>
    </van-cell-group>-->
    <van-cell-group class="loginout">
      <van-button size="large" @click="loginout">退出系统</van-button>
    </van-cell-group>
    <!-- <tabbar :index="2"></tabbar> -->
  </div>
</template>

<script>
import { Row, Col, Icon, Cell, CellGroup, Image } from "vant";
import tabbar from "@/components/tabbar.vue";
import defaulthead from "@/assets/images/head/default.jpg";
import { mapActions } from "vuex";

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
    return {
      defaulthead: defaulthead,
      UserInfo: {
        name: ""
      }
    };
  },
  mounted() {
    var _this = this;
    _this.getUserInfo().then(data => {
      _this.UserInfo = data.data.基本信息;
    });
  },
  methods: {
    ...mapActions(["handleLogOut", "getUserInfo"]),
    outSytem() {
      let _this = this;
      this.$dialog
        .confirm({
          title: "操作提示",
          message: "确认退出？"
        })
        .then(() => {
          _this.$router.go(-1);
        })
        .catch(() => {});
    },
    loginout() {
      let _this = this;
      this.$dialog
        .confirm({
          title: "操作提示",
          message: "确认退出？"
        })
        .then(() => {
          _this.handleLogOut().then(() => {
            _this.$router.push({
              path: "/login"
            });
          });
        })
        .catch(() => {});
    }
  }
};
</script>

<style lang="less">
.user {
  margin-bottom: 50px;
  &-poster {
    width: 100%;
    height: 53vw;
    display: block;
  }

  &-group {
    height: 180px;
    background: #3879cd;
    .head {
      width: 80px;
      height: 80px;

      position: absolute;
      left: 50px;
      top: 50px;
      img {
        border-radius: 80px;
        width: 100%;
        height: 100%;
      }
    }
    .info {
      padding-left: 145px;
      padding-top: 50px;
      height: 100%;
      color: #fff;

      font-size: 14px;
      p {
        line-height: 24px;
        margin: 0px;
        padding: 0px;
      }
    }
  }

  &-links {
    padding: 15px 0;
    font-size: 12px;
    text-align: center;
    background-color: #fff;

    .van-icon {
      display: block;
      font-size: 24px;
    }
  }
  .loginout {
    margin-top: 15px;
  }
}
</style>
