<template>
    <div class="NewsDetails">
        <div class="content-box">
            <h4 class="title">{{item.标题}}</h4>
            <p class="tiem">{{item.建立时间}}</p>
            <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="item.内容">
                </div>
            </div>
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">关 闭</el-button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "NewsDetails",
        props: ['item'],
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            }
        }
    }
</script>
