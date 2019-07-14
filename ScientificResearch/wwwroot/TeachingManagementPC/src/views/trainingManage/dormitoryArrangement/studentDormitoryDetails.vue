<template>
  <div class="details">
    <el-form size="small">
      <div class="item-box">
        <h5 class="title">{{item.姓名}}
          <span v-if="item.学员类型名称">( {{item.学员类型名称}}</span>
          <span v-if="item.性别">，{{item.性别}}</span> )
        </h5>
        <el-row>
          <el-col :span="5" align="center" class="left-content">
            <img v-if="item.头像路径" :src="http+item.头像路径" alt="" class="header-img">
            <img v-else src="@/assets/images/user.jpg" alt="" class="header-img">
            <p class="name">{{item.姓名}} </p>
            <p class="type">（ {{item.学员类型名称}} ）</p>
          </el-col>
          <el-col :span="19" class="right-content">
            <table class="mailTable">
              <tr>
                <th>学员姓名</th>
                <td>{{item.姓名}}</td>
                <th>工号</th>
                <td>{{item.工号}}</td>
              </tr>
              <tr>
                <th>学员类型</th>
                <td>{{item.学员类型名称}}</td>
                <th>培训专业</th>
                <td>{{item.专业名称}}</td>
              </tr>
              <tr>
                <th>应届/往届</th>
                <td>{{item.往届应届}}</td>
                <th>性别</th>
                <td>{{item.性别}}</td>
              </tr>
              <tr>
                <th>送培方式</th>
                <td>{{item.送培方式}}</td>
                <th>宿舍楼</th>
                <td>{{item.宿舍楼编号}}</td>
              </tr>
              <tr>
                <th>门禁卡卡号</th>
                <td>{{item.门禁卡卡号}}</td>
                <th>门牌号及床号</th>
                <td>{{item.门牌号及床号}}</td>
              </tr>
              <tr>
                <th>水起数</th>
                <td>{{item.水起数}}</td>
                <th>电起数</th>
                <td>{{item.电起数}}</td>
              </tr>
              <tr>
                <th>气起数</th>
                <td>{{item.气起数}}</td>
                <th>宿舍职位</th>
                <td>{{item.宿舍职位}}</td>
              </tr>
              <tr>
                <th>入住日期</th>
                <td>{{item.入住日期|dataFormat('yyyy-MM-dd')}}</td>
                <th>滞纳金比例</th>
                <td>{{item.滞纳金比例}}%</td>
              </tr>
              <tr>
                <th>建立时间</th>
                <td>{{item.建立时间|dataFormat('yyyy-MM-dd')}}</td>
                <th>退出日期</th>
                <td>{{item.退出日期}}</td>
              </tr>
              <tr>
                <th>退出原因</th>
                <td colspan="3">{{item.退出原因}}</td>
              </tr>
              <tr>
                <th>宿舍安排说明</th>
                <td colspan="3">{{item.宿舍安排说明}}</td>
              </tr>
            </table>
          </el-col>
        </el-row>
      </div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';

  export default {
    name: 'userDetails',
    props: ['item'],
    data() {
      return {
        http: HTTP_URL_HOST
      };
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getClass(value) {
        if (value) {
          return 'state-success';
        } else {
          return 'state-error';
        }
      }
    }
  };
</script>

<style scoped type="text/scss" lang="scss">
  @import "@/assets/scss/Variable.scss";

  .left-content {
    padding-top: 30px;

    .name {
      font-size: 14px;
      font-weight: bold;
      color: #333;
    }

    .type {
      font-size: 12px;
      color: #666;
    }

    p {
      margin-top: 5px;
    }
  }

  .header-img {
    border: 2px solid #edeff1;
    padding: 2px;
    margin-bottom: 10px;
    width: 110px;
    height: 110px;
    border-radius: 50%;
  }

  table {
    td {
      width: 32%;
    }
  }
</style>
