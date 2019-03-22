<template>
    <div class="NewsDetails">
        <div class="content-box">
            <h4 class="title">{{item.标题}}</h4>
            <p class="time"><span v-if="!isShow">【{{item.发布人}}】 </span>{{item.建立时间}}</p>
            <div class="ql-container ql-snow">
                <div class="ql-editor" v-html="item.内容"></div>
                <div class="file-list" v-if="!isShow&&item.文件!=''">
                    <label>附件：</label>
                    <ul>
                        <li v-for="el in item.文件"><a :href="item.文件" download="">{{getHtmlDocName(el)}}</a></li>
                    </ul>
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
        props: ['item', 'isShow'],
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            getHtmlDocName: function (url) {
                let arr = url.split('\\');
                return arr[arr.length - 1];
            },
        }
    }
</script>
