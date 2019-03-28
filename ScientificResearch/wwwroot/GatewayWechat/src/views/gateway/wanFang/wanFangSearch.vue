<template>
    <div class="WF-search">
        <div class="logo">
            <img src="@/assets/images/logo_wanfang.png" alt="">
        </div>
        <van-cell-group>
            <van-field v-model="req.q" required clearable label="关键词" placeholder="请输入" @keyup.enter.native="retrieval"/>
            <van-field
                    v-model="req.中图分类_f" clearable label="中图分类" placeholder="请选择"
                    @click="clickTitle(0)" readonly
            />
            <van-field
                    v-model="req.资源类型_f" clearable label="资源类型" placeholder="请选择"
                    readonly @click="clickTitle(1)"
            />
            <div class="item">
                <span class="title">出版时间</span>
                <div class="time-box">
                    <input v-model="starTime" placeholder="开始年度" type="number"> <span>至</span>
                    <input v-model="endTime" placeholder="结束年度" type="number">
                </div>
            </div>
            <p class="explain">说明：出版时间只能输入数字，例如 {{date}}</p>
        </van-cell-group>
        <van-popup v-model="showClassify" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">中图分类</h2>
                <van-radio-group v-model="classify">
                    <van-cell-group>
                        <van-cell :title="el.value" clickable @click="classify = el.key"
                                  v-for="el in configs.中图分类_f" :key="el.key">
                            <van-radio :name="el.key"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="warning" size="large" @click="resetClassify">重置</van-button>
                    <van-button type="primary" size="large" @click="confirmClassify">确定</van-button>
                </div>
            </div>
        </van-popup>
        <van-popup v-model="showType" position="bottom">
            <div class="tab-con">
                <h2 class="van-doc-demo-block__title">资源类型</h2>
                <van-radio-group v-model="resourceType">
                    <van-cell-group>
                        <van-cell :title="el.value" clickable @click="resourceType = el.key"
                                  v-for="el in configs.资源类型_f" :key="el.key">
                            <van-radio :name="el.key"/>
                        </van-cell>
                    </van-cell-group>
                </van-radio-group>
                <div class="btn-box">
                    <van-button type="warning" size="large" @click="resetResourceType">重置</van-button>
                    <van-button type="primary" size="large" @click="confirmResourceType">确定</van-button>
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
                    q: '肿瘤',
                    资源类型_f: '',
                    中图分类_f: '',
                    出版时间_f: '',
                    sort: '',
                    p: '1',
                    n: '20',
                    accountId: 2003
                },
                reqConfigs: {
                    isReload: true,
                    sourceType: 'wfSelectData'
                },
                configs: {},
                showClassify: false,
                showType: false,
                date: new Date().getFullYear(),
                classify: '',
                resourceType: '',
                starTime: '',
                endTime: '',

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
                        this.showClassify = true;
                        break;
                    case 1:
                        this.showType = true;
                        break;
                }
            },
            confirmClassify() {
                this.req.中图分类_f = this.classify;
                this.showClassify = false;
            },
            resetClassify() {
                this.classify = '';
            },
            confirmResourceType() {
                this.req.资源类型_f = this.resourceType;
                this.showType = false;
            },
            resetResourceType() {
                this.resourceType = '';
            },
            getDataConfigs: async function () {
                this.configs = await this.$myHttp.myGet(URL_WAN_FANG.GET_DATA_CONFIGS, this.reqConfigs);
                sessionStorage.setItem('WFConfigs', JSON.stringify(this.configs));
            },
            retrieval() {
                if (this.starTime && this.endTime) {
                    this.req.出版时间_f = this.starTime + '-' + this.endTime;
                }
                sessionStorage.setItem('WFSearch', JSON.stringify(this.req));
                this.$router.push({path: '/wanFangList'});
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
</style>
