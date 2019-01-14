<template>
    <div class="page-home page-common">
        <div class="top">
            <div class="wrapper">
                <div class="left">
                    <!--<img class="logo2" src="../assets/images/logo3.png" alt="数据库门户入口网站">-->
                    <span>LOGO 数据库门户入口网站</span>
                </div>
                <div class="right">
                    <router-link to="/login">
                        <a href="javascript:;">登录</a>
                    </router-link>
                    |
                    <router-link to="/about">
                        <a href="javascript:;"> 测试</a>
                    </router-link>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="banners">
                <el-carousel indicator-position="outside">
                    <el-carousel-item>
                        <img src="../assets/images/banner.jpg" alt="">
                    </el-carousel-item>
                    <el-carousel-item>
                        <img src="../assets/images/banner2.jpg" alt="">
                    </el-carousel-item>
                </el-carousel>
                <div class="search-box">
                    <ul>
                        <li :class="{ active: isActive==index }" v-for="(item, index)  in list" :key="index"
                            @click="clickLi(index)">
                            <a href="javascript:;">{{item}}</a>
                        </li>
                    </ul>
                    <div class="search">
                        <el-input type="text" placeholder="请输入内容" v-model="search"></el-input>
                        <el-button class="btn-search">检索</el-button>
                    </div>
                </div>
            </div>
            <div class="mian" :gutter="24">
                <el-row :gutter="21" class="items box">
                    <div class="wrapper">
                        <h4 class="title">数据库链接 Database Links</h4>
                        <el-col :span="8" class="item">
                            <div class="grid-content bg-purple">
                                <div class="item-header">
                                    <h5><i class="icon iconfont icon-shu2"></i> 文献数据库</h5>
                                    <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                        <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                    </el-tooltip>
                                </div>
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">中国知网CNKI</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">万方医学网中华医学会专区</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">本地Pubmed</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">中国生物医学文献服务系统</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">迈特思创</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </div>
                        </el-col>
                        <el-col :span="8" class="item">
                            <div class="grid-content bg-purple">
                                <div class="item-header">
                                    <h5><i class="icon iconfont icon-shipin-tianchong"></i> 视频资源</h5>
                                    <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                        <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                    </el-tooltip>
                                </div>
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">Visible Body说明 </span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">JoVE(实验视频期刊）</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </div>
                        </el-col>
                        <el-col :span="8" class="item">
                            <div class="grid-content bg-purple">
                                <div class="item-header">
                                    <h5><i class="icon iconfont icon-gengduoneirong"></i> 其他数据库</h5>
                                    <el-tooltip class="more item" effect="dark" content="更多" placement="top-start">
                                        <a href="javascript:;"><i class="icon iconfont icon-gengduo"></i></a>
                                    </el-tooltip>
                                </div>
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">CPSR功能介绍及说明</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">方正电子书</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </div>
                        </el-col>
                    </div>
                </el-row>
                <el-row :gutter="21" class="box items-bg">
                    <div class="wrapper">
                        <el-tabs type="border-card">
                            <el-tab-pane label="云中漫步" class="tab-one"><i
                                    class="icon iconfont icon-hangzhenggonggao"></i>
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">中国知网CNKI</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">万方医学网中华医学会专区</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">本地Pubmed</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">中国生物医学文献服务系统</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">迈特思创</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </el-tab-pane>
                            <el-tab-pane label="科研新闻" class="tab-two">
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">【普通通知】第一条通知</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">【普通通知】关于科研管理系统测试的通知</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">【公告】护理教育平台招标公告</span>
                                            <span class="time"><i class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">【公告】三基考试</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">【普通通知】国自然基金申请培训班</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </el-tab-pane>
                            <el-tab-pane label="考试公告" class="tab-three">
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">Visible Body说明 </span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">JoVE(实验视频期刊）</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </el-tab-pane>
                            <el-tab-pane label="其他公告" class="tab-four">
                                <ul class="list">
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">CPSR功能介绍及说明</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">
                                            <span class="btn-icon"><i
                                                    class="icon iconfont icon-yuandianxiao"></i></span>
                                            <span class="title">方正电子书</span>
                                            <span class="time">2018-08-29 17:56:05 <i
                                                    class="icon iconfont icon-right"></i></span></a>
                                    </li>
                                </ul>
                            </el-tab-pane>
                        </el-tabs>
                    </div>
                </el-row>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'home',
        data() {
            return {
                list: [
                    '知网CHKD',
                    '万方医学'
                ],
                isActive: 0,
                search: '',
            }
        },
        methods: {
            clickLi(index) {
                this.isActive = index;
            }
        }
    }
</script>
<style lang="less" type='text/less'>
    @import '../assets/less/common';

</style>
<style lang="less" type='text/less' scoped>
    @import '../assets/less/home';
</style>