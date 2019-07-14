<template>
  <div class="app-container page-common page-addStudent" v-if="isLoad">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <span class="title"> <i class="iconfont icon-set"></i> 设置科室基本要求：</span>
    <div class="title-box">
      <i class="iconfont iconkeshikucunguanli"></i><span> {{item.教学专业名称}} ( {{item.科室名称}})</span>
      <el-button size="mini" type="success" @click="addData"><i class="iconfont icontianjia"></i> 添加要求</el-button>
    </div>
    <div>
      <el-table v-loading="listLoading" :data="model.List"
                border fit highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90" prop="number">
          <template slot-scope="scope">{{scope.$index+1}}</template>
        </el-table-column>
        <el-table-column label="项目名称" prop="项目名称">
          <template slot-scope="scope">
            <el-input v-model="scope.row.项目名称" type="textarea"/>
          </template>
        </el-table-column>
        <el-table-column label="说明" align="center">
          <template slot-scope="scope">
            <el-input v-model="scope.row.说明" type="textarea"/>
          </template>
        </el-table-column>
        <el-table-column label="最低评分等级" align="center" width="150px">
          <template slot-scope="scope">
            <el-select v-model="scope.row.最低评分等级" placeholder="请选择" @change="changeLevels(scope.row)">
              <el-option
                v-for="item in levels"
                :key="item.编号"
                :label="item.等级名称"
                :value="item.等级名称">
                <span style="float: left">{{ item.等级名称 }}</span>
                <span style="float: right; color: #8492a6; font-size: 13px">{{ item.最小分值 }}</span>
              </el-option>
            </el-select>
          </template>
        </el-table-column>
        <el-table-column label="最低评分值（分）" align="center" width="150px">
          <template slot-scope="scope">
            {{scope.row.最低评分要求}}
          </template>
        </el-table-column>
        <el-table-column label="备注" align="center" prop="备注">
          <template slot-scope="scope">
            <el-input v-model="scope.row.备注" type="textarea"/>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="100px">
          <template slot-scope="scope">
            <el-button size="mini" type="danger" icon="el-icon-delete" @click="model.List.splice(scope.$index, 1)">删除
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
  import { URL_BASE_INFO, URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy } from '@/assets/js/Common';

  export default {
    name: 'addUser',
    data() {
      return {
        item: {},
        isLoad: false,
        listLoading: true,
        levels: [],
        model: {
          Id: 0,
          List: []
        }
      };
    },
    mounted() {
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'));
        this.model.Id = this.item.编号;
      }
      this.getAsk(this.item.编号);
      this.getlevels();
      this.isLoad = true;
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getlevels: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TEACHING_GRADING_SCALE, '');
        if (data && data.length > 0) {
          this.levels = data;
        }
      },
      changeLevels(item) {
        this.levels.find(function(itemB, index, arr) {
          if (item.最低评分等级 == itemB.等级名称) {
            item.最低评分要求 = itemB.最小分值;
          }
        });
      },
      getAsk: async function(id) {
        let postData = {
          教学专业科室编号: id
        };
        let data = await this.$http.myGet(URL_SETTING.GET_MAJOR_DEPARTMENT_ASK, postData);
        if (data && data.length > 0) {
          this.model.List = data;
        }
        this.listLoading = false;
      },
      addData() {
        let data = {
          编号: 0,
          项目名称: '',
          说明: '',
          最低评分等级: '已掌握',
          最低评分要求: 80,
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
          if (!this.model.List[i].项目名称) {
            this.$message.error('第（' + (i + 1) + '）行，请输入项目名称！');
            break;
          }
        }
        console.info('this.model');
        console.info(this.model);
        this.addOrEditAsk(this.model);
      }, 300),
      addOrEditAsk: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_MAJOR_DEPARTMENT_ASK, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/trainingDepartmentSettings' });
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
