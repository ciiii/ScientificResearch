<template>
    <div class="edit_container">
        <div v-loading="imageLoading"
             element-loading-text="请稍等，图片上传中">
            <quill-editor ref="myQuillEditor" v-model="content" :options="editorOption"
                          @change="onEditorChange($event)"></quill-editor>
            <el-upload style="display:none" :action="serverUrl" :show-file-list="false"
                       :before-upload='newEditorbeforeupload' :on-success='handleSingleSuccess' :headers="Authorization"
                       ref="uniqueId" id="uniqueId">
            </el-upload>
        </div>
    </div>
</template>

<script>
    import {Quill,quillEditor} from "vue-quill-editor"; //调用编辑器
    import {addQuillTitle} from "../../assets/js/QuillTitle";
    import 'quill/dist/quill.core.css';
    import 'quill/dist/quill.snow.css';
    import 'quill/dist/quill.bubble.css';
    import {HTTP_URL_HOST, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import {getUrl} from "@/assets/js/Common";

    const toolbarOptions = [
        ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
        ['blockquote', 'code-block'],

        [{'header': 1}, {'header': 2}],               // custom button values
        [{'list': 'ordered'}, {'list': 'bullet'}],
        [{'script': 'sub'}, {'script': 'super'}],      // superscript/subscript
        [{'indent': '-1'}, {'indent': '+1'}],          // outdent/indent
        [{'direction': 'rtl'}],                         // text direction

        [{'size': ['12px', '14px', '16px', '18px', '20px']}],  // custom dropdown
        [{'header': [1, 2, 3, 4, 5, 6, false]}],

        [{'color': []}, {'background': []}],          // dropdown with defaults from theme
        [{'font': ['SimSun', 'SimHei', 'Microsoft-YaHei', 'KaiTi', 'FangSong', 'Arial', 'Times-New-Roman', 'sans-serif']}],
        [{'align': []}],
        ['link', 'image', 'video'],
        ['clean']                                         // remove formatting button
    ]
    // 自定义字体大小
    let Size = Quill.import('attributors/style/size');
    Size.whitelist = ['12px', '14px', '16px', '18px', '20px'];
    Quill.register(Size, true);

    // 自定义字体类型
    let fonts = ['SimSun', 'SimHei', 'Microsoft-YaHei', 'KaiTi', 'FangSong', 'Arial', 'Times-New-Roman', 'sans-serif']
    let Font = Quill.import('formats/font')
    Font.whitelist = fonts // 将字体加入到白名单
    Quill.register(Font, true)

    export default {
        components: {
            quillEditor,
        },
        props: ['content'],
        data() {
            return {
                Authorization: {
                    Authorization: sessionStorage.getItem('Authorization')
                },
                serverUrl: getUrl(HTTP_URL_HOST + URL_NEWS.POST_UPLOAD_NEWS_IMG),
                imageLoading: false,
                editorOption: {
                    modules: {
                        toolbar: {
                            container: toolbarOptions,
                            handlers: {
                                'image': function (value) {
                                    if (value) {
                                        let fileInput = document.querySelector('#uniqueId  input') //隐藏的file元素
                                        fileInput.click() //触发事件
                                    } else {
                                        this.quill.format('image', false);
                                    }
                                }
                            }
                        }
                    },
                }
            }
        },
        mounted(){
            addQuillTitle();
        },
        methods: {
            onEditorChange({editor, html, text}) {// 内容改变事件
                this.$emit('myContent', html);
            },
            handleSingleSuccess(res) {
                let quill = this.$refs.myQuillEditor.quill
                if (res) {
                    // 获取光标所在位置
                    let length = quill.getSelection().index;
                    quill.insertEmbed(length, 'image', HTTP_URL_HOST + res.data[0])
                    // 调整光标到最后
                    quill.setSelection(length + 1)
                } else {
                    this.$message.error('图片插入失败!');
                }
                this.imageLoading = false
            },
            newEditorbeforeupload(file) {
                const isJPG = file.type === 'image/jpeg' || file.type === 'image/png';
                const isLt2M = file.size / 1024 / 1024 < 2;
                if (!isJPG) {
                    this.$message.error('上传图片只能是 JPG或PNG 格式!');
                }
                if (!isLt2M) {
                    this.$message.error('上传图片大小不能超过 2MB!');
                }
                if (isJPG && isLt2M) this.imageLoading = true
                return isJPG && isLt2M;
            },
            handleFormatError() {
                this.$message.error('图片插入失败!');
            },
        },
        computed: {
            editor() {
                return this.$refs.myQuillEditor.quill;
            },
        }
    }
</script>

<style scoped>
    .ivu-upload {
        display: none;
    }
</style>
