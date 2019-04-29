<template>
    <div class="WF-search">
        <div class="logo">
            <img src="@/assets/images/logo_wanfang.png" alt="">
        </div>
        <div class="main">
            <van-cell-group>
                <div class="item new-item">
                <span @click="clickTitle(0)" class="title">{{keyType.keyTypeOne}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="searchParamters.keyContent" placeholder="请输入"
                               @keyup.enter="retrieval">
                        <span @click="clickMate(0)" class="title title-right">{{searchType.searchTypeOne}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(1)" class="title">{{keyType.keyTypeTwo}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="search1.keyContent" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(1)" class="title title-right">{{searchType.searchTypeTwo}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(2)" class="title">{{keyType.keyTypeThree}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="search2.keyContent" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(2)" class="title title-right">{{searchType.searchTypeThree}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(3)" class="title">{{keyType.keyTypeFour}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="search3.keyContent" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(3)" class="title title-right">{{searchType.searchTypeFour}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item new-item">
                <span @click="clickTitle(4)" class="title">{{keyType.keyTypeFive}}
                    <van-icon name="icon iconfont icon-tabxiala"/></span>
                    <div class="time-box">
                        <input v-model="search4.keyContent" placeholder="请输入" @keyup.enter="retrieval">
                        <span @click="clickMate(4)" class="title title-right">{{searchType.searchTypeFive}}
                        <van-icon name="icon iconfont icon-tabxiala"/></span>
                    </div>
                </div>
                <div class="item">
                    <van-field
                            v-model="req.chineseLibType" clearable label="中图分类" placeholder="请选择"
                            @click="clickTitle(5)" readonly/>

                </div>
                <!--<van-field
                        v-model="req.chineseLibType" clearable label="中图分类" placeholder="请选择"
                        @click="clickTitle(5)" readonly/>-->
                <van-field
                        v-model="req.sourceType" clearable label="资源类型" placeholder="请选择"
                        readonly @click="clickTitle(6)"/>
                <div class="item">
                    <span class="title">出版时间</span>
                    <div class="time-box">
                        <input v-model="starTime" placeholder="开始年度" type="number" @keyup.enter="retrieval">
                        <span>至</span>
                        <input v-model="endTime" placeholder="结束年度" type="number" @keyup.enter="retrieval">
                    </div>
                </div>
                <div class="tab-con fullContent">
                    <van-checkbox-group v-model="isFullContent">
                        <van-cell-group>
                            <van-cell title="是否全文" clickable v-for="(el,index) in FullContent" @click="toggle(index)"
                                      :key="el">
                                <van-checkbox :name="el" ref="checkboxes" @click.stop="toggle(index)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-checkbox-group>
                </div>
                <p class="explain">说明：出版时间只能输入数字，例如 {{date}}</p>
            </van-cell-group>
            <van-popup v-model="showSearchType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">检索类型</h2>
                    <van-radio-group v-model="type">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="changeType(el)"
                                      v-for="el in configs.searchType" :key="el.key">
                                <van-radio :name="el.value" @click.stop="changeType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showMateType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">匹配类型</h2>
                    <van-radio-group v-model="mate">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="changekMateType(el)"
                                      v-for="el in searchLiset" :key="el.key">
                                <van-radio :name="el.value" @click.stop="changekMateType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showClassify" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">中图分类</h2>
                    <van-radio-group v-model="req.chineseLibType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="changeClassify(el)"
                                      v-for="el in configs.chineseLibType" :key="el.key">
                                <van-radio :name="el.value" @click.stop="changeClassify(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
                </div>
            </van-popup>
            <van-popup v-model="showType" position="bottom">
                <div class="tab-con">
                    <h2 class="van-doc-demo-block__title">资源类型</h2>
                    <van-radio-group v-model="req.sourceType">
                        <van-cell-group>
                            <van-cell :title="el.key" clickable @click="changeResourceType(el)"
                                      v-for="el in configs.sourceType" :key="el.key">
                                <van-radio :name="el.value" @click.stop="changeResourceType(el)"/>
                            </van-cell>
                        </van-cell-group>
                    </van-radio-group>
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
    import {trim, _debounce} from "@/assets/js/gateway/Common";

    export default {
        name: 'home',
        data() {
            return {
                req: {
                    keyWord: '',
                    sourceType: '',
                    chineseLibType: '',
                    releaseDate: '',
                    sort: '',
                    pageIndex: 1,
                    pageSize: 20,
                    isFullContent: '',
                    accountId: 2003
                },
                reqConfigs: {
                    isReload: true,
                    sourceType: 'wfSelectData'
                },
                configs: {},
                showType: false,
                showClassify: false,
                showSearchType: false,
                showMateType: false,
                date: new Date().getFullYear(),
                starTime: '',
                endTime: '',
                searchType: {
                    searchTypeOne: '模糊',
                    searchTypeTwo: '模糊',
                    searchTypeThree: '模糊',
                    searchTypeFour: '模糊',
                    searchTypeFive: '模糊',
                },
                keyType: {
                    keyTypeOne: '全部字段',
                    keyTypeTwo: '关键词',
                    keyTypeThree: '题名',
                    keyTypeFour: '作者',
                    keyTypeFive: '作者单位',
                },
                searchLiset: [
                    {
                        key: '模糊',
                        value: 1
                    },
                    {
                        key: '精准',
                        value: 2
                    },
                ],
                searchParamters: {
                    keyType: "全部字段",
                    keyContent: '',
                    matchType: 1,
                    paramters: []
                },
                search1: {
                    relationType: "AND",
                    keyType: "关键词",
                    keyContent: '',
                    matchType: 1
                },
                search2: {
                    relationType: "AND",
                    keyType: "题名",
                    keyContent: '',
                    matchType: 1
                },
                search3: {
                    relationType: "AND",
                    keyType: "作者",
                    keyContent: '',
                    matchType: 1
                },
                search4: {
                    relationType: "AND",
                    keyType: "作者单位",
                    keyContent: '',
                    matchType: 1
                },
                index: '',
                searchTypeIndex: '',
                isFullContent: [],
                FullContent: ['有'],
                type: '',
                mate: ''
            }
        },
        mounted: function () {
            this.req.accountId = this.$route.query.accountId;
            this.getDataConfigs();
        },
        methods: {
            clickTitle(index) {
                this.index = index;
                switch (index) {
                    case 0:
                        this.showSearchType = true;
                        this.type = this.searchParamters.keyType;
                        break;
                    case 1:
                        this.showSearchType = true;
                        this.type = this.search1.keyType;
                        break;
                    case 2:
                        this.showSearchType = true;
                        this.type = this.search2.keyType;
                        break;
                    case 3:
                        this.showSearchType = true;
                        this.type = this.search3.keyType;
                        break;
                    case 4:
                        this.showSearchType = true;
                        this.type = this.search4.keyType;
                        break;
                    case 5:
                        this.showClassify = true;
                        break;
                    case 6:
                        this.showType = true;
                        break;
                }
            },
            clickMate(index) {
                this.searchTypeIndex = index;
                switch (index) {
                    case 0:
                        this.mate = this.searchParamters.matchType;
                        break;
                    case 1:
                        this.mate = this.search1.matchType;
                        break;
                    case 2:
                        this.mate = this.search2.matchType;
                        break;
                    case 3:
                        this.mate = this.search3.matchType;
                        break;
                    case 4:
                        this.mate = this.search4.matchType;
                        break;
                }
                this.showMateType = true;
            },
            changeType(el) {
                switch (this.index) {
                    case 0:
                        this.keyType.keyTypeOne = el.key;
                        this.searchParamters.keyType = el.value;
                        break;
                    case 1:
                        this.keyType.keyTypeTwo = el.key;
                        this.search1.keyType = el.value;
                        break;
                    case 2:
                        this.keyType.keyTypeThree = el.key;
                        this.search2.keyType = el.value;
                        break;
                    case 3:
                        this.keyType.keyTypeFour = el.key;
                        this.search3.keyType = el.value;
                        break;
                    case 4:
                        this.keyType.keyTypeFive = el.key;
                        this.search4.keyType = el.value;
                        break;
                }
                this.type = el.key;
                this.showSearchType = false;
            },
            changeIndex(index, value, text) {
                switch (index) {
                    case 0:
                        this.searchParamters.matchType = value;
                        this.searchType.searchTypeOne = text;
                        break;
                    case 1:
                        this.search1.matchType = value;
                        this.searchType.searchTypeTwo = text;
                        break;
                    case 2:
                        this.search2.matchType = value;
                        this.searchType.searchTypeThree = text;
                        break;
                    case 3:
                        this.search3.matchType = value;
                        this.searchType.searchTypeFour = text;
                        break;
                    case 4:
                        this.search4.matchType = value;
                        this.searchType.searchTypeFive = text;
                        break;
                }
            },
            changekMateType(el) {
                if (el.value == 1) {
                    this.changeIndex(this.searchTypeIndex, el.value, '模糊')
                } else {
                    this.changeIndex(this.searchTypeIndex, el.value, '精确')
                }
                this.mate = el.key;
                this.showMateType = false;
            },
            changeClassify(el) {
                this.req.chineseLibType = el.key;
                this.showClassify = false;
            },
            changeResourceType(el) {
                this.req.sourceType = el.key;
                this.showType = false;
            },
            getDataConfigs: async function () {
                this.configs = await this.$myHttp.myGet(URL_WAN_FANG.GET_DATA_CONFIGS, this.reqConfigs);
                sessionStorage.setItem('WFConfigs', JSON.stringify(this.configs));
            },
            getSearchParameters(searchParamters) {
                let strSearch = this.getSearchTypeWord(searchParamters.keyType,
                    this.getMatchTypeWord(searchParamters.matchType, searchParamters.keyContent));
                let parameters = searchParamters.paramters;
                if (parameters != null && parameters.length > 0) {
                    for (let i = 0; i < parameters.length; i++) {
                        let parameter = parameters[i];
                        if (strSearch && strSearch != '') {
                            strSearch = "(" + strSearch + ") ";
                        }
                        strSearch = strSearch + parameter.relationType + " " + this.getSearchTypeWord(parameter.keyType,
                            this.getMatchTypeWord(parameter.matchType, parameter.keyContent));
                    }
                }
                if (strSearch && strSearch.startsWith("AND")) {
                    strSearch = "\\" + strSearch;
                }

                return strSearch;
            },
            getSearchTypeWord(keyType, keyWod) {
                if (keyType != "全部字段" && keyWod != '') {
                    keyWod = keyType + "=" + keyWod;
                }
                return keyWod;
            },
            getMatchTypeWord(matchType, keyWord) {
                if (matchType == 2 && keyWord != '') {
                    keyWord = "\"" + keyWord + "\"";
                }
                return keyWord;
            },
            toggle(index) {
                this.$refs.checkboxes[index].toggle();
            },
            retrieval: _debounce(function () {
                if (this.isFullContent.length > 0) {
                    this.req.isFullContent = this.isFullContent[0];
                } else {
                    this.req.isFullContent = '';
                }
                this.searchParamters.keyContent = trim(this.searchParamters.keyContent);
                this.search1.keyContent = trim(this.search1.keyContent);
                this.search2.keyContent = trim(this.search2.keyContent);
                this.search3.keyContent = trim(this.search3.keyContent);
                this.search4.keyContent = trim(this.search4.keyContent);


                if (this.search1.keyContent && this.search1.keyContent != '') {
                    this.searchParamters.paramters.push(this.search1);
                }
                if (this.search2.keyContent && this.search2.keyContent != '') {
                    this.searchParamters.paramters.push(this.search2);
                }
                if (this.search3.keyContent && this.search3.keyContent != '') {
                    this.searchParamters.paramters.push(this.search3);
                }
                if (this.search4.keyContent && this.search4.keyContent != '') {
                    this.searchParamters.paramters.push(this.search4);
                }
                this.req.keyWord = this.getSearchParameters(this.searchParamters);
                if (this.req.keyWord && this.req.keyWord != '') {
                    if (this.starTime && this.endTime) {
                        this.req.releaseDate = this.starTime + '-' + this.endTime;
                    }
                    sessionStorage.setItem('WFSearch', JSON.stringify(this.req));
                    this.searchParamters.paramters = [];
                    this.$router.push({path: '/wanFangList'});
                } else {
                    this.$toast({
                        message: '前5个条件至少输入1个才能检索！',
                        duration: 4000
                    });
                }
            }, 300)
        }
    }
</script>
<style type="text/less" lang="less">
    .WF-search {
        .van-overlay {
            top: 0 !important;
        }

        .tab-con .van-cell__title {
            text-align: left !important;
        }

        .van-cell__title.van-field__label,.fullContent .van-cell__title {
            text-align: center !important;
            margin-right: 5px !important;
            flex: none;
            width: 88px !important;
        }
        .fullContent {
            margin-top: -2px;
            padding-bottom: 0 !important;

            .van-cell__title {
                color: #45b97c !important;
                font-weight: bold !important;
            }
            .van-checkbox {
                text-align: left !important;
            }
        }
    }

</style>
<style type="text/less" scoped lang="less">
    @import "../../../assets/less/gateway/wanFangSearch";
</style>
