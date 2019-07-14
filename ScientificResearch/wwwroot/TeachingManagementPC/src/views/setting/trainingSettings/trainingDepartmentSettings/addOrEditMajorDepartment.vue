<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small" class="demo-ruleForm">
      <el-form-item label="科室名称" prop="科室名称" class="el-form-item-block">
        <el-input v-model="form.科室名称"></el-input>
      </el-form-item>
      <el-form-item label="培训专业" prop="培训专业">
        <el-select v-model="majorId" placeholder="请选择" width="80%">
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item.编号">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="最低培训时长" prop="最低培训时长">
        <el-input v-model="form.最低培训时长" type="number">
          <template slot="append">周</template>
        </el-input>
      </el-form-item>
      <el-form-item label="最低管床数量" prop="最低管床数量" class="el-item">
        <el-input v-model="form.最低管床数量" type="number">
          <template slot="append">例</template>
        </el-input>
        <span>，</span>
      </el-form-item>
      <el-form-item label="其中全程管理" prop="最低全程管理数量" class="form-item">
        <el-input v-model="form.最低全程管理数量" type="number">
          <template slot="append">例</template>
        </el-input>
        <span class="explain">为 0 表示不作要求！</span>
      </el-form-item>
      <el-form-item label="科室要求" class="el-form-item-block">
        <tinymce :height="400" v-model="form.科室要求"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer footer-box">
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
          排序值: 0,
          科室名称: '',
          最低培训时长: '',
          最低管床数量: '',
          最低全程管理数量: '',
          科室要求: '',
          备注: ''
        },
        rules: {
          科室名称: [
            { required: true, message: '请输入科室名称！', trigger: 'blur' }
          ],
          最低培训时长: [
            { required: true, message: '请输入最低培训时长！', trigger: 'blur' }
          ],
          最低管床数量: [
            { required: true, message: '请输入最低管床数量！', trigger: 'blur' }
          ],
          最低全程管理数量: [
            { required: true, message: '请输入全程管理数量！', trigger: 'blur' }
          ]
        },
        majors: [],
        majorId: '',
        isAdd: false
      };
    },
    mounted() {
      this.isAdd = this.$route.params.isAdd;
      if (!this.isAdd) {
        if (sessionStorage.getItem('item')) {
          this.form = JSON.parse(sessionStorage.getItem('item'));
        }
        this.$route.meta.title = '修改科室';
      } else {
        this.$route.meta.title = '添加科室';
      }
      this.getMajors();
    },
    methods: {
      getMajors: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, '');
        if (data && data.length > 0) {
          this.majors = data;
          this.majorId = this.majors[0].编号;
        }
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            let arr = [];
            let postData = {
              Id: this.majorId,
              List: arr
            };
            arr.push(this.form);
            this.addEditMajorDepartment(postData);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditMajorDepartment: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_MAJOR_DEPARTMENT, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/trainingDepartmentSettings' });
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
      width: 80%;
    }
  }

  .el-item {
    width: 20% !important;
  }

  .form-item {
    width: 70% !important;;

    .el-input {
      width: 20% !important;
    }
  }

  .demo-ruleForm .el-select {
    display: block;
  }

</style>
