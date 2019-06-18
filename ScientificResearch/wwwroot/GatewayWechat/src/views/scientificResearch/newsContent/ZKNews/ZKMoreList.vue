<template>
    <div>
        <van-pull-refresh v-model="isDownLoading" @refresh="onDownRefresh">
            <van-list
                    v-model="loading"
                    :finished="finished"
                    offset:10
                    finished-text="没有更多了"
                    @load="onLoad"
                    class="box"
            >
                <h3 v-if="!type">新闻 News</h3>
                <h3 v-else>{{type}} News</h3>
                <ul class="A_News" v-for="(item, key) in list" :key="key">
                    <li class="time">{{item.建立时间}}</li>
                    <li class="title" @click="newsDetails(item)">
                        <i class="icon iconfont icon-tongzhi"></i>
                        <p>{{item.标题}}</p>
                    </li>
                </ul>
            </van-list>
        </van-pull-refresh>
        <ReturnBtn/>
        <ReturnTop/>
    </div>
</template>
<script>
    export default {
        inject: ["reload"],
        data() {
            return {
                loading: false, //是否处于加载状态
                finished: false, //是否已加载完所有数据
                index: 1,
                size: 15,
                total: 0,
                isDownLoading: false,
                list: [],
                total: null,
                type: null
            };
        },
        mounted() {
            this.getType();
        },
        watch: {
            '$route': 'getType'
        },
        methods: {
            getType() {
                this.type = this.$route.params.type
                /*if (this.type) {
                    // this.$route.meta.title = this.type + '新闻';
                    console.info(111)
                    console.info(this.type)
                    console.info(this.$route.meta.title)
                } else {
                    this.$route.meta.title = '总库新闻'
                    console.info(222)
                    console.info(this.type)
                    console.info(this.$route.meta.title)
                }*/
            },
            onLoad() {
                var para = {
                    index: this.index,
                    size: this.size,
                    分类: this.type
                };
                this.$http.getNewsList(para).then(res => {
                    this.total = res.data.total;
                    const data = this.list;
                    this.list = data.concat(res.data.list);
                    this.loading = false;
                    this.index++;
                    if (this.list.length >= this.total) {
                        this.finished = true;
                    }
                });
            },
            onDownRefresh() {
                setTimeout(() => {
                    this.reload();
                    this.isDownLoading = false;
                }, 1000);
            },
            newsDetails(item) {
                this.$router.push({
                    path: "/ZKNewsDetails",
                    name: "ZKNewsDetails",
                    params: {
                        item
                    }
                });
            },
            // 截取时间
            startTime(item) {
                if (item != null) {
                    return item.slice(0, 10);
                }
            }
        }
    };
</script>
<style lang="less" scoped type="text/less">
    .box {
        background-color: #fff;

        h3 {
            text-align: left;
            font-size: 14px;
            padding: 10px;
            margin: 0 0 10px;
            color: #444;
            /*color: #1296db;*/
            background: #f5f5f5;
        }

        .A_News {
            border-bottom: 1px solid #ccc;
            padding: 10px 20px;
            display: flex;
            border: none;
            margin: 0 10px 10px;
            padding: 0;
            color: #333;

            .time {
                width: 75px;
                background: #7cb0ff;
                padding: 10px 0 0;
                color: #fff;
                height: 55px;
                text-align: center !important;
                line-height: 18px;
                box-sizing: border-box;
                margin-top: 0 !important;
                font-size: 12px;
            }

            .title {
                flex: 1;
                background: #f5f5f5;
                height: 55px;
                padding: 10px 5px 5px;
                margin-top: 0 !important;
                display: flex !important;
                box-sizing: border-box;
                max-height: 55px !important;

                i {
                    margin-right: 5px;
                    color: #7cb0ff;
                    padding-top: 1px;
                }

                p {
                    margin: 0 !important;
                    flex: 1 !important;
                    font-size: 12px;
                    display: -webkit-box !important;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    word-break: break-all;
                    -webkit-box-orient: vertical;
                    -webkit-line-clamp: 2;
                    text-align: left;
                }
            }
        }
    }
</style>
