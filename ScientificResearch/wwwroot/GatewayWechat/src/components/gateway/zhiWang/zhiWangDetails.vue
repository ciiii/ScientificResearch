<template>
    <div class="details">
        <div class="header">
            <h4 class="title">
                <van-icon name="fire"/>
                {{item.title}}
            </h4>
            <p class="time">{{item.publishDate}}</p>
            <p class="name">{{details.authors}}</p>
        </div>
        <div class="centent">
            <p>{{details.brief}}</p>
        </div>
        <div class="content-footer">
            <p v-if="details.sourceCome">【机构】：{{details.sourceCome}}</p>
            <p v-if="details.areaType">【领域】：{{details.areaType}}</p>
            <p v-if="details.fund">【基金】：{{details.fund}}</p>
            <p class="keyword" v-if="details.keyWord">
                <span v-for="(el,index) in details.keyWord" :key="index">{{el}}</span>
            </p>
            <div class="btn-box" v-if="isShowDown&&details">
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
    import {URL_ZHI_WANG} from "@/assets/js/gateway/connect/ConSysUrl";
    import {UrlEncode, _debounce} from "@/assets/js/gateway/Common";

    export default {
        name: "zhiWangDetails",
        props: ['item'],
        data() {
            return {
                req: {
                    detailUrl: '',
                    accountId: '',
                },
                reqUrl: {
                    url: '',
                    fileName: '',
                    accountId: '',
                },
                details: {},
                isShowDown: false,
                showPdf: false,
                downUrl: '',
            }
        },
        mounted() {
            this.req.detailUrl = this.item.detailUrl;
            this.req.accountId = this.item.accountId;
            this.reqUrl.accountId = this.item.accountId;
            this.reqUrl.fileName = this.item.fileName;
            this.getDetails();
        },
        methods: {
            getDetails: async function () {
                let data = await this.$myHttp.myGet(URL_ZHI_WANG.GET_ARTICLE_DETAILS, this.req);
                if (data.pdfDownUrl) {
                    this.reqUrl.url = data.pdfDownUrl;
                }
                if (data.keyWord) {
                    data.keyWord = data.keyWord.slice(0, data.keyWord.length - 1);
                    data.keyWord = data.keyWord.split(';');
                }
                if (this.reqUrl.url && this.reqUrl.url != '') {
                    this.isShowDown = true;
                } else {
                    this.isShowDown = false;
                }
                this.details = data;
            },
            getLoading() {
                this.toastLoading = this.$toast.loading({
                    mask: true,
                    message: '加载中...',
                    duration: 5000,
                });
            },
            getDownloadFile: _debounce(async function (type) {
                this.getLoading();
                let data = await this.$myHttp.myGet(URL_ZHI_WANG.GET_ARTICLE_DOWNURL, this.reqUrl);
                if (data && data != '') {
                    this.toastLoading.clear();
                    this.downUrl = URL_ZHI_WANG.GET_DOWNURL_FILE + '?fileName=' + UrlEncode(data) + '&downUrl=' + UrlEncode(this.reqUrl.url) + '&accountId=' + this.item.accountId;
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
</style>
