<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <div class="content" v-if="isLoad">
      <h5 class="personal-title">学员考勤（{{newItme.学员信息.姓名}}）</h5>
      <h5 class="title">学员信息</h5>
      <table class="mailTable">
        <tr>
          <th>姓名</th>
          <td>{{newItme.学员信息.姓名}}</td>
          <th>工号</th>
          <td>{{newItme.学员信息.工号}}</td>
          <th>往届应届</th>
          <td>{{newItme.学员信息.往届应届}}</td>
          <th>培训年届(年限)</th>
          <td>{{newItme.学员信息.学员培训年界}}（ {{newItme.学员信息.学员培训年限}} 年）</td>
        </tr>
        <tr>
          <th>学员类型名称</th>
          <td>{{newItme.学员信息.学员类型名称}}</td>
          <th>教学专业</th>
          <td>{{newItme.学员信息.专业名称}}</td>
          <th>教学本院策略</th>
          <td>{{newItme.学员信息.教学本院策略名称}}</td>
          <th>报到时间</th>
          <td>{{newItme.学员信息.报到时间|dataFormat('yyyy-MM-dd')}}</td>
        </tr>
        <tr>
          <th>状态</th>
          <td :class="getStatesA(newItme.学员信息.状态)">{{newItme.学员信息.状态}}</td>
          <th>当前轮转本院科室</th>
          <td>{{newItme.学员信息.当前教学轮转本院科室名称}}</td>
          <th>计划开始培训日期</th>
          <td>{{newItme.学员信息.计划开始培训日期|dataFormat('yyyy-MM-dd')}}</td>
          <th>计划结束培训日期</th>
          <td>{{newItme.学员信息.计划结束培训日期|dataFormat('yyyy-MM-dd')}}</td>
        </tr>
      </table>
      <h5 class="title">学员考勤</h5>
      <div class="filter-container">
        <div class="filter-item">考勤时间：
          <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
        </div>
        <el-button class="filter-item" type="primary" size="small" @click="onSearch">确定</el-button>
        <el-button class="filter-item" type="success" size="small" @click="onSearch">一键全勤</el-button>
      </div>
      <div class="content">
        <el-table class="tableone" ref="multipleTable" v-loading="listLoading" :data="list" element-loading-text="Loading"
                  border fit highlight-current-row stripe>
          <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
          <el-table-column label="正常白班" prop="正常白班">
            <template slot-scope="scope">
              <el-radio-group v-model="scope.row.正常白班">
                <el-radio label="线上品牌商赞助"></el-radio>
                <el-radio label="线下场地免费"></el-radio>
              </el-radio-group>
            </template>
          </el-table-column>
          <el-table-column align="center" label="任务类型" prop="任务类型名称"></el-table-column>
          <el-table-column label="是否医技" prop="是否医技" align="center" width="100">
            <template slot-scope="scope">
              {{scope.row.是否医技?'是':'否'}}
            </template>
          </el-table-column>
        </el-table>
    </div>
  </div>
  <div slot="footer" class="dialog-footer">
    <el-button @click="$router.go(-1)">返回</el-button>
    <el-button type="primary" @click="confirmHandler">提 交</el-button>
  </div>
  </div>
</template>

<script>
  import { URL_OFFICE, URL_SETTING, URL_TEACHING_MANAGEMENT, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate } from '@/assets/js/Common';
  import datePicker from '@/components/datePicker';

  export default {
    name: 'addEditSignIn',
    components: { datePicker },
    data() {
      return {
        objItme: {
          编号: 0,
          考勤日期: '',
          教学考勤类型编号: 0,
          说明: '',
          建立人: 0,
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        form: {
          Id: '',
          List: []
        },
        newItme: {},
        types: [],
        isLoad: false,
        isDialog: false
      };
    },
    mounted() {
      if (localStorage.getItem('userInfo')) {
        let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
        this.form.建立人 = userInfo.编号;
      }
      if (localStorage.getItem('item')) {
        this.newItme = JSON.parse(sessionStorage.getItem('item'));
      }
      this.getType();
      this.isLoad = true;
    },
    methods: {
      getType: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_SING_IN_TYPES, '');
        if (data && data.length > 0) {
          this.types = data;
        } else {
          this.types = [];
        }
      },
      getStatesA(state) {
        switch (state) {
          case '未报到':
            return 'state-warning';
          case '退培':
            return 'state-error';
          case '已报到':
            return 'state-success';
          case '轮转计划已安排':
            return 'state-primary';
          case '在培':
            return 'state-success';
          case '待结业':
            return 'state-warning';
          case '结业':
            return 'state-success';
        }
      },
      btnDel() {
        if (this.obj.状态 != '未入科') {
          return this.isError(this.obj.状态);
        }
        this.$confirm('确认删除已选轮转吗?', '提示', {
          type: 'warning'
        }).then(() => {
          if (this.obj.编号 == 0) {
            this.delItem();
          } else {
            let arr = [];
            arr.push(this.obj.编号);
            this.delRotation(arr);
          }
        });
      },
      btnAdd() {
        this.item = this.newItme.轮转信息[this.newItme.轮转信息.length - 1];
        this.isDialog = true;
      },
      myEvent(item) {
        this.newItme.轮转信息.push(item);
        this.isDialog = false;
      },
      confirmHandler: _debounce(function() {
        let data = [];
        this.newItme.轮转信息.forEach((item) => {
          data.push(item);
        });
        this.addEditRotation(data);
      }, 300),
      addEditRotation: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_ADD_OR_EDIT_ROTATION, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/rotationList', query: { state: '轮转计划已安排' } });
      },
      delRotation: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_BATCH_DELETE_ROTATION, data);
        this.$message.success('提交成功！');
        this.delItem();
      },
      delItem() {
        this.newItme.轮转信息.splice(this.index, 1);
        this.newItme.轮转信息.forEach((item, index) => {
          if (index >= this.index) {
            item.计划入科日期 = addDay(this.newItme.轮转信息[index - 1].计划出科日期, 1);
            item.计划出科日期 = addDay(item.计划入科日期, item.day);
          }
        });
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";
  @import "@/assets/scss/AddStudent.scss";

  .mailTable {
    margin-bottom: 10px;
  }

  .personal-title {
    padding-bottom: 5px;
    margin: 0 0 10px 20px;
    color: #696d73;
    font-size: 22px;
    font-style: italic;
    font-weight: normal;
    text-align: left;
  }

  .rotation-box {
    width: 80%;
    margin: 0 auto 10px;
    overflow: hidden;

    display: flex;
    border-radius: 5px;

    .left {
      flex: 1;
      padding: 15px 20px;
      border: 1px solid $border;
      min-height: 350px;
      max-height: 600px;
      overflow-y: auto;

      ul {
        padding: 0;
        margin: 0;
      }

      li {
        border-radius: 5px;
        overflow: hidden;

        a {
          display: block;
          padding: 10px;
          font-size: 13px;
          border-bottom: 1px solid $border;
        }

        .state {
          float: right;
        }
      }

      .active {
        background: #f0f3f9;
        box-shadow: 0 1px 4px rgba(0, 21, 41, .08);
        border: 1px solid #e9edf7;

        a {
          color: $colorActive;
        }
      }
    }

    .right {
      width: 60px;
      padding-top: 100px;
      margin-left: 15px;

      .el-button {
        margin-left: 0;
        margin-bottom: 10px;
        padding: 8px 12px;

        i {
          font-size: 22px;
        }
      }
    }
  }
</style>

