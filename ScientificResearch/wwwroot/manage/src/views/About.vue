<template>
    <div class="about">
        <el-table class="tableone" :data="tableData" stripe style="width: 100%">
            <el-table-column prop="date" label="日期" ></el-table-column>
            <el-table-column prop="name" label="姓名" ></el-table-column>
            <el-table-column prop="address" label="地址"></el-table-column>
        </el-table>
        <el-table class="tabletwo" :data="tableData" stripe style="width: 100%">
            <el-table-column prop="date" label="日期"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="address" label="地址"></el-table-column>
        </el-table>
        <div class="block">
            <span class="demonstration">显示总数 {{total}}</span>
            <el-pagination
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange(total)"
                    :current-page.sync="currentPage1"
                    :page-size="20"
                    layout="total, sizes,prev, pager, next,jumper"
                    :total="100">
            </el-pagination>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'about',
        data() {
            return {
                tableData: [
                    {
                        date: '2016-05-02',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1518 弄'
                    }, {
                        date: '2016-05-04',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1517 弄'
                    }, {
                        date: '2016-05-01',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1519 弄'
                    }, {
                        date: '2016-05-03',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1516 弄'
                    }, {
                        date: '2016-05-03',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1516 弄'
                    }, {
                        date: '2016-05-03',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1516 弄'
                    }, {
                        date: '2016-05-03',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1516 弄'
                    }, {
                        date: '2016-05-03',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1516 弄'
                    }
                ],
                currentPage1: 5,
                currentPage2: 5,
                currentPage3: 5,
                currentPage4: 4,
                total: ''
            }
        },
        methods: {
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val, total) {
                console.log(`当前页: ${val}`);
                this.total = total;

            }
        }
    }
</script>
