<template>
    <div class="addNews">
        <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small" v-if="isLoad">
            <el-form-item label="标题" prop="Model.标题" class="el-form-item-block">
                <el-input v-model="form.Model.标题"></el-input>
            </el-form-item>
            <el-form-item label="分类" prop="Model.新闻分类编号">
                <el-select v-model="form.Model.新闻分类编号" placeholder="请选择" @change="changeType">
                    <el-option v-for="item in types" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="标签" class="el-form-item-title">
                <el-select v-model="newTags" multiple placeholder="请选择(多个)">
                    <el-option
                            v-for="item in tags"
                            :key="item.编号"
                            :label="item.名称"
                            :value="item.编号">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item label="内容" prop="Model.内容" class="el-form-item-block">
                <!--<VueQuilEditor ref="umeditor" :content="form.内容" @myContent="myContent"></VueQuilEditor>-->

                <template>
                    <tinymce id="tinymce" v-model="form.Model.内容" :value="form.Model.内容" ref="tm"></tinymce>
                </template>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button @click="cancelHandler">取 消</el-button>
            <el-button type="primary" @click="confirmHandler">确 定</el-button>
        </div>
    </div>
</template>
<script src="https://cdn.bootcss.com/tinymce/4.7.4/tinymce.min.js"></script>
<script>
    import {HTTP_URL_HOST, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import VueQuilEditor from '../quilEditor/VueQuilEditor';
    import tinymce from '@/components/tinymce/Tinymce';
    import {_debounce, deepCopy, formatDate} from "@/assets/js/Common";

    export default {
        name: "AddNews",
        props: ['item', 'isAdd', 'types'],
        components: {
            VueQuilEditor,
            tinymce,
        },
        data() {
            return {
                form: {
                    Model: {
                        编号: 0,
                        标题: '',
                        新闻分类编号: '',
                        内容: '',
                        建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
                    },
                    List: []
                },
                rules: {  //表单验证
                    标题: [
                        {required: true, message: '标题不能为空！', trigger: 'blur'}
                    ],
                    新闻分类编号: [
                        {required: true, message: '请选择新闻分类！', trigger: 'blur'}
                    ],
                    内容: [
                        {required: true, message: '内容不能为空！', trigger: 'blur'}
                    ],
                },
                newTags: [],
                tags: [],
                isLoad: false
            }
        },
        mounted() {
            if (!this.isAdd) {
                this.getDetails(this.item.编号)
            } else {
                this.isLoad = true
            }
        },
        methods: {
            cancelHandler() {
                this.$emit('myEvent', false);
            },
            changeType(id) {
                this.getTags(id);
            },
            getTags: async function (id) {
                let postData = {
                    新闻分类编号: id
                }
                let data = await this.$http.myGet(URL_NEWS.GET_NEWS_TAGS, postData);
                if (data && data.length > 0) {
                    this.tags = data;
                } else {
                    this.tags = []
                }
            },
            getDetails: async function (id) {
                let postData = {
                    新闻编号: id
                }
                let data = await this.$http.myGet(URL_NEWS.GET_NEWS_DETAILS, postData);
                if (data) {
                    this.form.Model = data.新闻;
                    this.getTags(this.form.Model.新闻分类编号);
                    this.newTags = [];
                    data.标签.forEach((item) => {
                        this.newTags.push(item.标签编号);
                    })
                }
                this.isLoad = true
            },
            myContent(data) {
                this.form.Model.内容 = data;
            },
            confirmHandler: _debounce(function () {
                this.$refs.form.validate((valid) => {
                    if (valid) {
                        this.form.Model.内容 = this.$refs.tm.getContent();
                        this.form.List = this.newTags;
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
            onEditorDestroy() {
                console.info('2222')
            }
        }
    }
</script>

<style lang="less" type='text/less' scoped>
    @import "../../assets/less/Variable.less";

    .el-switch {
        padding-top: 5px;
    }

    .addNews {
        .el-form-item {
            width: 40%;
            display: inline-block;
        }

        .el-form-item-title {
            width: 60%;
        }

        .el-form-item-block {
            width: 100%;
        }
    }
</style>
