<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <div class="content" v-if="isLoad">
      <h5 class="personal-title">修改学员轮转（{{newItme.学员信息.姓名}}）</h5>
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
      <h5 class="title">此学员在本院待轮转的科室</h5>
      <div class="rotation-box">
        <div class="left">
          <ul>
            <li v-for="(item,$index) in newItme.轮转信息" :key="item.计划出科日期" :class="{active:index==$index}"
                @click="clickLi($index,item)">
              <a href="javascript:;">
                <span class="title"><el-tag>{{item.本院科室名称}}</el-tag></span>
                <span class="begin-time"><i class="el-icon-time"></i> {{item.计划入科日期|dataFormat('yyyy-MM-dd')}} 至</span>
                <span class="end-time"><i class="el-icon-time"></i> {{item.计划出科日期|dataFormat('yyyy-MM-dd')}}</span>
                <span> ( 时间：{{item.day}}天，可容人数：{{item.最大学员人数}}人)</span>
                <span class="state">
                  <el-tag :type="item.state" size="small" disable-transitions>{{item.状态}}</el-tag>
                </span>
              </a>
            </li>
          </ul>
        </div>
        <div class="right">
          <el-tooltip class="item" effect="dark" content="下移" placement="right">
            <el-button type="primary" plain @click="btnDown"><i class="iconfont iconxiangxia"></i></el-button>
          </el-tooltip>
          <el-tooltip class="item" effect="dark" content="上移" placement="right">
            <el-button type="primary" plain @click="btnUp"><i class="iconfont iconshangxian"></i></el-button>
          </el-tooltip>
          <el-tooltip class="item" effect="dark" content="删除" placement="right">
            <el-button type="danger" plain @click="btnDel"><i class="iconfont iconshanchu11"></i></el-button>
          </el-tooltip>
          <el-tooltip class="item" effect="dark" content="添加" placement="right">
            <el-button type="success" plain @click="btnAdd"><i class="iconfont icontianjia"></i></el-button>
          </el-tooltip>
        </div>
      </div>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">提 交</el-button>
    </div>
    <el-dialog title="添加科室轮转" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="common-dialog">
      <addDepartmentRotation ref="child" @myEvent="myEvent" :item="item"></addDepartmentRotation>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_OFFICE, URL_SETTING, URL_TEACHING_MANAGEMENT, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import {
    _debounce,
    deepCopy,
    matchingProperty,
    alterItem,
    countDays,
    addDay,
    reduceDay
  } from '@/assets/js/Common';
  import selectDateAfter from '@/components/selectDateAfter';
  import addDepartmentRotation from './addDepartmentRotation';

  export default {
    name: 'editRotation',
    components: { selectDateAfter, addDepartmentRotation },
    data() {
      return {
        form: {
          编号: 0,
          学员编号: 0,
          计划入科日期: '',
          计划出科日期: '',
          实际入科日期: '',
          实际出科日期: '',
          教学本院科室编号: 0,
          带教老师编号: 0,
          最低管床数量: 0,
          最低全程管理数量: 0,
          备注: ''
        },
        newItme: {},
        isLoad: false,
        isDialog: false,
        isShow: false,
        index: 0,
        obj: {}
      };
    },
    mounted() {
      if (sessionStorage.getItem('item')) {
        this.newItme = JSON.parse(sessionStorage.getItem('item'));
        this.form.学员编号 = this.newItme.学员信息.编号;
        this.newItme.轮转信息.forEach((item) => {
          item.day = countDays(item.计划入科日期, item.计划出科日期);
          item.state = this.getStatesB(item.状态);
        });
        this.obj = this.newItme.轮转信息[0];
        this.isLoad = true;
      }

    },
    methods: {
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
      getStatesB(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
      },
      clickLi(index, item) {
        this.index = index;
        this.obj = item;
      },
      isError(state) {
        this.$message({
          showClose: true,
          message: '【' + state + '】状态不能进行操作！',
          type: 'error'
        });
      },
      btnDown() {
        if (this.obj.状态 != '未入科') {
          return this.isError(this.obj.状态);
        }
        if (this.index != this.newItme.轮转信息.length - 1) {
          this.newItme.轮转信息 = alterItem(this.newItme.轮转信息, this.index, this.index + 1);
          this.index++;
          this.newItme.轮转信息[this.index].计划出科日期 = this.newItme.轮转信息[this.index - 1].计划出科日期;
          this.newItme.轮转信息[this.index - 1].计划入科日期 = this.newItme.轮转信息[this.index].计划入科日期;
          this.newItme.轮转信息[this.index].计划入科日期 = reduceDay(this.newItme.轮转信息[this.index].计划出科日期, this.newItme.轮转信息[this.index].day);
          this.newItme.轮转信息[this.index - 1].计划出科日期 = addDay(this.newItme.轮转信息[this.index - 1].计划入科日期, this.newItme.轮转信息[this.index - 1].day);
        }
      },
      btnUp() {
        if (this.obj.状态 != '未入科') {
          return this.isError(this.obj.状态);
        }
        if (this.index != 0) {
          this.newItme.轮转信息 = alterItem(this.newItme.轮转信息, this.index, this.index - 1);
          this.index--;
          this.newItme.轮转信息[this.index].计划入科日期 = this.newItme.轮转信息[this.index + 1].计划入科日期;
          this.newItme.轮转信息[this.index + 1].计划出科日期 = this.newItme.轮转信息[this.index].计划出科日期;
          this.newItme.轮转信息[this.index].计划出科日期 = addDay(this.newItme.轮转信息[this.index].计划入科日期, this.newItme.轮转信息[this.index].day);
          this.newItme.轮转信息[this.index + 1].计划入科日期 = reduceDay(this.newItme.轮转信息[this.index + 1].计划出科日期, this.newItme.轮转信息[this.index + 1].day);
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
        if (this.newItme.轮转信息.length > 0) {
          this.obj = this.newItme.轮转信息[0];
        } else {
          this.obj = [];
        }
        this.index = 0;
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

