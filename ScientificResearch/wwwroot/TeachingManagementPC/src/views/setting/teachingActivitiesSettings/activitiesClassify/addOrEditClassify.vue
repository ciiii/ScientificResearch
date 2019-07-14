<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="110px" size="small">
      <el-form-item label="分类名称" prop="名称">
        <el-input v-model="form.名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="活动内容模板" class="tinymce" prop="活动内容模板">
        <span class="explain">(必须包括科室情况、科室纪律、培养计划与要求、医德医风、医患沟通)</span>
        <tinymce :height="300" v-model="form.活动内容模板"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl'
  import { _debounce, deepCopy } from '@/assets/js/Common'
  import Tinymce from '@/components/Tinymce'

  export default {
    name: 'addClassify',
    props: ['item', 'isAdd'],
    components: { Tinymce },
    data() {
      return {
        list: [],
        form: {
          编号: 0,
          名称: '',
          活动内容模板: '',
          备注: ''
        },
        rules: {
          名称: [
            { required: true, message: '请输入分类名称！', trigger: 'blur' }
          ],
          活动内容模板: [
            { required: true, message: '请输入活动内容模板！', trigger: 'blur' }
          ]
        }
      }
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item)
      }
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      myEvent(value) {
        this.form = value
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.addEditClassify(this.form)
          } else {
            this.$message.error('信息有误！')
            return false
          }
        })
      }, 300),
      addEditClassify: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_OR_EDIT_ACTIVITIES_CLASSIFY, data)
        this.$message.success('提交成功！')
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

  .tinymce {
    padding-right: 10px;
  }

  .el-form {
    height: auto;
  }
</style>
