<template>
    <div>
        <div class="nav">
            <!-- <img src="@/assets/images/iocn/logo.png" alt="科研logo"> -->
            <img v-if="this.Logo!=null" :src="url+this.Logo">
            <img v-else :src="this.defaultImg">
            <!-- <span @click="toLogin" v-if="!personnel">登 录</span> -->
        </div>
        <van-pull-refresh v-model="isDownLoading" @refresh="onDownRefresh">
            <div class="section">
                <swipe/>
                <div class="listBox">
                    <iocnList @getKYNews="getKYNews" @getPersonnel="getPersonnel"/>
                </div>
                <div class="A_News_box News_box">
                    <div class="newsTitle">
                        <h3>新闻 News</h3>
                        <span @click="ZKMore">更多<i class="icon iconfont icon-you"></i></span>
                    </div>
                    <ul class="A_News" v-for="(item, key) in list" :key="key" @click="ZKNewsDetails(item)">
                        <li class="time">{{item.建立时间}}</li>
                        <li class="title">
                            <i class="icon iconfont icon-tongzhi"></i>
                            <p>{{item.标题}}</p>
                        </li>
                    </ul>
                </div>
                <div v-show="isShow" class="A_News_box News_box">
                    <div class="newsTitle">
                        <h3>科研新闻</h3>
                        <span @click="KYmore">更多<i class="icon iconfont icon-you"></i></span>
                    </div>
                    <ul class="A_News" v-for="(item, key) in KYList" :key="key" @click="KYNewsDetails(item.编号)">
                        <li class="time">
                            {{startTime(item.建立时间)}}
                            <p>({{item.通知类型}})</p>
                        </li>
                        <li class="title">
                            <i class="icon iconfont icon-tongzhi"></i>
                            <p>{{item.通知名称}}</p>
                        </li>
                    </ul>
                </div>
            </div>
        </van-pull-refresh>
        <HomeFooter/>
    </div>
</template>
<script>
    import swipe from "@/components/index/swipe";
    import iocnList from "@/components/index/iocnList";
    import HomeFooter from "@/components/footer/homeFooter";

    export default {
        name: "home",
        inject: ["reload"],
        components: {
            swipe,
            iocnList,
            HomeFooter
        },
        data() {
            return {
                isDownLoading: false, //控制下拉刷新的加载动画
                list: [],
                index: 1,
                size: 3,
                total: 0,
                KYList: [],
                isShow: false,
                personnel: null,
                url:
                    process.env.NODE_ENV === "development"
                        ? "http://192.168.0.99:63739"
                        : "",
                Logo: null,
                HospitalInformation: JSON.parse(
                    localStorage.getItem("HospitalInformation")
                ),
                defaultImg: require("@/assets/images/iocn/logo.png")
            };
        },
        created() {
            if (localStorage.HospitalInformation) {
                this.Logo = this.HospitalInformation.Logo;
            }
        },
        mounted() {
            this.getPrimaryNews();
        },
        methods: {
            // 获取医院信息
            async getLogo(personnel) {
                console.info(5655)
                let para = {
                    k: personnel.DbKey
                };
                let res = await this.$http.getHospitalInformation(para);
                this.Logo = res.data.Logo;
                localStorage.HospitalInformation = JSON.stringify(res.data);
            },
            getPersonnel() {
                this.personnel = JSON.parse(localStorage.getItem("personnel"));
                if (!localStorage.HospitalInformation) {
                    this.getLogo(this.personnel);
                }
            },
            getPrimaryNews() {
                var para = {
                    index: this.index,
                    size: this.size
                };
                this.$http.getNewsList(para).then(res => {
                    this.list = res.data.list;
                    this.total = res.data.total;
                });
            },
            getKYNews() {
                var code = JSON.parse(localStorage.getItem("personnel"));
                var para = {
                    人员编号: code.编号,
                    index: this.index,
                    size: this.size
                };
                this.$http.getToViewNewsList(para).then(res => {
                    this.KYList = res.data.list;
                    if (res.data.list.length != 0) {
                        this.isShow = true;
                    }
                });
            },

            ZKNewsDetails(item) {
                this.$router.push({
                    path: "/ZKNewsDetails",
                    name: "ZKNewsDetails",
                    params: {
                        item
                    }
                });
            },
            ZKMore() {
                this.$router.push("/ZKMoreList");
            },
            KYNewsDetails(item) {
                this.$router.push({
                    path: "/KYNewsDetails",
                    name: "KYNewsDetails",
                    params: {
                        item
                    }
                });
            },
            KYmore() {
                this.$router.push("/KYMoreList");
            },
            // 下拉刷新
            onDownRefresh() {
                setTimeout(() => {
                    this.reload();
                    this.isLoading = false;
                }, 500);
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
    @background-color: #f4f8fb;
    @ContentColor: #fff;
    .nav {
        background-color: #fff;

        img {
            height: 30px;
            padding: 15px 0 10px;
        }

        span {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 16px;
            color: #a3a3a3;
        }
    }

    .section {
        background-color: @background-color;
    }

    .listBox {
        background-color: @ContentColor;
        margin-top: 10px;

        ul {
            display: flex;
            flex-wrap: wrap;
            padding: 8px;

            li {
                width: 25%;
                padding: 10px 0;

                img {
                    width: 40px;
                    height: 40px;
                }

                p {
                    margin: 0;
                    font-size: 14px;
                    color: #000;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: nowrap;
                    //   width:80px;
                }
            }
        }
    }

    .A_News_box {
        margin-top: 10px;
        background-color: @ContentColor;
        padding: 8px;

        .newsTitle {
            display: flex;
            justify-content: space-between;
            background-color: #f5f5f5;

            h3 {
                font-size: 14px;
                text-align: left;
                padding: 10px;
                margin: 0;
                color: #444;
            }

            span {
                font-size: 12px;
                display: flex;
                color: #666;
                align-items: center;

                i {
                    font-size: 12px;
                }
            }
        }

        .A_News {
            border-bottom: 1px solid #ddd;
            padding: 8px;
            margin: 10px 0;

            li {
                overflow: hidden;
                -webkit-line-clamp: 2;
                text-overflow: ellipsis;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                margin-top: 10px;
                font-size: 12px;
                text-align: left;

                p {
                    font-size: 13px;
                    font-weight: 400;
                    margin: 0;
                    line-height: 1.6;
                    text-align: left;
                    color: #333;
                }

                span {
                    font-size: 12px;
                    font-weight: 800;
                    color: #ff976a;
                    margin: 0 5px;
                }
            }
        }
    }

    .News_box {
        .A_News {
            display: flex;
            border: none;
            margin-bottom: 0;
            padding: 0;

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

                p {
                    text-align: center;
                    color: #fff;
                    font-size: 12px;
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
                    color: #333;
                }
            }
        }
    }
</style>
