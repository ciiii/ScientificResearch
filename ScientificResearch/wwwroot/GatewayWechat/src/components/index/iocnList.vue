<template>
    <div>
        <ul>
            <li v-for="(item,index) in iocnList" :key="index">
                <a @click="path(item)" href="javascript:;">
                    <img :src="url+ item.Logo">
                    <p>{{item.名称}}</p>
                </a>
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                iocnList: [],
                url:
                    process.env.NODE_ENV === "development"
                        ? "http://192.168.0.99:63739"
                        : ""
            };
        },
        mounted() {
            this.login();
            // let urlNow = encodeURIComponent("http://192.168.0.157:8080/login?name=ScientificResearch_Test");
            // console.log(urlNow,"eee")
            // let urlNow = encodeURIComponent("http://192.168.0.157:8080/#/");
            // console.log(urlNow,"eee")
        },
        methods: {
            getUrlKey(name) {
                //获取url 参数
                return (
                    decodeURIComponent(
                        (new RegExp("[?|&]" + name + "=" + "([^&;]+?)(&|#|;|$)").exec(
                            location.href
                        ) || [, ""])[1].replace(/\+/g, "%20")
                    ) || null
                );
            },
            async login() {
                //本地存储
                let personnel = JSON.parse(localStorage.getItem("personnel"));
                let flag = this.$route.params.item;
                // 如果没有flag
                if (flag == undefined) {
                    //如果没有本地储存
                    if (!personnel) {
                        let code = this.getUrlKey("code");
                        let res = await this.$http.LoginWithOpenId(code);
                        //如果有绑定的
                        // if (res.data)
                        if (res != undefined) {
                            localStorage.personnel = JSON.stringify(res.data.人员);
                            localStorage.token = `${res.data.token_type} ${
                                res.data.access_token
                                }`;
                            this.$emit("getPersonnel");
                            this.$emit("getKYNews");
                        }
                        // 取医院服务列表
                        let returnOfGetServiceList = await this.$http.getServiceList({
                            医院名称: !!res ? res.data.人员.DbKey : ""
                        });
                        this.iocnList = returnOfGetServiceList.data;
                    }
                    //如果有本地存储
                    else {
                        var para = {
                            医院名称: personnel.DbKey
                        };
                        let res = await this.$http.getServiceList(para);
                        this.iocnList = res.data;
                        this.$emit("getPersonnel");
                        this.$emit("getKYNews");
                    }
                } else {
                    let returnOfGetServiceList = await this.$http.getServiceList({
                        医院名称: ""
                    });
                    this.iocnList = returnOfGetServiceList.data;
                }
            },
            path(item) {
                if (item.手机链接地址 && item.手机链接地址.indexOf('http') == 0) {
                    if (item.手机链接地址.indexOf('aiyisheng.com/Login') > -1) {
                        this.logoinServe(item.手机链接地址)
                    } else {
                        window.location = item.手机链接地址;
                    }
                } else {
                    if (item.手机链接地址 === null) {
                        this.$toast({
                            duration: 2000,
                            message: "你还没有权限，请先联系医院管理员!"
                        });
                    } else {
                        this.$router.push({
                            path: item.手机链接地址,
                            query: {
                                accountId: item.编号
                            }
                        });
                    }
                }
            },
            logoinServe: async function (url) {
                let postData = {
                    loginType: 'UPTODATE/'
                }
                let data = await this.$myHttp.myPostServe(url, postData);
                window.location = data.url;
            },
        }
    };
</script>
<style lang="less" scoped type="text/less">
    ul {
        display: flex;
        flex-wrap: wrap;
        padding: 8px;

        li {
            width: 20%;
            padding: 10px 0;

            img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
            }

            p {
                margin: 0;
                font-size: 11px;
                color: #333;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }

        }
    }
</style>
