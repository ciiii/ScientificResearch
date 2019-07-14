<template>
  <div class="addDictionary">
    <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
      <el-form-item label="楼栋名称" prop="名称">
        <el-input v-model="form.名称" maxLength="200"></el-input>
      </el-form-item>
      <el-form-item label="层数">
        <el-input v-model="form.层数" maxLength="50" type="number"></el-input>
      </el-form-item>
      <el-form-item label="单元数">
        <el-input v-model="form.单元数" maxLength="50" type="number"></el-input>
      </el-form-item>
      <el-form-item label="每层户数">
        <el-input v-model="form.每单元每层户数" maxLength="50" type="number"></el-input>
      </el-form-item>
      <el-form-item label="每户床数">
        <el-input v-model="form.每户床数" maxLength="50" type="number"></el-input>
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="form.备注" type="textarea" :rows="5" maxLength="200"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl'
  import { _debounce, deepCopy } from '@/assets/js/Common'

  export default {
    name: 'AddService',
    props: ['item', 'isDialog', 'isAdd'],
    data() {
      return {
        form: {
          编号: 0,
          名称: '',
          层数: 0,
          单元数: 0,
          每单元每层户数: 0,
          每户床数: 0,
          备注: ''
        },
        rules: {  //表单验证
          名称: [
            { required: true, message: '楼栋名称不能为空！', trigger: 'blur' },
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
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.addOrEditDictionary()
          } else {
            this.$message.error('信息有误！')
            return false
          }
        })
      }, 300),
      addOrEditDictionary: async function() {
        await this.$http.myPost(URL_BASE_INFO.POST_ADD_OR_EDIT_DORMITORY, this.form)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      }
    }
  }
</script>
