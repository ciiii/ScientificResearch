<template>
    <div class="addHospital">
        <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
            <el-form-item label="医院名称" prop="名称">
                <el-input v-model="form.名称"></el-input>
            </el-form-item>
            <el-form-item label="代码(简称)" prop="代码">
                <template slot-scope="scope">
                    <el-popover
                            placement="top-start"
                            title="代码（即名称简称）"
                            width="300"
                            trigger="hover">
                        <el-input v-model="form.代码" slot="reference"></el-input>
                        <p>
                            这个代码会作为分库的登录地址，需认真填写。例如：代码为：'test'，即登录地址为：'login_test.html'
                        </p>
                    </el-popover>
                </template>
            </el-form-item>
            <el-form-item label="联系人" prop="联系人">
                <el-input v-model="form.联系人"></el-input>
            </el-form-item>
            <el-form-item label="联系电话" prop="联系电话">
                <el-input v-model="form.联系电话"></el-input>
            </el-form-item>
            <el-form-item label="地址" prop="地址">
                <el-input v-model="form.地址"></el-input>
            </el-form-item>
            <el-form-item label="是否启用" prop="是否启用">
                <template slot-scope="scope">
                    <el-switch class="switch"
                               style="display: block"
                               v-model="form.是否启用"
                               active-color="#13ce66"
                               inactive-color="#ff4949"
                               active-text="启用">
                    </el-switch>
                </template>
            </el-form-item>
            <el-form-item label="备注" prop="备注">
                <el-input v-model="form.备注" type="textarea" :rows="3"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>

<script>
    import {validateNumberLetter,validateChineseEnglish} from "@/assets/js/Validate";
    import {Hospital} from "@/assets/js/connect/ReturnData";

    export default {
        name: "AddHospital",
        props: ['data', 'isAdd'],
        data() {
            return {
                form: {
                    编号: 0,
                    名称: '',
                    代码: '',
                    联系人: '',
                    联系电话: '',
                    地址: '',
                    是否启用: true,
                    备注: ''
                },
                rules: {  //表单验证
                    名称: [
                        {required: true, message: '名称只能为中文或英文！', trigger: 'blur',validator: validateChineseEnglish}
                    ],
                    代码: [
                        {required: true, message: '代码只能是英文或数字！', trigger: 'blur'}, {validator: validateNumberLetter}
                    ],
                },
                msg: 'eeee',
            }
        },
        mounted() {
            if (!this.isAdd) {
                this.form = this.data;
            }
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            confirmHandler() {
                Hospital.addOrEditHospital('post', this.form, (success, strErro, obj) => {
                    if (success) {
                        this.$message.success('添加成功！');
                        this.$emit('myEvent', false);
                    }
                });
            }
        }
    }
</script>

<style lang="less" type='text/less' scoped>
    .el-switch {
        padding-top: 5px;
    }
</style>
