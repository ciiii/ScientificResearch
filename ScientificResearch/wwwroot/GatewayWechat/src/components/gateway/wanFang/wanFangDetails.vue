<template>
    <div class="details">
        <div class="header">
            <h4 class="title">
                <van-icon name="fire"/>
                {{item.title}}
            </h4>
            <p class="name">{{item.authors}}</p>
        </div>
        <div class="centent"><p>{{details.abstracts}}</p></div>
        <div class="content-footer">
            <p>【来源】：{{introdution[0]+introdution[1]}}</p>
            <p>【被引】：{{introdution[2]}}</p>
            <p v-if="keyWord">【关键词】：{{keyWord}}</p>
            <p v-if="item.tag" class="keyword">
                <span v-for="(el,index) in item.tag" :key="index">{{el}}</span>
            </p>
            <div class="btn-box" v-if="item.full&&details">
                <van-button type="default" @click="getDownloadFile(true)">
                    <van-icon name="icon iconfont icon-browse"/> 预览PDF
                </van-button>
                <van-button type="default" @click="getDownloadFile(false)">
                    <van-icon name="icon iconfont icon-download"/>下载PDF
                </van-button>
            </div>
        </div>
    </div>
</template>

<script>
    import {URL_WAN_FANG} from "@/assets/js/gateway/connect/ConSysUrl";
    import {UrlEncode, _debounce} from "@/assets/js/gateway/Common";

    export default {
        name: "wanFangDetails",
        props: ['item'],
        data() {
            return {
                req: {
                    url: '',
                    accountId: '',
                },
                reqUrl: {
                    url: '',
                    fileName: '',
                    accountId: '',
                },
                details: {},
                keyWord: '',
                introdution: '',
                showPdf: false,
                downUrl: 'javascript:;'
            }
        },
        mounted() {
            this.req.url = this.item.detailUrl;
            this.req.accountId = this.item.accountId;
            this.reqUrl.accountId = this.item.accountId;
            this.introdution = this.item.introdution;
            if (this.item.keyWord != '') {
                this.keyWord = this.item.keyWord.join('，');
            }
            this.getDetails();
        },
        methods: {
            getDetails: async function () {
                let data = await this.$myHttp.myGet(URL_WAN_FANG.GET_ARTICLE_DETAILS, this.req);
                this.reqUrl.url = data.downUrl;
                this.reqUrl.fileName = data.fileName;
                this.details = data;
            },
            getLoading() {
                this.toastLoading = this.$toast.loading({
                    mask: true,
                    message: '加载中...',
                    duration: 5000
                });
            },
            getDownloadFile: _debounce(async function (type) {
                this.getLoading();
                let data = await this.$myHttp.myGet(URL_WAN_FANG.GET_ARTICLE_DOWNURL, this.reqUrl);
                if (data && data != '') {
                    this.toastLoading.clear();
                    this.downUrl = URL_WAN_FANG.GET_DOWNURL_FILE + '?fileName=' + UrlEncode(data) + '&downUrl=' + UrlEncode(this.reqUrl.url) + '&accountId=' + this.item.accountId;
                    if (type) {
                        this.$router.push({path: '/pdfPreview', query: {url: this.downUrl}})
                    } else {
                        window.location.href = this.downUrl;
                    }
                } else {
                    this.$toast('您无权或余额不足不能下载此文章！');
                }
            }, 300),
        }
    }
</script>
<style scoped type="text/less" lang="less">
    @import "../../../assets/less/gateway/Details";

    .keyword {
        span {
            border-color: #409EFF;
            color: #409EFF;
        }
    }
</style>
