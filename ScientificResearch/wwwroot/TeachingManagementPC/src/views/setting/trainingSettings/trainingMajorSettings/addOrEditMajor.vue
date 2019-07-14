<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small" class="demo-ruleForm">
      <el-form-item label="专业名称" prop="名称">
        <el-input v-model="form.名称"></el-input>
      </el-form-item>
      <el-form-item label="专业年份" v-if="isLoad">
        <selectDate ref="date" :date="form.年份" type="year" format="yyyy" title="选择年" @myEvent="myGetYear"></selectDate>
      </el-form-item>
      <el-form-item label="是否国家标准" prop="是否国家标准">
        <el-radio-group v-model="form.是否国家标准">
          <el-radio :label="true">是</el-radio>
          <el-radio :label="false">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="最低培训时长" prop="最低培训时长">
        <el-input v-model="form.最低培训时长" type="number">
          <template slot="append">周</template>
        </el-input>
      </el-form-item>
      <el-form-item label="标准代码">
        <el-input v-model="form.标准代码"></el-input>
        <p class="explain">此代码是国家卫计委对培训专业规定的统一代码，不能随意填写！只需对培训专业填写！</p>
      </el-form-item>
      <el-form-item label="学习要求及目标" class="el-form-item-block">
        <tinymce :height="400" v-model="form.学习要求及目标"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy } from '@/assets/js/Common';
  import selectDate from '@/components/selectDate';
  import Tinymce from '@/components/Tinymce';

  export default {
    name: 'addMajor',
    components: { selectDate, Tinymce },
    data() {
      return {
        form: {
          编号: 0,
          名称: '',
          年份: new Date().getFullYear(),
          是否国家标准: true,
          标准代码: '',
          最低培训时长: '',
          学习要求及目标: '',
          备注: ''
        },
        rules: {
          名称: [
            { required: true, message: '请输入项目名称！', trigger: 'blur' }
          ],
          年份: [
            { required: true, message: '请选择专业年份！', trigger: 'blur' }
          ],
          最低培训时长: [
            { required: true, message: '请输入最低培训时长！', trigger: 'blur' }
          ]
        },
        isAdd: false,
        isLoad: false
      };
    },
    mounted() {
      this.isAdd = this.$route.params.isAdd;
      if (!this.isAdd) {
        if (sessionStorage.getItem('item')) {
          this.form = JSON.parse(sessionStorage.getItem('item'));
        }
        this.$route.meta.title = '修改专业';
      } else {
        this.$route.meta.title = '添加专业';
        this.form.年份 = new Date().getFullYear();
      }
      this.isLoad = true;
    },
    methods: {
      myGetYear(value) {
        this.form.年份 = value;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.form.年份 = parseInt(this.form.年份);
            this.addEditMajor(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditMajor: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_TRAINING_MAJOR, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/trainingMajorSettings' });
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";

  .el-dialog {
    .el-cascader {
      width: 100% !important;
    }

    .el-cascader.is-disabled .el-cascader__label {
      color: #666
    }
  }

  .el-cascader-menu {
    width: 220px !important;
  }

  .el-form-item {
    .el-input {
      width: 90%;
    }
  }
</style>
