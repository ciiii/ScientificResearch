<template>
  <div class="details">
    <el-form label-width="120px" size="small">
      <el-form-item label="分类名称：">
        <span>{{item.名称}}</span>
      </el-form-item>
      <label class="el-form-item__label" style="width: 120px;">活动模板：</label>
      <div class="tinymce-content" v-html="item.活动内容模板"></div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'userDetails',
    props: ['item'],
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      }
    }
  }
</script>

<style type="text/scss" lang="scss" scoped>

  .el-form-item {
    float: none !important;
    width: 100% !important;
  }

  .el-form {
    height: auto;
  }
</style>
