<template>
    <div class="UE">
        <div id="ueditor" ref="myEditor" @change="onEditorChange($event)" v-model="content" type="text/plain" style="width:100%;height:120px;"></div>
    </div>
</template>

<script src="/public/ueditor/ueditor.config.js"></script>
<script src="/public/ueditor/ueditor.all.min.js"></script>
<script src="/public/ueditor/lang/zh-cn/zh-cn.js"></script>
<script src="/public/ueditor/ueditor.parse.min.js"></script>

<script>
    /*import '../../assets/libs/ueditor/ueditor.config.js';
    import '../../assets/libs/ueditor/ueditor.all.min.js';
    import '../../assets/libs/ueditor/lang/zh-cn/zh-cn';*/
    import {HTTP_URL_HOST,URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    // import '../../assets/libs/ueditor/ueditor.parse.js';
    export default {
        // components: {
        //     quillEditor,
        // },
        props: ['content'],
        data() {
            return {
                /*Authorization: {
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
                }*/
                ue: null,
            }
        },
        mounted(){
            /*// 实例化editor编辑器
            this.editor = window.UE.getEditor("editor");
            //设置编辑器默认内容
            this.editor.addListener('ready', () => {
                this.editor.setContent(this.value)
            })*/
            this.ue = UE.getEditor('ueditor',{
                // BaseUrl: '',
                // UEDITOR_HOME_URL: HTTP_URL_HOST + URL_NEWS.POST_UPLOAD_NEWS_IMG,
                toolbars: [
                    ['fullscreen', 'source', 'undo', 'redo'],
                    ['bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc']
                ]
            })
        },
        methods: {
            /*onEditorChange({editor, html, text}) {// 内容改变事件
                this.$emit('myContent', html);
            },
            //获取编辑器中的内容
            getUEContent () {
                return this.editor.getContent()
            },*/
            save(){
                let ueditordata = UE.getEditor('ueditor').getContent();
                Event.$emit('seted', ueditordata);
            }
        },
        destroyed() {
            // 将editor进行销毁
            this.ue.destroy();
        },
        /*computed: {
            editor() {
                return this.$refs.myEditor.quill;
            },
        }*/
    }
</script>

<style scoped>
    .ivu-upload {
        display: none;
    }
</style>
