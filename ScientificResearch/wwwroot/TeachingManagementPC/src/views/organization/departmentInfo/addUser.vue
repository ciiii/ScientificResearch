<template>
  <div class="add-user">
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small">
      <div class="item-box">
        <el-form-item label="姓名" prop="姓名">
          <el-input v-model.trim="form.姓名"></el-input>
        </el-form-item>
        <el-form-item label="工号" prop="工号">
          <el-input v-model="form.工号"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="密码" v-if="isAdd">
          <el-input v-model="form.密码"></el-input>
        </el-form-item>
        <el-form-item label="所在科室" prop="部门编号">
          <cascaderDepartment ref="child" @myEvent="getDepartmentMyEvent"
                              :departmentId="item.部门编号"></cascaderDepartment>
        </el-form-item>
        <el-form-item label="性别" prop="性别">
          <el-radio-group v-model="form.性别">
            <el-radio label="男"></el-radio>
            <el-radio label="女"></el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="出生日期" prop="出生日期">
          <el-input v-model="form.出生日期"></el-input>
        </el-form-item>
        <el-form-item label="身份证" prop="身份证">
          <el-input v-model="form.身份证"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="手机号">
          <el-input v-model="form.手机号" type="number"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" prop="邮箱">
          <el-input v-model="form.邮箱"></el-input>
        </el-form-item>
        <el-form-item label="政治面貌" prop="政治面貌">
          <el-input v-model="form.政治面貌"></el-input>
        </el-form-item>
        <el-form-item label="入职日期" prop="入职日期">
          <el-input v-model="form.入职日期"></el-input>
        </el-form-item>
        <el-form-item label="职称" prop="职务名称">
          <el-select v-model="form.职务名称" placeholder="请选择">
            <el-option v-for="item in posts" :key="item.编号" :label="item.值" :value="item.值"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="最高学位" prop="学位">
          <el-input v-model="form.学位"></el-input>
        </el-form-item>
        <el-form-item label="说明信息" prop="备注" class="el-form-item-block">
          <el-input type="textarea" v-model="form.备注"></el-input>
        </el-form-item>
      </div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_USER, URL_BASE_INFO, URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl'
  import { _debounce, deepCopy,onlyNum } from '@/assets/js/Common'
  import { validateIdNo, validateEMail, validatePhone } from '@/assets/js/Validate'
  import cascaderDepartment from '@/components/setting/cascaderDepartment'

  export default {
    name: 'addUser',
    props: ['item', 'isAdd'],
    components: { cascaderDepartment },
    data() {
      return {
        list: [],
        name: '',
        rules: {  //表单验证
          姓名: [
            { required: true, message: '请输入姓名！', trigger: 'blur' }
          ],
          工号: [
            { required: true, message: '请输入工号！', trigger: 'blur' }
          ],
          密码: [
            { required: true, message: '请输入密码！', trigger: 'blur' }
          ],
          身份证: [
            { required: true, message: '请输入正确的身份证号！', trigger: 'blur' }, { validator: validateIdNo }
          ],
          手机号: [
            { required: true, message: '请输入正确的手机号！', trigger: 'blur' }, { validator: validatePhone }
          ],
          部门编号: [
            { required: true, message: '请选择所在科室！', trigger: 'blur' }
          ]
        },
        userType: [],
        posts: [],
        form: {
          编号: 0,
          工号: '',
          密码: '',
          姓名: '',
          部门编号: '',
          性别: '男',
          身份证: '',
          出生日期: '',
          入职日期: '',
          手机: '',
          邮箱: '',
          学位: '',
          政治面貌: '',
          职务名称: '',
          备注: '',
          是否启用: true
        },
        departments: [],
        selected: []
      }
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item)
      }
      this.getPosts()
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      getPosts: async function() {
        let postData = {
          分类: '职称'
        }
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData)
        if (data && data.length > 0) {
          this.posts = data
        }
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.addOrEditUser(this.form)
          } else {
            this.$message.error('信息有误！')
            return false
          }
        })
      }, 300),
      addOrEditUser: async function(data) {
        await this.$http.myPost(URL_USER.POST_ADD_OR_EDIT_USER, data)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      },
      getDepartmentMyEvent(value) {
        this.form.部门编号 = value
      }
    }
  }
</script>
