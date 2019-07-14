<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small" v-if="isLoad">
      <el-form-item label="学员">
        <el-input v-model="names" disabled></el-input>
      </el-form-item>
      <el-form-item label="报到时间" prop="报到时间">
        <selectDate ref="date" :date="form.报到时间" type="date" format="yyyy-MM-dd" @myEvent="myGetDate"
                    title="选择日期"></selectDate>
      </el-form-item>
      <el-form-item label="教学本院策略" prop="教学本院策略编号">
        <el-select v-model="form.教学本院策略编号" placeholder="请选择">
          <el-option v-for="item in strategys" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
        </el-select>
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
  import { URL_TEACHING_MANAGEMENT, URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import selectDate from '@/components/selectDate';

  export default {
    name: 'addDownload',
    props: ['item', 'isAdd', 'arr', 'nameArr'],
    components: { selectDate },
    data() {
      return {
        req: {
          教学专业编号: '',
          Like名称: '',
          是否启用: true
        },
        form: {
          编号: 0,
          报到时间: formatDate(new Date(), 'yyyy-MM-dd'),
          教学本院策略编号: '',
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        strategys: [],
        isLoad: false,
        names: '',
        rules: {  //表单验证
          报到时间: [
            { required: true, message: '请选择报到时间！', trigger: 'blur' }
          ],
          教学本院策略编号: [
            { required: true, message: '请选择教学本院策略！', trigger: 'blur' }
          ]
        }
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
        if (this.form.专业编号 && this.form.专业编号 != 0) {
          this.req.教学专业编号 = this.form.专业编号;
        }
      } else {
        this.form.编号 = this.item.编号;
      }
      this.names = this.nameArr;
      this.getStrategys();
      this.isLoad = true;
    },
    methods: {
      getStrategys: async function(value) {
        let data = await this.$http.myGet(URL_SETTING.GET_HOSPITAL_STRATEGY_LIST, this.req);
        if (data && data.length > 0) {
          this.strategys = data;
        }
      },
      myGetDate(value) {
        this.form.报到时间 = value;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            let arr = [];
            this.arr.forEach(item => {
              let data = {
                编号: item,
                报到时间: this.form.报到时间,
                教学本院策略编号: this.form.教学本院策略编号,
                建立时间: this.form.建立时间,
                备注: this.form.备注
              };
              arr.push(data);
              this.addEditStudentReport(arr);
            });
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });

      }, 300),
      addEditStudentReport: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.URL_POST_BATCH_ADD_EDIT_STUDENT_REPORT, data);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);
      },
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
