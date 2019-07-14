<template>
  <div class="app-container page-common">
    <h4 class="page-title" align="center">标准培训专业设置</h4>
    <div class="filter-container">
      <el-button class="filter-item" type="success" @click="btnAddEdit('添加专业',true,'')">
        <i class="iconfont icontianjia"></i> 添加专业
      </el-button>
      <div class="filter-item">
        <selectDate ref="date" :date="req.年份" type="year" format="yyyy" title="选择年" @myEvent="changeTime"
                    v-if="isLoad"></selectDate>
      </div>
      <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
      </el-button>
    </div>
    <div class="content" v-if="list&&list.length>0">
      <el-table class="tableone"
                v-loading="listLoading" :data="list"
                element-loading-text="Loading" border fit
                highlight-current-row stripe>
        <el-table-column align="center" label="序号" width="90">
          <template slot-scope="scope">
            {{ scope.$index+1 }}
          </template>
        </el-table-column>
        <el-table-column label="专业名称" prop="名称"></el-table-column>
        <el-table-column label="年份" align="center" prop="年份" width="150"></el-table-column>
        <el-table-column label="是否国家标准" align="center">
          <template slot-scope="scope">
            {{scope.row?'是':'否'}}
          </template>
        </el-table-column>
        <el-table-column label="学习要求" align="center" prop="学习要求"></el-table-column>
        <el-table-column label="标准代码" align="center" prop="标准代码"></el-table-column>
        <el-table-column label="最低培训时长（周）" align="center" prop="最低培训时长"></el-table-column>
        </el-table-column>
        <el-table-column label="操作" align="center" width="200">
          <template slot-scope="scope">
            <el-button size="mini" type="success" plain icon="el-icon-edit"
                       @click="btnAddEdit('修改专业',false,scope.row)">编辑
            </el-button>
            <el-button size="mini" type="primary" plain @click="btnDetails(scope.row)">查看详情</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="@/assets/images/nothing.png"></div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl'
  import selectDate from '@/components/selectDate'

  export default {
    components: { selectDate},
    data() {
      return {
        list: [],
        req: {
          年份: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        item: {},
        isLoad: false
      }
    },
    mounted() {
      this.listLoading = true
      this.getList()
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, this.req)
        if (data && data.length > 0) {
          data.forEach(function(item) {
            if (item.学习要求及目标 && item.学习要求及目标 != '') {
              item.学习要求 = '有'
            } else {
              item.学习要求 = '无'
            }
          })
          this.list = data
        } else {
          this.list = []
        }
        this.listLoading = false
        this.isLoad = true
      },
      onSearch() {
        this.listLoading = true
        this.list = []
        this.getList()
      },
      changeTime(val){
        this.req.年份 = val
        this.onSearch()
      },
      btnAddEdit(title, isAdd, item) {
        sessionStorage.setItem('item', JSON.stringify(item))
        this.$router.push({
          name: 'AddOrEditMajor', params: {
            isAdd: isAdd
          }
        })
      },
      btnDetails(item) {
        sessionStorage.setItem('item', JSON.stringify(item))
        this.$router.push({ path: '/majorDetails' })
      },
    }
  }
</script>
<style type="text/scss" lang="scss" scoped>
  .el-date-editor {
    padding: 0;
  }

  .el-cascader, .el-cascader-menu {
    width: 300px;
  }
</style>
