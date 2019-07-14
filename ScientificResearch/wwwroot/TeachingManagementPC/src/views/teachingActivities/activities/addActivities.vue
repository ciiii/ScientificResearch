<template>
  <div class="app-container page-common page-addStudent page-addActivities">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small" class="demo-ruleForm"
             v-if="isLoad">
      <el-form-item label="活动主题" prop="Model.活动主题" class="el-form-item-block">
        <el-input v-model="form.Model.活动主题"></el-input>
      </el-form-item>
      <el-form-item label="活动类别" prop="Model.活动类别">
        <el-input v-model="form.Model.教学活动类型名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="主讲人" class="form-item" prop="Model.主讲人姓名" v-clickoutside="handleClose">
        <el-input v-model="form.Model.主讲人姓名" readonly/>
        <selectUser @myEvent="myEventUser" v-if="isUser"></selectUser>
        <el-button @click="isUser=true">选择主讲人</el-button>
        <!--<span class="explain">* 如果不是本医院管理员或者带教老师，请在输入框中输入主讲人姓名。</span>-->
      </el-form-item>
      <el-form-item label="主讲人职称">
        <el-input v-model="form.Model.主讲人职称"/>
      </el-form-item>
      <el-form-item label="病人" class="item-width">
        <el-input v-model="form.Model.病人姓名" readonly></el-input>
        <el-button @click="clickPatient">选择病人</el-button>
        <span class="explain">* 只能选1位病人。</span>
      </el-form-item>
      <el-form-item label="教学病例">
        <el-input v-model="form.Model.教学病例"></el-input>
      </el-form-item>
      <el-form-item label="接收者类型">
        <el-radio-group v-model="peopleType">
          <el-radio label="0">所有人</el-radio>
          <el-radio label="1">学员</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="配置接收学员" v-if="peopleType=='1'">
        <el-input v-model="studentNames" readonly></el-input>
        <el-button @click="clickStudent">选择学员</el-button>
      </el-form-item>
      <el-form-item label="活动地点" prop="Model.活动地点" class="item-address">
        <el-input v-model="form.Model.活动地点"></el-input>
        <span class="explain">* XX楼XX科XX室 。</span>
      </el-form-item>
      <el-form-item label="活动时间" prop="Model.活动开始时间">
        <datePicker :date="time" :placeholder="placeholder" type="datetimerange" @myEvent="changeTime"></datePicker>
      </el-form-item>
      <el-form-item label="附件" class="uploadFile-box">
        <uploadFileOrImg :url="url" @myEvent="myEventFiles" :files="files"
                         @removeFile="removeFile"></uploadFileOrImg>
      </el-form-item>
      <el-form-item label="活动内容" class="el-form-item-block" prop="Model.活动内容">
        <tinymce :height="400" v-model="form.Model.活动内容"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer footer-box">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="big-dialog common-dialog">
      <component :is="pageUrl" @myEvent="getMyEvent"/>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_ACTIVITY, URL_SETTING, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl, clickoutside } from '@/assets/js/Common';
  import Tinymce from '@/components/Tinymce';
  import uploadFileOrImg from '@/components/uploadFileOrImg';
  import datePicker from '@/components/datePicker';
  import selectStudentTable from '@/components/setting/selectStudentTable';
  import selectPatientTable from '@/components/setting/selectPatientTable';
  import selectUser from '@/components/setting/selectUser';

  export default {
    name: 'addActivities',
    components: {
      Tinymce,
      uploadFileOrImg,
      datePicker,
      selectStudentTable,
      selectPatientTable,
      selectUser
    },
    data() {
      return {
        form: {
          Model: {
            编号: 0,
            活动主题: '',
            活动开始时间: '',
            活动结束时间: '',
            活动地点: '',
            教学活动类型编号: 0,
            教学活动类型名称: '',
            主讲人编号: 0,
            主讲人姓名: '',
            主讲人职称: '',
            活动内容: '',
            教学病例: '',
            病人编号: null,
            病人姓名: '',
            附件: '',
            建立人: 0,
            建立人姓名: 0,
            建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
            备注: ''
          },
          List: []
        },
        rules: {
          活动主题: [
            { required: true, message: '请输入活动主题！', trigger: 'blur' }
          ],
          主讲人姓名: [
            { required: true, message: '请选择主讲人！', trigger: 'blur' }
          ],
          活动开始时间: [
            { required: true, message: '请选择活动开始时间！', trigger: 'blur' }
          ],
          活动结束时间: [
            { required: true, message: '请选择活动结束时间！', trigger: 'blur' }
          ],
          活动地点: [
            { required: true, message: '请填写活动地点！', trigger: 'blur' }
          ],
          教学活动类型编号: [
            { required: true, message: '请选择教学活动类型！', trigger: 'blur' }
          ],
          活动内容: [
            { required: true, message: '请填写活动内容！', trigger: 'blur' }
          ]
        },
        url: getUrl(HTTP_URL_HOST + URL_ACTIVITY.POST_UPLOAD_ACTIVITY_FILE),
        types: [],
        time: [],
        peopleType: '0',
        isDialog: false,
        isAdd: true,
        isLoad: false,
        isStudent: false,
        isUser: false,
        selectStudents: [],
        files: [],
        directives: { clickoutside },
        title: '',
        studentNames: '',
        pageUrl: 'selectStudentTable',
        placeholder: {
          start: '开始日期',
          end: '结束日期'
        }
      };
    },
    directives: { clickoutside },
    mounted() {
      if (sessionStorage.getItem('itemData')) {
        let itemData = JSON.parse(sessionStorage.getItem('itemData'));
        this.isAdd = itemData.isAdd;
        if (!this.isAdd) {
          this.$route.meta.title = '修改' + itemData.type.name;
          this.getDetails(itemData.item.编号);
        } else {
          this.$route.meta.title = '添加' + itemData.type.name;
          this.form.Model.教学活动类型编号 = itemData.type.id;
          this.form.Model.教学活动类型名称 = itemData.type.name;
          this.form.Model.活动内容 = itemData.type.content;
          if (localStorage.getItem('userInfo')) {
            let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
            this.form.Model.建立人 = userInfo.编号;
            this.form.Model.建立人姓名 = userInfo.姓名;
          }
          this.isLoad = true;
        }
        this.getTypes();
      }
    },
    methods: {
      getTypes: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TEACHING_ACTIVITIES_CLASSIFY, '');
        if (data && data.length > 0) {
          this.types = data.reverse();
        }
      },
      getDetails: async function(id) {
        let postData = {
          教学活动编号: id
        };

        let data = await this.$http.myGet(URL_ACTIVITY.GET_ACTIVITY_DETAILS, postData);
        if (data && data.教学活动) {
          this.form.Model = data.教学活动;
          this.form.List = data.可参与者;
          this.time = [this.form.Model.活动开始时间, this.form.Model.活动结束时间];
          if (this.form && this.form.Model.附件 != '') {
            this.files = this.form.Model.附件.split(',');
          }
          if (this.form.List && this.form.List.length > 0) {
            if (this.form.List[0].学员编号 == 0) {
              this.peopleType = '0';
            } else {
              this.peopleType = '1';
              let arr = [];
              this.form.List.forEach(function(item) {
                arr.push(item.学员编号);
              });
              this.selectStudents = arr;
              let studentArr = this.getNameArr();
              this.studentNames = studentArr.join();
            }
            this.isLoad = true;
          }
        }
      },
      changeTime(time) {
        this.time = time;
        if (this.time && this.time.length != 0) {
          this.form.Model.活动开始时间 = formatDate(this.time[0], 'yyyy-MM-dd hh:mm:ss');
          this.form.Model.活动结束时间 = formatDate(this.time[1], 'yyyy-MM-dd hh:mm:ss');
        }
      },
      getNameArr() {
        let newArr = [];
        this.form.List.forEach(function(item) {
          newArr.push(item.学员姓名);
        });
        return newArr;
      },
      clickStudent() {
        this.title = '选择学员';
        this.pageUrl = 'selectStudentTable';
        this.isDialog = true;
      },
      clickPatient() {
        this.title = '选择病人';
        this.pageUrl = 'selectPatientTable';
        this.isDialog = true;
      },
      handleClose(e) {
        this.isUser = false;
      },
      myEventFiles(arr) {
        this.files.push(arr);
      },
      removeFile(value) {
        this.files.splice(this.files.findIndex(item => item == value), 1);
      },
      getArr() {
        let arr = [];
        let newArr = [];
        if (this.peopleType == '0') {
          arr = [0];
        } else {
          arr = this.selectStudents;
        }
        arr.forEach((item) => {
          let data = {
            编号: 0,
            学员编号: item,
            备注: ''
          };
          newArr.push(data);
        });
        this.form.List = newArr;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.getArr();
            if (!this.form.List || this.form.List.length == 0) {
              this.$message.error('请选择接受者！');
              return false;
            }
            if (this.files && this.files.length > 0) {
              this.form.Model.附件 = this.files.join();
            }
            console.info(this.form);
            this.addEditActivity(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditActivity: async function(data) {
        await this.$http.myPost(URL_ACTIVITY.POST_ADD_EDIT_ACTIVITY, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/activitiesList', query: { type: this.form.Model.教学活动类型编号 } });
      },
      getMyEvent(arr) {
        if (this.pageUrl == 'selectStudentTable') {
          this.getMyEventStudents(arr);
        } else {
          this.getMyEventPatient(arr);
        }
      },
      getMyEventStudents(arr) {
        this.isDialog = false;
        this.selectStudents = [];
        let names = [];
        arr.forEach((item) => {
          names.push(item.姓名);
          this.selectStudents.push(item.编号);
        });
        this.studentNames = names.join();
      },
      getMyEventPatient(arr) {
        this.isDialog = false;
        this.form.Model.病人编号 = arr[0].编号;
        this.form.Model.病人姓名 = arr[0].姓名;
      },
      myEventUser(item) {
        this.form.Model.主讲人姓名 = item.姓名;
        this.form.Model.主讲人编号 = item.编号;
        this.form.Model.主讲人职称 = item.职务名称;
        this.isUser = false;
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .addActivities {
    .uploadFile-box {
      .el-form-item__content {
        width: 40% !important;
      }
    }
  }
</style>
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

  .uploadFile-box {
    width: 100% !important;

    .upload-demo {
      width: 40%;
    }
  }

  .el-item {
    width: 20% !important;
  }

  .item-width {
    .el-input {
      width: 50% !important;
    }
  }

  .item-address {
    .el-input {
      width: 70% !important;
    }
  }

  .form-item {
    .el-input {
      width: 200px !important;
    }
  }

  .demo-ruleForm .el-select {
    display: block;
  }

</style>
