<template>
    <div class="ZW-search">
        <div class="logo">
            <img src="@/assets/images/logo_zhiwang.png" alt="" v-if="searchType==0">
            <img src="@/assets/images/logo_zhiwangCHKD.jpg" alt="" v-else>
        </div>
        <div class="main">
            <van-cell-group>
                <div class="item">
                <span @click="clickTitle(0)" class="title">{{type}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <van-field
                            v-model="req.searchKeyWord"
                            clearable
                            placeholder="请输入"
                            @click-label="clickTitle(0)" @keyup.enter.native="retrieval"/>
                </div>
                <div class="item">
                <span @click="clickTitle(1)" class="title">{{author}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <van-field
                            v-model="req.authorName" clearable placeholder="请输入"
                            @click-label="clickTitle(1)" @keyup.enter.native="retrieval"/>
                </div>
                <van-field v-model="req.authorGroup" clearable label="作者单位" placeholder="请输入"
                           @keyup.enter.native="retrieval"/>
                <div class="item">
                    <span class="title">发表时间</span>
                    <div class="time-box">
                        <input v-model="req.publicYearFrom" placeholder="开始年度" type="number" @keyup.enter="retrieval">
                        <span>至</span>
                        <input v-model="req.publicYearTo" placeholder="结束年度" type="number" @keyup.enter="retrieval">
                    </div>
                </div>
                <van-field
                        v-model="time" clearable label="更新时间" placeholder="请选择"
                        @click="clickTitle(2)" readonly/>
                <div class="item new-item">
                    <span class="title">来源期刊</span>
                    <div class="time-box">
                        <input v-model="req.sourceName" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickTitle(3)" class="title title-right">{{sourceRearchType}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                    <span class="title">支持基金</span>
                    <div class="time-box">
                        <input v-model="req.supportFundName" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickTitle(4)" class="title title-right">{{supportFundType}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <van-field
                        v-model="sourceType" clearable label="来源类别" placeholder="请选择"
                        readonly @click="clickTitle(5)"/>
                <p class="explain">说明：发表时间只能输入数字，例如 {{date}}</p>
            </van-cell-group>
            <van-popup v-model="showType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">检索类型</h2>
                    <van-radio-group v-model="req.searchType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickType(el)"
                                      v-for="el in configs.检索类型" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showAuthor" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">作者类型</h2>
                    <van-radio-group v-model="req.authorType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickAuthor(el)"
                                      v-for="el in configs.作者类型" :key="el.value">
                                <van-radio :name="el.value" @click.stop="clickAuthor(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showTime" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">更新时间</h2>
                    <van-radio-group v-model="newTime">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickTime(el)"
                                      v-for="el in configs.更新时间" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickTime(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                    <div class="btn-box">
                        <van-button type="warning" size="large" @click="resetTime">不限条件</van-button>
                        <van-button type="primary" size="large" @click="confirmTime">确定</van-button>
                    </div>
                </div>
            </van-popup>
            <van-popup v-model="showSourceRearchType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">来源期刊检索类型</h2>
                    <van-radio-group v-model="req.sourceRearchType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickSourceRearchType(el)"
                                      v-for="el in searchLiset" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickSourceRearchType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showSupportFundType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">支持基金检索类型</h2>
                    <van-radio-group v-model="req.supportFundType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickSupportFundType(el)"
                                      v-for="el in searchLiset" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickSupportFundType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showSourceType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">来源类别(多选)</h2>
                    <van-checkbox-group v-model="newSourceType">
                        <van-cell-group>
                            <van-cell
                                    v-for="(el, index) in configs.来源类别"
                                    clickable :key="el.key" :title="el.key" @click="toggle(index)">
                                <van-checkbox :name="el.value" ref="checkboxes" @click.stop="toggle(index)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-checkbox-group>
                    <div class="btn-box">
                        <van-button type="warning" size="large" @click="resetSourceType">不限条件</van-button>
                        <van-button type="primary" size="large" @click="confirmSourceType">确定</van-button>
                    </div>
                </div>
            </van-popup>
        </div>
        <div class="retrieval-box">
            <van-button class="btn-retrieval" type="primary" size="large" @click="retrieval">检索</van-button>
        </div>
    </div>
</template>

<script>
    import {URL_WAN_FANG} from '@/assets/js/gateway/connect/ConSysUrl'
    import {_debounce} from "@/assets/js/gateway/Common";

    export default {
        name: 'home',
        data() {
            return {
                req: {
                    searchType: 'SU$%=|',
                    searchKeyWord: '',
                    authorType: 'AU',
                    authorName: '',
                    authorGroup: '',
                    publicYearFrom: '',
                    publicYearTo: '',
                    updateTimeTag: '',
                    sourceName: '',
                    sourceRearchType: '%',
                    sourceType: '',
                    supportFundName: '',
                    supportFundType: '%',
                    accountId: 2015
                },
                reqConfigs: {
                    isReload: true,
                    sourceType: 'zwSelectData'
                },
                configs: {},
                showType: false,
                showAuthor: false,
                showTime: false,
                showSourceRearchType: false,
                showSupportFundType: false,
                showSourceType: false,
                date: new Date().getFullYear(),
                resourceType: '',
                starTime: '',
                endTime: '',
                searchLiset: [
                    {
                        key: '模糊',
                        value: '%'
                    },
                    {
                        key: '精准',
                        value: '='
                    },
                ],
                type: '主题',
                author: '作者',
                time: '',
                newTime: '',
                sourceRearchType: '模糊',
                supportFundType: '模糊',
                sourceType: '',
                newSourceType: [],
                item: {},
                searchType: 0
            }
        },
        mounted: function () {
            this.searchType = this.$route.query.type;
            this.req.accountId = this.$route.query.accountId;
            this.getDataConfigs();
        },
        methods: {
            onSearch() {
                this.req.Index = 1;
                this.getList();
            },
            clickTitle(index) {
                switch (index) {
                    case 0:
                        this.showType = true;
                        break;
                    case 1:
                        this.showAuthor = true;
                        break;
                    case 2:
                        this.showTime = true;
                        break;
                    case 3:
                        this.showSourceRearchType = true;
                        break;
                    case 4:
                        this.showSupportFundType = true;
                        break;
                    case 5:
                        this.showSourceType = true;
                        break;
                }
            },
            clickType(el) {
                this.type = el.key;
                this.req.searchType = el.value;
                this.showType = false;
            },
            clickAuthor(el) {
                this.author = el.key;
                this.req.authorType = el.value;
                this.showAuthor = false;
            },
            clickTime(el) {
                this.item = el;
                this.newTime = el.value;
            },
            confirmTime() {
                this.time = this.item.key;
                this.req.updateTimeTag = this.item.value;
                this.showTime = false;
            },
            resetTime() {
                this.time = '不限';
                this.newTime = '';
                this.req.updateTimeTag = '';
                this.showTime = false;
            },
            clickSourceRearchType(el) {
                this.sourceRearchType = el.key;
                this.req.sourceRearchType = el.value;
                this.showSourceRearchType = false;
            },
            clickSupportFundType(el) {
                this.supportFundType = el.key;
                this.req.supportFundType = el.value;
                ;
                this.showSupportFundType = false;
            },
            confirmSourceType() {
                this.req.sourceType = '';
                this.sourceType = '';
                let arr = [];
                this.newSourceType.forEach((item, index) => {
                    this.configs.来源类别.filter(function (itemB) {
                        if (itemB.value == item)
                            arr.push(itemB.key);
                    });
                });
                this.req.sourceType = this.newSourceType.join(' or ');
                this.sourceType = arr.join();
                this.showSourceType = false;
            },
            resetSourceType() {
                this.sourceType = '不限';
                this.newSourceType = [];
                this.req.sourceType = '';
                this.showSourceType = false;
            },
            toggle(index) {
                this.$refs.checkboxes[index].toggle();
            },
            getDataConfigs: async function () {
                this.configs = await this.$myHttp.myGet(URL_WAN_FANG.GET_DATA_CONFIGS, this.reqConfigs);
                sessionStorage.setItem('ZWConfigs', JSON.stringify(this.configs));
            },
            retrieval: _debounce(function () {
                if (this.searchType == 0) {
                    sessionStorage.setItem('ZWSearch', JSON.stringify(this.req));
                } else {
                    let data = {
                        mainType: this.req.searchType,
                        mainWord: this.req.searchKeyWord,
                        authorMatchType: this.req.authorType,
                        author: this.req.authorName,
                        authorDepartment: this.req.authorGroup,
                        fromYear: this.req.publicYearFrom,
                        toYear: this.req.publicYearTo,
                        updateTag:this.req.updateTimeTag,
                        sourceName: this.req.sourceName,
                        sourceNameMatchType: this.req.sourceRearchType,
                        sourceType: this.req.sourceType,
                        supportFundName: this.req.supportFundName,
                        supportFundNameMatcthType: this.req.supportFundType,
                        accountId: this.req.accountId
                    }
                    sessionStorage.setItem('ZWSearch', JSON.stringify(data));
                }
                this.$router.push({path: '/zhiWangList', query: {type: this.searchType}});
            }, 300)
        }
    }
</script>
<style type="text/less" lang="less">
    .ZW-search {
        .van-overlay {
            top: 0 !important;
        }

        .tab-con .van-cell__title {
            text-align: left !important;
        }

        .van-cell__title.van-field__label {
            text-align: center !important;
            margin-right: 5px !important;
            flex: none;
            width: 88px !important;
        }
    }

</style>
<style type="text/less" scoped lang="less">
    @import "../../../assets/less/gateway/wanFangSearch";
    .logo{
        img{
            width: 188px;
            height: auto;
        }
    }
</style>
