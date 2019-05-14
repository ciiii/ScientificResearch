<template>
  <footer class="footer_nav">
    <div class="footnav">
      <div v-for="(val,index) in footerlist"
           class="nav_item"
           :key="index"
           :class="{middle:index==3}"
           @click="chengetabindex(val,index)">
        <div class="img"
             :class="[val.img,val.bckimg]"></div>
        <div class="txt"
             :class="val.bcktxt">{{val.tit}}</div>
      </div>
    </div>
    <div class="empty"></div>
  </footer>
</template>
<script>
export default {
  data () {
    return {
      footerlist: [
        {
          topath: '/TeachingManagementWeChat',
          tit: '首页',
          img: 'index',
          bckimg: '',
          bcktxt: ''
        },
        {
          topath: '/trainingManagementList',
          tit: '培训',
          img: 'backlog',
          bckimg: '',
          bcktxt: ''
        },
        {
          topath: '/',
          tit: '总库',
          img: 'gateway',
          bckimg: '',
          bcktxt: ''
        },
        {
          topath: '/',
          tit: '教学',
          img: 'release',
          bckimg: '',
          bcktxt: ''
        },
        {
          topath: '/personal',
          tit: '我的',
          img: 'personal',
          bckimg: '',
          bcktxt: ''
        }
      ]
    }
  },
  mounted () {
    this.footerlist.forEach(res => {
      if (this.$route.path === res.topath) {
        this.$set(res, 'bckimg', res.img + '_active')
        this.$set(res, 'bcktxt', 'active')
      }
    })
  },
  methods: {
    // 切换底部tab
    chengetabindex (nav, index) {
      this.footerlist.forEach(item => {
        item.bckimg = ''
        item.bcktxt = ''
      })
      nav.bckimg = nav.img + '_active'
      nav.bcktxt = 'active'
      this.$router.push(nav.topath)
    }
  }
}
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

.footnav .gateway {
  width: 18px;
  height: 18px;
  background: url(../../assets/images/footerIocn/gateway_default.png) center
    no-repeat / contain;
}
.footnav .gateway_active {
  background: url(../../assets/images/footerIocn/gateway_active.png) center
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
.empty {
  height: 30px;
}
</style>
