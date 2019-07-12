<template>
    <div id="notFound">
        <div class="text-center col-sm-12">
            <!--<h1 align="center">404</h1>-->
            <!--<h4 align="center">Opps...page not found.</h4>-->
            <img src="@/assets/images/404.jpg" alt="">
        </div>
    </div>
</template>
<script>
    export default {
        name: 'NotFound'
    }
</script>

<style type="text/less" lang="less">
    #notFound {
        padding: 10em;
        z-index: 99;
        height: 500px;
        background: #FEA918;
        position: relative;
        width: 100%;
        height: 100vh;
        text-align: center;

        h1 {
            font-size: 70px;
        }

        h4 {
            font-size: 16px;
            color: #999;
        }

        img {
            margin: 10px auto;
            width: 158px;
            height: 235px;
        }

    }
</style>
