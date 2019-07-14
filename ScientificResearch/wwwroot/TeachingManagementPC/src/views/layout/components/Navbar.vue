<template>
  <div class="navbar">
    <hamburger :toggle-click="toggleSideBar" :is-active="sidebar.opened" class="hamburger-container"/>
    <breadcrumb/>
    <el-dropdown class="avatar-container" trigger="click">
      <div class="avatar-wrapper">
        <span class="user-name">{{DbKey}}</span>
        <img src="@/assets/images/user.gif" class="user-avatar">
        <i class="el-icon-caret-bottom"/>
      </div>
      <el-dropdown-menu slot="dropdown" class="user-dropdown">
        <router-link class="inlineBlock" to="/">
          <el-dropdown-item><i class="iconfont icon-personal"></i> 个人资料</el-dropdown-item>
        </router-link>
        <router-link class="inlineBlock" to="/editPassWord">
          <el-dropdown-item><i class="iconfont icon-jurisdiction"></i> 修改密码</el-dropdown-item>
        </router-link>
        <el-dropdown-item divided>
          <span style="display:block;" @click="logOut"><i class="iconfont icontuichu"></i> 退出登录</span>
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <el-dialog title="修改密码" :visible.sync="isDialog" width="30%" v-if='isDialog' :close-on-click-modal="false">
      <editPassWord ref="child" @myEvent="getMyEvent"></editPassWord>
    </el-dialog>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  import Breadcrumb from '@/components/Breadcrumb';
  import Hamburger from '@/components/Hamburger';
  import { getInfo } from '@/assets/js/Common';
  import editPassWord from '@/views/teachingOffice/personal/editPassWord';

  export default {
    components: {
      Breadcrumb,
      Hamburger,
      editPassWord
    },
    computed: {
      ...mapGetters([
        'sidebar',
        'avatar'
      ])
    },
    data() {
      return {
        DbKey: '',
        url: '',
        userInfo: {},
        isDialog: false
      };
    },
    mounted() {
      this.userInfo = getInfo();
      this.DbKey = this.userInfo.data.人员.DbKey;
    },
    methods: {
      toggleSideBar() {
        this.$store.dispatch('ToggleSideBar');
      },
      logOut() {
        this.$confirm('确认退出吗?', '提示', {
          type: 'warning'
        }).then(() => {
          localStorage.removeItem('userInfo');
          localStorage.removeItem('Authorization');
          if (localStorage.getItem('isEntryLogin') == 'true') {
            window.location.href = this.userInfo.url;
          } else {
            this.$router.push({ path: this.userInfo.url });
          }
        });
      },
      getMyEvent() {
        this.isDialog = false;
      },
      editPassWord() {
        this.isDialog = true;
      }
    }
  };
</script>

<style type="text/scss" lang="scss" scoped>
  .navbar {
    height: 60px;
    line-height: 60px;
    box-shadow: 0 1px 4px rgba(0, 21, 41, .08);

    .hamburger-container {
      line-height: 58px;
      height: 60px;
      float: left;
      padding: 6px 10px 10px;
    }

    .screenfull {
      position: absolute;
      right: 90px;
      top: 16px;
      color: red;
    }

    .avatar-container {
      height: 60px;
      display: inline-block;
      position: absolute;
      right: 35px;

      .avatar-wrapper {
        cursor: pointer;
        margin-top: 10px;
        position: relative;
        line-height: initial;

        .user-name {
          font-size: 12px;
          float: left;
          padding-top: 15px;
          margin-right: 10px;
          color: #666;
        }

        .user-avatar {
          width: 40px;
          height: 40px;
          border-radius: 50%;
        }

        .el-icon-caret-bottom {
          position: absolute;
          right: -18px;
          top: 25px;
          font-size: 12px;
        }
      }
    }
  }
</style>

