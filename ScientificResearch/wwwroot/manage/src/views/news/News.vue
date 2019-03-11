<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <h4 class="title">新闻 News</h4>
            <div class="screen-box">
                <el-button type="primary" class="btn-add" @click="btnAdd">
                    <i class="el-icon-circle-plus-outline"></i> 添加新闻
                </el-button>
                <el-form ref="form" :model="req" :inline="true" class="demo-form-inline">
                    <el-form-item>
                        <el-input v-model="req.Like标题" placeholder="请输入标题" @keyup.enter.native="search">
                            <i slot="prefix" class="el-input__icon el-icon-search"></i>
                        </el-input>
                    </el-form-item>
                    <!--<el-form-item label="建立时间">-->
                    <!--<el-date-picker type="date" placeholder="选择开始日期" v-model="req.beginTime"></el-date-picker>-->
                    <!--至-->
                    <!--<el-date-picker type="date" placeholder="选择结束日期" v-model="req.endTime"></el-date-picker>-->
                    <!--</el-form-item>-->
                    <el-button plain @click="search" >查询</el-button>
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
                        <el-tooltip content="详情" placement="bottom" effect="light">
                            <el-button icon="el-icon-tickets" circle @click="btnDetails(scope.row)"></el-button>
                        </el-tooltip>
                        <el-tooltip content="编辑" placement="bottom" effect="light">
                            <el-button type="primary" icon="el-icon-edit" circle
                                       @click="btnEdit(scope.row)"></el-button>
                        </el-tooltip>
                        <el-tooltip content="删除" placement="bottom" effect="light">
                            <el-button type="danger" icon="el-icon-delete" circle
                                       @click="btnDel(scope.row)"></el-button>
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
        <el-dialog class="big-dialog" :title="title" :visible.sync="isAddDialog" v-if='isAddDialog' :close-on-click-modal="false">
            <div v-if="isDetails">
                <NewsDetails ref="child" @myEvent="closeDialog" :item="item"></NewsDetails>
            </div>
            <div v-else>
                <AddNews ref="child" @myEvent="getMyEvent" :item="item" :isAddDialog="isAddDialog"
                         :isAdd="isAdd"></AddNews>
            </div>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import AddNews from "@/components/news/AddNews"
    import NewsDetails from "@/components/news/NewsDetails"

    export default {
        name: 'news',
        components: {
            AddNews,
            NewsDetails
        },
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 16,
                    OrderType: false,
                    Like标题: '',
                },
                tableData: [],
                total: 0,
                title: '添加新闻',
                isAdd: true,
                isAddDialog: false,
                item: {},
                isDetails: false,
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
            btnAdd() {
                this.title = '添加新闻';
                this.isAdd = true;
                this.isAddDialog = true;
                this.isDetails = false;

            },
            btnEdit(data) {
                this.title = '修改新闻';
                this.isAdd = false;
                this.item = data;
                this.isAddDialog = true;
                this.isDetails = false;
            },
            btnDetails(data) {
                this.title = '新闻详情';
                this.isDetails = true;
                this.item = data;
                this.isAddDialog = true;
            },
            btnDel(data) {
                this.$confirm('您确定要【删除】此新闻吗', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    this.deleteNews(data);
                })
            },
            deleteNews: async function (el) {
                let data = [el.编号];
                await this.$http.myPost(URL_NEWS.POST_DELETE_NEWS, data);
                this.$message.success('删除成功！');
                this.getNews();
            },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                this.req.Index = val;
                this.getNews();

            },
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    @import '../../assets/less/News';
</style>
