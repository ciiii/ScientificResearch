<template>
  <div class="box">
    <ul v-for="(item,key) in list"
        :key="key">
      <p class="title">{{item.名称}}</p>

    </ul>
    <ul>
      <!-- <p class="title">{{this.list[1].名称}}</p> -->
    </ul>
  </div>
</template>
<script>
export default {
  data () {
    return {
      list: [],
      list2: [],
      code: null
    }
  },
  created () {
    this.getEvaluatio()
  },
  mounted () {

  },
  methods: {
    async getEvaluatio () {
      var para = {
        目标类型: this.$route.params.item
      }
      let res = await this.$http.getEvaluatioClassification(para)
      console.log(res.data, '~~~~~~~')
      this.list = res.data
      this.list.map(item => {
        this.code = {
          教学360评价分类编号: item.编号
        }
      })
      let res2 = await this.$http.getEvaluatioProject(this.code)
      this.list2 = res2.data
      console.log(this.list2, 'qqqqqqqq')
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  padding: 10px;
  text-align: left;
  ul {
    background-color: #fff;
    .title {
      font-size: 14px;
      color: #1296db;
    }
  }
}
</style>
