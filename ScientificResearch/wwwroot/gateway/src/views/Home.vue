<template>
    <div class="home">
        <IEunder10 v-if="isDownload"/>
        <HomeContent v-else/>
    </div>
</template>

<script>
    import HomeContent from '../views/HomeContent';
    import IeUnderTen from '../views/IeUnderTen';

    export default {
        name: 'home',
        components: {
            HomeContent,
            IeUnderTen
        },
        data() {
            return {
                isDownload: false
            }
        },
        mounted() {
            this.$nextTick(function () {
                if (this.IEVersion()) {
                    this.isDownload = true;
                }
            });
        },
        methods: {
            IEVersion: function () {
                let userAgent = navigator.userAgent;
                let isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;
                if (isIE) {
                    let reIE = new RegExp("MSIE (\\d+\\.\\d+);");
                    reIE.test(userAgent);
                    let fIEVersion = parseFloat(RegExp["$1"]);
                    if (fIEVersion < 10) {
                        return true;
                    }
                } else {
                    return false;
                }
            }
        },
    }
</script>
