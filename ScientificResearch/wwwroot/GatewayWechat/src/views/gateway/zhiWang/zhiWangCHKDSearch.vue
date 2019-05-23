<template>
    <div class="ZW-search">
        <div class="logo">
            <img src="@/assets/images/logo_zhiwangCHKD.jpg" alt="">
        </div>
        <div class="main">
            <van-cell-group>
                <div class="item new-item">
                <span @click="clickTitle(0)" class="title">{{keyWord}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="req.mainWord" placeholder="请输入"
                               @keyup.enter="retrieval">
                        <span @click="clickMate(0)" class="title title-right">{{searchType.searchTypeOne}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(1)" class="title">{{keyType.keyTypeOne}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="req.searchWord1" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(1)" class="title title-right">{{searchType.searchTypeTwo}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(2)" class="title">{{keyType.keyTypeTwo}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="req.searchWord2" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(2)" class="title title-right">{{searchType.searchTypeThree}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(3)" class="title">{{keyType.keyTypeThree}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="req.searchWord3" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(3)" class="title title-right">{{searchType.searchTypeFour}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(4)" class="title">{{keyType.keyTypeFour}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="req.searchWord4" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(4)" class="title title-right">{{searchType.searchTypeFive}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(5)" class="title">{{keyType.keyTypeFive}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="req.searchWord5" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(5)" class="title title-right">{{searchType.searchTypeSix}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                    <span class="title">作者</span>
                    <div class="time-box">
                        <input v-model="req.author" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(6)" class="title title-right">{{searchType.searchTypeSeven}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <van-field v-model="req.authorDepartment" clearable label="作者单位" placeholder="请输入"
                           @keyup.enter.native="retrieval"/>
                <div class="item new-item">
                    <span class="title">第一作者</span>
                    <div class="time-box">
                        <input v-model="req.firstAuthor" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(7)" class="title title-right">{{searchType.searchTypeEight}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <van-field v-model="req.firstAuthorDepartment" clearable label="第一作者单位" placeholder="请输入"
                           @keyup.enter.native="retrieval"/>
                <div class="item">
                    <span class="title">发表时间</span>
                    <div class="time-box">
                        <input v-model="req.fromYear" placeholder="开始年度" type="number" @keyup.enter="retrieval">
                        <span>至</span>
                        <input v-model="req.toYear" placeholder="结束年度" type="number" @keyup.enter="retrieval">
                    </div>
                </div>
                <van-field
                        v-model="time" clearable label="更新时间" placeholder="请选择"
                        @click="clickTitle(6)" readonly/>
                <div class="item new-item">
                    <span class="title">来源期刊</span>
                    <div class="time-box">
                        <input v-model="req.sourceName" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(8)" class="title title-right">{{searchType.searchTypeNine}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                    <span class="title">支持基金</span>
                    <div class="time-box">
                        <input v-model="req.supportFundName" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(9)" class="title title-right">{{searchType.searchTypeTen}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <van-field
                        v-model="sourceType" clearable label="来源类别" placeholder="请选择"
                        readonly @click="clickTitle(7)"/>
                <p class="explain">说明：发表时间只能输入数字，例如 {{date}}</p>
            </van-cell-group>
            <van-popup v-model="showMainType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">关键字类型</h2>
                    <van-radio-group v-model="req.mainType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickMainType(el)"
                                      v-for="el in configs.关键字类型" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickMainType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">检索类型</h2>
                    <van-radio-group v-model="type">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickType(el)"
                                      v-for="el in configs.检索类型" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickType(el)"/>
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
            <van-popup v-model="showMateType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">匹配类型</h2>
                    <van-radio-group v-model="mate">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="clickkMateType(el)"
                                      v-for="el in searchLiset" :key="el.key">
                                <van-radio :name="el.value" @click.stop="clickkMateType(el)"/>
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
                    mainType: '主要主题词',
                    mainWord: '',
                    mainMatchType: '%',
                    searcthType1: '主题',
                    searchWord1: '',
                    searchMatchType1: '%',
                    searcthType2: '题名',
                    searchWord2: '',
                    searchMatchType2: '%',
                    searcthType3: '关键词',
                    searchWord3: '',
                    searchMatchType3: '%',
                    searcthType4: '摘要',
                    searchWord4: '',
                    searchMatchType4: '%',
                    searcthType5: '全文',
                    searchWord5: '',
                    searchMatchType5: '%',
                    fromYear: '',
                    toYear: '',
                    updateTag: '',
                    sourceName: '',
                    sourceNameMatchType: '%',
                    sourceType: '',
                    supportFundName: '',
                    supportFundNameMatcthType: '%',
                    author: '',
                    authorMatchType: '%',
                    authorDepartment: '',
                    firstAuthor: '',
                    firstAuthorMatchType: '%',
                    firstAuthorDepartment: '',
                    accountId: 2015
                },
                searchType: {
                    searchTypeOne: '模糊',
                    searchTypeTwo: '模糊',
                    searchTypeThree: '模糊',
                    searchTypeFour: '模糊',
                    searchTypeFive: '模糊',
                    searchTypeSix: '模糊',
                    searchTypeSeven: '模糊',
                    searchTypeEight: '模糊',
                    searchTypeNine: '模糊',
                    searchTypeTen: '模糊',
                },
                keyWord: '主要主题',
                keyType: {
                    keyTypeOne: '题名&关键词&摘要',
                    keyTypeTwo: '题名',
                    keyTypeThree: '关键词',
                    keyTypeFour: '摘要',
                    keyTypeFive: '正文'
                },
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
                reqConfigs: {
                    isReload: true,
                    sourceType: 'zwSelectData'
                },
                configs: {},
                showMainType: false,
                showMateType: false,
                showType: false,
                showAuthor: false,
                showTime: false,
                showSourceType: false,
                type: '',
                mate: '',
                date: new Date().getFullYear(),
                resourceType: '',
                starTime: '',
                endTime: '',
                time: '',
                newTime: '',
                sourceType: '',
                newSourceType: [],
                item: {},
                index: '',
                searchTypeIndex: ''
            }
        },
        mounted: function () {
            this.req.accountId = this.$route.query.accountId;
            this.getDataConfigs();
        },
        methods: {
            onSearch() {
                this.req.Index = 1;
                this.getList();
            },
            clickTitle(index) {
                this.index = index;
                switch (index) {
                    case 0:
                        this.showMainType = true;
                        break;
                    case 1:
                        this.showType = true;
                        this.type = this.req.searcthType1;
                        break;
                    case 2:
                        this.showType = true;
                        this.type = this.req.searcthType2;
                        break;
                    case 3:
                        this.showType = true;
                        this.type = this.req.searcthType3;
                        break;
                    case 4:
                        this.showType = true;
                        this.type = this.req.searcthType4;
                        break;
                    case 5:
                        this.showType = true;
                        this.type = this.req.searcthType5;
                        break;
                    case 6:
                        this.showTime = true;
                        break;
                    case 7:
                        this.showSourceType = true;
                        break;
                }
            },
            clickMate(index) {
                this.searchTypeIndex = index;
                switch (index) {
                    case 0:
                        this.mate = this.req.mainMatchType;
                        break;
                    case 1:
                        this.mate = this.req.searchMatchType1;
                        break;
                    case 2:
                        this.mate = this.req.searchMatchType2;
                        break;
                    case 3:
                        this.mate = this.req.searchMatchType3;
                        break;
                    case 4:
                        this.mate = this.req.searchMatchType4;
                        break;
                    case 5:
                        this.mate = this.req.searchMatchType5;
                        break;
                    case 6:
                        this.mate = this.req.authorMatchType;
                        break;
                    case 7:
                        this.mate = this.req.firstAuthorMatchType;
                        break;
                    case 8:
                        this.mate = this.req.sourceNameMatchType;
                        break;
                    case 9:
                        this.mate = this.req.supportFundNameMatcthType;
                        break;
                }
                this.showMateType = true;
            },
            clickMainType(el) {
                this.keyWord = el.key;
                this.req.mainType = el.value;
                this.showMainType = false;
            },
            clickType(el) {
                switch (this.index) {
                    case 1:
                        this.keyType.keyTypeOne = el.key;
                        this.req.searcthType1 = el.value;
                        break;
                    case 2:
                        this.keyType.keyTypeTwo = el.key;
                        this.req.searcthType2 = el.value;
                        break;
                    case 3:
                        this.keyType.keyTypeThree = el.key;
                        this.req.searcthType3 = el.value;
                        break;
                    case 4:
                        this.keyType.keyTypeFour = el.key;
                        this.req.searcthType4 = el.value;
                        break;
                    case 5:
                        this.keyType.keyTypeFive = el.key;
                        this.req.searcthType5 = el.value;
                        break;
                }
                this.type = el.key;
                this.showType = false;
            },
            clickkMateType(el) {
                switch (this.searchTypeIndex) {
                    case 0:
                        this.searchType.searchTypeOne = el.key;
                        this.req.mainMatchType = el.value;
                        break;
                    case 1:
                        this.searchType.searchTypeTwo = el.key;
                        this.req.searchMatchType1 = el.value;
                        break;
                    case 2:
                        this.searchType.searchTypeThree = el.key;
                        this.req.searchMatchType2 = el.value;
                        break;
                    case 3:
                        this.searchType.searchTypeFour = el.key;
                        this.req.searchMatchType3 = el.value;
                        break;
                    case 4:
                        this.searchType.searchTypeFive = el.key;
                        this.req.searchMatchType4 = el.value;
                        break;
                    case 5:
                        this.searchType.searchTypeSix = el.key;
                        this.req.searchMatchType5 = el.value;
                        break;
                    case 6:
                        this.searchType.searchTypeSeven = el.key;
                        this.req.authorMatchType = el.value;
                        break;
                    case 7:
                        this.searchType.searchTypeEight = el.key;
                        this.req.firstAuthorMatchType = el.value;
                        break;
                    case 8:
                        this.searchType.searchTypeNine = el.key;
                        this.req.sourceNameMatchType = el.value;
                        break;
                    case 9:
                        this.searchType.searchTypeTen = el.key;
                        this.req.supportFundNameMatcthType = el.value;
                        break;
                }
                this.mate = el.key;
                this.showMateType = false;
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
                this.req.updateTag = this.item.value;
                this.showTime = false;
            },
            resetTime() {
                this.time = '不限';
                this.newTime = '';
                this.req.updateTag = '';
                this.showTime = false;
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
                sessionStorage.setItem('ZWSearch', JSON.stringify(this.req));
                this.$router.push({path: '/zhiWangList', query: {type: 1}});
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

    .logo {
        img {
            width: 188px;
            height: auto;
        }
    }
</style>
