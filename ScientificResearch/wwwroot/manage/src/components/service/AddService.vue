<template>
    <div class="addService">
        <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
            <el-form-item label="服务名称" prop="名称">
                <el-input v-model="form.名称" maxLength="200"></el-input>
            </el-form-item>
            <el-form-item label="是否启用" prop="是否启用">
                <template slot-scope="scope">
                    <el-switch class="switch"
                               style="display: block"
                               v-model="form.是否启用"
                               active-color="#13ce66"
                               inactive-color="#ff4949"
                               @change="switchChange(form.是否启用)"
                               active-text="启用">
                    </el-switch>
                </template>
            </el-form-item>
            <el-form-item label="说明" prop="备注">
                <el-input v-model="form.备注" type="textarea" :rows="5" maxLength="2000"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>

<script>
    import {validateChineseEnglish} from "../../assets/js/Validate";
    import {URL_SERVICE} from "../../assets/js/connect/ConSysUrl";
    import {_debounce} from "@/assets/js/Common";

    export default {
        name: "AddService",
        props: ['item', 'isAddDialog', 'isAdd', 'getService'],
        data() {
            return {
                form: {
                    编号: 0,
                    名称: '',
                    是否启用: true,
                    备注: ''
                },
                rules: {  //表单验证
                    名称: [
                        {required: true, message: '名称只能为中文或英文！', trigger: 'blur', validator: validateChineseEnglish}
                    ],
                }
            }
        },
        mounted() {
            if (!this.isAdd) {
                this.form = this.item;
            }
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            switchChange(el) {
                console.info(el);
            },
            confirmHandler: _debounce(function () {
                this.$refs.form.validate((valid) => {
                    if (valid) {
                        this.AddOrEdit();
                    } else {
                        this.$message.error('信息有误！');
                        return false;
                    }
                });
            }, 300),
            AddOrEdit: async function () {
                await this.$http.myPost(URL_SERVICE.POST_ADD_OR_EDIT_SERVICE, this.form);
                this.$message.success('提交成功！');
                this.$emit('myEvent', false);
            },

        }
    }
</script>

<style lang="less" type='text/less' scoped>
    .el-switch {
        padding-top: 5px;
    }
</style>
