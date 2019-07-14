<template>
  <div class="app-container page-common">
    <div class="personal-title"><i class="iconfont icon-set"></i> 修改密码</div>
    <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small" action="/upload"
             enctype="multipart/form-data" method="post">
      <el-form-item label="旧密码" prop="旧密码">
        <el-input v-model="form.旧密码" maxLength="100"></el-input>
      </el-form-item>
      <el-form-item label="新密码" prop="新密码">
        <el-input v-model="form.新密码" maxLength="100"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer footer-box">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="test">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_USER } from '@/assets/js/connect/ConSysUrl';
  import { _debounce } from '@/assets/js/Common';

  export default {
    name: 'editPassWord',
    data() {
      return {
        form: {
          旧密码: '',
          新密码: ''
        },
        rules: {  //表单验证
          旧密码: [
            { required: true, message: '旧密码不能为空！', trigger: 'blur' }
          ],
          新密码: [
            { required: true, message: '旧密码不能为空！', trigger: 'blur' }
          ]
        }
      };
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.editPassWord();
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      editPassWord: async function() {
        await this.$http.myPost(URL_USER.POST_EDIT_PASS_WORD, this.form);
        this.$message.success('提交成功！');
        this.$emit('myEvent');
      },
      test: async function() {
        // this.isDialog = true;
        let postData = {
          userName: 'xzrmyy2016',
          password: 'xzrmyy',
          serviceType: 1,
          loginType: 0
        };

        let data = await this.$http.myPost('', postData);
        console.info(data);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);

      }
    }
  };
</script>
