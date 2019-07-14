<template>
  <div class="app-container page-common page-addStudent page-addEditSignIn">
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
          <th>当前科室管理员</th>
          <td>{{newItme.学员信息.科室管理员姓名}}</td>
          <th>计划入科日期</th>
          <td>{{newItme.学员信息.计划开始培训日期|dataFormat('yyyy-MM-dd')}}</td>
          <th>计划出科日期</th>
          <td>{{newItme.学员信息.计划结束培训日期|dataFormat('yyyy-MM-dd')}}</td>
        </tr>

      </table>
      <h5 class="title">轮转信息</h5>
      <table class="mailTable">
        <tr>
          <th>实际入科日期</th>
          <td>{{rotationData.教学轮转.实际入科日期|dataFormat('yyyy-MM-dd')}}</td>
          <th>计划出科日期</th>
          <td>{{rotationData.教学轮转.计划出科日期|dataFormat('yyyy-MM-dd')}}</td>
          <th>带教老师姓名</th>
          <td>{{rotationData.教学轮转.带教老师姓名}}</td>
          <th>最低管床数</th>
          <td>{{rotationData.教学轮转.最低管床数}} 例</td>
        </tr>
        <tr>
          <th>最低管床数量</th>
          <td>{{rotationData.教学轮转.最低管床数量}} 例</td>
          <th>技能病例数</th>
          <td>{{rotationData.教学轮转.技能病例数}} 例</td>
          <th>疾病病例数</th>
          <td>{{rotationData.教学轮转.疾病病例数}} 例</td>
          <th>门诊病例数</th>
          <td>{{rotationData.教学轮转.门诊病例数}} 例</td>
        </tr>
        <tr>
          <th>住院病例数</th>
          <td>{{rotationData.教学轮转.住院病例数}} 例</td>
          <th>医技病例数</th>
          <td>{{rotationData.教学轮转.医技病例数}} 例</td>
          <th>最大学员人数</th>
          <td>{{rotationData.教学轮转.最大学员人数}} 人</td>
          <th>状态</th>
          <td>
            <el-tag :type="getStates(rotationData.教学轮转.状态)" size="small" disable-transitions>{{rotationData.教学轮转.状态}}
            </el-tag>
          </td>
        </tr>
      </table>
      <h5 class="title">学员考勤</h5>
      <div class="filter-container">
        <div class="filter-item">考勤时间：
          <datePicker :date="time" :placeholder="placeholder" type="daterange" @myEvent="changeTime"></datePicker>
        </div>
        <el-button class="filter-item" type="primary" size="mini" @click="onSearch">确定</el-button>
        <el-button class="filter-item" type="success" size="mini" @click="brnFullAttendance">一键全勤</el-button>
      </div>
      <div class="content">
        <el-table class="tableone" ref="multipleTable" v-loading="listLoading" :data="list"
                  element-loading-text="Loading" height="500"
                  border fit highlight-current-row stripe>
          <el-table-column align="center" label="序号" width="60">
            <template slot-scope="scope">{{scope.$index+1}}</template>
          </el-table-column>
          <el-table-column label="考勤日期" prop="考勤日期" align="center" width="130">
            <template slot-scope="scope">{{scope.row.考勤日期|dataFormat('yyyy-MM-dd')}}</template>
          </el-table-column>
          <el-table-column :label="item.名称" v-for="item in types" :key="item.编号" width="120" align="center">
            <template slot-scope="scope">
              <el-radio v-model="scope.row.教学考勤类型编号" :label="item.编号"></el-radio>
            </template>
          </el-table-column>
          <el-table-column align="center" label="说明">
            <template slot-scope="scope">
              <el-input v-model="scope.row.说明" size="mini" type="textarea"
                        autosize></el-input>
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
  import { _debounce, deepCopy, formatDate, getObjArr, addDay, timeStamp } from '@/assets/js/Common';
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
        placeholder: {
          start: '开始日期',
          end: '结束日期'
        },
        newItme: {},
        types: [],
        rotationData: {},
        time: [],
        list: [],
        isLoad: false,
        Loading: false,
        isDialog: false,
        listLoading: false
      };
    },
    mounted() {
      if (localStorage.getItem('userInfo')) {
        let userInfo = getObjArr('userInfo').人员;
        this.form.建立人 = userInfo.编号;
      }
      if (localStorage.getItem('dataItem')) {
        let data = getObjArr('dataItem');
        this.newItme = data.item;
        this.form.Id = data.item.学员信息.当前教学轮转编号;
        this.getType();
        this.getRotationSignIn(this.form.Id);
      }
    },
    methods: {
      getType: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_SING_IN_TYPES, '');
        if (data && data.length > 0) {
          this.types = data.reverse();
        } else {
          this.types = [];
        }
      },
      getRotationSignIn: async function(id) {
        let postDate = {
          教学轮转编号: id
        };
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_ROTATION_SING_IN, postDate);
        if (data) {
          console.info(data);
          this.time = [data.教学轮转.实际入科日期, data.教学轮转.计划出科日期];
          this.rotationData = data;
          this.getList();
        } else {
          this.time = [];
        }
      },
      getList() {
        this.list = [];
        this.getTime(this.time[0], this.time[1]);
        this.listLoading = false;
        this.isLoad = true;
      },
      getTime(beginTime, endTime) {
        if (timeStamp(beginTime) <= timeStamp(endTime)) {
          let data;
          data = this.rotationData.教学考勤情况列表.find((item) => {
            if (timeStamp(item.考勤日期) == timeStamp(beginTime)) {
              return item;
            }
          });
          if (!data) {
            data = deepCopy(this.objItme);
            data.考勤日期 = beginTime;
          }
          this.list.push(data);
          beginTime = addDay(beginTime, 1) + ' 00:00:00';
          this.getTime(beginTime, endTime);
        }
      },
      changeTime(time) {
        this.time = time;
      },
      onSearch() {
        if (timeStamp(this.time[0]) < timeStamp(this.rotationData.教学轮转.实际入科日期) ||
          timeStamp(this.time[1]) > timeStamp(this.rotationData.教学轮转.计划出科日期)) {
          this.$message({
            showClose: true,
            message: '考勤时间必须在【实际入科日期】到【计划出科日期】之内，请选择正确的时间段！',
            type: 'error',
            duration: 5000
          });
        } else {
          this.list = [];
          this.listLoading = true;
          this.getList();
        }
      },
      brnFullAttendance() {
        this.list.forEach((item) => {
          if (item.教学考勤类型编号 == 0) {
            item.教学考勤类型编号 = 1;
          }
        });
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
      getStates(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
      },
      confirmHandler() {
        this.list.map((item, key, ary) => {
          if (item.教学考勤类型编号 == 0) {
            this.$message.error('【' + item.考勤日期 + '】请选择考勤类型！');
            return false;
          }
        });
        this.form.List = this.list;
        this.addEditSignIn(this.form);
      },
      addEditSignIn: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_ADD_EDIT_SING_IN, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/signIn' });
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .page-addEditSignIn {
    .el-table {
      .el-radio {
        padding-left: 10px;

        .el-radio__label {
          opacity: 0;
        }
      }
    }
  }
</style>
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
</style>

