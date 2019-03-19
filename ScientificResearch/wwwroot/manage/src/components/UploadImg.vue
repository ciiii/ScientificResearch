<template>
    <div>
        <el-upload
                class="avatar-uploader"
                :action="postUrl"
                :show-file-list="false"
                :on-success="handleAvatarSuccess"
                :before-upload="beforeAvatarUpload"
                :headers="Authorization">
            <img v-if="image" :src="image" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
        </el-upload>
    </div>
</template>
<style>
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }

    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }

    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 100px;
        height: 100px;
        line-height: 100px !important;
        text-align: center;
    }

    .avatar {
        width: 100px;
        height: 100px;
        display: block;
        padding: 3px;
    }
</style>

<script>
    import {HTTP_URL_HOST, URL_NEWS} from "@/assets/js/connect/ConSysUrl";
    import {getUrl} from "@/assets/js/Common";

    export default {
        name: "UploadImg",
        props: ['logo'],
        data() {
            return {
                image: '',
                postUrl: getUrl(HTTP_URL_HOST + URL_NEWS.POST_UPLOAD_LOGO_IMG),
                Authorization: {
                    Authorization: sessionStorage.getItem('Authorization')
                },
                isImage: true,
            };
        },
        mounted() {
            this.image = this.logo;
        },
        methods: {
            handleAvatarSuccess(res, file) {
                this.image = HTTP_URL_HOST + res.data[0];
                this.$emit('myEvent', this.image);
            },
            beforeAvatarUpload(file) {

                const isJPG = file.type === 'image/jpeg' || file.type === 'image/png';
                const isLt2M = file.size / 1024 / 1024 < 2;

                if (!isJPG) {
                    this.$message.error('上传图片只能是 JPG或PNG 格式!');
                }
                if (!isLt2M) {
                    this.$message.error('上传头像图片大小不能超过 2MB!');
                }
                return isJPG && isLt2M;
            }
        }
    }
</script>
