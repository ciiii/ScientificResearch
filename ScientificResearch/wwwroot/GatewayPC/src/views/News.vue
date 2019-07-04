<template>
    <div class="page-news page-common">
        <div class="main wrapper">
            <div class="btn-back-box">
                <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)" icon="el-icon-back"> 返回
                </el-button>
            </div>
            <h4 class="title">{{type==1?'指南':'前沿'}}新闻</h4>
            <div class="screen-box">
                <el-form ref="form" :model="req" :inline="true" class="demo-form-inline">
                    <el-form-item>
                        <el-input v-model="req.Like标题" placeholder="请输入标题" @keyup.enter.native="search">
                            <i slot="prefix" class="el-input__icon el-icon-search"></i>
                        </el-input>
                    </el-form-item>
                    <el-form-item label="标签">
                        <el-select v-model="req.Like标签" placeholder="请选择" @change="search">
                            <el-option label="全部" value=""></el-option>
                            <el-option v-for="item in tags" :key="item.编号" :label="item.名称"
                                       :value="item.名称"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-button class="btn-search" @click="search">查询</el-button>
                </el-form>
            </div>
            <el-table class="tableone" border :data="tableData" stripe :header-cell-style="{'text-align':'center'}">
                <el-table-column label="序号" width="50" align="center" prop="number"></el-table-column>
                <el-table-column label="标题">
                    <template slot-scope="scope">
                        <a href="javascript:;" class="a-title" @click="btnDetails(scope.row)" v-text="scope.row.标题"></a>
                    </template>
                </el-table-column>
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
        <el-dialog class="big-dialog" title="新闻详情" :visible.sync="isDetailsDialog" v-if='isDetailsDialog'>
            <NewsDetails ref="child" @myEvent="getMyEvent" :item="item" :isShow="isShow"></NewsDetails>
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
                    Size: 16,
                    OrderType: false,
                    新闻分类编号: '',
                    Like标题: '',
                    Like标签: '',
                },
                tableData: [],
                total: 0,
                title: '新闻详情',
                isDetailsDialog: false,
                isShow: false,
                item: {},
                tags: [],
                type: null,
                key: ''
            }
        },
        mounted() {
            this.type = this.$route.query.type;
            this.req.新闻分类编号 = this.type;
            this.getNews();
            this.getTags(this.type);
            this.key = sessionStorage.getItem('myKey');
        },
        methods: {
            search: async function () {
                this.req.Index = 1;
                await this.getNews();
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
                this.isDetailsDialog = val;
            },
            btnDetails(item) {
                this.isShow = true;
                this.item = item;
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
    .zw-search-box {
        display: none;
    }
    td {
        .tag {
            margin: 3px 5px;
        }
    }
    @import "../assets/less/News";
</style>
