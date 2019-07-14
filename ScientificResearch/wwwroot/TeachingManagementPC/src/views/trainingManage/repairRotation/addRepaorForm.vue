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
      <el-form-item label="补轮转天数" prop="补轮转天数">
        <el-input v-model="form.补轮转天数" type="number">
          <template slot="append">天</template>
        </el-input>
      </el-form-item>
      <el-form-item label="补轮原因">
        <el-input v-model="form.说明" type="textarea"></el-input>
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
    name: 'addRepaorForm',
    props: ['item'],
    data() {
      return {
        list: [],
        form: {
          教学轮转编号: 0,
          补轮转天数: null,
          说明: ''
        },
        rules: {
          补轮转天数: [
            { required: true, message: '请输入补轮转天数！', trigger: 'blur' }, { validator: isInteger }
          ]
        },
        state:'',
        isLoad: false
      };
    },
    mounted() {
      this.form.教学轮转编号 = this.item.编号;
      this.item.计划入科日期 = formatDate(this.item.计划入科日期, 'yyyy-MM-dd');
      this.item.计划出科日期 = formatDate(this.item.计划出科日期, 'yyyy-MM-dd');
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
            this.addEditRotation(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditRotation: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_REPAIR_ROTATION, data);
        this.$message.success('提交成功！');
        this.$emit('myEvent',false);
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
