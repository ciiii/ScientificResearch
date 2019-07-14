<template>
  <div class="import-user">
    <el-form ref="form" label-width="150px" size="small">
      <el-form-item label="批量导入学员：" >
        <uploadFile :url="imoprtExcel" @myEvent="closeDialog"></uploadFile>
      </el-form-item>
      <el-form-item label="下载模板文件：">
        <a :href="downloadImoprtExcel" class="download-excel">点击下载 Excel 文件学员模板</a>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="closeDialog">返 回</el-button>
    </div>
  </div>
</template>

<script>
  import { HTTP_URL_HOST, URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl'
  import { getUrl } from '@/assets/js/Common'
  import uploadFile from '@/components/uploadFile'

  export default {
    name: 'importStudent',
    components:{uploadFile},
    data() {
      return {
        downloadImoprtExcel: getUrl(HTTP_URL_HOST + URL_ORGANIZATION.URL_GET_DOWNLOAD_STUDENT_TEMPLET),
        imoprtExcel:  getUrl(HTTP_URL_HOST + URL_ORGANIZATION.URL_POST_IMPORT_STUDENT),
      }
    },
    methods:{
      closeDialog() {
        this.$emit('myEvent', false)
      }
    }
  }
</script>
<style type="text/scss" lang="scss" >
  .import-user {
    .el-form {
      min-height: 300px !important;
    }
    .el-form-item__content{
      line-height: 23px;
    }
  }
</style>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";

  .import-user {
    .el-form {
      height: 300px !important;
    }
  }

  .download-excel {
    color: $colorActive;
    border-bottom: 1px solid $colorActive;
    font-size: 13px;

    &:hover {
      color: $colorActive;
    }
  }
</style>
