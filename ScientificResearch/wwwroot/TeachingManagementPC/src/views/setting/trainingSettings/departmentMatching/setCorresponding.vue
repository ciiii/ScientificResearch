<template>
  <div class="app-container page-common page-addStudent" v-if="isLoad">
    <span class="title"><i class="iconfont icon-set"></i> 设置本院科室对应：</span>
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <div class="title-box">
      <i class="iconfont iconkeshikucunguanli"></i><span> {{info.专业名称}} ( 策略：{{info.策略名称}})</span>
      <el-button size="small" type="success" @click="addData"><i class="iconfont icontianjia"></i> 添加科室对应</el-button>
    </div>
    <div>
      <el-table v-loading="listLoading" :data="model.List"
                border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="标准科室" align="center">
          <template slot-scope="scope">
            <el-select v-model="scope.row.教学专业科室编号" placeholder="请选择" @change="changeMajorDepartment(value,scope.row)" size="small">
              <el-option
                v-for="item in majorDepartments"
                :key="item.编号" :label="item.科室名称" :value="item.编号">
              </el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="本院科室" align="center">
          <template slot-scope="scope">
            <el-select v-model="scope.row.本院科室编号" placeholder="请选择" size="small">
              <el-option
                v-for="item in departments"
                :key="item.编号" :label="item.名称" :value="item.编号">
              </el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="是否必选" align="center" width="150px">
          <template slot-scope="scope">
            <el-switch class="switch"
                       style="display: block"
                       v-model="scope.row.是否必选"
                       active-color="#13ce66"
                       inactive-color="#ff4949"
                       active-text="是">
            </el-switch>
          </template>
        </el-table-column>
        <el-table-column label="培训时长（周）" align="center" width="110px">
          <template slot-scope="scope">
            <el-input v-model="scope.row.培训时长" type="number" size="small"/>
          </template>
        </el-table-column>
        <el-table-column label="管床数量（例）" align="center" width="110px">
          <template slot-scope="scope">
            <el-input v-model="scope.row.最低管床数量" type="number" size="small"/>
          </template>
        </el-table-column>
        <el-table-column label="全程管理（例）" align="center" width="110px">
          <template slot-scope="scope">
            <el-input v-model="scope.row.最低全程管理数量" type="number" size="small"/>
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" prop="备注">
          <template slot-scope="scope">
            <el-input v-model="scope.row.备注" type="textarea"/>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="100px">
          <template slot-scope="scope">
            <el-button size="mini" type="danger" icon="el-icon-delete" @click="btnRemove(scope.$index,scope.row)">删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div slot="footer" class="dialog-footer footer-box" v-if="model.List.length>0">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">提 交</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_ORGANIZATION, URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy } from '@/assets/js/Common';

  export default {
    name: 'addCorresponding',
    data() {
      return {
        list: [],
        req: {
          教学本院策略编号: ''
        },
        item: {},
        isLoad: false,
        listLoading: true,
        majorDepartments: [],
        departments: [],
        model: {
          Id: 0,
          List: []
        }
      };
    },
    mounted() {
      if (sessionStorage.getItem('info')) {
        this.info = JSON.parse(sessionStorage.getItem('info'));
        this.model.Id = this.info.教学本院策略编号;
        this.req.教学本院策略编号 = this.info.教学本院策略编号;
        this.getList();
        this.getMajorDepartment(this.info.教学专业编号);
        this.getDepartment();
        this.isLoad = true;
      }

    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_DEPARTMENT, this.req);
        if (data && data.length > 0) {
          this.model.List = data;
        } else {
          this.model.List = [];
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      getMajorDepartment: async function(id) {
        let postData = {
          教学专业编号: id
        };
        let data = await this.$http.myGet(URL_SETTING.GET_MAJOR_DEPARTMENT, postData);
        if (data && data.length > 0) {
          this.majorDepartments = data;
        }
      },
      changeMajorDepartment(index, item) {
        this.majorDepartments.find((el) => {
          if (el.编号 == index) {
            item.培训时长 = el.最低培训时长;
            item.最低管床数量 = el.最低管床数量;
            item.最低全程管理数量 = el.最低全程管理数量;
          }
        });
      },
      getDepartment: async function() {
        let postData = {
          是否启用: true,
          是否教学科室: true
        };
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_TEACHING_DEPARTMENT_LIST, postData);
        if (data && data.length > 0) {
          this.departments = data;
        }
      },
      addData() {
        let data = {
          编号: 0,
          排序值: 0,
          教学专业科室编号: '',
          本院科室编号: '',
          是否必选: true,
          培训时长: 0,
          最低管床数量: 0,
          最低全程管理数量: 0,
          备注: ''
        };
        this.model.List.push(data);
      },
      confirmHandler: _debounce(function() {
        if (this.model.List.length == 0) {
          this.$message.error('至少添加一项要求！');
          return false;
        }
        for (let i = 0; i < this.model.List.length; i++) {
          if (!this.model.List[i].培训时长) {
            this.$message.error('第（' + (i + 1) + '）行，请输入培训时长！');
            break;
          }
          if (!this.model.List[i].最低管床数量) {
            this.$message.error('第（' + (i + 1) + '）行，请输入最低管床数量！');
            break;
          }
        }
        this.addOrEditAsk(this.model);
      }, 300),
      addOrEditAsk: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_STRATEGY_DEPARTMENT, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/departmentMatching' });
      },
      btnRemove(index, item) {
        if (item.编号 == 0) {
          this.model.List.splice(index, 1);
        } else {
          this.delAsk(index, [item.编号]);
        }
      },
      delAsk: async function(index, data) {
        await this.$http.myPost(URL_SETTING.POST_DELETE_STRATEGY_DEPARTMENT, data);
        this.$message.success('提交成功！');
        this.model.List.splice(index, 1);
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .page-addStudent {
    overflow: hidden;
    position: relative;

    .btn-back-box {
      margin-bottom: 10px;
    }

    .el-input {
      input {
        text-align: center;
      }
    }

    .el-textarea {
      textarea {
        height: 80px;
      }
    }

    .title-box {
      background: #eceff4;
      padding: 8px 15px;
      margin-bottom: 10px;

      h4 {
        margin: 0;
        font-size: 18px;
        color: #333;
        font-weight: normal;

        > i {
          font-size: 20px;
        }
      }

      button {
        margin-left: 10px;
      }
    }
  }

  .title {
    float: left;
    padding-top: 8px;
    font-size: 18px;

    i {
      font-size: 20px;
    }
  }
</style>
