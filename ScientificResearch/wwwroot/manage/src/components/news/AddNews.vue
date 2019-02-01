<template>
    <div class="addNews">
        <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
            <el-form-item label="标题" prop="标题">
                <el-input v-model="form.标题"></el-input>
            </el-form-item>
            <el-form-item label="内容" prop="内容">
                <VueQuilEditor ref="umeditor" :content="form.内容" @myContent="myContent"></VueQuilEditor>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>

<script>
    import {URL_NEWS} from "../../assets/js/connect/ConSysUrl";
    import VueQuilEditor from '../quilEditor/VueQuilEditor'

    export default {
        name: "AddNews",
        props: ['item', 'isAdd'],
        components: {
            VueQuilEditor
        },
        data() {
            return {
                form: {
                    编号: 0,
                    标题: '',
                    内容: '',
                },
                rules: {  //表单验证
                    标题: [
                        {required: true, message: '标题不能为空！', trigger: 'blur'}
                    ],
                    内容: [
                        {required: true, message: '内容不能为空！', trigger: 'blur'}
                    ],
                },
            }
        },
        mounted() {
            if (!this.isAdd) {
                this.form = this.item;
            }
            console.info('this.form');
            console.info(this.form);
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            myContent(data) {
                this.form.内容 = data;
            },
            confirmHandler :async function() {
                await this.$http.myPost(URL_NEWS.POST_ADD_OR_EDIT_NEWS, this.form);
                this.$message.success('提交成功！');
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
