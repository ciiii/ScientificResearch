<template>
  <div class="app-container page-common page-addStudent page-rotaion">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h5 class="title">自动分配轮转</h5>
    <el-form label-width="150px" size="small" class="demo-ruleForm" v-if="isLoad">
      <el-form-item label="教学专业" prop="教学专业" class="el-item">
        <el-select v-model="req.教学专业编号" placeholder="请选择" @change="getStrategys">
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item.编号">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="教学策略" prop="教学策略" class="form-item">
        <el-select v-model="reqDistribution.教学本院策略编号" placeholder="请选择">
          <el-option v-for="item in strategys" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
        </el-select>
        <span class="explain">说明：如教学策略“无数据”，请选择其他【教学专业】！</span>
      </el-form-item>
      <el-form-item label="学员开始培训日期" class="el-form-item-block">
        <div class="data-box">
          <selectDateAfter ref="date" :date="reqDistribution.计划开始培训日期" type="date" format="yyyy-MM-dd"
                           @myEvent="myGetDate" title="选择日期"></selectDateAfter>
        </div>
        <span class="explain">说明：开始日期将作为学员到第一个科室的报到时间，后面将以此时间开始进行计算！</span>
      </el-form-item>
      <el-form-item label="学员名单" class="form-item">
        <el-button @click="btnStudent" plain>选择学员</el-button>
        <el-tag
          v-for="item in selectStudents" :key="item.编号" closable type="" @close="handleClose(item)">
          {{item.姓名}}
        </el-tag>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="beginDistribution">开始分配</el-button>
      <el-button type="success" @click="confirmHandler" v-if="isShow&&list.length>0">保存轮转</el-button>
    </div>
    <div class="content" v-if="isShow">
      <el-table class="tableone" ref="multipleTable"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" stripe
                :span-method="arraySpanMethod">
        <el-table-column align="center" fixed label="序号" width="80">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="姓名" fixed width="150">
          <template slot-scope="scope">
            <div class="name-box" slot="reference">
              <el-badge :value="scope.row.轮转信息.length" class="item">
               <span class="logo-img">
                <img v-if="scope.row.学员信息.头像路径" :src="http+scope.row.学员信息.头像路径" alt="">
                <img v-else src="@/assets/images/user.jpg" alt="">
               </span>
                <span class="title">{{scope.row.学员信息.姓名}}</span>
              </el-badge>
            </div>
            <el-tag size="small" type="" disable-transitions>{{scope.row.学员信息.学员类型名称}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column v-for="item in dateArr" :label="item" :key="item" :width="widthValue">
          <template slot-scope="scope">
            <span v-for="item in scope.row.轮转信息" :key="item.计划出科日期" class="item-box" :width="item.itemWidth"
                  :style="'left:'+ item.leftWidth+'px'">
              <span v-if="item.itemWidth>50" class="begin-time time">{{item.计划入科日期|dataFormat('MM-dd')}}</span>
              <span v-if="item.itemWidth>100" class="end-time time">{{item.计划出科日期|dataFormat('MM-dd')}}</span>
              <el-popover
                placement="top-start"
                :title="scope.row.学员信息.姓名+'【'+scope.row.学员信息.学员类型名称+'】'"
                width="200"
                trigger="hover">
                <p class="keshi">轮转科室：<span>{{item.本院科室名称}}</span></p>
                <p class="begin-time">入科时间：<span><i class="el-icon-time"></i>
                  {{item.计划入科日期|dataFormat('yyyy-MM-dd')}}</span>
                </p>
                <p class="end-time">出科时间：<span><i class="el-icon-time"></i>
                  {{item.计划出科日期|dataFormat('yyyy-MM-dd')}}</span>
                </p>
                <p class="number">技能病例数：<span>{{item.技能病例数?item.技能病例数:0}}</span> 例</p>
                <p class="number">最低管床数：<span>{{item.最低管床数量?item.最低管床数量:0}}</span> 例</p>
                <p class="number">最低全程管理数量：<span>{{item.最低管床数量?item.最低管床数量:0}}</span> 例</p>
                <p class="number">疾病病例数：<span>{{item.疾病病例数?item.疾病病例数:0}}</span> 例</p>
                <p class="number">门诊病例数：<span>{{item.门诊病例数?item.门诊病例数:0}}</span> 例</p>
                <p class="number">最大学员人数：<span>{{item.最大学员人数?item.最大学员人数:0}}</span> 人</p>
                <el-button type="primary" plain class="item-content" slot="reference"
                           :style="'width:'+item.itemWidth+'px'">{{item.本院科室名称}}</el-button>
              </el-popover>
            </span>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <el-dialog title="选择学员" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="big-dialog common-dialog">
      <selectStudentReportTable ref="child" @myEvent="myEventStudent" :selectArr="selectStudents"></selectStudentReportTable>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_OFFICE, URL_SETTING, URL_TEACHING_MANAGEMENT, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import selectDateAfter from '@/components/selectDateAfter';
  import selectStudentReportTable from '@/components/setting/selectStudentReportTable';

  export default {
    name: 'automaticRotation',
    components: {
      selectDateAfter,
      selectStudentReportTable
    },
    data() {
      return {
        reqDistribution: {
          计划开始培训日期: '',
          教学本院策略编号: '',
          学员编号列表: []
        },
        req: {
          教学专业编号: '',
          是否启用: true
        },
        List: [],
        isLoad: false,
        http: HTTP_URL_HOST,
        selectStudents: [],
        majors: [],
        strategys: [],
        isDialog: false,
        isShow: false,
        minTime: '',
        maxTime: '',
        dateArr: [],
        widthValue: 290
      };
    },
    mounted() {
      this.isLoad = true;
      this.getMajors();
    },
    methods: {
      getMajors: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, '');
        if (data && data.length > 0) {
          this.majors = data;
        }
      },
      getStrategys: async function() {
        this.strategys = [];
        let item = this.majors.find((item, index, arr) => {
          if (this.req.教学专业编号 == item.编号) {
            return item;
          }
        });
        this.majorName = item.名称;
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_STRATEGY_LIST, this.req);
        if (data && data.length > 0) {
          this.strategys = data;
          this.reqDistribution.教学本院策略编号 = '';
        } else {
          this.strategys = [];
          this.reqDistribution.教学本院策略编号 = '';
        }
      },
      arraySpanMethod({ row, column, rowIndex, columnIndex }) {
        let index = 2;
        if (columnIndex == index) { //用于设置要合并的列
          return {
            colspan: this.dateArr.length, //合并的列数，设为０则直接不显示
            rowspan: 1
          };
        } else if (columnIndex > index) {
          return {
            colspan: 0, //合并的列数，设为０则直接不显示
            rowspan: 0
          };
        }
      },
      btnStudent() {
        this.isDialog = true;
      },
      handleClose(item) {
        this.selectStudents.splice(this.selectStudents.indexOf(item), 1);
      },
      myGetDate(value) {
        this.reqDistribution.计划开始培训日期 = value;
      },
      myEventStudent(arr) {
        this.selectStudents = arr;
        this.isDialog = false;
      },
      beginDistribution: async function() {
        if (!this.req.教学专业编号 || this.req.教学专业编号 == '') {
          this.$message.error('请选择教学专业！');
          return false;
        }
        if (!this.reqDistribution.教学本院策略编号 || this.reqDistribution.教学本院策略编号 == '') {
          this.$message.error('请选择教学策略！');
          return false;
        }
        if (!this.reqDistribution.计划开始培训日期 || this.reqDistribution.计划开始培训日期 == '') {
          this.$message.error('请选择计划开始培训日期！');
          return false;
        }
        if (!this.selectStudents || this.selectStudents.length == 0) {
          this.$message.error('请选择需要轮转的学员！');
          return false;
        }
        this.reqDistribution.学员编号列表 = [];
        this.selectStudents.forEach((item) => {
          this.reqDistribution.学员编号列表.push(item.编号);
        });
        this.getList();
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_TEACHING_MANAGEMENT.GET_AUTOMATIC_ROTATION, this.reqDistribution);
        if (data && data.list.length > 0) {
          this.minTime = data.最小日期;
          this.maxTime = data.最大日期;
          data = data.list;
          data.forEach((itemA) => {
            itemA.轮转信息.forEach((itemB) => {
              let obj = this.getDay(itemB);
              itemB.itemWidth = obj.itemWidth;
              itemB.leftWidth = obj.leftWidth;
            });
          });
          this.list = data;
          this.dateArr = [];
          this.getTime();
        } else {
          this.list = [];
          this.total = 0;
        }
        this.listLoading = false;
        this.isShow = true;
      },
      getDay(itemB) {
        let startTimestamp = new Date(itemB.计划入科日期);
        let endTimestamp = new Date(itemB.计划出科日期);
        let minTimestamp = new Date(this.minTime);
        let day = Math.floor((endTimestamp - startTimestamp) / 86400000);
        let left = Math.floor((startTimestamp - minTimestamp) / 86400000);
        let width = this.widthValue / 30;
        let obj = {
          itemWidth: day * width,
          leftWidth: left * width
        };
        return obj;
      },
      getTime() {
        let mydateMin = new Date(this.minTime);
        let mydateMax = new Date(this.maxTime);
        let minTimestamp = mydateMin.getTime();
        let maxTimestamp = mydateMax.getTime();
        let minYear = mydateMin.getFullYear();
        let minMonth = mydateMin.getMonth() + 1;
        this.getMonths(minTimestamp, maxTimestamp, minYear, minMonth);
      },
      getMonths(minTimestamp, maxTimestamp, minYear, minMonth) {
        if (minTimestamp <= maxTimestamp) {
          let year = minYear;
          let month = minMonth;
          if (month > 12) {
            month = 1;
            year++;
          }
          let newMonth;
          if (month < 10) {
            newMonth = '0' + month;
          } else {
            newMonth = month;
          }
          let date = year + '年' + newMonth;
          let newTimestamp = Date.parse(new Date(year + '-' + newMonth + '-01 00:00:00'));
          this.dateArr.push(date);
          month++;
          this.getMonths(newTimestamp, maxTimestamp, year, month);
        }
      },
      confirmHandler: _debounce(function() {
        let data = [];
        this.list.forEach((itemA) => {
          itemA.轮转信息.forEach((itemB) => {
            data.push(itemB);
          });
        });
        this.addEditRotation(data);
      }, 300),
      addEditRotation: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_ADD_OR_EDIT_ROTATION, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/rotationList', query: { state: '轮转计划已安排' } });
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .page-rotaion {
    .el-badge__content.is-fixed {
      top: 8px;
      right: auto;
      left: -40px;
    }

    .el-popover {
      .keshi {
        span {
          color: #409EFF;
        }
      }

      .begin-time {
        span {
          color: #67c23a;
        }

      }

      .end-time {
        span {
          color: #f56c6c;
        }

      }

      .number {
        span {
          color: #409EFF;
        }
      }
    }
  }
