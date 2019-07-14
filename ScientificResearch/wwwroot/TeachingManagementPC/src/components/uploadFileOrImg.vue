<template>
  <div>
    <el-upload
      class="upload-demo"
      :action="url"
      :on-preview="handlePreview"
      show-file-list
      :file-list="fileList"
      :on-remove="handleRemove"
      :headers="Authorization"
      :on-success="handleAvatarSuccess">
      <el-button size="small" type="primary">点击上传</el-button>
    </el-upload>
  </div>
</template>

<script>
  import { HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import {getHtmlDocName} from '@/assets/js/Common';

  export default {
    name: 'UploadFile',
    props: ['url', 'files'],
    data() {
      return {
        fileList: [],
        Authorization: {
          Authorization: localStorage.getItem('Authorization')
        }
      };
    },
    mounted() {
      this.files.forEach((item)=> {
        let data = {
          name: getHtmlDocName(item),
          url: HTTP_URL_HOST + item
        };
        this.fileList.push(data);
      });
    },
    methods: {
      handlePreview(file) {
        console.log(file);
      },
      handleRemove(file, fileList) {
        this.$emit('removeFile',file.name);
      },
      handleAvatarSuccess(response) {
        if (response.error) {
          this.$notify.error({
            title: '上传失败',
            message: response.error
          });
          this.fileList = [];
        } else {
          this.$message.success('上传成功！');
          this.$emit('myEvent', response.data[0]);
        }
      }
    }
  };
</script>
