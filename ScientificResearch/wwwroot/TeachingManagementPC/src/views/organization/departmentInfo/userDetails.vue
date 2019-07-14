<template>
  <div class="details">
    <el-form label-width="120px" size="small">
      <div class="item-box">
        <h5 class="title">{{item.姓名}}<span v-if="item.部门名称">（{{item.部门名称}}）</span></h5>
        <table class="mailTable">
          <tr>
            <th>姓名</th>
            <td class="name">{{item.姓名}}</td>
            <th>工号</th>
            <td>{{item.工号}}</td>
          </tr>
          <tr>
            <th>所在科室</th>
            <td>{{item.部门名称}}</td>
            <th>身份证</th>
            <td>{{item.身份证}}</td>
          </tr>
          <tr>
            <th>性别</th>
            <td>{{item.性别}}</td>
            <th>出生日期</th>
            <td>{{item.出生日期|dataFormat('yyyy-MM-dd')}}</td>
          </tr>
          <tr>
            <th>手机号</th>
            <td>{{item.手机}}</td>
            <th>邮箱</th>
            <td>{{item.邮箱}}</td>
          </tr>
          <tr>
            <th>政治面貌</th>
            <td>{{item.政治面貌}}</td>
            <th>入职日期</th>
            <td>{{item.入职日期|dataFormat('yyyy-MM-dd')}}</td>
          </tr>
          <tr>
            <th>职称</th>
            <td>{{item.职务名称}}</td>
            <th>最高学位</th>
            <td>{{item.最高学位}}</td>
          </tr>
          <tr>
            <th>说明信息</th>
            <td class="explain" colspan="3">{{item.备注}}</td>
          </tr>
        </table>
      </div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'userDetails',
    props: ['item'],
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      }
    }
  }
</script>

<style scoped>

</style>
