<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
      <el-form-item label="项目名称" prop="名称">
        <el-input v-model="form.名称"></el-input>
      </el-form-item>
      <el-form-item label="标准分值" prop="标准分">
        <el-input v-model="form.标准分" type="number">
          <template slot="append">分</template>
        </el-input>
      </el-form-item>
      <el-form-item label="评价说明">
        <el-input v-model="form.说明" type="textarea" :rows="5"></el-input>
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

  export default {
    name: 'addProject',
    props: ['item', 'isAdd', 'type'],
    data() {
      return {
        list: [],
        form: {
          编号: 0,
          名称: '',
          标准分: 0,
          是否启用: true,
          说明: '',
          备注: ''
        },
        rules: {
          名称: [
            { required: true, message: '请输入项目名称！', trigger: 'blur' }
          ],
          标准分: [
            { required: true, message: '请输入标准分值！', trigger: 'blur' }
          ]
        }
      }
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item)
      }
      this.getTypes()
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      getTypes: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TEACHING_ACTIVITIES_CLASSIFY, '')
        if (data && data.length > 0) {
          this.list = data
        }
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            let postData = {
              Id: this.type,
              list: [this.form]
            }
            this.addEditProject(postData)
          } else {
            this.$message.error('信息有误！')
            return false
          }
        })
      }, 300),
      addEditProject: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_ACTIVITIES_PROJDECT, data)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      }
    }
  }
</script>
