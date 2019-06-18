<template>
    <footer class="footer_nav">
        <van-tabbar v-model="active" active-color="#1296db">
            <van-tabbar-item icon="home-o" to="/">首页</van-tabbar-item>
            <van-tabbar-item icon="hot-o" @click="clickZKNews('前沿')">前沿</van-tabbar-item>
            <van-tabbar-item icon="service-o" @click="clickZKNews('视听')">视听</van-tabbar-item>
            <van-tabbar-item icon="volume-o" @click="clickZKNews('公告')">公告</van-tabbar-item>
            <van-tabbar-item icon="user-o" to="/homePersonal">我的</van-tabbar-item>
        </van-tabbar>
        <div class="empty"></div>
    </footer>
</template>

<script>
    export default {
        data() {
            return {
                footerlist: [],
                active: 0
            };
        },
        mounted() {
        },

        methods: {
            clickZKNews(type) {
                this.$router.push({name: 'ZKMoreList', params: {type: type}})
            }
        }
    };
</script>

<style lang="less" scoped>
    .empty {
        height: 50px;
    }
</style>

