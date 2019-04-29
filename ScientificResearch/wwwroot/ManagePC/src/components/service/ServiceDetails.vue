<template>
    <div class="serviceDetails">
        <el-form label-width="100px" size="small">
            <el-form-item label="服务名称：" prop="名称">
                <span>{{item.名称}}</span>
            </el-form-item>
            <el-form-item label="是否启用：" prop="是否启用">
                <template slot-scope="scope">
                    <el-switch class="switch" disabled="true"
                               style="display: block"
                               v-model="item.是否启用"
                               active-color="#13ce66"
                               inactive-color="#ff4949"
                               active-text="启用">
                    </el-switch>
                </template>
            </el-form-item>
            <el-form-item label="说明：" prop="备注">
                <span>{{item.备注}}</span>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">关 闭</el-button>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ServiceDetails",
        props: ['item'],
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            }
        }
    }
</script>

<style lang="less" type='text/less' scoped>
    .el-switch {
        padding-top: 5px;
    }
</style>
