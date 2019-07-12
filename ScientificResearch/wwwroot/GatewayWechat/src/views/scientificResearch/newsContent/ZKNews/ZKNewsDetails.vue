<template>
    <div class="box NewsDetails" v-if="isLoad">
        <h4 class="title">{{form.新闻.标题}}</h4>
        <p class="time">新闻分类：{{form.新闻.新闻分类名称}}；{{form.新闻.建立时间}}</p>
        <p class="tags">
            <van-tag plain round type="primary" v-for="el in tags" :key="el">{{el}}</van-tag>
        </p>
        <div class="ql-container ql-snow">
            <div class="ql-editor" v-html="form.新闻.内容"></div>
        </div>
        <ReturnBtn/>
        <ReturnTop/>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                form: {},
                active: 1,
                isLoad: false,
                tags: []
            };
        },
        mounted() {
            let id = this.$route.params.item.编号;
            this.getDetails(id);
        },
        methods: {
            getDetails(id) {
                let postData = {
                    新闻编号: id
                }
                this.$http.getNewsDetails(postData).then(res => {
                    let data = res.data;
                    if (data) {
                        this.form = data;
                        if (this.form.新闻.标签 && this.form.新闻.标签 != '') {
                            this.tags = this.form.新闻.标签.split(',')
                        }
                    }
                    this.isLoad = true;
                })
            },
        }
    };
</script>
<style lang="less" scoped type="text/less">
    .box {
        padding: 10px 20px;
        background-color: #fff;

        .title {
            font-size: 18px;
            text-align: center;
            margin: 10px 0;
        }

        .content {
            color: rgb(51, 51, 51);
            letter-spacing: 0;
            font-size: 13px;
            line-height: 25px;
        }

        .time {
            color: #999;
            font-size: 12px;
            text-align: center;
            margin: 8px 0;
        }

    }

    .NewsDetails {
        .tags {
            text-align: center;
            margin-top: 0px;
            margin-bottom: 10px;
        }

        .van-tag {
            margin: 3px;
            display: inline;
        }
    }

    .ql-editor {
        /deep/ img {
            max-width: 100%;
            height: auto !important;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 5px;
            margin-left: -5px;
        }

        /deep/ p {
            text-align: justify;
            font-size: 12px !important;

            span {
                text-indent: 2em;
                font-size: 13px !important;
            }
        }
    }

</style>
