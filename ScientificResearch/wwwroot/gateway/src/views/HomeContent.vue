<template>
    <div class="HomeContent">
        <div class="banners">
            <el-carousel indicator-position="outside">
                <el-carousel-item>
                    <img src="../assets/images/banner.jpg" alt="">
                </el-carousel-item>
                <el-carousel-item>
                    <img src="../assets/images/banner2.jpg" alt="">
                </el-carousel-item>
            </el-carousel>
            <div class="search-box">
                <ul>
                    <li :class="{ active: isActive==index }" v-for="(item, index)  in list" :key="index"
                        @click="clickLi(index)">
                        <a href="javascript:;">{{item}}</a>
                    </li>
                </ul>
                <div class="search">
                    <el-input type="text" placeholder="请输入内容" v-model="search"></el-input>
                    <el-button class="btn-search">检索</el-button>
                </div>
            </div>
        </div>
        <div class="mian" :gutter="24">
            <el-row :gutter="21" class="items box">
                <div class="wrapper">
                    <h4 class="title">数据库链接 Database Links</h4>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-shu2"></i> 文献数据库</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in serviceList" :key="el.编号">
                                    <a :href="el.电脑链接地址?el.电脑链接地址:'javascript:;'" @click="clickUrl(el)" target="_blank">
                                        <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">{{el.名称}}</span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-shipin-tianchong"></i> 视频资源</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">Visible Body说明 </span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">JoVE(实验视频期刊）</span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-gengduoneirong"></i> 其他数据库</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">CPSR功能介绍及说明</span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">方正电子书</span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                </div>
            </el-row>
            <el-row :gutter="21" class="box items-bg">
                <div class="wrapper">
                    <el-tabs type="border-card">
                        <el-tab-pane label="云中漫步" class="tab-one">
                            <i class="icon iconfont icon-hangzhenggonggao"></i>
                            <ul class="list">
                                <li v-for="el in newsList" :key="el.编号">
                                    <a href="javascript:;" @click="btnDetails(el)">
                                        <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">{{el.标题}}</span>
                                        <span class="time">{{el.建立时间|dataFormat('yyyy-mm-hh')}}
                                            <i class="icon iconfont icon-right"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
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
                        </el-tab-pane>
                        <el-tab-pane label="科研新闻" class="tab-two">
                            <ul class="list">
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">【普通通知】第一条通知</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">【普通通知】关于科研管理系统测试的通知</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">【公告】护理教育平台招标公告</span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">【公告】三基考试</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">【普通通知】国自然基金申请培训班</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                            </ul>
                        </el-tab-pane>
                        <el-tab-pane label="考试公告" class="tab-three">
                            <ul class="list">
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">Visible Body说明 </span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">JoVE(实验视频期刊）</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                            </ul>
                        </el-tab-pane>
                        <el-tab-pane label="其他公告" class="tab-four">
                            <ul class="list">
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">CPSR功能介绍及说明</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                                <li>
                                    <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">方正电子书</span>
                                        <span class="time">2018-08-29 17:56:05 <i
                                                class="icon iconfont icon-right"></i></span></a>
                                </li>
                            </ul>
                        </el-tab-pane>
                    </el-tabs>
                </div>
            </el-row>
        </div>
        <el-dialog class="big-dialog" title="新闻详情" :visible.sync="isDetailsDialog" v-if='isDetailsDialog'>
            <NewsDetails ref="child" @myEvent="getMyEvent" :item="item"></NewsDetails>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_HOSPITAL, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import NewsDetails from "@/components/NewsDetails"

    export default {
        name: 'HomeContent',
        components: {
            NewsDetails
        },
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 20,
                    OrderType: false,
                },
                list: [
                    '知网CHKD',
                    '万方医学'
                ],
                isActive: 0,
                newsList: [],
                total: 0,
                search: '',
                isDetailsDialog: false,
                item: {},
                serviceList: [],
                serviceDefault: [],
            }
        },
        mounted() {
            this.getHospitalService();
            this.getNews();
        },
        methods: {
            clickLi(index) {
                this.isActive = index;
            },
            clickUrl(el) {
                if (localStorage.myUserInfo) {
                    if (!el.电脑链接地址) {
                        this.$message.warning('您没有订购该服务！');
                    }
                } else {
                    this.$message.error('请先登录！');
                    this.$router.push({path: '/login'});
                }
            },
            getHospitalService: async function () {
                let postData = {
                    医院名称: ''
                }
                if (localStorage.myUserInfo) {
                    postData.医院名称 = JSON.parse(localStorage.myUserInfo).人员.DbKey
                }
                this.serviceList = await this.$http.myGet(URL_HOSPITAL.GET_HOSPITAL_BUY_SERVICE, postData);
            },
            getNews: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_PANGING_NEWS, this.req);
                this.newsList = data.list;
                this.total = data.total;
            },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                this.req.Index = val;
                this.getNews();
            },
            getMyEvent(val) {
                this.getNews();
                this.closeDialog(val);
            },
            closeDialog(val) {
                this.isDetailsDialog = val;
            },
            btnDetails(data) {
                this.item = data;
                this.isDetailsDialog = true;
            },
        }
    }
</script>
<style lang="less" type='text/less'>
    @import '../assets/less/Common';

    .items-bg {
        .el-tabs__content {
            min-height: 250px;
        }
    }

</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/HomeContent';
</style>
