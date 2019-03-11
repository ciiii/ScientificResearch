<template>
    <div class="addNews">
        <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
            <el-form-item label="标题" prop="标题">
                <el-input v-model="form.标题"></el-input>
            </el-form-item>
            <el-form-item label="内容" prop="内容">
                <!--<VueQuilEditor ref="umeditor" :content="form.内容" @myContent="myContent"></VueQuilEditor>-->
                <tinymce id="tinymce" v-model="form.内容" :value="form.内容" ref="tm"></tinymce>
                <!--<tinymce2 id="tinymce" v-model="form.内容" ref="editor" @on-destroy="onEditorDestroy"></tinymce2>-->
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>

<script>
    import {HTTP_URL_HOST, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import VueQuilEditor from '../quilEditor/VueQuilEditor';
    import tinymce from '@/components/tinymce/Tinymce';
    // import tinymce2 from '@/components/tinymce/Tinymce2';
    import {_debounce} from "@/assets/js/Common";

    export default {
        name: "AddNews",
        props: ['item', 'isAdd'],
        components: {
            VueQuilEditor,
            tinymce,
            // tinymce2
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
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            myContent(data) {
                this.form.内容 = data;
            },
            confirmHandler: _debounce(function () {
                this.$refs.form.validate((valid) => {
                    if (valid) {
                        this.form.内容 = this.$refs.tm.getUEContent()
                        this.AddOrEdit();
                    } else {
                        this.$message.error('信息有误！');
                        return false;
                    }
                });
            }, 300),
            AddOrEdit: async function () {
                await this.$http.myPost(URL_NEWS.POST_ADD_OR_EDIT_NEWS, this.form);
                this.$message.success('提交成功！');
                this.$emit('myEvent', false);
            },
            onEditorDestroy(){
                console.info('2222')
            }
        }
    }
</script>

<style lang="less" type='text/less' scoped>
    .el-switch {
        padding-top: 5px;
    }
</style>
