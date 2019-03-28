<template>
    <div class="WF-search ZW-search">
        <div class="logo">
            <img src="@/assets/images/logo_zhiwang.png" alt="">
        </div>
        <van-cell-group>
            <div class="item">
                <span @click="clickTitle(0)" class="title">{{type}} <van-icon
                        name="icon iconfont icon-tabxiala"/></span>
                <van-field
                        v-model="req.searchKeyWord"
                        clearable
                        placeholder="请输入"
                        @click-label="clickTitle(0)" @keyup.enter.native="retrieval"
                />
            </div>
            <div class="item">
                <span @click="clickTitle(1)" class="title">{{author}} <van-icon
                        name="icon iconfont icon-tabxiala"/></span>
                <van-field
                        v-model="req.authorName"
                        clearable
                        placeholder="请输入"
                        @click-label="clickTitle(1)" @keyup.enter.native="retrieval"
                />
            </div>
            <van-field v-model="req.authorGroup" clearable label="作者单位" placeholder="请输入" @keyup.enter.native="retrieval"/>
            <div class="item">
                <span class="title">发表时间</span>
                <div class="time-box">
                    <input v-model="req.publicYearFrom" placeholder="开始年度" type="number"> <span>至</span>
                    <input v-model="req.publicYearTo" placeholder="结束年度" type="number">
                </div>
            </div>
            <van-field
                    v-model="time" clearable label="更新时间" placeholder="请选择"
                    @click="clickTitle(2)" readonly
            />
            <div class="item new-item">
                <span class="title">来源期刊</span>
                <div class="time-box">
                    <input v-model="req.sourceName" placeholder="请输入">
                    <span @click="clickTitle(3)" class="title title-right">{{sourceRearchType}} <van-icon
                            name="icon iconfont icon-tabxiala"/></span>
                </div>
            </div>
            <div class="item new-item">
                <span class="title">支持基金</span>
                <div class="time-box">
                    <input v-model="req.supportFundName" placeholder="请输入">
                    <span @click="clickTitle(4)" class="title title-right">{{supportFundType}} <van-icon
                            name="icon iconfont icon-tabxiala"/></span>
                </div>
            </div>
            <van-field
                    v-model="sourceType" clearable label="来源类别" placeholder="请选择"
                    readonly @click="clickTitle(5)"
            />
            <p class="explain">说明：发表时间只能输入数字，例如 {{date}}</p>
        </van-cell-group>

        <van-popup v-model="showType" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">检索类型</h2>
                <van-radio-group v-model="newType">
                    <van-cell-group>
                        <van-cell :title="el.key" clickable @click="clickType(el)"
                                  v-for="el in configs.检索类型" :key="el.key">
                            <van-radio :name="el.value"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="info" plain size="large" @click="resetType">返回</van-button>
                    <van-button type="primary" size="large" @click="confirmType">确定</van-button>
                </div>
            </div>
        </van-popup>
        <van-popup v-model="showAuthor" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">作者类型</h2>
                <van-radio-group v-model="newAuthor">
                    <van-cell-group>
                        <van-cell :title="el.key" clickable @click="clickAuthor(el)"
                                  v-for="el in configs.作者类型" :key="el.value">
                            <van-radio :name="el.value"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="info" plain size="large" @click="resetAuthor">返回</van-button>
                    <van-button type="primary" size="large" @click="confirmAuthor">确定</van-button>
                </div>
            </div>
        </van-popup>
        <van-popup v-model="showTime" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">更新时间</h2>
                <van-radio-group v-model="newTime">
                    <van-cell-group>
                        <van-cell :title="el.key" clickable @click="clickTime(el)"
                                  v-for="el in configs.更新时间" :key="el.key">
                            <van-radio :name="el.value"/>
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
                <van-radio-group v-model="newSourceRearchType">
                    <van-cell-group>
                        <van-cell :title="el.key" clickable @click="clickSourceRearchType(el)"
                                  v-for="el in searchLiset" :key="el.key">
                            <van-radio :name="el.value"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="info" plain size="large" @click="resetSourceRearchType">返回</van-button>
                    <van-button type="primary" size="large" @click="confirmSourceRearchType">确定</van-button>
                </div>
            </div>
        </van-popup>
        <van-popup v-model="showSupportFundType" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">支持基金检索类型</h2>
                <van-radio-group v-model="newSupportFundType">
                    <van-cell-group>
                        <van-cell :title="el.key" clickable @click="clickSupportFundType(el)"
                                  v-for="el in searchLiset" :key="el.key">
                            <van-radio :name="el.value"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="info" plain size="large" @click="resetSupportFundType">返回</van-button>
                    <van-button type="primary" size="large" @click="confirmSupportFundType">确定</van-button>
                </div>
            </div>
        </van-popup>
        <van-popup v-model="showSourceType" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">来源类别</h2>
                <van-checkbox-group v-model="newSourceType">
                    <van-cell-group>
                        <van-cell
                                v-for="(el, index) in configs.来源类别"
                                clickable
                                :key="el.key"
                                :title="el.key"
                                @click="toggle(index)"
                        >
                            <van-checkbox :name="el.value" ref="checkboxes"/>
                        </van-cell>
                    </van-cell-group>
                </van-checkbox-group>
                <div class="btn-box">
                    <van-button type="warning" size="large" @click="resetSourceType">不限条件</van-button>
                    <van-button type="primary" size="large" @click="confirmSourceType">确定</van-button>
                </div>
            </div>
        </van-popup>
        <div class="retrieval-box">
            <van-button class="btn-retrieval" type="primary" size="large" @click="retrieval">检索</van-button>
        </div>
    </div>
