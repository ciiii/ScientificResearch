<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="140px" size="small" v-if="isLoad">
      <el-form-item label="本院科室" prop="教学本院科室编号">
        <el-select v-model="form.教学本院科室编号" filterable placeholder="请选择" @change="changeDepartment">
          <el-option
            v-for="item in departments"
            :key="item.编号"
            :label="item.本院科室名称"
            :value="item.编号">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="计划入科日期" prop="计划入科日期">
        <el-input v-model="form.计划入科日期" disabled></el-input>
      </el-form-item>
      <el-form-item label="计划出科日期" prop="计划出科日期">
        <selectDateAfter ref="date" :date="form.计划出科日期" type="date" format="yyyy-MM-dd" @myEvent="myGetEndDate"
                         title="选择日期"></selectDateAfter>
      </el-form-item>
      <el-form-item label="最低管床数量" prop="最低管床数量">
        <el-input v-model="form.最低管床数量">
          <template slot="append">例</template>
        </el-input>
      </el-form-item>
      <el-form-item label="最低全程管理数量" prop="最低全程管理数量">
        <el-input v-model="form.最低全程管理数量">
          <template slot="append">例</template>
        </el-input>
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="form.备注" type="textarea"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, formatDate, getUrl, countDays, addDay } from '@/assets/js/Common';
  import selectDateAfter from '@/components/selectDateAfter';

  export default {
    name: 'addDepartmentRotation',
    props: ['item'],
    components: { selectDateAfter },
    data() {
      return {
        req: {
          教学本院策略编号: ''
        },
        form: {
          编号: 0,
          学员编号: '',
          教学本院科室编号: '',
          本院科室名称: '',
          最低管床数量: '',
          最低全程管理数量: '',
          教学本院策略编号: '',
          计划入科日期: '',
          计划出科日期: '',
          最大学员人数: '',
          状态:'未入科',
          state:'warning',
          day: '',
          备注: ''
        },
        departments: [],
        isLoad: false,
        rules: {  //表单验证
          教学本院科室编号: [
            { required: true, message: '请选择教学本院科室！', trigger: 'blur' }
          ],
          计划入科日期: [
            { required: true, message: '请选择计划入科日期！', trigger: 'blur' }
          ],
          计划出科日期: [
            { required: true, message: '请选择计划出科日期！', trigger: 'blur' }
          ],
          最低管床数量: [
            { required: true, message: '请输入最低管床数量！', trigger: 'blur' }
          ],
          最低全程管理数量: [
            { required: true, message: '请输入最低全程管理数量！', trigger: 'blur' }
          ]
        }
      };
    },
    mounted() {
      this.form.学员编号 = this.item.学员编号;
      this.form.教学本院策略编号 = this.item.教学本院策略编号;
      this.req.教学本院策略编号 = this.item.教学本院策略编号;
      this.form.计划入科日期 = addDay(this.item.计划出科日期, 1);
      this.form.计划出科日期 = addDay(this.form.计划入科日期, 1);
      this.getDepartments();
    },
    methods: {
      getDepartments: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_DEPARTMENT, this.req);
        if (data && data.length > 0) {
          this.departments = data;
          this.isLoad = true;
        }
      },
      changeDepartment(value) {
        let item = this.departments.find((item) => item.编号 == value);
        this.form.本院科室名称 = item.本院科室名称;
        this.form.最大学员人数 = item.最大学员人数;
        this.form.最低管床数量 = item.最低管床数量;
        this.form.最低全程管理数量 = item.最低全程管理数量;
      },
      myGetEndDate(value) {
        this.form.计划出科日期 = value;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.form.day = countDays(this.form.计划入科日期, this.form.计划出科日期);
            this.$emit('myEvent', this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });

      }, 300),
      cancelHandler() {
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
