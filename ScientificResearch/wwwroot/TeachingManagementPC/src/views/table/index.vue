<template>
  <div class="app-container">
    <div class="filter-container">
      <el-input v-model="姓名" placeholder="姓名" style="width: 200px;" class="filter-item" @keyup.enter.native="onSearch" />
      <el-select v-model="类型1" placeholder="类型" clearable style="width: 90px" class="filter-item">
        <el-option label="类型1" value="类型1" />
        <el-option label="类型2" value="类型2" />
      </el-select>
      <el-select v-model="类型2" placeholder="请选择类型" clearable class="filter-item" style="width: 130px">
        <el-option  label="类型1" value="item.key" />
        <el-option  label="类型2" value="item.44" />
      </el-select>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-search" >搜索</el-button>
      <el-button class="filter-item" style="margin-left: 10px;" type="primary" icon="el-icon-edit">添加</el-button>
      <el-button v-waves class="filter-item" type="primary" icon="el-icon-download">导出</el-button>
      <el-checkbox class="filter-item" style="margin-left:15px;" >审核人</el-checkbox>
    </div>
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="Loading"
      border
      fit
      highlight-current-row>
      <el-table-column align="center" label="ID" width="95">
        <template slot-scope="scope">
          {{ scope.$index }}
        </template>
      </el-table-column>
      <el-table-column label="Title">
        <template slot-scope="scope">
          {{ scope.row.title }}
        </template>
      </el-table-column>
      <el-table-column label="Author" width="110" align="center">
        <template slot-scope="scope">
          <span>{{ scope.row.author }}</span>
        </template>
      </el-table-column>
      <el-table-column label="Pageviews" width="110" align="center">
        <template slot-scope="scope">
          {{ scope.row.pageviews }}
        </template>
      </el-table-column>
      <el-table-column class-name="status-col" label="Status" width="110" align="center">
        <template slot-scope="scope">
          <el-tag :type="scope.row.status | statusFilter">{{ scope.row.status }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="created_at" label="Display_time" width="200">
        <template slot-scope="scope">
          <i class="el-icon-time"/>
          <span>{{ scope.row.display_time }}</span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getList } from '@/api/table'

export default {
  filters: {
    statusFilter(status) {
      const statusMap = {
        published: 'success',
        draft: 'gray',
        deleted: 'danger'
      }
      return statusMap[status]
    }
  },
  data() {
    return {
      list: null,
      listLoading: true
    }
  },
  created() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.listLoading = true
      getList(this.listQuery).then(response => {
        this.list = response.data.items
        this.listLoading = false
      })
    }
  }
}
</script>
