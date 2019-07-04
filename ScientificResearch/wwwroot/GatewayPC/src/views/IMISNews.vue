<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <div class="btn-back-box">
                <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)" icon="el-icon-back"> 返回
                </el-button>
            </div>
            <h4 class="title">科研新闻 News</h4>
            <div class="screen-box">
                <el-form ref="form" :model="req" :inline="true" class="demo-form-inline">
                    <el-form-item>
                        <el-input v-model="req.Like通知名称" placeholder="请输入标题" @keyup.enter.native="search">
                            <i slot="prefix" class="el-input__icon el-icon-search"></i>
                        </el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-input v-model="req.Like发送人姓名" placeholder="请输入发送人" @keyup.enter.native="search"></el-input>
                    </el-form-item>
                    <el-button class="btn-search" @click="search">查询</el-button>
                </el-form>
            </div>
            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" type="index" show-overflow-tooltip width="50"
                                 align="center"></el-table-column>
                <el-table-column label="标题">
                    <template slot-scope="scope">
                        <a href="javascript:;" class="a-title" @click="btnDetails(scope.row)">【{{scope.row.通知类型}}】{{scope.row.通知名称}}</a>
                    </template>
                </el-table-column>
                <el-table-column prop="发送人姓名" label="发布人" align="center"></el-table-column>
                <el-table-column prop="建立时间" label="建立时间" align="center"></el-table-column>
                <el-table-column label="操作" align="center" width="80">
                    <template slot-scope="scope">
                        <el-tooltip content="查看详情" placement="bottom" effect="light">
                            <el-button icon="el-icon-tickets" class="btn-details" circle
                                       @click="btnDetails(scope.row)"></el-button>
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
        <el-dialog class="big-dialog connom-dialog" title="新闻详情" :visible.sync="isDetailsDialog" v-if='isDetailsDialog'>
            <IMISNewsDetails ref="child" @myEvent="getMyEvent" :item="item"></IMISNewsDetails>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import IMISNewsDetails from "@/components/IMISNewsDetails"

    export default {
        name: 'news',
        components: {
            IMISNewsDetails
        },
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 16,
                    OrderType: false,
                    Like通知名称: '',
                    Like发送人姓名: '',
                },
                tableData: [],
                total: 0,
                title: '新闻详情',
                isDetailsDialog: false,
                isShow: false,
                item: {},
                key:''
            }
        },
        mounted() {
            this.getNews();
            this.key = sessionStorage.getItem('myKey');
        },
        methods: {
            search: async function () {
                this.req.Index = 1;
                await this.getNews();
            },
            getNews: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_IMIS_NEWS, this.req);
                this.tableData = data.list;
                this.total = data.total;
            },
            getMyEvent(val) {
                this.isDetailsDialog = val;
            },
            btnDetails(item) {
                this.isShow = false;
                this.isDetailsDialog = true;
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
    @import "../assets/less/News";
</style>
