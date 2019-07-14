<template>
  <div>
    <el-upload
      class="upload-demo"
      :action="url"
      :on-preview="handlePreview"
      :file-list="fileList"
      :headers="Authorization"
      :on-success="handleAvatarSuccess">
      <el-button size="small" type="primary">点击上传</el-button>
      <div slot="tip" class="el-upload__tip">只能上传 Excel 文件，且不超过500kb</div>
    </el-upload>
  </div>
</template>

<script>
  export default {
    name: 'UploadFile',
    props: ['url'],
    data() {
      return {
        fileList: [],
        Authorization: {
          Authorization: localStorage.getItem('Authorization')
        }
      }
    },
    methods: {
      handlePreview(file) {
        console.log(file)
      },
      handleAvatarSuccess(response) {
        if (response.error) {
          this.$notify.error({
            title: '上传失败',
            message: response.error
          })
          this.fileList = []
        } else {
          this.$message.success('上传成功！')
          this.$emit('myEvent')
        }

      }
    }
  }
</script>
