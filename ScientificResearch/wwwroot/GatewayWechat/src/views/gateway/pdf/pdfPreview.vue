<template>
    <div class="page pinch-zoom-parent">
        <div class="pinch-zoom">
            <iframe style="width: 100%;height:1400px;" frameborder="0" scrolling="no"
                    :src="'pdf/web/viewer.html?file=' + encodeURIComponent(this.downUrl)"></iframe>
        </div>
    </div>
</template>

<script>
    export default {
        name: "padPreview",
        data() {
            return {
                downUrl: 'javascript:;'
            }
        },
        mounted() {
            this.downUrl = this.$route.query.url;
        },
    }
</script>
<style type="text/less" lang="less">
    .page.pinch-zoom-parent{
        z-index: 3333;
        position: relative;
    }
</style>