</template>

<script>
    import {URL_WAN_FANG} from '@/assets/js/gateway/connect/ConSysUrl'

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
                    languageType: 1,
                    accountId: 2006
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
                newType: 'SU$%=|',
                author: '作者',
                newAuthor: 'AU',
                time: '',
                newTime: '',
                sourceRearchType: '模糊',
                newSourceRearchType: '%',
                supportFundType: '模糊',
                newSupportFundType: '%',
                sourceType: '',
                newSourceType: [],
                item: {}
            }
        },
        mounted: function () {
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
                this.item = el;
                this.newType = el.value;
            },
            confirmType() {
                this.type = this.item.key;
                this.req.searchType = this.item.value;
                this.showType = false;
            },
            resetType() {
                this.newType = '';
                this.showType = false;
            },
            clickAuthor(el) {
                this.item = el;
                this.newAuthor = el.value;
            },
            confirmAuthor() {
                this.author = this.item.key;
                this.req.authorType = this.newAuthor;
                this.showAuthor = false;
            },
            resetAuthor() {
                this.newAuthor = '';
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
                this.item = el;
                this.newSourceRearchType = el.value;
            },
            confirmSourceRearchType() {
                this.sourceRearchType = this.item.key;
                this.req.sourceRearchType = this.item.value;
                this.showSourceRearchType = false;
            },
            resetSourceRearchType() {
                this.newSourceRearchType = '';
                this.showSourceRearchType = false;
            },
            clickSupportFundType(el) {
                this.item = el;
                this.newSupportFundType = el.value;
            },
            confirmSupportFundType() {
                this.supportFundType = this.item.key;
                this.req.supportFundType = this.item.value;
                this.showSupportFundType = false;
            },
            resetSupportFundType() {
                this.newSupportFundType = '';
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
            retrieval() {
                sessionStorage.setItem('ZWSearch', JSON.stringify(this.req));
                this.$router.push({path: '/zhiWangList'});
            }
        }
    }
</script>
<style type="text/less" lang="less">
    .WF-search {
        .van-overlay {
            top: 0 !important;
        }
    }

</style>
<style type="text/less" scoped lang="less">
    @import "../../../assets/less/gateway/wanFangSearch";

    .ZW-search {
        .item {
            .van-cell {
                padding: 10px 10px 10px 0;
            }
        }
    }
</style>
