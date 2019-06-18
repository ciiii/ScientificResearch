<template>
    <div class="box">
        <div class="title" v-html="this.list.标题" :class="{active:active==this.list.标题}"></div>
        <div class="time">
            分类：{{list.分类}} ；时间：{{list.建立时间}}
        </div>
        <div class="content" v-html="this.list.内容" :class="{active:active==this.list.内容}"></div>
        <ReturnBtn/>
        <ReturnTop/>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                list: [],
                active: 1
            };
        },
        mounted() {
            this.getDetails();
        },
        methods: {
            getDetails() {
                this.list = this.$route.params.item;
                console.log(this.$route.params.item)
            }
        }
    };
</script>
<style lang="less" scoped type="text/less">
    .box {
        padding: 10px 20px;
        background-color: #fff;

        .title {
            font-size: 18px;
            text-align: left;
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
            margin: 8px 0 10px;
        }

    }

    /deep/ img {
        max-width: 100%;
        height: auto !important;
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 5px;
        margin-left:-5px;
    }

    /deep/ p {
        text-align: justify;
        span {
            text-indent: 2em;
            font-size: 13px !important;
        }
    }
</style>
