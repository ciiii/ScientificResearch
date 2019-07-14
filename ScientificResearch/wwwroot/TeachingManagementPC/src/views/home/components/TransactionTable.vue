<template>
  <el-table :data="list" style="width: 100%;padding-top: 15px;">
    <el-table-column label="Order_No" min-width="200">
      <template slot-scope="scope">
        {{ scope.row.id | orderNoFilter }}
      </template>
    </el-table-column>
    <el-table-column label="Price" width="195" align="center">
      <template slot-scope="scope">
        ¥{{ scope.row.price |formatMoney }}
      </template>
    </el-table-column>
    <el-table-column label="Status" width="100" align="center">
      <template slot-scope="{row}">
        <el-tag :type="row.status | statusFilter">
          {{ row.status }}
        </el-tag>
      </template>
    </el-table-column>
  </el-table>
</template>

<script>
  export default {
    filters: {
      statusFilter(status) {
        const statusMap = {
          success: 'success',
          pending: 'danger'
        }
        return statusMap[status]
      },
      orderNoFilter(str) {
        return str.substring(0, 30)
      }
    },
    data() {
      return {
        list: [
          {
            id: 'd156646c-bA05-946d-f2Ad-7fC51B',
            price: 2500,
            status: 'success'
          },
          {
            id: 'd156646c-bA05-946d-f2Ad-7fC51B',
            price: 6200,
            status: 'success'
          },
          {
            id: 'd156646c-bA05-946d-f2Ad-7fC51B',
            price: 2890,
            status: 'danger'
          },
          {
            id: 'd156646c-bA05-946d-f2Ad-7fC51B',
            price: 3800,
            status: 'success'
          },
          {
            id: 'd156646c-bA05-946d-f2Ad-7fC51B',
            price: 7500,
            status: 'danger'
          }
        ]
      }
    },
    created() {

    },
    methods: {}
  }
</script>
