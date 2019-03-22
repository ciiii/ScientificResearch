<template>
    <div class="HomeContent page-common">
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
                    <el-tabs type="border-card" :active-name="activeName">
                        <el-tab-pane label="云中漫步" name="tab-one">
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
                            <a v-if="total>4" class="more" href="javascript:;" @click="moreNews('news')">更多...</a>
                            <div v-if="total==0" align="center">
                                <p class="text-center"><img src="../assets/images/nothing.png"></p>
                            </div>
                        </el-tab-pane>
                        <el-tab-pane label="科研新闻" v-if="isLogin" name="tab-two">
                            <ul class="list">
                                <li v-for="el in IMISNewsList" :key="el.编号">
                                    <a href="javascript:;" @click="btnIMISDetails(el)">
                                        <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">【{{el.通知类型}}】{{el.通知名称}}</span>
                                        <span class="time">{{el.建立时间}}<i class="icon iconfont icon-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                            <a v-if="MISNewsTotal>9" class="more" href="javascript:;" @click="moreNews('IMISNews')">更多...</a>
                            <div v-if="MISNewsTotal==0" align="center">
                                <p class="text-center"><img src="../assets/images/nothing.png"></p>
                            </div>
                        </el-tab-pane>
                        <el-tab-pane label="考试公告" v-if="isLogin" name="tab-three">
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
                        <el-tab-pane label="其他公告" name="tab-four">
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
                                                class="icon iconfont icon-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </el-tab-pane>
                    </el-tabs>
                </div>
            </el-row>
        </div>
        <el-dialog class="big-dialog" title="新闻详情" :visible.sync="isDetailsDialog" v-if='isDetailsDialog'>
            <NewsDetails ref="child" @myEvent="getMyEvent" :item="item" :isShow="isShow"></NewsDetails>
        </el-dialog>
    </div>
</template>
<script>
    import {URL_HOSPITAL, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import NewsDetails from "@/components/NewsDetails"

    export default {
        name: 'HomeContent',
        components: {
            NewsDetails,
        },
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 9,
                    OrderType: false,
                },
                reqTwo: {
                    Index: 1,
                    Size: 3,
                    OrderType: false,
                    人员编号: ''
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
                IMISNewsList: [],
                MISNewsTotal: 0,
                isLogin: false,
                isShow: false,
                activeName: 'tab-one'
            }
        },
        mounted() {
            this.getHospitalService();
            this.getNews();
            if (localStorage.myUserInfo) {
                let myUserInfo = JSON.parse(localStorage.getItem('myUserInfo'));
                this.reqTwo.人员编号 = myUserInfo.人员.编号;
                this.isLogin = true;
                this.getIMISNews();
            } else {
                this.reqTwo.人员编号 = '';
                this.isLogin = false;
            }
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
            getIMISNews: async function () {
                let data = await this.$http.myGet(URL_NEWS.GET_IMIS_NEWS, this.reqTwo);
                this.IMISNewsList = data.list;
                this.MISNewsTotal = data.total;
            },
            getIMISNewsDetails: async function (id) {
                let postData = {
                    编号: id
                }
                let data = await this.$http.myGet(URL_NEWS.GET_IMIS_NEWS_DETAILS, postData);
                let files = []
                if (data.通知公告.相关文件路径 != null && data.通知公告.相关文件路径 != '') {
                    files = data.通知公告.相关文件路径.split(',');
                }
                this.item = {
                    标题: data.通知公告.通知名称,
                    建立时间: data.通知公告.建立时间,
                    内容: data.通知公告.通知内容,
                    文件: files,
                    发布人: data.通知公告.发送人姓名
                };
            },
            handleSizeChange(val) {
                console.log(`每页 ${val} 条`);
            },
            handleCurrentChange(val) {
                this.req.Index = val;
                this.getNews();
            },
            getMyEvent(val) {
                this.isDetailsDialog = val;
            },
            btnDetails(item) {
                this.isShow = true;
                this.item = item;
                this.isDetailsDialog = true;
            },
            btnIMISDetails(item) {
                this.isShow = false;
                this.isDetailsDialog = true;
                this.getIMISNewsDetails(item.编号)
            },
            moreNews(name) {
                this.$router.push({path: '/' + name});
            }
        }
    }
</script>
<style lang="less" type='text/less'>
    @import '../assets/less/Common';

    .items-bg {
        .el-tabs__content {
            height: 410px;
        }
    }

</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/HomeContent';
</style>
