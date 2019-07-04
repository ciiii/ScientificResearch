<template>
    <div class="NewsDetails details">
        <div class="content-box" v-if="isLoad">
            <el-tabs type="card">
                <el-tab-pane label="通知内容">
                    <h4 class="title">{{form.通知公告.通知名称}}</h4>
                    <p class="time">
                        <span>新闻类型：{{form.通知公告.通知类型}}，发表人：{{form.通知公告.发送人姓名}}，发表时间：</span>{{form.通知公告.建立时间}}
                    </p>
                    <div class="ql-editor" v-html="form.通知公告.通知内容"></div>
                </el-tab-pane>
                <el-tab-pane label="基本信息">
                    <div class="item-box">
                        <h5 class="title">基本信息</h5>
                        <table class="mailTable">
                            <tr>
                                <th>通知名称</th>
                                <td colspan="3">{{form.通知公告.通知名称}}</td>
                            </tr>
                            <tr>
                                <th>通知类型</th>
                                <td>{{form.通知公告.通知类型}}</td>
                                <th>通知标识</th>
                                <td>{{form.通知公告.通知标识}}</td>
                            </tr>
                            <tr>
                                <th>发布人</th>
                                <td>{{form.通知公告.发送人姓名}}</td>
                                <th>部门</th>
                                <td>{{form.通知公告.发送人部门名称}}</td>
                            </tr>
                            <tr>
                                <th>接收人数</th>
                                <td>{{form.通知公告.接收人数}}</td>
                                <th>已接收人数</th>
                                <td>{{form.通知公告.已接收人数}}</td>
                            </tr>
                            <tr>
                                <th>接受者类型</th>
                                <td>{{form.通知公告.接收者类型名称}}</td>
                                <th>接受者</th>
                                <td>{{names}}</td>
                            </tr>
                            <tr>
                                <th>发布时间</th>
                                <td>{{form.通知公告.建立时间|dataFormat('yyyy-MM-dd')}}</td>
                                <th>关闭时间</th>
                                <td>{{form.通知公告.关闭时间|dataFormat('yyyy-MM-dd')}}</td>
                            </tr>
                        </table>
                        <h5 class="title" v-if="files.length>0">附件</h5>
                        <div class="file-list" v-if="files.length>0">
                            <ul>
                                <li v-for="el in files">
                                    <a :href="getUrl(el)" download="" target="_blank"><i class="el-icon-document"></i>
                                        {{getName(el)}}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </el-tab-pane>
            </el-tabs>
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">关 闭</el-button>
        </div>
    </div>
</template>

<script>
    import {HTTP_URL_HOST, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import {getHtmlDocName, getUrl} from '@/assets/js/Common';

    export default {
        name: "NewsDetails",
        props: ['item'],
        data() {
            return {
                isLoad: false,
                form: {},
                files: [],
                names: ''
            }
        },
        mounted() {
            this.getIMISNewsDetails(this.item.编号)
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            getUrl(item) {
                return getUrl(HTTP_URL_HOST + item);
            },
            getName(item) {
                return getHtmlDocName(item);
            },
            getIMISNewsDetails: async function (id) {
                let postData = {
                    编号: id
                }
                let data = await this.$http.myGet(URL_NEWS.GET_IMIS_NEWS_DETAILS, postData);
                if (data) {
                    this.form = data;
                    if (data.通知公告.相关文件路径 && data.通知公告.相关文件路径 != '') {
                        this.files = data.通知公告.相关文件路径.split(',');
                    }
                    if (data.接收条件.length != 0) {
                        data.通知公告.接收者类型名称 = data.接收条件[0].接收者类型名称;
                        let arr = [];
                        data.接收条件.forEach((item) => {
                            arr.push(item.接收者名称);
                        })
                        this.names = arr.join();
                    }
                }
                this.isLoad = true;
            },
        }
    }
</script>
