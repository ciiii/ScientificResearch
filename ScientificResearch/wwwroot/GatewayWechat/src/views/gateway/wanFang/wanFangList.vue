<template>
    <div class="WF-list">
        <!--<van-nav-bar title="万方医学" left-text="返回" left-arrow @click-left="onClickLeft"/>-->
        <div class="screen-box">
            <van-tabs v-model="active" @click="clickTab">
                <van-tab title="相关度"></van-tab>
                <van-tab title="时间排序"></van-tab>
                <van-tab title="被引次数"></van-tab>
                <!--<van-tab>
                    <div slot="title" :class="changeClass(3)">
                        筛选
                        <van-icon name="icon iconfont icon-shangla"/>
                    </div>
                </van-tab>-->
            </van-tabs>
        </div>
        <van-pull-refresh v-model="isRefreshLoading" @refresh="onRefresh">
            <div class="content">
                <van-list class="list"
                          offset:500
                          v-model="loading"
                          :finished="finished"
                          finished-text="没有更多了···"
                          loading-text="加载中..."
                          @load="onLoad">
                    <ul>
                        <li v-for="item in list" :key="item.id" @click="clickTitle(item)">
                            <p class="title">{{item.title}}</p>
                            <p class="source">【来源】{{item.introdution[0]+item.introdution[1]}}</p>
                            <p class="author" v-if="item.authors">【作者】{{item.authors}}</p>
                            <p class="author">【引用】{{item.introdution[2]}}</p>
                            <p class="keyword"><span v-for="(el,index) in item.keyWord" :key="index">{{el}}</span></p>
                        </li>
                    </ul>
                </van-list>
            </div>
        </van-pull-refresh>
        <van-popup v-model="showScreen" position="right">
            <div class="tab-con">
                <van-radio-group v-model="sort">
                    <van-cell-group>
                        <van-cell :title="el.value" clickable @click="sort = el.key"
                                  v-for="el in configs.sort" :key="el.key">
                            <van-radio :name="el.key"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="warning" size="large" @click="resetScreen">重置</van-button>
                    <van-button type="primary" size="large" @click="confirmScreen">确定</van-button>
                </div>
            </div>
        </van-popup>
        <van-popup v-model="isShowDetails" position="right" :overlay="false" class="details-popup" v-if='isShowDetails'>
            <wanFangDetails ref="wanFangDetails" :item="item"/>
            <div class="backtrack">
                <span @click="backtrack"><i class="icon iconfont icon-fanhui"></i> 返回</span>
            </div>
        </van-popup>
        <div class="back-btn-box" v-if="isShowBtn">
            <span @click="backTop"><i class="icon iconfont icon-i-back-top"></i></span>
            <span @click="$router.back(-1)"><i class="icon iconfont icon-fanhui"></i></span>
        </div>
    </div>
</template>

<script>
    import {URL_WAN_FANG} from '@/assets/js/gateway/connect/ConSysUrl'
    import {_debounce} from "@/assets/js/gateway/Common";
    import wanFangDetails from "@/components/gateway/wanFang/wanFangDetails"

    export default {
        name: 'WFList',
        components: {wanFangDetails},
        data() {
            return {
                req: {},
                list: [],
                isRefreshLoading: false,
                loading: false,
                finished: false,
                configs: {},
                active: 0,
                showScreen: false,
                IconShow: false,
                sort: '',
                isShowDetails: false,
                isShowBtn: false,
                item: {},
            }
        },
        mounted: function () {
            this.configs = JSON.parse(sessionStorage.getItem('WFConfigs'));
            this.req = JSON.parse(sessionStorage.getItem('WFSearch'));
            window.addEventListener('scroll', this.scrollToTop)
        },
        methods: {
            onLoad() {
                this.getList();
            },
            clickTab(index, title) {
                switch (index) {
                    case 0:
                        this.req.sort = '';
                        this.showScreen = false;
                        this.IconShow = false;
                        break;
                    case 1:
                        this.req.sort = 'Date desc';
                        this.showScreen = false;
                        this.IconShow = false;
                        break;
                    case 2:
                        this.req.sort = 'CitedCount desc';
                        this.showScreen = false;
                        this.IconShow = false;
                        break;
                    case 3:
                        this.req.sort = '';
                        this.showScreen = true;
                        this.IconShow = true;
                        break;
                }
                this.onSearch();
            },
            changeClass() {
                if (this.IconShow) {
                    return 'active';
                }
            },
            confirmScreen() {
                this.req.sort = '';
                this.IconShow = false;
                this.showScreen = false;
                this.onSearch();
            },
            resetScreen() {
                this.req.sort = '';
            },
            onSearch() {
                this.req.pageIndex = 1;
                this.finished = false;
                this.loading = true;
                this.backTop();
                this.list = [];
                this.getList();
            },
            getList: async function () {
                let data = await this.$myHttp.myGet(URL_WAN_FANG.GET_PANGING_LIST, this.req);
                if (data && data != []) {
                    if (Array.isArray(data)) {
                        this.req.pageIndex++;
                        if (data.length < this.req.pageIndex) {
                            this.finished = true;
                        }
                        data.forEach(function (item) {
                            if (item.keyWord && item.keyWord != "") {
                                item.keyWord = item.keyWord.slice(0, item.keyWord.length - 1);
                                item.keyWord = item.keyWord.split('；');
                            }
                            if (item.introdution != '') {
                                item.introdution = item.introdution.split(' ');
                            }
                        })
                        this.list = this.list.concat(data);
                    } else {
                        this.finished = true;
                        this.list = [];
                    }
                } else {
                    this.finished = true;
                    this.list = [];
                }
                this.isRefreshLoading = false;
                this.loading = false;
            },
            onRefresh() {
                this.finished = false;
                this.req.pageIndex = 1;
                this.list = [];
                this.getList();
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
        },
        destroyed() {
            window.removeEventListener('scroll', this.scrollToTop);
        }
    }
</script>
<style type="text/less" lang="less">
    .WF-list {
        .van-overlay {
            top: 100px !important;
        }

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
