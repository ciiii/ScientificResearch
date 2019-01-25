<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <h4 class="title">新闻 News</h4>
            <el-button type="primary" class="btn-add"><i class="el-icon-circle-plus-outline"></i> 添加新闻</el-button>
            <div class="screen-box">
                <el-form ref="form" :model="req" :inline="true" class="demo-form-inline">
                    <el-form-item label="新闻名称">
                        <el-input v-model="req.name"></el-input>
                    </el-form-item>
                    <el-form-item label="新闻类型">
                        <el-select v-model="req.type" placeholder="请选择活动区域">
                            <el-option label="类型一" value="shanghai"></el-option>
                            <el-option label="类型一" value="beijing"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="建立时间">
                        <el-col :span="11">
                            <el-date-picker type="date" placeholder="选择开始日期" v-model="req.beginTime"
                                            style="width: 100%;"></el-date-picker>
                        </el-col>
                        <el-col class="line" :span="1">-</el-col>
                        <el-col :span="11">
                            <el-time-picker type="date" placeholder="选择结束日期" v-model="req.endTime"
                                            style="width: 100%;"></el-time-picker>
                        </el-col>
                    </el-form-item>
                </el-form>
            </div>
            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" type="index" show-overflow-tooltip width="50"
                                 align="center"></el-table-column>
                <el-table-column prop="标题" label="标题"></el-table-column>
                <el-table-column prop="内容" label="内容" align="center"></el-table-column>
                <el-table-column prop="建立时间" label="建立时间" align="center"></el-table-column>
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
    </div>
</template>
<script>
    import {News} from "@/assets/js/connect/ReturnData";

    export default {
        name: 'news',
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 20,
                    OrderType: false,
                    name: '',
                    type: '',
                    beginTime: '',
                    endTime: '',
                },
                tableData: [],
                total: 0
            }
        },

        mounted() {
            this.getNews();
        },

        methods: {
            getNews(){
                News.getPagingNewsList('get', this.req, (success, strErro, obj) => {
                    if (success) {
                        obj = obj.data;
                        this.tableData = obj.list;
                        this.total = obj.total;
                    }
                });
            },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                console.log(`当前页: ${val}`);
                this.req.Index = val;
                this.getNews();
                // this.total = total;

            },
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    @import '../../assets/less/News';
</style>
