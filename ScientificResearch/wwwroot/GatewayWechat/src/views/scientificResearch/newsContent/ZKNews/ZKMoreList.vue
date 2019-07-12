<template>
    <div v-if="isLoad">
        <div class="screen-box">
            <van-tabs v-model="active" @click="clickTab">
                <van-tab title="指南"></van-tab>
                <van-tab title="前沿"></van-tab>
            </van-tabs>
            <van-dropdown-menu>
                <van-dropdown-item v-model="req.Like标签" :options="tags" @change="changeTage"/>
            </van-dropdown-menu>
        </div>
        <van-pull-refresh v-model="isDownLoading" @refresh="onDownRefresh">
            <van-list
                    v-model="loading"
                    :finished="finished"
                    offset:500
                    finished-text="没有更多了"
                    loading-text="加载中..."
                    @load="onLoad"
                    class="box list"
            >
                <ul class="A_News ">
                    <li @click="newsDetails(item)" v-for="(item, key) in list" :key="key">
                        <p class="title">{{item.标题}}</p>
                        <p class="type">【新闻类型】{{item.新闻分类名称}}</p>
                        <p class="time">【发表时间】{{item.建立时间}}</p>
                        <p class="tags">
                            <van-tag plain round type="primary" v-for="el in item.tags" :key="el">{{el}}</van-tag>
                        </p>
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
                finished: false, //是否已加载完所有数据,
                req: {
                    Index: 1,
                    Size: 10,
                    新闻分类编号: null,
                    Like标题: '',
                    Like标签: ''
                },
                total: 0,
                isDownLoading: false,
                isLoad: false,
                list: [],
                type: null,
                types: [],
                tags: [],
                active: null
            };
        },
        created() {
            this.type = this.$route.query.type;
            if (!this.type || this.type == 1) {
                this.active = 0;
                this.req.新闻分类编号 = 1
            } else {
                this.active = 1
                this.req.新闻分类编号 = 2
            }
            this.getNewsTags(this.req.新闻分类编号);
            this.isLoad = true;
        },
        methods: {
            onSearch() {
                this.req.Index = 1;
                this.finished = false;
                this.loading = true;
                this.backTop();
                this.list = [];
                this.getList();
            },
            onLoad() {
                this.getList();
            },
            getNewsTags(id) {
                let postData = {
                    新闻分类编号: id
                }
                this.$http.getNewsTags(postData).then(res => {
                    if (res.data.length > 0) {
                        this.tags = [];
                        this.tags.push({text: '全部标签', value: ''});
                        res.data.forEach((item) => {
                            let data = {
                                text: item.名称,
                                value: item.名称
                            }
                            this.tags.push(data)
                        })
                    } else {
                        this.tags = [];
                        this.tags.push({text: '全部标签', value: ''});
                    }
                })
            },
            getList() {
                this.$http.getNewsList(this.req).then(res => {
                    this.total = res.data.total;
                    let data = res.data.list;
                    if (data && data != []) {
                        if (Array.isArray(data)) {
                            this.req.Index++;
                            if (data.length < this.req.Index) {
                                this.finished = true;
                            }
                            data.forEach((item) => {
                                if (item.标签 && item.标签 != '') {
                                    item.tags = item.标签.split(',')
                                }
                            })
                            this.list = this.list.concat(data);
                        } else {
                            this.finished = true;
                            this.list = [];
                        }
                    } else {
                        this.finished = true;
                        this.list = [];
                    }
                    this.isDownLoading = false;
                    this.loading = false;
                });
            },
            clickTab(index, title) {
                if (title == '指南') {
                    this.req.新闻分类编号 = 1;

                } else {
                    this.req.新闻分类编号 = 2;
                    this.req.Like标签 = '';
                }
                this.getNewsTags(this.req.新闻分类编号);
                this.onSearch();
            },
            changeTage() {
                this.onSearch();
            },
            onDownRefresh() {
                this.reload()
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
            },
            backTop() {
                document.documentElement.scrollTop = 0;
                document.body.scrollTop = 0;
            },
        }
    };
</script>
<style lang="less" type="text/less">
    .screen-box {
        .van-dropdown-menu {
            height: 40px;
        }

        .van-dropdown-menu__item {
            .van-dropdown-menu__title {
                font-size: 13px;
                color: #333;
            }
        }

        .van-popup {
            overflow: hidden;
            height: 350px;
            overflow-y: auto;
        }

        .van-cell {
            width: 50%;
            float: left;
            text-align: left;
        }
    }

</style>
<style lang="less" scoped type="text/less">
    .van-pull-refresh {
        margin-top: 95px;
    }

    .screen-box {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        z-index: 999;

        .van-tabs__content {
            z-index: 2002;
            position: absolute;
            width: 100%;
        }

        .van-collapse {
            display: flex;
        }

        .van-collapse-item {
            flex: 1;
            font-size: 14px;
        }

        .van-tab {
            .active {
                .van-icon {
                    transform: rotate(180deg);
                    transition: 0.5s;
                }
            }

            .van-icon {
                font-size: 14px;
            }
        }
    }

    .list {
        text-align: left;

        h3 {
            text-align: left;
            font-size: 14px;
            padding: 10px;
            margin: 0 0 10px;
            color: #444;
            background: #f5f5f5;
        }

        .van-cell {
            margin-bottom: 5px;
            font-size: 14px;
            border: 1px solid #ddd;
        }

        li {
            margin-bottom: 10px;
            font-size: 12px;
            box-shadow: 1px 3px 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            background: #fff;

            p {
                margin-top: 0;
                margin-bottom: 5px;
            }

            .title {
                font-size: 14px;
                font-weight: bold;
                margin-bottom: 10px;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                color: #333;
            }

            .time, .type {
                color: #666;
                overflow: hidden;
                white-space: nowrap;
                text-overflow: ellipsis;
                font-size: 12px;
            }

            .tags {
                padding-left: 3px;

                .van-tag {
                    margin: 3px;
                }
            }
        }
    }
</style>
