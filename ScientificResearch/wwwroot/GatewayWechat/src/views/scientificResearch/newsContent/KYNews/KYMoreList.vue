<template>
    <div>
        <van-pull-refresh v-model="isDownLoading" @refresh="onDownRefresh">
            <van-list
                    v-model="loading"
                    :finished="finished"
                    finished-text="没有更多了"
                    @load="onLoad"
                    class="box">
                <h3>科研新闻</h3>
                <ul class="A_News" v-for="(item, key) in list" :key="key" @click="newsDetails(item.编号)">
                    <li class="time">
                        {{startTime(item.建立时间)}}
                        <p>({{item.通知类型}})</p>
                    </li>
                    <li class="title">
                        <i class="icon iconfont icon-tongzhi"></i>
                        <p>{{item.通知名称}}</p>
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
                total: null
            };
        },
        methods: {
            onLoad() {
                var code = JSON.parse(localStorage.getItem("personnel"));
                var para = {
                    人员编号: code.编号,
                    index: this.index,
                    size: this.size
                };
                this.$http.getToViewNewsList(para).then(res => {
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
                    path: "/KYNewsDetails",
                    name: "KYNewsDetails",
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
    }

    h3 {
        text-align: left;
        font-size: 14px;
        padding: 10px 20px;
        margin: 0;
        /*color: #1296db;*/
        /*background-color: #e7e7e7;*/
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
            p{
                margin-top: 0;
            }
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
</style>
