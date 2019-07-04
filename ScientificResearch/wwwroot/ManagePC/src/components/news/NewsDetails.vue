<template>
    <div class="NewsDetails">
        <div class="content-box" v-if="isLoad">
            <h4 class="title">{{form.新闻.标题}}</h4>
            <p class="tiem">
                <el-tag class="tag" v-if="tags" v-for="el in tags" :key="el">{{el}}</el-tag>
            </p>
            <p class="tiem">新闻分类：{{form.新闻.新闻分类名称}}；{{form.新闻.建立时间}}</p>
            <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="form.新闻.内容">
                </div>
            </div>
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">关 闭</el-button>
        </div>
    </div>
</template>

<script>
    import {URL_NEWS} from "@/assets/js/connect/ConSysUrl";

    export default {
        name: "NewsDetails",
        props: ['item'],
        data() {
            return {
                form: {},
                tags: [],
                isLoad: false
            }
        },
        mounted() {
            this.getDetails(this.item.编号)
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            getDetails: async function (id) {
                let postData = {
                    新闻编号: id
                }
                let data = await this.$http.myGet(URL_NEWS.GET_NEWS_DETAILS, postData);
                if (data) {
                    this.form = data;
                    if (this.form.新闻.标签 && this.form.新闻.标签 != '') {
                        this.tags = this.form.新闻.标签.split(',')
                    }
                }
                this.isLoad = true;
            },
        }
    }
</script>
<style lang="less" type='text/less' scoped>
    .tag {
        margin: 0 5px 5px;
    }
</style>
