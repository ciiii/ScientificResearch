<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <h4 class="title">新闻 News</h4>
            <div class="screen-box">
                <el-form ref="form" :model="req" :inline="true" class="demo-form-inline">
                    <el-form-item>
                        <el-input v-model="req.Like标题" placeholder="请输入标题" @keyup.enter.native="search">
                            <i slot="prefix" class="el-input__icon el-icon-search"></i>
                        </el-input>
                    </el-form-item>
                    <el-button plain @click="search">查询</el-button>
                </el-form>
            </div>
            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" type="index" show-overflow-tooltip width="50"
                                 align="center"></el-table-column>
                <el-table-column label="标题">
                    <template slot-scope="scope">
                        <a href="javascript:;" @click="btnDetails(scope.row)" v-text="scope.row.标题"></a>
                    </template>
                </el-table-column>
                <el-table-column prop="建立时间" label="建立时间" align="center"></el-table-column>
                <el-table-column label="操作" align="center" width="200">
                    <template slot-scope="scope">
                        <el-tooltip content="查看详情" placement="bottom" effect="light">
                            <el-button icon="el-icon-search" circle @click="btnDetails(scope.row)"></el-button>
                        </el-tooltip>
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
        <el-dialog class="big-dialog" :title="title" :visible.sync="isAddDialog" v-if='isAddDialog'>
            <NewsDetails ref="child" @myEvent="closeDialog" :item="item"></NewsDetails>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import NewsDetails from "@/components/NewsDetails"

    export default {
        name: 'news',
        components: {
            NewsDetails
        },
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 20,
                    OrderType: false,
                    Like标题: '',
                },
                tableData: [],
                total: 0,
                title: '新闻详情',
                isAddDialog: false,
                item: {},
            }
        },
        mounted() {
            this.getNews();
        },
        methods: {
            search: async function () {
                this.req.Index = 1;
                await this.getNews();
            },
            getNews: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_PANGING_NEWS, this.req);
                this.tableData = data.list;
                this.total = data.total;
            },
            getMyEvent(val) {
                this.getNews();
                this.closeDialog(val);
            },
            closeDialog(val) {
                this.isAddDialog = val;
            },
            btnDetails(data) {
                this.isDetails = true;
                this.item = data;
                this.isAddDialog = true;
            },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                console.log(`当前页: ${val}`);
                this.req.Index = val;
                this.getNews();

            },
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    .page-news{
        .main{
            .line{
                text-align: center;
            }
        }
        .screen-box{
            position: relative;
            .btn-add{
                left: 0;
                top: 0;
            }
            .el-form{
                margin-left: 130px;
            }
        }
    }
</style>
