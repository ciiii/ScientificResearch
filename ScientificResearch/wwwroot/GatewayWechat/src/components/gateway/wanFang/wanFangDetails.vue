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
            <p v-if="introdution">【来源】：{{introdution[0]+introdution[1]}}</p>
            <p v-if="introdution">【被引】：{{introdution[2]}}</p>
            <p v-if="keyWord">【关键词】：{{keyWord}}</p>
            <p v-if="item.tag" class="keyword">
                【标签】：<span v-for="el in item.tag" :key="el">{{el}}</span>
            </p>
            <div class="btn-box" v-if="item.full">
                <a href="javascript:;" class="btn-preview" @click="clickPreview">
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
    import {URL_WAN_FANG, URL_DOWNLOAD_FILE} from "@/assets/js/gateway/connect/ConSysUrl";
    import {UrlEncode} from "@/assets/js/gateway/Common";
    import {downloadFile} from "@/assets/js/gateway/FileSaver";

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
                if (data.downUrl) {
                    this.downUrl = URL_WAN_FANG.GET_DOWNURL_FILE + '?fileName=' + UrlEncode(data.fileName) + '&downUrl=' + UrlEncode(this.reqUrl.url) + '&accountId=' + this.item.accountId;
                }
                this.details = data;
            },
            clickPreview() {
                window.open('pdf/web/viewer.html?file=' + encodeURIComponent(this.downUrl));
            },
            getDownloadFile: async function () {
                let url = await this.$myHttp.myGet(URL_WAN_FANG.GET_ARTICLE_DOWNURL, this.reqUrl);
                if (url) {

                    let newUrl = URL_DOWNLOAD_FILE + '?fileName='+url;
                    console.info(newUrl);
                    window.location.href = newUrl;
                    // downloadFile(newUrl, this.item.fileName);
                }
            },
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
