<template>
  <div class="addDictionary">
    <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small" v-if="isLoad">
      <el-form-item label="姓名" prop="姓名">
        <el-input v-model="form.姓名" maxLength="200"></el-input>
      </el-form-item>
      <el-form-item label="性别">
        <el-radio-group v-model="form.性别">
          <el-radio label="男">男</el-radio>
          <el-radio label="女">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="出生日期">
        <selectDate ref="date" :date="form.出生日期" type="date" format="yyyy-MM-dd" @myEvent="myBirthdayDate"
                    title="选择日期"></selectDate>
      </el-form-item>
      <el-form-item label="住院号" prop="住院号">
        <el-input v-model="form.住院号"></el-input>
      </el-form-item>
      <el-form-item label="住院床号" prop="住院床号">
        <el-input v-model="form.住院床号"></el-input>
      </el-form-item>
      <el-form-item label="入院日期">
        <selectDate ref="date" :date="form.入院日期" type="date" format="yyyy-MM-dd" @myEvent="myBeginDate"
                    title="选择日期"></selectDate>
      </el-form-item>
      <el-form-item label="出院日期">
        <selectDate ref="date" :date="form.出院日期" type="date" format="yyyy-MM-dd" @myEvent="myEndDate"
                    title="选择日期"></selectDate>
      </el-form-item>
      <el-form-item label="主要诊断" prop="主要诊断" class="el-form-item-block">
        <el-input v-model="form.主要诊断" type="textarea" :rows="5"></el-input>
      </el-form-item>
      <el-form-item label="次要诊断" prop="次要诊断" class="el-form-item-block">
        <el-input v-model="form.次要诊断" type="textarea" :rows="5"></el-input>
      </el-form-item>
      <el-form-item label="备注" prop="备注" class="el-form-item-block">
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
  import { _debounce, deepCopy } from '@/assets/js/Common';
  import selectDate from '@/components/selectDate';

  export default {
    name: 'addPatient',
    components:{selectDate},
    props: ['item', 'isAdd'],
    data() {
      return {
        form: {
          编号: 0,
          姓名: '',
          性别: '男',
          出生日期: '',
          住院号: '',
          住院床号: '',
          主要诊断: '',
          次要诊断: '',
          入院日期: '',
          出院日期: '',
          备注: ''
        },
        rules: {  //表单验证
          姓名: [
            { required: true, message: '请填写病人姓名！', trigger: 'blur' }
          ]
        },
        isLoad: false
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
      }
      this.isLoad = true;
    },
    methods: {
      cancelHandler() {
        this.$emit('myClosed', false);
      },
      myBirthdayDate(value) {
        this.form.出生日期 = value;
      },
      myBeginDate(value) {
        this.form.入院日期 = value;
      },
      myEndDate(value) {
        this.form.出院日期 = value;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.addEditPatient();
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditPatient: async function() {
        await this.$http.myPost(URL_SETTING.POST_ADD_OR_EDIT_PATIENT, this.form);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);
      }
    }
  };
</script>
