<template>
    <div class="home page-common">
        <div class="banners">
            <el-carousel indicator-position="outside">
                <el-carousel-item>
                    <img src="@/assets/images/banner.jpg" alt="">
                </el-carousel-item>
                <el-carousel-item>
                    <img src="@/assets/images/banner2.jpg" alt="">
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
                    <h4 class="title">资源文献 Links</h4>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-shu2"></i> 文献数据库</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a href="javascript:;" @click="moreService"><i
                                            class="icon iconfont icon-gengduo"></i></a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in serviceList" :key="el.编号">
                                    <a href="javascript:;" @click="clickUrl(el)">
                                        <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <img class="img-logo" v-if="el.Logo" :src="el.Logo" alt="服务logo" height="20"/>
                                        <img class="img-logo" v-else src="../assets/images/service-logo.jpg"
                                             alt="服务logo" height="20"/>
                                        <span class="title">{{el.名称}}</span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-yingwenyuyan"></i> 外文资源</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start"
                                            v-if="englishResources.length>7">
                                    <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in englishResources" :key="el.url">
                                    <a :href="el.url" target="_blank">
                                        <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">{{el.name}} </span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-gengduoneirong"></i> 其他资源</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start"
                                            v-if="otherResources.length>7">
                                    <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in otherResources" :key="el.url">
                                    <a :href="el.url" target="_blank">
                                        <span class="btn-icon"><i class="icon iconfont icon-yuandianxiao"></i></span>
                                        <span class="title">{{el.name}} </span>
                                        <span class="time"><i class="icon iconfont icon-right"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </el-col>
                </div>
            </el-row>
            <el-row :gutter="21" class="news-box">
                <div class="wrapper">
                    <h4 class="title">新闻 News</h4>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-quanbuxinwen"></i> 爱医生新闻</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a v-if="total>6" class="more" href="javascript:;" @click="moreNews('news')">
                                        更多<i class="el-icon-d-arrow-right"></i>
                                    </a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in newsList" :key="el.编号">
                                    <a href="javascript:;" @click="btnDetails(el)">
                                        <span class="time">{{el.建立时间}}</span>
                                        <div class="content">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">{{el.标题}} </span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div v-if="total==0" align="center">
                                <p class="text-center">暂无数据</p>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="8" class="item" v-if="IMISNewsTotal">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-quanbuxinwen"></i> 科研新闻</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a v-if="IMISNewsTotal>6" class="more" href="javascript:;"
                                       @click="moreNews('IMISNews')">
                                        更多<i class="el-icon-d-arrow-right"></i>
                                    </a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in IMISNewsList" :key="el.编号">
                                    <a href="javascript:;" @click="btnIMISDetails(el)">
                                        <span class="time">{{el.建立时间}}</span>
                                        <div class="content">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">【{{el.通知类型}}】{{el.通知名称}} </span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div v-if="IMISNewsTotal==0" align="center">
                                <p class="text-center">暂无数据</p>
                            </div>
                        </div>
                    </el-col>
                    <el-col :span="8" class="item">
                        <div class="grid-content bg-purple">
                            <div class="item-header">
                                <h5><i class="icon iconfont icon-quanbuxinwen"></i> 其他新闻</h5>
                                <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                    <a v-if="otherTotal>6" class="more" href="javascript:;"
                                       @click="moreNews('otherNews')">
                                        更多<i class="el-icon-d-arrow-right"></i>
                                    </a>
                                </el-tooltip>
                            </div>
                            <ul class="list">
                                <li v-for="el in otherNews" :key="el.编号">
                                    <a href="javascript:;" @click="btnOtherDetails(el)">
                                        <span class="time">{{el.建立时间}}</span>
                                        <div class="content">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">{{el.标题}} </span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <div v-if="otherTotal==0" align="center">
                                <p class="text-center" style="color: #666">暂无数据</p>
                            </div>
                        </div>
                    </el-col>
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
        name: 'Home',
        components: {
            NewsDetails,
        },
        data() {
            return {
                req: {
                    Index: 1,
                    Size: 6,
                    OrderType: false,
                },
                reqTwo: {
                    Index: 1,
                    Size: 6,
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
                IMISNewsTotal: 0,
                isLogin: false,
                isShow: false,
                activeName: 'tab-one',
                otherTotal: 2,
                otherNews: [
                    {
                        编号: 1,
                        建立时间: '2019-03-14 15:58:27',
                        标题: '测试公告新闻，测试测试新闻'
                    },
                    {
                        编号: 0,
                        建立时间: '2019-03-13 10:12:52',
                        标题: '测试新闻，测试其他新闻'
                    }
                ],
                englishResources: [
                    {
                        name: 'JoVE (Journal of Visualized Experiments)',
                        url: 'http://www.jove.com/'
                    },
                    {
                        name: 'EBSCO学术资源检索(ASP/BSP)',
                        url: 'http://search.ebscohost.com/'
                    },
                    {
                        name: 'WILEY医学及护理学科库',
                        url: 'http://onlinelibrary.wiley.com/'
                    },
                    {
                        name: 'WorldLib国外文献服务平台',
                        url: 'http://worldlib.com.cn/'
                    },
                    {
                        name: 'Elsevier-ClinicalKey医学资源平台',
                        url: 'http://www.clinicalkey.com/'
                    },
                    {
                        name: 'OVID-EBMR循证医学全文数据库',
                        url: 'http://ovidsp.ovid.com/'
                    },
                    {
                        name: 'NSTL免费电子期刊数据库',
                        url: 'http://archive.nstl.gov.cn/Archives/'
                    },
                ],
                otherResources: [
                    {
                        name: '生物医学中心开放获取期刊',
                        url: 'https://www.biomedcentral.com/'
                    },
                    {
                        name: '上海图书馆电子报纸导读',
                        url: 'http://newspaper.digilib.sh.cn/website/index.asp'
                    },
                    {
                        name: '国家哲学社会科学文献中心',
                        url: 'http://www.ncpssd.org/'
                    },
                    {
                        name: 'Socolar平台OA期刊和OA仓贮资',
                        url: 'http://www.socolar.com/'
                    },
                    {
                        name: '国家科技图书文献中心',
                        url: 'http://www.nstl.gov.cn/'
                    },
                    {
                        name: '中国科技论文在线',
                        url: 'http://www.paper.edu.cn/'
                    },
                ]
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
            moreService() {
                this.$router.push({path: '/Service'});
            },
            clickUrl(el) {
                if (localStorage.myUserInfo) {
                    if (!el.电脑链接地址) {
                        this.$message.warning('您没有订购该服务！');
                    } else {
                        localStorage.setItem('gatewayUrl', window.location.href);
                        localStorage.setItem('isEntryLogin',true);
                        window.open(el.电脑链接地址);
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
                this.IMISNewsTotal = data.total;
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
            btnOtherDetails(item) {

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
            min-height: 250px;
            max-height: 410px;
        }
    }

</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/Home';
</style>
