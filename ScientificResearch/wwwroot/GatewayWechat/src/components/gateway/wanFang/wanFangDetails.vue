<template>
    <div class="details">
        <div class="header">
            <h4 class="title">
                <van-icon name="fire"/>
                {{item.title}}
            </h4>
            <p class="name">{{item.authors}}</p>
        </div>
        <div class="centent">
            <p>{{details.abstracts}}</p>
        </div>
        <div class="content-footer">
            <p v-if="introdution">【来源】：{{introdution[0]+introdution[1]}}</p>
            <p v-if="introdution">【被引】：{{introdution[2]}}</p>
            <p v-if="keyWord">【关键词】：{{keyWord}}</p>
            <p v-if="item.tag" class="keyword">【标签】：<span v-for="el in item.tag" :key="el">{{el}}</span></p>
            <div class="btn-box" v-if="item.full">
                <!-- <a href="javascript:;" @click="clickPreview" class="btn-preview">
                     预览PDF
                     <van-icon name="icon iconfont icon-browse"/>
                 </a>-->
                <a :href="downUrl" class="btn-preview">
                    预览PDF
                    <van-icon name="icon iconfont icon-browse"/>
                </a>
                <a :href="downUrl" id="btn-download" class="btn-download">
                    下载PDF
                    <van-icon name="icon iconfont icon-download"/>
                </a>
            </div>
        </div>
    </div>
</template>

<script>
    import {HTTP_URL_HOST, URL_WAN_FANG_DOWNLOAD_FILE, URL_WAN_FANG} from "@/assets/js/gateway/connect/ConSysUrl";
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
            console.info(this.item);
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
                    this.downUrl = HTTP_URL_HOST + URL_WAN_FANG_DOWNLOAD_FILE + this.item.fileName;
                }
                console.info('data.downUrl');
                console.info(data.downUrl);
                this.details = data;
                // if (this.item.full) {
                //     this.getWfDataDownUrl();
                // }
            },
            clickPreview() {
                sessionStorage.setItem('downUrl', JSON.stringify(this.downUrl));
                console.info('this.downUrl44444');
                console.info(this.downUrl);
                window.open('../../../assets/libs/pdf/web/viewer.html?file=' + decodeURI(encodeURI(encodeURI(this.downUrl))))
                // window.open('@/assets/libs/pdf/web/viewer.html?file=' + encodeURIComponent(this.downUrl))
            },
            clickDownload() {
                this.getWfDataDownUrl();
            },
            getWfDataDownUrl: async function () {
                let url = await this.$myHttp.myGet(URL_WAN_FANG.GET_ARTICLE_DOWNURL, this.reqUrl);
                if (url) {
                    let newUrl = HTTP_URL_HOST + URL_WAN_FANG_DOWNLOAD_FILE + url;
                    downloadFile(newUrl, this.item.fileName);
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
