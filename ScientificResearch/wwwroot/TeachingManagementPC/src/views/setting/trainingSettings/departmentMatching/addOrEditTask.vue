<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small" v-if="isLoad">
      <el-form-item label="标准科室">
        <el-input disabled v-model="info.item.教学专业科室名称"></el-input>
      </el-form-item>
      <el-form-item label="本院科室">
        <el-input disabled v-model="info.item.本院科室名称"></el-input>
      </el-form-item>
      <el-form-item label="任务项目名称" prop="项目名称">
        <el-input v-model="form.项目名称"></el-input>
      </el-form-item>
      <el-form-item label="任务类型" prop="任务类型编号">
        <el-select v-model="form.任务类型编号" placeholder="请选择">
          <el-option
            v-for="item in types"
            :key="item.编号" :label="item.名称" :value="item.编号">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="是否门诊" prop="是否门诊">
        <el-radio-group v-model="form.是否门诊">
          <el-radio :label="true">是</el-radio>
          <el-radio :label="false">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="是否病房" prop="是否病房">
        <el-radio-group v-model="form.是否病房">
          <el-radio :label="true">是</el-radio>
          <el-radio :label="false">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="是否医技" prop="是否医技">
        <el-radio-group v-model="form.是否医技">
          <el-radio :label="true">是</el-radio>
          <el-radio :label="false">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="掌握程度" prop="最低评分要求">
        <el-select v-model="form.最低评分要求" placeholder="请选择">
          <el-option
            v-for="item in levels"
            :key="item.编号"
            :label="item.等级名称"
            :value="item.最小分值">
            <span style="float: left">{{ item.等级名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.最小分值 }}</span>
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="数量要求" prop="数量要求">
        <el-input v-model="form.数量要求" type="number">
          <template slot="append">例</template>
        </el-input>
        <p class="explain">为 0 表示不作要求！</p>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_BASE_INFO, URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy } from '@/assets/js/Common';

  export default {
    name: 'addTask',
    props: ['item', 'isAdd', 'id'],
    data() {
      return {
        list: [],
        form: {
          编号: 0,
          项目名称: '',
          任务类型编号: '',
          是否门诊: true,
          是否病房: true,
          是否医技: true,
          最低评分要求: '',
          数量要求: 0,
          备注: ''
        },
        rules: {
          项目名称: [
            { required: true, message: '请输入任务项目名称！', trigger: 'blur' }
          ],
          任务类型编号: [
            { required: true, message: '请选择任务类型！', trigger: 'blur' }
          ],
          是否门诊: [
            { required: true, message: '请选择门诊！', trigger: 'blur' }
          ],
          是否病房: [
            { required: true, message: '请选择病房！', trigger: 'blur' }
          ],
          是否医技: [
            { required: true, message: '请选择医技！', trigger: 'blur' }
          ],
          最低评分要求: [
            { required: true, message: '请选择最低评分要求！', trigger: 'blur' }
          ],
          数量要求: [
            { required: true, message: '请输入数量要求！', trigger: 'blur' }
          ]
        },
        types: [],
        levels: [],
        title: '',
        isLoad: false
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
      }
      if (sessionStorage.getItem('info')) {
        this.info = JSON.parse(sessionStorage.getItem('info'));
      }
      this.isLoad = true;
      this.getTypes();
      this.getlevels();

    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getTypes: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_MAJOR_DEPARTMENT_TASK_TYPE, '');
        if (data && data.length > 0) {
          this.types = data;
        }
      },
      getlevels: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TEACHING_GRADING_SCALE, '');
        if (data && data.length > 0) {
          this.levels = data;
        }
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            let postData = {
              Id: this.id,
              List: [this.form]
            };
            this.addEditTask(postData);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditTask: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_HOSPITAL_DEPARTMENT_TASK, data);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);
      }
    }
  };
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
