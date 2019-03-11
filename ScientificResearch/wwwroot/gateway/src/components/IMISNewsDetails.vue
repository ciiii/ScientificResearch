<template>
    <div class="NewsDetails">
        <div class="content-box">
            <el-tabs type="border-card" :active-name="activeName">
                <el-tab-pane label="新闻内容" name="tab-content">

                    <h4 class="title">{{item.标题}}</h4>
                    <p class="tiem">{{item.建立时间}}</p>
                    <div class="ql-container ql-snow">
                        <div class="ql-editor" v-html="item.内容">
                        </div>
                    </div>

                </el-tab-pane>
                <el-tab-pane label="基本信息" name="tab-info">

                </el-tab-pane>
            </el-tabs>
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
        data() {
            return {
                activeName: 'tab-content'
            }
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            }
        }
    }
</script>
