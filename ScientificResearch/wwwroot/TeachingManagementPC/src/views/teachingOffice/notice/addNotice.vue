<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small" class="demo-ruleForm"
             v-if="isLoad">
      <el-form-item label="通知名称" prop="通知名称" class="el-form-item-block">
        <el-input v-model="form.通知名称"></el-input>
      </el-form-item>
      <el-form-item label="通知类型" prop="通知类型">
        <el-select v-model="form.通知类型" placeholder="请选择" width="80%">
          <el-option v-for="item in types" :key="item.编号" :label="item.值" :value="item.值"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="发布人">
        <el-input v-model="form.发送人姓名" disabled/>
      </el-form-item>
      <el-form-item label="关闭时间" prop="关闭时间">
        <selectDateAfter ref="date" :date="form.关闭时间" type="date" format="yyyy-MM-dd" @myEvent="myGetDate"
                         title="选择日期"></selectDateAfter>
      </el-form-item>
      <el-form-item label="是否必读" prop="是否必读">
        <el-radio-group v-model="form.是否必读">
          <el-radio :label="true">是</el-radio>
          <el-radio :label="false">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="接收者类型">
        <el-radio-group v-model="peopleType">
          <el-radio label="人员">人员</el-radio>
          <el-radio label="教学学员">教学学员</el-radio>
          <el-radio label="部门">部门</el-radio>
          <el-radio label="教学角色">教学角色</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="配置接收人" v-if="peopleType=='人员'">
        <el-input v-model="userNames" readonly></el-input>
        <el-button @click="clickUser">选择人员</el-button>
      </el-form-item>
      <el-form-item label="配置接收学员" v-if="peopleType=='教学学员'">
        <el-input v-model="studentNames" readonly></el-input>
        <el-button @click="clickStudent">选择学员</el-button>
      </el-form-item>
      <el-form-item label="配置接收部门" v-if="peopleType=='部门'" v-clickoutside="handleClose">
        <el-input v-model="departments" @focus="isShow=true" />
        <treeDepartmentMultiple ref="child" :selectArr="selectdepartments"
                                @myEvent="getMyEventDepartment" v-if="isShow"></treeDepartmentMultiple>
      </el-form-item>
      <el-form-item label="配置接收角色" v-if="peopleType=='教学角色'">
        <selectRoleMultiple ref="child" :selectArr="selectRoles" @myEvent="getMyEventRoles"
                            v-if="isLoad"></selectRoleMultiple>
      </el-form-item>
      <el-form-item label="相关文件路径" prop="相关文件路径" class="uploadFile-box">
        <uploadFileOrImg :url="url" @myEvent="myEventFiles" :files="files"
                         @removeFile="removeFile"></uploadFileOrImg>
      </el-form-item>
      <el-form-item label="通知内容" class="el-form-item-block" prop="通知内容">
        <tinymce :height="400" v-model="form.通知内容"/>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer footer-box">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               class="big-dialog common-dialog">
      <selectUserTable v-if="isUser" ref="child" @myEvent="getMyEventUsers" :selectArr="selectUsers"></selectUserTable>
      <selectStudentTable v-else ref="child" @myEvent="getMyEventStudents"
                          :selectArr="selectStudents"></selectStudentTable>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_OFFICE, URL_BASE_INFO, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl, clickoutside } from '@/assets/js/Common';
  import selectDateAfter from '@/components/selectDateAfter';
  import Tinymce from '@/components/Tinymce';
  import uploadFileOrImg from '@/components/uploadFileOrImg';
  import selectUserTable from '@/components/setting/selectUserTable';
  import selectStudentTable from '@/components/setting/selectStudentTable';
  import treeDepartmentMultiple from '@/components/setting/treeDepartmentMultiple';
  import selectRoleMultiple from '@/components/setting/selectRoleMultiple';

  export default {
    name: 'addNotice',
    components: {
      selectDateAfter,
      Tinymce,
      uploadFileOrImg,
      selectUserTable,
      selectStudentTable,
      treeDepartmentMultiple,
      selectRoleMultiple
    },
    data() {
      return {
        form: {
          编号: 0,
          通知类型: '',
          发送人编号: 0,
          发送人姓名: '',
          通知名称: '',
          关闭时间: '',
          相关文件路径: '',
          通知内容: '',
          是否启用: true,
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: '',
          是否必读: true
        },
        List: [],
        rules: {
          通知名称: [
            { required: true, message: '请输入通知名称！', trigger: 'blur' }
          ],
          通知类型: [
            { required: true, message: '请选择通知类型！', trigger: 'blur' }
          ],
          关闭时间: [
            { required: true, message: '请选择关闭时间！', trigger: 'blur' }
          ],
          通知内容: [
            { required: true, message: '请填写通知内容！', trigger: 'blur' }
          ]
        },
        url: getUrl(HTTP_URL_HOST + URL_OFFICE.POST_UPLOAD_NOTICE_IMG),
        types: [],
        peopleType: '人员',
        isDialog: false,
        isAdd: true,
        isLoad: false,
        isShow: false,
        isUser: false,
        departments: '',
        selectUsers: [],
        selectStudents: [],
        selectdepartments: [],
        selectRoles: [],
        files: [],
        title: '',
        userNames: '',
        studentNames: ''
      };
    },
    directives: { clickoutside },
    mounted() {
      if (sessionStorage.getItem('itemData')) {
        let itemData = JSON.parse(sessionStorage.getItem('itemData'));
        this.isAdd = itemData.isAdd;
        if (!this.isAdd) {
          this.$route.meta.title = '修改通知';
          let item = itemData.item;
          this.getDetails(item.编号);
        } else {
          this.$route.meta.title = '添加通知';
          if (localStorage.getItem('userInfo')) {
            let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
            this.form.发送人编号 = userInfo.编号;
            this.form.发送人姓名 = userInfo.姓名;
          }
          this.isLoad = true;
        }
        this.getTypes();
      }
    },
    methods: {
      getTypes: async function() {
        let postData = {
          分类: '通知类型'
        };
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData);
        if (data && data.length > 0) {
          this.types = data.reverse();
        }
      },
      getDetails: async function(id) {
        let postData = {
          编号: id
        };
        let data = await this.$http.myGet(URL_OFFICE.GET_NOTICE_DETAILS, postData);
        if (data && data.通知公告) {
          this.form = data.通知公告;
          this.List = data.接收条件;
          if (this.form && this.form.相关文件路径 != '') {
            this.files = this.form.相关文件路径.split(',');
          }
          if (this.List && this.List.length > 0) {
            this.peopleType = this.List[0].接收者类型;

            this.getSelectArr(this.peopleType);
          }
          this.isLoad = true;
        }
      },
      getNameArr() {
        let newArr = [];
        this.List.forEach(function(item) {
          newArr.push(item.接收者名称);
        });
        return newArr;
      },
      getSelectArr(type) {
        let arr = [];
        this.List.forEach(function(item) {
          arr.push(item.接收者编号);
        });
        switch (type) {
          case '人员':
            this.selectUsers = arr;
            let nameArr = this.getNameArr();
            this.userNames = nameArr.join();
            break;
          case '教学学员':
            this.selectStudents = arr;
            let studentArr = this.getNameArr();
            this.studentNames = studentArr.join();
            break;
          case '部门':
            this.selectdepartments = arr;
            let newArr = [];
            this.List.forEach(function(item) {
              newArr.push(item.接收者名称);
            });
            this.departments = newArr.join();
            break;
          case '教学角色':
            this.selectRoles = arr;
            break;
        }
      },
      clickUser() {
        this.title = '选择人员';
        this.isDialog = true;
        this.isUser = true;
      },
      clickStudent() {
        this.title = '选择学员';
        this.isDialog = true;
        this.isUser = false;
      },
      handleClose(e) {
        this.isShow = false;
      },
      myGetDate(value) {
        this.form.关闭时间 = value;
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
        switch (this.peopleType) {
          case '人员':
            arr = this.selectUsers;
            break;
          case '教学学员':
            arr = this.selectStudents;
            break;
          case '部门':
            arr = this.selectdepartments;
            break;
          case '教学角色':
            arr = this.selectRoles;
            break;
        }
        arr.forEach((item) => {
          let data = {
            编号: 0,
            接收者类型: this.peopleType,
            接收者编号: item
          };
          newArr.push(data);
        });
        this.List = newArr;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.getArr();
            if (!this.List || this.List.length == 0) {
              this.$message.error('请选择' + this.peopleType + '接受者！');
              return false;
            }
            if (this.files && this.files.length > 0) {
              this.form.相关文件路径 = this.files.join();
            }
            let data = {
              Model: this.form,
              List: this.List
            };
            this.addEditNotice(data);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditNotice: async function(data) {
        await this.$http.myPost(URL_OFFICE.POST_ADD_OR_EDIT_NOTICE, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/notice' });
      },
      getMyEventUsers(arr) {
        this.isDialog = false;
        this.selectUsers = [];
        let names = [];
        arr.forEach((item) => {
          names.push(item.姓名);
          this.selectUsers.push(item.编号);
        });
        this.userNames = names.join();
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
      getMyEventDepartment(node) {
        let arrName = [];
        let arrId = [];
        node.forEach(function(item) {
          arrName.push(item.名称);
          arrId.push(item.编号);
        });
        this.departments = arrName.join();
        this.selectdepartments = arrId;
      },
      getMyEventRoles(arr) {
        this.selectRoles = arr;
      }
    }
  };
</script>
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
    width: 40% !important;
  }

  .el-item {
    width: 20% !important;
  }

  .form-item {
    width: 70% !important;;

    .el-input {
      width: 20% !important;
    }
  }

  .demo-ruleForm .el-select {
    display: block;
  }

</style>
