<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small">
      <el-form-item label="文件名称" prop="文件名称">
        <el-input v-model="form.文件名称"></el-input>
      </el-form-item>
      <el-form-item label="文件类型" prop="文件类型">
        <el-select v-model="form.文件类型" placeholder="请选择">
          <el-option v-for="item in types" :key="item.编号" :label="item.值" :value="item.值"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="上传人">
        <el-input v-model="form.上传人姓名" disabled/>
      </el-form-item>
      <el-form-item label="上传人部门">
        <el-input v-model="form.上传人部门名称" disabled/>
      </el-form-item>
      <el-form-item label="是否启用" prop="是否启用">
        <template slot-scope="scope">
          <el-switch class="switch"
                     style="display: block"
                     v-model="form.是否启用"
                     active-color="#13ce66"
                     inactive-color="#ff4949"
                     active-text="启用">
          </el-switch>
        </template>
      </el-form-item>
      <el-form-item label="文件上传" class="uploadFile-box" v-if="isLoad">
        <uploadFileOrImg :url="url" @myEvent="myEventFiles" :files="files"
                         @removeFile="removeFile"></uploadFileOrImg>
      </el-form-item>
      <el-form-item label="文件说明">
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
  import { HTTP_URL_HOST, URL_OFFICE } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import uploadFileOrImg from '@/components/uploadFileOrImg';

  export default {
    name: 'addDownload',
    props: ['item', 'isAdd', 'types'],
    components: { uploadFileOrImg },
    data() {
      return {
        list: [],
        form: {
          编号: 0,
          文件名称: '',
          文件类型: '',
          文件路径: '',
          是否启用: true,
          上传人编号: 0,
          上传人姓名: '',
          上传人部门名称: '',
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        rules: {
          文件名称: [
            { required: true, message: '请输入文件名称！', trigger: 'blur' }
          ],
          文件类型: [
            { required: true, message: '请选择文件类型！', trigger: 'blur' }
          ]
        },
        url: getUrl(HTTP_URL_HOST + URL_OFFICE.URL_POST_UPLOAD_DOWNLOAD_FILE),
        files: [],
        isLoad: false
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
        if (this.form.文件路径 != '') {
          this.files = this.form.文件路径.split(',');
        }
        this.isLoad = true;
      } else {
        if (localStorage.getItem('userInfo')) {
          let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
          this.form.上传人编号 = userInfo.编号;
          this.form.上传人姓名 = userInfo.姓名;
          this.form.上传人部门名称 = userInfo.部门名称;
          this.isLoad = true;
        }
      }
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
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
              this.form.文件路径 = this.files.join();
            } else {
              this.$message.error('请上传文件！');
              return false;
            }
            this.addEditTask(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditTask: async function(data) {
        await this.$http.myPost(URL_OFFICE.URL_POST_ADD_OR_EDIT_DOWNLOAD, data);
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
