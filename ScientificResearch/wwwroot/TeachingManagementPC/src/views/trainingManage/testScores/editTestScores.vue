<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small" v-if="isLoad">
      <el-form-item label="学员姓名">
        <el-input v-model="form.学员姓名" disabled></el-input>
      </el-form-item>
      <el-form-item label="本院科室">
        <el-input v-model="form.本院科室名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="计划入科日期">
        <el-input v-model="form.计划入科日期" disabled></el-input>
      </el-form-item>
      <el-form-item label="计划出科日期">
        <el-input v-model="form.计划出科日期" disabled></el-input>
      </el-form-item>
      <el-form-item label="状态">
        <el-tag :type="getStates(form.状态)" size="small">{{form.状态}}</el-tag>
      </el-form-item>
      <el-form-item label="理论考试成绩" prop="理论考试成绩">
        <el-input v-model="form.理论考试成绩" type="number">
          <template slot="append">分</template>
        </el-input>
      </el-form-item>
      <el-form-item label="技能考试成绩" prop="技能考试成绩">
        <el-input v-model="form.技能考试成绩" type="number">
          <template slot="append">分</template>
        </el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import { isInteger } from '@/assets/js/Validate';

  export default {
    name: 'editTestScores',
    props: ['item', 'isAdd'],
    data() {
      return {
        form: {
          编号: 0,
          理论考试成绩: '',
          技能考试成绩: '',
          建立人: '',
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        rules: {
          理论考试成绩: [
            { required: true, message: '请输入理论考试成绩！', trigger: 'blur' }, { validator: isInteger }
          ],
          技能考试成绩: [
            { required: true, message: '请输入技能考试成绩！', trigger: 'blur' }, { validator: isInteger }
          ]
        },
        userId: '',
        isLoad: false
      };
    },
    mounted() {
      if (localStorage.getItem('userInfo')) {
        let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
        this.userId = userInfo.编号;
      }
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
        this.form.计划入科日期 = formatDate(this.form.计划入科日期, 'yyyy-MM-dd');
        this.form.计划出科日期 = formatDate(this.form.计划出科日期, 'yyyy-MM-dd');
        if (!this.form.建立人) {
          this.form.建立人 = this.userId;
        }
        this.form.建立时间 = formatDate(new Date(), 'yyyy-MM-dd');
      } else {
        this.form.建立人 = this.userId;
      }
      this.isLoad = true;
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent');
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
            this.editTestScores(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      editTestScores: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_EDIT_TEST_SCORES, data);
        this.$message.success('提交成功！');
        this.$emit('myEvent');
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
