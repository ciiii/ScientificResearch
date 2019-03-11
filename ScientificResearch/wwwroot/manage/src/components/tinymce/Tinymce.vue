<template>
    <div>
        <textarea :id='id' v-model='content'></textarea>
    </div>
</template>
<script>
    import {HTTP_URL_HOST, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import tinymce from 'tinymce/tinymce';
    import 'tinymce/themes/modern/theme';
    import 'tinymce/langs/zh_CN';

    export default {
        name: "Tinymce",
        props: {
            id: {
                type: String,
                required: true
            },
            htmlClass: {default: '', type: String},
            value: {default: ''},
            plugins: {
                default: function () {
                    return [
                        'advlist autolink lists link image charmap print preview hr anchor pagebreak',
                        'searchreplace wordcount visualblocks visualchars code fullscreen',
                        'insertdatetime media nonbreaking save table contextmenu directionality',
                        'template paste textcolor colorpicker textpattern imagetools toc help emoticons hr codesample'
                    ];
                }, type: Array
            },
            toolbar1: {
                default: 'formatselect | bold italic  strikethrough  forecolor backcolor | link image | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
                type: String
            },
            toolbar2: {default: '', type: String},
            other_options: {
                default: function () {
                    return {};
                }, type: Object
            },
            readonly: {default: false, type: Boolean}
        },

        data() {
            return {
                content: '',
                editor: null,
                cTinyMce: null,
                checkerTimeout: null,
                isTyping: false
            }
        },
        mounted() {
            this.content = this.value;
            console.info('this.value');
            console.info(this.value);
            this.init();
        },
        beforeDestroy() {
            // 销毁tinymce
            this.$emit('on-destroy')
            window.tinymce.remove(`#${this.id}`)
        },
        watch: {
            value: function (newValue) {
                if (!this.isTyping) {
                    if (this.editor !== null)
                        this.editor.setContent(newValue);
                    else
                        this.content = newValue;
                }
            },
            readonly(value) {
                if (value) {
                    this.editor.setMode('readonly');
                } else {
                    this.editor.setMode('design');
                }
            }
        },
        methods: {
            init() {
                let _this=this;
                let options = {
                    selector: '#' + this.id,
                    skin: false,
                    toolbar1: this.toolbar1,
                    toolbar2: this.toolbar2,
                    plugins: this.plugins,
                    height: 300,
                    images_upload_handler: async function (blobInfo, success, failure) {
                        if (blobInfo.blob().size > _this.maxSize) {
                            failure('文件体积过大！')
                        }

                        if (_this.accept.indexOf(blobInfo.blob().type) > 0) {
                            const formData = new FormData();
                            formData.append('upfile', blobInfo.blob(), blobInfo.filename())
                            let url = await _this.$http.myPost(URL_NEWS.POST_UPLOAD_NEWS_IMG, formData);
                            _this.$message.success('上传成功！');
                        } else {
                            failure('图片格式错误！')
                        }
                    },
                    setup: (editor) => {
                        // 抛出 'on-ready' 事件钩子
                        editor.on(
                            'init', () => {
                                self.loading = false
                                self.$emit('on-ready')
                                editor.setContent(self.value)
                            }
                        )
                        // 抛出 'input' 事件钩子，同步value数据
                        editor.on(
                            'input change undo redo', () => {
                                self.$emit('input', editor.getContent())
                            }
                        )
                    },
                    init_instance_callback: this.initEditor
                };
                tinymce.init(this.concatAssciativeArrays(options, this.other_options));
            },
            initEditor(editor) {
                this.editor = editor;
                editor.on('KeyUp', (e) => {
                    this.submitNewContent();
                });
                editor.on('Change', (e) => {
                    if (this.editor.getContent() !== this.value) {
                        this.submitNewContent();
                    }
                    this.$emit('editorChange', e);
                });
                editor.on('init', (e) => {
                    editor.setContent(this.content);
                    this.$emit('input', this.content);
                });
                if (this.readonly) {
                    this.editor.setMode('readonly');
                } else {
                    this.editor.setMode('design');
                }
                this.$emit('editorInit', editor);
            },
            concatAssciativeArrays(array1, array2) {
                if (array2.length === 0) return array1;
                if (array1.length === 0) return array2;
                let dest = [];
                for (let key in array1) dest[key] = array1[key];
                for (let key in array2) dest[key] = array2[key];
                return dest;
            },
            submitNewContent() {
                this.isTyping = true;
                if (this.checkerTimeout !== null)
                    clearTimeout(this.checkerTimeout);
                this.checkerTimeout = setTimeout(() => {
                    this.isTyping = false;
                }, 300);
                this.$emit('input', this.editor.getContent());
            },
            /*init () {
                const self = this

                this.Editor = tinymce.init({
                    // 默认配置
                    ...this.DefaultConfig,

                    // 图片上传
                    images_upload_handler: async function (blobInfo, success, failure) {
                        if (blobInfo.blob().size > self.maxSize) {
                            failure('文件体积过大！')
                        }

                        if (self.accept.indexOf(blobInfo.blob().type) >= 0) {
                            const formData = new FormData();
                            formData.append('upfile', blobInfo.blob(), blobInfo.filename())
                            let url = await this.$http.myPost(URL_NEWS.POST_UPLOAD_NEWS_IMG, formData);
                            this.$message.success('上传成功！');
                        } else {
                            failure('图片格式错误！')
                        }
                    },

                    // prop内传入的的config
                   ...this.config,

                    // 挂载的DOM对象
                    selector: `#${this.id}`,
                    setup: (editor) => {
                        // 抛出 'on-ready' 事件钩子
                        editor.on(
                            'init', () => {
                                self.loading = false
                                self.$emit('on-ready')
                                editor.setContent(self.value)
                            }
                        )
                        // 抛出 'input' 事件钩子，同步value数据
                        editor.on(
                            'input change undo redo', () => {
                                self.$emit('input', editor.getContent())
                            }
                        )
                    }
                })
            }*/
        }
    }
</script>

<style type="text/less">
    .mce-tinymce {
        box-sizing: border-box;
    }
</style>