</style>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";
  @import "@/assets/scss/AddStudent.scss";

  .el-dialog {
    .el-cascader {
      width: 100% !important;
    }

    .el-cascader.is-disabled .el-cascader__label {
      color: #666
    }
  }

  .el-cascader-menu {
    width: 220px !important;
  }

  .el-form-item {
    .el-input {
      width: 80%;
    }

    .el-tag {
      margin-right: 5px;
    }

    .data-box {
      width: 26%;
      display: inline-block;
    }
  }

  .uploadFile-box {
    width: 40% !important;
  }

  .el-item {
    width: 30% !important;
  }

  .form-item {
    width: 70% !important;;

    .el-select {
      width: 30% !important;
      display: inline-block !important;
    }

    span {
      display: inline-block;
      margin-left: 10px;
    }
  }

  .el-form-item-block {
    .el-input__inner {
      width: 30% !important;
    }
  }

  .demo-ruleForm .el-select {
    display: block;
  }

  .page-title {
    margin-bottom: 20px;
  }

  table {

    p {
      margin-top: 0;
      margin-bottom: 0;
      font-size: 12px;
    }

    .td-name {
      width: 150px;
    }

    .td-number {
      width: 60px;
    }

    .td-month {
      width: 300px;
    }

    .name-box {
      overflow: hidden;
      margin-bottom: 5px;
      padding-left: 20px;
    }

    .el-tag {
      float: left;
      margin-left: 20px;
    }

    .logo-img {
      width: 30px !important;
      height: 30px !important;
      margin-right: 5px !important;
    }

    .title {
      padding-top: 10px;
    }

    .item-box {
      height: 65px;
      position: absolute;
      text-align: center;
      padding-top: 30px;
      top: 7px;
      padding-right: 0;
    }

    .item-content {
      display: block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      font-size: 13px;
    }

    .time {
      position: absolute;
      height: 25px;
      display: inline-block;
      padding: 3px 5px;
      border-top-left-radius: 8px;
      border-top-right-radius: 8px;
      font-size: 12px;
      top: 5px;
      border: 1px solid #ddd;
      border-bottom: none;
      color: #666;
    }

    .begin-time {
      left: 0;
      background: #e6f5df;
    }

    .end-time {
      right: 0;
      background: #ffe8e8;
    }

    .item-box:last-child {
      margin-right: 0;
    }


  }

</style>
