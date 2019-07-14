<template>
  <div class="app-container page-common page-addStudent" v-if="isLoad">
    <span class="item-title"><i class="iconfont iconkeshikucunguanli"></i><span> 专业方向：{{info.专业名称}} ，策略：{{info.item.教学本院策略名称}}（ 标准科室：{{info.item.教学专业科室名称}} ，本院科室：{{info.item.本院科室名称}} ）</span></span>
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <div class="filter-container">
      <el-button size="small" class="filter-item" type="success" @click="btnAddEdit('添加任务',true,'')">
        <i class="iconfont icontianjia"></i> 添加任务
      </el-button>
      <el-input v-model="req.Like项目名称" placeholder="项目名称" style="width: 200px;" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
      <el-button class="filter-item" size="small" type="primary" icon="el-icon-search" @click="onSearch">查询</el-button>
      <el-button size="mini" type="danger" icon="el-icon-delete" @click="btnBatchDel">批量删除</el-button>
    </div>
    <div class="content">
      <el-table class="tableone" ref="multipleTable" v-loading="listLoading" :data="list" element-loading-text="Loading"
                border fit highlight-current-row stripe @selection-change="handleSelectionChange" :row-key="getRowKeys">
        <el-table-column type="selection" align="center" width="55" :reserve-selection="true"
                         prop="编号"></el-table-column>
        <el-table-column align="center" label="序号" width="90" prop="number"></el-table-column>
        <el-table-column label="任务项目名称" prop="项目名称"></el-table-column>
        <el-table-column align="center" label="任务类型" prop="任务类型名称"></el-table-column>
        <el-table-column label="是否医技" prop="是否医技" align="center" width="100">
          <template slot-scope="scope">
            {{scope.row.是否医技?'是':'否'}}
          </template>
        </el-table-column>
        <el-table-column label="是否病房" prop="是否病房" align="center" width="100">
          <template slot-scope="scope">
            {{scope.row.是否病房?'是':'否'}}
          </template>
        </el-table-column>
        <el-table-column label="是否门诊" prop="是否门诊" align="center" width="100">
          <template slot-scope="scope">
            {{scope.row.是否医技?'是':'否'}}
          </template>
        </el-table-column>
        <el-table-column align="center" label="最低评分等级" prop="最低评分等级"></el-table-column>
        <el-table-column align="center" label="最低评分要求（分）" prop="最低评分要求"></el-table-column>
        <el-table-column align="center" label="数量要求（例）" prop="数量要求"></el-table-column>
        <el-table-column label="操作" align="center" width="200px">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit('修改任务',false,scope.row)">编辑
            </el-button>
            <el-button size="mini" type="danger" icon="el-icon-delete" @click="btnDelTask(scope.row,scope.$index)">删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <div class="block paging">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page.sync="req.Index"
          :page-size="req.Size" background
          layout="total, prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog'
               :close-on-click-modal="false" width="30%" class="common-dialog">
      <addOrEditTask ref="child" @myEvent="getMyEvent" :item="item" :isAdd="isAdd"
                     :id="this.req.教学本院科室编号"></addOrEditTask>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_BASE_INFO, URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import addOrEditTask from './addOrEditTask';

  export default {
    name: 'taskList',
    components: { addOrEditTask },
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 13,
          OrderType: false,
          教学本院科室编号: '',
          Like项目名称: ''
        },
        info: {},
        item: {},
        isLoad: false,
        isDialog: false,
        listLoading: true,
        isAdd: false,
        total: 0,
        title: '',
        multipleSelection: [],
        getRowKeys(row) {
          return row.编号;
        }
      };
    },
    mounted() {
      if (sessionStorage.getItem('info')) {
        this.info = JSON.parse(sessionStorage.getItem('info'));
        this.req.教学本院科室编号 = this.info.item.编号;
      }
      this.listLoading = true;
      this.getTasks();
    },
    methods: {
      getTasks: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_PAGING_HOSPITAL_DEPARTMENT_TASK, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          let number = (this.req.Index - 1) * this.req.Size + 1;
          data.forEach(function(item) {
            item.number = number;
            number++;
          });
          this.list = data;
        }
        this.listLoading = false;
        this.isLoad = true;
      },
      onSearch() {
        this.req.Index = 1;
        this.listLoading = true;
        this.list = [];
        this.getTasks();
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getTasks();
      },
      handleSelectionChange(rows) {
        this.multipleSelection = [];
        if (rows) {
          rows.forEach(row => {
            if (row) {
              this.multipleSelection.push(row);
            }
          });
        }
        console.info(this.multipleSelection);
      },
      btnBatchDel() {
        if (this.multipleSelection.length == 0) {
          this.$message.error('请先勾选需要删除的任务项目！');
        } else {
          this.$confirm('确认要删除已勾选该任务吗?', '提示', {
            type: 'warning'
          }).then(() => {
            let data = [];
            this.multipleSelection.forEach(function(item) {
              data.push(item.编号);
            });
            this.postBatchDelTask(data);
          });
        }
      },
      postBatchDelTask: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_DELETE_HOSPITAL_DEPARTMENT_TASK, data);
        this.$message.success('提交成功！');
        this.onSearch();
      },
      btnDelTask(item, index) {
        this.$confirm('确认要删除该任务吗?', '提示', {
          type: 'warning'
        }).then(() => {
          this.postDelTask(item.编号, index);
        });
      },
      postDelTask: async function(id, index) {
        let data = [id];
        await this.$http.myPost(URL_SETTING.POST_DELETE_HOSPITAL_DEPARTMENT_TASK, data);
        this.list.splice(index, 1);
        this.$message.success('提交成功！');
      },
      btnAddEdit(title, isAdd, item) {
        this.title = title;
        this.isAdd = isAdd;
        this.item = item;
        this.isDialog = true;
      },
      getMyEvent(value) {
        this.isDialog = value;
        this.onSearch();
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

  .item-title {
    float: left;
    padding-top: 8px;
    font-size: 18px;

    i {
      font-size: 20px;
    }
  }

</style>
