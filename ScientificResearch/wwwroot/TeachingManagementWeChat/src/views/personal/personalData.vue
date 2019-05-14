<template>
  <section class="box">
    <van-tabs v-model="active"
              swipeable
              class="popup">
      <van-tab title="基本信息">
        <van-cell-group class="input">
          <van-field v-model="list.工号"
                     label="登录号码"
                     :readonly="true" />
          <van-field v-model="list.部门名称"
                     label="所在科室"
                     :readonly="true" />
          <van-field v-model="list.手机"
                     label="联系电话"
                     :readonly="true" />
          <van-field v-model="list.技术职称"
                     label="职称"
                     :readonly="true" />
          <van-field v-model="list.政治面貌"
                     label="政治面貌"
                     :readonly="true" />
          <van-field v-model="list.学历"
                     label="最高学历"
                     :readonly="true" />
          <van-field v-model="list.姓名"
                     label="联系人"
                     :readonly="true" />
        </van-cell-group>
      </van-tab>
      <van-tab title="人事信息">
        <div>
          <van-cell-group>
            <van-field v-model="list.入职日期"
                       label="入职日期"
                       :readonly="true" />
            <van-field v-model="list.人员类别"
                       label="人员类别"
                       :readonly="true" />
            <van-field v-model="list.岗位性质"
                       label="岗位性质"
                       :readonly="true" />
            <van-field v-model="list.岗位类型"
                       label="岗位类型"
                       :readonly="true" />
            <van-field v-model="list.岗位名称"
                       label="岗位名称"
                       :readonly="true" />
            <van-field v-model="list.合同开始日期"
                       label="合同开始日期"
                       :readonly="true" />
            <van-field v-model="list.合同结束日期"
                       label="合同结束日期"
                       :readonly="true" />
            <van-field v-model="list.参加工作时间"
                       label="参加工作时间"
                       :readonly="true" />
          </van-cell-group>
        </div>
      </van-tab>
    </van-tabs>
    <ReturnBtn />
  </section>
</template>
<script>
export default {
  data () {
    return {
      active: 0,
      list: []
    }
  },
  mounted () {
    this.getPersonnelDetails()
  },
  methods: {
    async getPersonnelDetails () {
      var para = {
        人员编号: JSON.parse(localStorage.getItem('teachingPersonnel')).编号
      }
      let res = await this.$http.getSomePersonnelDetails(para)
      this.list = res.data
    }
  }
}
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
}
.box {
  padding: 10px;
}
</style>
