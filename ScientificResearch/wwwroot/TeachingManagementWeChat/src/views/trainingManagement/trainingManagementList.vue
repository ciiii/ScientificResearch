<template>
  <div class="box">
    <div class="title">
      <i class="icon iconfont iconpeixunguanli1"></i>培训管理
    </div>
    <div>
      <van-cell title="学员报到"
                icon="user-circle-o"
                to="studentsReport"
                is-link />
      <van-cell title="学员宿舍安排"
                icon="home-o"
                to="/studentsDormitoryArrangeList"
                is-link />
      <van-cell title="学员退培管理"
                icon="exchange"
                to="/studentsExitTraining"
                is-link />
      <van-cell title="学员考试成绩"
                icon="edit"
                to="/studentsTestScores"
                is-link />
    </div>
    <Footer />
  </div>
</template>
<script>
import Footer from '@/components/footer/footer'
export default {
  components: {
    Footer
  },
  data () {
    return {

    }
  },
  created () {

  },
  mounted () {

  },
  methods: {

  }
}
</script>
<style lang="less" scoped>
.box {
  text-align: left;
  .title {
    font-size: 14px;
    padding: 10px;
    background-color: #fff;
    margin-bottom: 10px;
    i {
      font-weight: 800;
      color: #16c2c2;
      margin-right: 5px;
      vertical-align: middle;
    }
  }
}
</style>
