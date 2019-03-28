<template>
    <div class="WF-list ZW-list">
        <!--<van-nav-bar title="知网数据" left-text="返回" left-arrow @click-left="onClickLeft"/>-->
        <div class="screen-box">
            <!--<van-search v-model="req.q"
                        placeholder="请输入搜索关键词"
                        show-action shape="round" @search="onSearch">
                <div slot="action" @click="onSearch">搜索</div>
            </van-search>-->
            <van-tabs v-model="active" @click="clickTab">
                <van-tab title="相关度"></van-tab>
                <van-tab title="发表时间"></van-tab>
                <van-tab title="被引次数"></van-tab>
                <van-tab title="下载次数"></van-tab>
            </van-tabs>
        </div>
        <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
            <div class="content">
                <van-list class="list"
                          offset:500
                          v-model="loading"
                          :finished="finished"
                          finished-text="没有更多了···"
                          loading-text="加载中..."
                          @load="onLoad">
                    <ul>
                        <li v-for="item in list.listDatas" :key="item.id" @click="clickTitle(item)">
                            <p class="title">{{item.title}}</p>
                            <p class="author">【作者】{{item.authors}}</p>
                            <p class="author">【发表时间】{{item.publishDate}}</p>
                            <p class="source" v-if="item.source">【来源】{{item.source}}</p>
                            <p class="author" v-if="item.downCount">【下载】{{item.downCount}}</p>
                            <p class="author" v-if="item.refCount">【引用】{{item.refCount}}</p>

                        </li>
                    </ul>
                </van-list>
            </div>
        </van-pull-refresh>
        <!--<van-popup v-model="showLanguages" position="right">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">文献语种</h2>
                <van-radio-group v-model="newLanguages">
                    <van-cell-group>
                        <van-cell :title="el.key" clickable @click="newLanguages = el.key"
                                  v-for="el in configs.文献语种" :key="el.key">
                            <van-radio :name="el.value"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
            </div>
        </van-popup>-->
        <van-popup v-model="isShowDetails" position="right" :overlay="false" class="details-popup" v-if='isShowDetails'>
            <zhiWangDetails ref="wanFangDetails" :item="item"/>
            <div class="back-btn-box">
                <span @click="backtrack"><i class="icon iconfont icon-fanhui"></i></span>
            </div>
        </van-popup>
        <div class="back-btn-box" v-if="isShowBtn">
            <span @click="backTop"><i class="icon iconfont icon-i-back-top"></i></span>
            <span @click="$router.back(-1)"><i class="icon iconfont icon-fanhui"></i></span>
        </div>
    </div>
</template>

<script>
    import {URL_ZHI_WANG} from '@/assets/js/gateway/connect/ConSysUrl'
    import {_debounce} from "@/assets/js/gateway/Common";
    import zhiWangDetails from "@/components/gateway/zhiWang/zhiWangDetails"

    export default {
        name: 'zhiWangList',
        components: {zhiWangDetails},
        data() {
            return {
                req: {},
                reqPanging: {
                    pageUrl: '',
                    accountId: '',
                },
                reqScreen: {
                    sortUrl: '',
                    accountId: '',
                },
                isScreen: false,
                list: [],
                isLoading: false,
                loading: false,
                finished: false,
                configs: {},
                active: 0,
                IconShow: false,
                sort: '',
                isShowDetails: false,
                item: {},
                isShowBtn: false,
                searchType: 0

            }
        },
        mounted: function () {
            this.configs = JSON.parse(sessionStorage.getItem('ZWConfigs'));
            this.req = JSON.parse(sessionStorage.getItem('ZWSearch'));
            console.info(this.configs);

            this.reqPanging.accountId = this.req.accountId;
            this.reqScreen.accountId = this.req.accountId;
            window.addEventListener('scroll', this.scrollToTop)
        },
        methods: {
            onLoad() {
                switch (this.searchType) {
                    case 0:
                        this.getList();
                        break;
                    case 1:
                        this.getPangingList();
                        break;
                    case 2:
                        this.getScreenList();
                }

            },
            clickTab(index, title) {
                console.info('title')
                console.info(title);
                console.info(index);
                switch (index) {
                    case 0:
                        this.reqScreen.sortUrl = this.list.sortRelateUrl;
                        break;
                    case 1:
                        this.reqScreen.sortUrl = this.list.sortPublicDateUrl;
                        break;
                    case 2:
                        this.reqScreen.sortUrl = this.list.sortByUseTimesUrl;
                        break;
                    case 3:
                        this.reqScreen.sortUrl = this.list.sortByDownTimesUrl;
                        break;
                }
                this.searchType = 2;
                this.onSearch();
            },
            onSearch: _debounce(function () {
                this.getScreenList();
            }, 300),
            getList: async function () {
                let data = await this.$myHttp.myGet(URL_ZHI_WANG.GET_ARTICLE_LIST, this.req);
                this.finished = true;
                this.list = data;
                this.reqPanging.pageUrl = data.nextPageUrl;
                this.isLoading = false;
                this.loading = false;
            },
            getScreenList: async function () {
                let data = await this.$myHttp.myGet(URL_ZHI_WANG.GET_SCREEN_LIST, this.reqScreen);
                this.finished = true;
                this.list = data;
                this.reqPanging.pageUrl = data.nextPageUrl;
                this.isLoading = false;
                this.loading = false;
                this.isScreen = false;
            },
            getPangingList: async function () {
                let data = await this.$myHttp.myGet(URL_ZHI_WANG.GET_PANGING_LIST, this.reqPanging);
                if (data && data != []) {
                    this.req.reqPanging.pageUrl = data.nextPageUrl;
                    if (data.length < this.req.p) {
                        this.finished = true;
                    }
                } else {
                    this.finished = true;
                }
                this.list = this.list.concat(data);
                this.isLoading = false;
                this.loading = false;
            },
            onRefresh() {
                setTimeout(() => {
                    this.list = [];
                    this.getList();
                }, 500)
            },
            onClickLeft() {
                this.$router.go(-1)
            },
            clickTitle(item) {
                item.accountId = this.req.accountId;
                this.item = item;
                this.isShowDetails = true;
            },
            scrollToTop() {
                let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;
                let browserHeight = window.outerHeight;
                if (scrollTop > browserHeight) {
                    this.isShowBtn = true;
                } else {
                    this.isShowBtn = false;
                }
            },
            backTop() {
                document.documentElement.scrollTop = 0;
                document.body.scrollTop = 0;
            },
            backtrack() {
                this.isShowDetails = false;
            }
        }
    }
</script>
<style type="text/less" lang="less">
    .WF-list {
        .details-popup {
            top: 0 !important;
            height: 100vh;
            transform: initial;
        }
    }
</style>
<style type="text/less" scoped lang="less">
    @import "../../../assets/less/gateway/wanFangList";
</style>
