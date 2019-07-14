<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small">
      <el-form-item label="学员姓名">
        <el-input v-model="item.学员姓名" disabled></el-input>
      </el-form-item>
      <el-form-item label="本院科室">
        <el-input v-model="item.本院科室名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="计划入科日期">
        <el-input v-model="item.计划入科日期" disabled></el-input>
      </el-form-item>
      <el-form-item label="计划出科日期">
        <el-input v-model="item.计划出科日期" disabled></el-input>
      </el-form-item>
      <el-form-item label="状态">
        <el-tag :type="getStates(item.状态)" size="small">{{item.状态}}</el-tag>
      </el-form-item>
      <el-form-item label="原带教老师">
        <el-input v-model="item.带教老师姓名" disabled></el-input>
      </el-form-item>
      <el-form-item label="新带教老师" prop="新带教老师编号">
        <el-select v-model="form.新带教老师编号" placeholder="请选择">
          <el-option
            v-for="item in teachers"
            :key="item.带教老师编号"
            :label="item.姓名"
            :value="item.带教老师编号">
          </el-option>
        </el-select>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_ORGANIZATION, URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import { isInteger } from '@/assets/js/Validate';

  export default {
    name: 'addStudentEntry',
    props: ['item'],
    data() {
      return {
        list: [],
        form: {
          编号: 0,
          教学轮转编号: 0,
          原带教老师编号: null,
          新带教老师编号: null,
          建立人: null,
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        rules: {
          新带教老师编号: [
            { required: true, message: '请选择新带教老师！', trigger: 'blur' }, { validator: isInteger }
          ]
        },
        state: '',
        isLoad: false,
        teachers: []
      };
    },
    mounted() {
      this.form.原带教老师编号 = this.item.带教老师编号;
      this.form.教学轮转编号 = this.item.编号;
      this.item.计划入科日期 = formatDate(this.item.计划入科日期, 'yyyy-MM-dd');
      this.item.计划出科日期 = formatDate(this.item.计划出科日期, 'yyyy-MM-dd');
      if (localStorage.getItem('userInfo')) {
        let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
        this.form.建立人 = userInfo.编号;
        this.isLoad = true;
      }
      this.isLoad = true;
      this.getTeachers(this.item.本院科室编号);
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent');
      },
      getTeachers: async function(id) {
        let postData = {
          科室编号: id
        };
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_DEPARTMENT_TEACHING_TEACHER, postData);
        if (data && data.length > 0) {
          this.teachers = data;
        } else {
          this.teachers = [];
        }
      },
      getStates(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            if (this.form.原带教老师编号 != this.form.新带教老师编号) {
              this.postChangeTeacher(this.form);
            } else {
              this.$message.error('【新带教老师】和【原带教老师】一样，请选择其他老师！');
            }
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      postChangeTeacher: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_ADD_EDIT_CHANGE_TEACHER, data);
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

  .el-form {
    height: auto;
  }
</style>
