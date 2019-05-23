<template>
  <van-tabs v-model="active"
            swipeable
            class="box">
    <van-tab title="教学活动">
      <van-cell-group v-for="(item,key) in TeachingTypeList"
                      :key='key'>
        <van-cell :title="item.名称"
                  is-link />
      </van-cell-group>
    </van-tab>
    <van-tab title="教学评价">
      <van-cell-group v-for="(item,key) in EvaluateDirectionList"
                      :key='key'>
        <van-cell @click="goEvaluate(item.目标类型)"
                  :title="item.名称"
                  is-link />
      </van-cell-group>
    </van-tab>
    <Footer />
  </van-tabs>
</template>
<script>
import Footer from '@/components/footer/footer'
export default {
  components: {
    Footer
  },
  data () {
    return {
      active: 0,
      TeachingTypeList: [],
      EvaluateDirectionList: [],
      arr: []
    }
  },
  created () {
    this.getList()
  },
  mounted () {

  },
  methods: {
    async getList () {
      let TeachingType = await this.$http.getTeachingType()
      this.TeachingTypeList = TeachingType.data
      // console.log(this.TeachingTypeList, '3434')
      let EvaluateDirection = await this.$http.getEvaluateDirection()

      this.EvaluateDirectionList = EvaluateDirection.data
      // this.arr = EvaluateDirection.data
      // this.arr.map(item => {
      //   if (item.被评价人类型 === '医院管理员') {
      //     this.EvaluateDirectionList.push(item)
      //   }
      // })
      // console.log(this.EvaluateDirectionList, '5555')
    },
    goEvaluate (item) {
      this.$router.push({
        path: '/toStudentEvaluation',
        name: 'toStudentEvaluation',
        params: {
          item
        }
      })
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  padding: 10px;
  .van-tab__pane {
    text-align: left;
    padding-top: 35px;
    height: 100vh;
  }
}
</style>
