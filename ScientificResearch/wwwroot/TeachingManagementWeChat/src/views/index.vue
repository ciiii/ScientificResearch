<template>
  <div class="index">
    <div class="nav">
      <span @click="login">登录</span>
      <img :src="url+this.Logo || this.defaultImg">
    </div>
    <div class="backlogBox">
      <div class="backlog">
        <span>
          <i class="icon iconfont icontongzhi1"></i>
          <span>通知公告</span>
        </span>
        <span @click="more">
          更多
          <i class="icon iconfont iconyou"></i>
        </span>
      </div>
      <van-swipe :autoplay="3000"
                 vertical
                 :show-indicators="false"
                 class="backlogContent">
        <van-swipe-item v-for="(item,key) in NoticeInformation"
                        :key="key">
          <span @click="newsItem(item.编号)">
            <i class="iocn iconfont icon-tongzhi"></i>
            {{item.通知名称}}
          </span>
        </van-swipe-item>
      </van-swipe>
    </div>
    <!-- <StudentsList /> -->
    <StudentsChart />
    <ToDoList />
    <Footer />
  </div>
</template>

<script>
import Footer from '@/components/footer/footer'
// import StudentsList from '@/components/indexList/studentsList'
import StudentsChart from '@/components/chart/studentsChart'
import ToDoList from '@/components/indexList/toDoList'
export default {
  name: 'index',
  components: {
    Footer,
    // StudentsList,
    StudentsChart,
    ToDoList
  },
  data () {
    return {
      NoticeInformation: [],
      url:
        process.env.NODE_ENV === 'development'
          ? 'http://192.168.0.99:63739'
          : '',
      Logo: '',
      HospitalInformation: JSON.parse(
        localStorage.getItem('HospitalInformation')
      ),
      defaultImg: require('@/assets/images/logo/logo.png')
    }
  },
  created () {
    this.Logo = this.HospitalInformation.Logo
  },
  mounted () {
    var para = {
      index: 1,
      size: 15
    }
    this.$http.getNoticeInformation(para).then(res => {
      this.NoticeInformation = res.data.list
    })
  },
  methods: {
    login () {
      this.$router.push('/login')
    },
    newsItem (item) {
      this.$router.push({
        path: '/noticeDetails',
        name: 'noticeDetails',
        params: {
          item
        }
      })
    },
    more () {
      this.$router.push('/noticeList')
    }

  }
}
</script>
<style lang="less" scoped>
.nav {
  background-color: #fff;
  span {
    position: absolute;
    right: 10px;
    top: 15px;
    font-size: 14px;
  }
  img {
    height: 40px;
    padding: 5px 0;
  }
}
.backlogBox {
  padding: 10px;
  background-color: #fff;
  margin: 10px 0;
  .backlog {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    margin-bottom: 10px;
    span {
      padding: 5px 0;
    }
    .icontongzhi1 {
      color: #ffa031;
      padding-right: 8px;
    }
    .iconyou {
      font-weight: bold;
      font-size: 14px;
    }
  }
  .backlogContent {
    height: 32px;
    font-size: 14px;
    text-align: left;
    background-color: #fffbe8;
    span {
      padding: 5px;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
      color: #ed6a0c;
      border-bottom: 1px solid #fff;
      i {
        padding-right: 5px;
      }
    }
    .backlogContent {
      height: 32px;
      font-size: 14px;
      text-align: left;
      background-color: #fffbe8;
      span {
        padding: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        color: #ed6a0c;
        border-bottom: 1px solid #fff;
        i {
          padding-right: 5px;
        }
      }
    }
  }
}
</style>
