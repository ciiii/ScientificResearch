<template>
  <div class="addDictionary">
    <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
      <el-form-item label="名称" prop="值">
        <el-input v-model="form.值" maxLength="200"></el-input>
      </el-form-item>
      <el-form-item label="备注" prop="备注">
        <el-input v-model="form.备注" type="textarea" :rows="5" maxLength="2000"></el-input>
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
    props: ['item', 'isDialog', 'isAdd', 'type'],
    data() {
      return {
        form: {
          编号: 0,
          分类: '',
          值: '',
          上级编号: 0,
          级别: 0,
          排序: 0,
          备注: ''
        },
        rules: {  //表单验证
          值: [
            { required: true, message: '名称不能为空！', trigger: 'blur'}
          ]
        }
      }
    },
    mounted() {
      if (this.isAdd) {
        this.form.分类 = this.type
      } else {
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
            if (this.isAdd) {
              this.AddDictionary()
            } else {
              this.EditDictionary()
            }
          } else {
            this.$message.error('信息有误！')
            return false
          }
        })
      }, 300),
      AddDictionary: async function() {
        await this.$http.myPost(URL_BASE_INFO.POST_ADD_DICTIONARY, this.form)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      },
      EditDictionary: async function() {
        await this.$http.myPost(URL_BASE_INFO.POST_EDIT_DICTIONARY, this.form)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      }
    }
  }
</script>
