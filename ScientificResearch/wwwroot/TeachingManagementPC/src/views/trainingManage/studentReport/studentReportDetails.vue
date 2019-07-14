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
            <el-form ref="form" :model="item" label-width="130px" size="small">
              <el-form-item label="学员姓名:">
                <span>{{item.姓名}}</span>
              </el-form-item>
              <el-form-item label="工号:">
                <span>{{item.工号}}</span>
              </el-form-item>
              <el-form-item label="学员类型:">
                <span>{{item.学员类型名称}}</span>
              </el-form-item>
              <el-form-item label="专业方向:">
                <span>{{item.专业名称}}（{{item.学员培训年界}}级，学制:{{item.学员培训年限}} 年）</span>
              </el-form-item>
              <el-form-item label="应届/往届:">
                <span>{{item.往届应届}}</span>
              </el-form-item>
              <el-form-item label="性别:">
                <span>{{item.性别}}</span>
              </el-form-item>
              <el-form-item label="送培方式:">
                <span>{{item.送培方式}}</span>
              </el-form-item>
              <el-form-item label="教学本院策略:">
                <span>{{item.教学本院策略名称}}</span>
              </el-form-item>
              <el-form-item label="是否已报到:">
                <span :class="getClass(item.是否已报到)">{{item.是否已报到?'已报到':'未报到'}}</span>
              </el-form-item>
              <el-form-item label="报到时间:">
                <span>{{item.报到时间|dataFormat('yyyy-MM-dd')}}</span>
              </el-form-item>
              <el-form-item label="建立时间:">
                <span>{{item.建立时间|dataFormat('yyyy-MM-dd')}}</span>
              </el-form-item>
              <el-form-item label="备注:" class="el-form-item-block">
                <span>{{item.备注}}</span>
              </el-form-item>
            </el-form>
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
  .right-content{
    border-left: 1px solid $border;
    padding-left: 10px;
  }
</style>
