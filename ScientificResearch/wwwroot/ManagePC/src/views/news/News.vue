<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <h4 class="title">新闻 News</h4>
            <div class="filter-container">
                <el-button class="filter-item" type="success" @click="btnAdd">
                    <i class="iconfont icontianjia"></i> 添加新闻
                </el-button>
                <el-input v-model="req.Like标题" placeholder="请输入标题" style="width: 200px;" class="filter-item"
                          @keyup.enter.native="search" prefix-icon="el-icon-search"/>
                <div class="filter-item">
                    新闻类型
                    <el-select v-model="req.新闻分类编号" placeholder="请选择" @change="changeType">
                        <el-option label="全部" value=""></el-option>
                        <el-option v-for="item in types" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
                    </el-select>
                </div>
                <div class="filter-item">
                    标签
                    <el-select v-model="req.Like标签" placeholder="请选择" @change="search">
                        <el-option label="全部" value=""></el-option>
                        <el-option v-for="item in tags" :key="item.编号" :label="item.名称" :value="item.名称"></el-option>
                    </el-select>
                </div>
                <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="search">查询
                </el-button>
            </div>
            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" width="50" align="center" prop="number"></el-table-column>
                <el-table-column label="标题">
                    <template slot-scope="scope">
                        <a href="javascript:;" @click="btnDetails(scope.row)" v-text="scope.row.标题"></a>
                    </template>
                </el-table-column>
                <el-table-column label="新闻分类" align="center" width="100" prop="新闻分类名称"></el-table-column>
                <el-table-column label="标签">
                    <template slot-scope="scope">
                        <el-tag class="tag" v-if="scope.row.tags" size="small" v-for="el in scope.row.tags" :key="el">{{el}}</el-tag>
                    </template>
                </el-table-column>
                <el-table-column label="建立时间" align="center" width="150">
                    <template slot-scope="scope">
                        {{scope.row.建立时间|dataFormat('yyyy-MM-dd')}}
                    </template>
                </el-table-column>
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
        <el-dialog class="big-dialog" :title="title" :visible.sync="isAddDialog" v-if='isAddDialog'
                   :close-on-click-modal="false">
            <div v-if="isDetails">
                <NewsDetails ref="child" @myEvent="closeDialog" :item="item"></NewsDetails>
            </div>
            <div v-else>
                <AddNews ref="child" @myEvent="getMyEvent" :item="item" :isAddDialog="isAddDialog" :types="types"
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
                    新闻分类编号: '',
                    Like标签: '',
                },
                tableData: [],
                total: 0,
                title: '添加新闻',
                isAdd: true,
                isAddDialog: false,
                item: {},
                isDetails: false,
                types: [],
                tags: [],
            }
        },
        mounted() {
            this.getNews();
            this.getTypes();
        },
        methods: {
            getTypeClass(state) {
                switch (state) {
                    case '指南':
                        return 'primary';
                        break;
                    case '前沿':
                        return 'success';
                        break;
                }
            },
            search: async function () {
                this.req.Index = 1;
                await this.getNews();
            },
            changeType(id) {
                if (id) {
                    this.getTags(id);
                } else {
                    this.tags = [];
                    this.req.Like标签 = '';
                }
                this.search();
            },
            getTypes: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_NEWS_TYPE, '');
                if (data && data.length > 0) {
                    this.types = data;
                } else {
                    this.types = []
                }
            },
            getTags: async function (id) {
                let postData = {
                    新闻分类编号: id
                }
                let data = await this.$http.myGet(URL_NEWS.GET_NEWS_TAGS, postData);
                if (data && data.length > 0) {
                    this.tags = data;
                } else {
                    this.tags = [];
                    this.req.Like标签 = '';
                }
            },
            getNews: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_PANGING_NEWS, this.req);
                this.total = data.total;
                data = data.list;
                let number = (this.req.Index - 1) * this.req.Size + 1;
                data.forEach((item) => {
                    item.number = number;
                    if (item.标签 && item.标签 != '') {
                        item.tags = item.标签.split(',')
                    }
                    number++;
                });
                this.tableData = data;

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

    td {
        .tag {
            margin: 0 5px 5px;
        }
    }
</style>
