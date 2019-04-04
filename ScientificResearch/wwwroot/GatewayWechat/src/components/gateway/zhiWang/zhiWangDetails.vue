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
                【关键词】：<span v-for="el in details.keyWord" :key="el">{{el}}</span>
            </p>
            <div class="btn-box" v-if="isShowDown">
                <a href="javascript:;" class="btn-preview" @click="getDownloadFile">
                    预览PDF
                    <van-icon name="icon iconfont icon-browse"/>
                </a>
                <a :href="downUrl" id="btn-download" class="btn-download" download="">
                    下载PDF
                    <van-icon name="icon iconfont icon-download"/>
                </a>
            </div>
        </div>
    </div>
</template>

<script>
    import {URL_ZHI_WANG} from "@/assets/js/gateway/connect/ConSysUrl";
    import {UrlEncode} from "@/assets/js/gateway/Common";

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
                downUrl: 'javascript:;'
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
                this.reqUrl.url = data.pdfDownUrl;
                if (data.keyWord) {
                    data.keyWord = data.keyWord.slice(0, data.keyWord.length - 1);
                    data.keyWord = data.keyWord.split(';');
                }
                if (this.reqUrl.url && this.reqUrl.url != '') {
                    this.isShowDown = true;
                    this.downUrl = URL_ZHI_WANG.GET_DOWNURL_FILE + '?fileName=' + UrlEncode(this.item.fileName) + '&downUrl=' + UrlEncode(this.reqUrl.url) + '&accountId=' + this.item.accountId;
                } else {
                    this.isShowDown = false;
                }
                this.details = data;
            },
            getDownloadFile: async function () {
                let data = await this.$myHttp.myGet(URL_ZHI_WANG.GET_ARTICLE_DOWNURL, this.reqUrl);
                if (data && data != '') {
                    this.clickPreview();
                } else {
                    this.$toast('您无权或余额不足不能下载此文章！');
                }
            },
            clickPreview() {
                window.open('pdf/web/viewer.html?file=' + encodeURIComponent(this.downUrl));
            }
        }
    }
</script>

<style scoped type="text/less" lang="less">
    @import "../../../assets/less/gateway/Details";
</style>
