<template>
  <div class="details" v-if="isLoad">
    <el-tabs type="card">
      <el-tab-pane label="基本信息">
        <el-form size="small">
          <div class="item-box">
            <h5 class="title">{{item.姓名}}
              <span v-if="item.学员类型名称">( {{item.学员类型名称}}</span>
              <span v-if="item.性别">，{{item.性别}} )</span>
            </h5>
            <el-row>
              <el-col :span="5" align="center" class="left-content">
                <img v-if="item.头像路径" :src="http+item.头像路径" alt="" class="header-img">
                <img v-else src="@/assets/images/user.jpg" alt="" class="header-img">
                <p class="name">{{item.姓名}}<span v-if="item.工号">（工号：{{item.工号}}）</span></p>
                <p class="type">{{item.学员类型名称}}</p>
              </el-col>
              <el-col :span="19" class="right-content">
                <table class="mailTable">
                  <tr>
                    <th>学员类型名称</th>
                    <td>{{item.学员类型名称}}</td>
                    <th>专业方向</th>
                    <td>{{item.专业名称}}（{{item.学员培训年界}}级，学制:{{item.学员培训年限}} 年）</td>
                  </tr>
                  <tr>
                    <th>应届/往届</th>
                    <td>{{item.往届应届}}</td>
                    <th>家庭住址</th>
                    <td>{{item.家庭住址}}</td>
                  </tr>
                  <tr>
                    <th>证件号码</th>
                    <td>{{item.证件号码}}<span v-if="item.证件类型">（{{item.证件类型}}）</span></td>
                    <th>出生日期</th>
                    <td>{{item.出生日期|dataFormat('yyyy-MM-dd')}}</td>
                  </tr>
                  <tr>
                    <th>手机号码</th>
                    <td>{{item.手机号码}}</td>
                    <th>电子邮箱</th>
                    <td>{{item.电子邮箱}}</td>
                  </tr>
                  <tr>
                    <th>QQ号码</th>
                    <td>{{item.QQ号码}}</td>
                    <th>微信号</th>
                    <td>{{item.微信号}}</td>
                  </tr>
                  <tr>
                    <th>政治面貌</th>
                    <td>{{item.政治面貌}}</td>
                    <th>家庭住址</th>
                    <td>{{item.家庭住址}}</td>
                  </tr>
                  <tr>
                    <th>取得执业证书日期</th>
                    <td>{{item.取得执业证书日期|dataFormat('yyyy-MM-dd')}}</td>
                    <th>执业证书编号</th>
                    <td>{{item.执业证书编号}}</td>
                  </tr>
                  <tr>
                    <th>取得医师资格证书日期</th>
                    <td>{{item.取得医师资格证书日期|dataFormat('yyyy-MM-dd')}}</td>
                    <th>医师资格证书编号</th>
                    <td>{{item.医师资格证书编号}}</td>
                  </tr>
                  <tr>
                    <th>毕业年份</th>
                    <td>{{item.毕业年份}}</td>
                    <th>毕业学校</th>
                    <td>{{item.毕业学校}}</td>
                  </tr>

                  <tr>
                    <th>毕业专业</th>
                    <td>{{item.毕业专业}}</td>
                    <th>毕业证编码</th>
                    <td>{{item.毕业证编码}}</td>
                  </tr>
                  <tr>
                    <th>送培方式</th>
                    <td>{{item.送培方式}}</td>
                    <th>工作单位</th>
                    <td>{{item.工作单位}}</td>
                  </tr>
                  <tr>
                    <th>医疗卫生机构</th>
                    <td>{{item.医疗卫生机构}}</td>
                    <th>最高学历</th>
                    <td>{{item.最高学历}}</td>
                  </tr>
                </table>
              </el-col>
            </el-row>
          </div>
        </el-form>
      </el-tab-pane>
      <el-tab-pane label="培训情况">
        <el-form size="small">
          <div class="item-box">
            <h5 class="title">{{train.姓名}}
              <span v-if="train.学员类型名称">( {{train.学员类型名称}}</span>
              <span v-if="train.性别">，{{train.性别}} )</span>
            </h5>
            <table class="mailTable">
              <tr>
                <th>姓名</th>
                <td>{{train.姓名}}</td>
                <th>学员类型名称</th>
                <td>{{train.学员类型名称}}</td>
              </tr>
              <tr>
                <th>专业方向</th>
                <td>{{train.专业名称}}（{{train.学员培训年界}}级，学制:{{train.学员培训年限}} 年）</td>
                <th>状态</th>
                <td>
                  <el-tag :type="getStudentStates(train.状态)" size="small">{{train.状态}}</el-tag>
                </td>
              </tr>
              <tr>
                <th>当前教学轮转本院科室</th>
                <td>{{train.当前教学轮转本院科室名称}}</td>
                <th>当前科室管理员</th>
                <td>{{train.当前科室管理员姓名}}</td>
              </tr>
              <tr>
                <th>教学本院策略</th>
                <td>{{train.教学本院策略名称}}</td>
                <th>报到时间</th>
                <td>{{train.报到时间|dataFormat('yyyy-MM-dd')}}</td>
              </tr>
              <tr>
                <th>计划开始培训日期</th>
                <td>{{train.计划开始培训日期|dataFormat('yyyy-MM-dd')}}</td>
                <th>计划结束培训日期</th>
                <td>{{train.计划结束培训日期|dataFormat('yyyy-MM-dd')}}</td>
              </tr>
              <tr>
                <th>实际开始培训日期</th>
                <td>{{train.实际开始培训日期|dataFormat('yyyy-MM-dd')}}</td>
                <th>实际结束培训日期</th>
                <td>{{train.实际结束培训日期|dataFormat('yyyy-MM-dd')}}</td>
              </tr>
              <tr>
                <th>结业日期</th>
                <td>{{train.结业日期|dataFormat('yyyy-MM-dd')}}</td>
                <th>退培日期</th>
                <td>{{train.退培日期|dataFormat('yyyy-MM-dd')}}</td>
              </tr>
              <tr>
                <th>备注</th>
                <td colspan="3">{{train.备注}}</td>
              </tr>
            </table>
          </div>
        </el-form>
      </el-tab-pane>
    </el-tabs>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';

  export default {
    name: 'userDetails',
    props: ['item'],
    data() {
      return {
        http: HTTP_URL_HOST,
        isLoad: false,
        details: {},
        train: {}
      };
    },
    mounted() {
      this.getDetails(this.item.编号);
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getStudentStates(state) {
        switch (state) {
          case '未报到':
            return 'warning';
          case '退培':
            return 'danger';
          case '已报到':
            return 'success';
          case '轮转计划已安排':
            return '';
          case '在培':
            return 'success';
          case '待结业':
            return 'warning';
          case '结业':
            return 'success';
        }
      },
      getDetails: async function(id) {
        let postData = {
          学员编号: id
        };
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_STUDENT_INFO, postData);
        if (data) {
          this.details = data;
          this.train = data.培训情况;
          this.isLoad = true;
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
    border-radius: 6px;
  }

  table {
    td {
      width: 32%;
    }
  }
</style>
