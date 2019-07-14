<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small" class="demo-ruleForm"
             v-if="isLoad">
      <el-form-item label="学员姓名">
        <el-input v-model="form.学员姓名" disabled></el-input>
      </el-form-item>
      <el-form-item label="本院科室">
        <el-input v-model="form.本院科室名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="处理类别" prop="处理类别">
        <el-select v-model="form.处理类别" placeholder="请选择" width="80%">
          <el-option v-for="item in types" :key="item.编号" :label="item.值" :value="item.值"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="处理日期" prop="处理日期">
        <selectDate ref="date" :date="form.处理日期" type="date" format="yyyy-MM-dd" @myEvent="myGetDate"
                    title="选择日期"></selectDate>
      </el-form-item>
      <el-form-item label="附件" prop="附件" class="uploadFile-box el-form-item-block">
        <uploadFileOrImg :url="url" @myEvent="myEventFiles" :files="files"
                         @removeFile="removeFile"></uploadFileOrImg>
      </el-form-item>
      <el-form-item label="处理原因" class="el-form-item-block" prop="处理原因">
        <el-input v-model="form.处理原因" type="textarea"/>
      </el-form-item>
      <el-form-item label="处理意见" class="el-form-item-block" prop="处理意见">
        <el-input v-model="form.处理意见" type="textarea"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT, HTTP_URL_HOST, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import selectDate from '@/components/selectDate';
  import uploadFileOrImg from '@/components/uploadFileOrImg';

  export default {
    name: 'addEditRecordForm',
    props: ['item', 'isAdd'],
    components: { selectDate, uploadFileOrImg },
    data() {
      return {
        form: {
          编号: 0,
          教学轮转编号: '',
          处理日期: formatDate(new Date(), 'yyyy-MM-dd'),
          处理类别: '',
          处理原因: '',
          处理意见: '',
          学员姓名: '',
          本院科室名称: '',
          附件: ''
        },
        rules: {
          处理类别: [
            { required: true, message: '请输入处理类别！', trigger: 'blur' }
          ],
          处理日期: [
            { required: true, message: '请选择处理日期！', trigger: 'blur' }
          ],
          处理原因: [
            { required: true, message: '请输入处理原因！', trigger: 'blur' }
          ],
          处理意见: [
            { required: true, message: '请输入处理意见！', trigger: 'blur' }
          ]
        },
        url: getUrl(HTTP_URL_HOST + URL_TEACHING_MANAGEMENT.POST_UPLOAD_MEDICAL_ERROR_RECORD),
        types: [],
        isLoad: false,
        isShow: false,
        isDialog: false,
        selectStudents: [],
        files: [],
        itemData: {}
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
        if (this.form.附件 != '') {
          this.files = this.form.附件.split(',');
        }
      } else {
        this.form.教学轮转编号 = this.item.编号;
        this.form.学员姓名 = this.item.学员姓名;
        this.form.本院科室名称 = this.item.本院科室名称;
      }
      this.getTypes();
      this.isLoad = true;
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent');
      },
      getTypes: async function() {
        let postData = {
          分类: '教学医疗事故处理类别'
        };
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData);
        if (data && data.length > 0) {
          this.types = data.reverse();
        }
      },
      myGetDate(value) {
        this.form.处理日期 = value;
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
      myEventFiles(arr) {
        this.files.push(arr);
      },
      removeFile(value) {
        this.files.splice(this.files.findIndex(item => item == value), 1);
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            if (this.files && this.files.length > 0) {
              this.form.附件 = this.files.join();
            }
            this.addEditRecord(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditRecord: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_ADD_EDIT_MEDICAL_ERROR_RECORD, data);
        this.$message.success('提交成功！');
        if (this.isAdd) {
          this.$router.push({ path: '/recordList' });
        } else {
          this.$emit('myEvent');
        }
      }
    }
  };
</script>
