<template>
    <div class="tinymce-editor">
        <textarea v-model="myValue" :id="id" :init='init'></textarea>
    </div>
</template>

<script>
    import {URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import tinymce from 'tinymce/tinymce'
    // import Editor from '@tinymce/tinymce-vue'
    import 'tinymce/themes/modern/theme'
    import 'tinymce/plugins/image'
    import 'tinymce/plugins/media'
    import 'tinymce/plugins/table'
    import 'tinymce/plugins/lists'
    import 'tinymce/plugins/contextmenu'
    import 'tinymce/plugins/wordcount'
    import 'tinymce/plugins/colorpicker'
    import 'tinymce/plugins/textcolor'
    import 'tinymce/langs/zh_CN';
    export default {
        /*components: {
            Editor
        },*/
        props: {
            //传入一个value，使组件支持v-model绑定
            value: {
                type: String,
                default: ''
            },
            disabled: {
                type: Boolean,
                default: false
            },
            plugins: {
                type: [String, Array],
                default: 'lists image media table textcolor wordcount contextmenu'
            },
            toolbar: {
                type: [String, Array],
                default: 'undo redo |  formatselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | lists image media table | removeformat'
            },
            other_options: {
                default: function () {return {};}, type: Object
            },
            maxSize: {
                default: 2097152,
                type: Number
            },
            id: {
                type: String,
                required: true
            },
        },
        data() {
            return {
                //初始化配置
                myValue: this.value,
                init: {
                    language_url: '/public/tinymce/langs/zh_CN.js',
                    language: 'zh_CN',
                    skin_url: '/public/tinymce/skins/lightgray',
                    height: 300,
                    plugins: 'link lists image code table colorpicker textcolor wordcount contextmenu',
                    toolbar:
                        'bold italic underline strikethrough | fontsizeselect | forecolor backcolor | alignleft aligncenter alignright alignjustify | bullist numlist | outdent indent blockquote | undo redo | link unlink image code | removeformat',
                    branding: false,
                    images_upload_handler: (blobInfo, success, failure) => {
                        const img = 'data:image/jpeg;base64,' + blobInfo.base64()
                        success(img)
                    },
                }
            }
        },
        beforeDestroy() {
            // 销毁tinymce
            this.$emit('on-destroy');
            window.tinymce.remove(`#${this.id}`);
        },
        mounted() {
            tinymce.init({});
            // this.init();
        },
        methods: {
            init() {
                const _this = this;
                let options = {
                    // language_url: '/public/tinymce/langs/zh_CN.js',
                    // language: 'zh_CN',
                    // skin_url: '/public/tinymce/skins/lightgray',
                    selector: `#${this.id}`,
                    height: 300,
                    plugins: this.plugins,
                    toolbar: this.toolbar,
                    branding: false,
                    menubar: false,
                    //此处为图片上传处理函数，这个直接用了base64的图片形式上传图片，
                    //如需ajax上传可参考https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_handler
                    /*images_upload_handler: (blobInfo, success, failure) => {
                        const img = 'data:image/jpeg;base64,' + blobInfo.base64()
                        success(img)
                    },*/
                    setup(editor) {
                        editor.addButton('h2', {
                            title: '小标题', // tooltip text seen on mouseover
                            text: '小标题',
                            onclick() {
                                editor.execCommand('mceToggleFormat', false, 'h2');
                            },
                            onPostRender() {
                                const btn = this;
                                editor.on('init', () => {
                                    editor.formatter.formatChanged('h2', state => {
                                        btn.active(state);
                                    });
                                });
                            }
                        });
                    },
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
                }
                tinymce.init(this.concatAssciativeArrays(options, this.other_options));
            },
            concatAssciativeArrays(array1, array2) {
                if (array2.length === 0) return array1;
                if (array1.length === 0) return array2;
                let dest = [];
                for (let key in array1) dest[key] = array1[key];
                for (let key in array2) dest[key] = array2[key];
                return dest;
            },
        },
        watch: {
            value(newValue) {
                this.myValue = newValue
            },
            myValue(newValue) {
                this.$emit('input', newValue)
            },

        }
    }

</script>

<style type="text/less">
    .mce-tinymce {
        box-sizing: border-box;
    }
</style>


