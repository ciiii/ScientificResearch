<template>
  <footer class="footer_nav">
    <div class="footnav">
      <div
        v-for="(val,index) in footerlist"
        class="nav_item"
        :key="index"
        :class="{middle:index==2}"
        @click="chengetabindex(val,index)"
      >
        <div class="img" :class="[val.img,val.bckimg]"></div>
        <div class="txt" :class="val.bcktxt">{{val.tit}}</div>
      </div>
    </div>
    <transition name="release">
      <div class="pop_out_box" v-if="releaseShow" @click="popOutDisapper">
        <ul class="pop_out">
          <li @click="goLectureList()">
            <span>主办讲座</span>
          </li>
          <li @click="releaseTopic()">
            <span>参会信息</span>
          </li>
          <li @click="expenseList()">
            <span>参会报销管理</span>
          </li>
        </ul>
      </div>
    </transition>
    <div class="empty"></div>
  </footer>
</template>

<script>
export default {
  data() {
    return {
      footerlist: [
        {
          topath: "/index",
          tit: "首页",
          img: "index",
          bckimg: "",
          bcktxt: ""
        },
        {
          topath: "/backlog",
          tit: "成果",
          img: "backlog",
          bckimg: "",
          bcktxt: ""
        },
        {
          topath: "",
          tit: "活动",
          img: "release",
          bckimg: "",
          bcktxt: ""
        },
        {
          topath: "/personal",
          tit: "我的",
          img: "personal",
          bckimg: "",
          bcktxt: ""
        }
      ],
      releaseShow: false //活动弹框是否显示
    };
  },
  mounted() {
    this.footerlist.forEach(res => {
      if (this.$route.path == res.topath) {
        this.$set(res, "bckimg", res.img + "_active");
        this.$set(res, "bcktxt", "active");
      }
    });
  },
  methods: {
    //切换底部tab
    chengetabindex(nav, index) {
      if (index == 2) {
        this.releaseShow = !this.releaseShow;
      }
      this.footerlist.forEach(item => {
        item.bckimg = "";
        item.bcktxt = "";
      });
      nav.bckimg = nav.img + "_active";
      nav.bcktxt = "active";
      this.$router.push(nav.topath);
    },
    // 点击底部活动弹框消失
    popOutDisapper() {
      this.releaseShow = false;
    },
    // 跳转主办讲座列表
    goLectureList() {
      this.$router.push("/lectureList");
    },
    // 跳转参会信息
    releaseTopic() {
      this.$router.push("/meetingInformation");
    },
    // 跳转参会报销列表
    expenseList() {
      this.$router.push("/expenseList");
    }
  }
};
</script>

<style lang="less" scoped>
.footnav {
  height: 50px;
  display: flex;
  justify-content: space-around;
  align-items: center;
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  font-size: 14px;
  color: #7d7e80;
  background-color: #fff;
  border-top: 1px solid #ededed;
  text-align: center;
  .nav_item {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 20%;
    color: #ababab;
  }
}
.footnav .txt {
  color: #ababab;
  font-size: 12px;
  &.active {
    color: #1296db;
  }
}
.footnav .index {
  width: 18px;
  height: 18px;
  background: url(../../assets/images/footerIocn/index_active.png) center
    no-repeat / contain;
}
.footnav .index_active {
  background: url(../../assets/images/footerIocn/index_default.png) center
    no-repeat / contain;
}
.footnav .backlog {
  width: 18px;
  height: 18px;
  background: url(../../assets/images/footerIocn/backlog_active.png) center
    no-repeat / contain;
}
.footnav .backlog_active {
  background: url(../../assets/images/footerIocn/backlog_default.png) center
    no-repeat / contain;
}
.footnav .release {
  width: 18px;
  height: 18px;
  background: url(../../assets/images/footerIocn/activity_default.png) center
    no-repeat / contain;
}
.footnav .release_active {
  background: url(../../assets/images/footerIocn/activity_active.png) center
    no-repeat / contain;
}
.footnav .personal {
  width: 18px;
  height: 18px;
  background: url(../../assets/images/footerIocn/personal_active.png) center
    no-repeat / contain;
}
.footnav .personal_active {
  background: url(../../assets/images/footerIocn/personal_default.png) center
    no-repeat / contain;
}
.release-enter-active,
.release-leave-active {
  opacity: 1;
  transition: all 0.5s;
}
.release-enter,
.release-leave {
  opacity: 0;
  transition: all 0.5s;
}
.empty {
  margin-bottom: 60px;
}
.pop_out_box {
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  bottom: 0;
  //点击活动出现的弹框
  .pop_out {
    width: 150px;
    background: rgba(0, 0, 0, 0.8);
    position: absolute;
    z-index: 50;
    bottom: 55px;
    left: -10px;
    margin-left: 170px;
    border-radius: 20px;
    &::after {
      content: "";
      display: block;
      width: 0;
      height: 0;
      border: 8px solid transparent;
      border-top-color: rgba(0, 0, 0, 0.8);
      position: absolute;
      bottom: -16px;
      left: 50%;
      margin-left: -8px;
    }
    li {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 50px;
      border-bottom: 1px solid #474747;
      &:last-child {
        border-bottom: none;
      }
      > img {
        width: 40px;
        height: 40px;
        margin-right: 30px;
      }
      span {
        color: #fff;
        font-size: 14px;
      }
    }
  }
}
</style>

