<template>
  <div class="app-container page-common page-personal">
    <div class="personal-info">
      <div class="personal-title"><i class="iconfont icon-set"></i> 修改密码</div>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="medium">
        <el-form-item label="旧密码" prop="旧密码">
          <el-input v-model="form.旧密码" maxLength="100" type="password"></el-input>
        </el-form-item>
        <el-form-item label="新密码" prop="新密码">
          <el-input v-model="form.新密码" maxLength="100" type="password"></el-input>
        </el-form-item>
      </el-form>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button type="primary" @click="confirmHandler">提 交</el-button>
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
        this.$message({
          showClose: true,
          message: '密码修改成功！',
          type: 'success'
        });
        this.$emit('myEvent');
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .page-personal {
    margin: 15px;
    padding: 50px 0 100px 20px;
    overflow: hidden;
    position: relative;
    height: 100%;
    background: #fff;
  }

  .personal-info {
    width: 40%;
    margin: 0 auto 40px;
  }

  .personal-title {
    padding-left: 20px;
    padding-bottom: 5px;
    margin: 50px 0 30px 50px;
    color: #696d73;
    font-size: 22px;
    font-style: italic;
    font-weight: normal;
    text-align: left;
  }
</style>
