<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="120px" size="small">
      <el-form-item label="部门名称" prop="名称">
        <el-input v-model="form.名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="科室管理员" prop="科室管理员姓名" class="name">
        <el-input v-model="form.科室管理员姓名" readonly></el-input>
        <el-button @click="clickUser" type="success" plain>选择人员</el-button>
        <selectUser ref="child" :number="item.科室管理员编号" @myEvent="getMyEvent" v-if="isShow"
                    v-clickoutside="handleCloseUser"></selectUser>
      </el-form-item>
      <el-form-item label="最大学员人数" prop="最大学员人数">
        <el-input v-model="form.最大学员人数" type="number"></el-input>
      </el-form-item>
      <el-form-item label="带教老师" class="name" v-clickoutside="handleClose">
        <el-input v-model="names" readonly></el-input>
        <el-button @click="clickTeachers" type="primary" plain>选择老师</el-button>
        <selectUserMultiple ref="child" :selectUsers="selectUsers" @myEvent="getMyEventMultiple"
                            v-if="isShowTeacher"></selectUserMultiple>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_ORGANIZATION, URL_USER } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, arrayToJson, deepCopy, clickoutside } from '@/assets/js/Common';
  import cascaderDepartment from '@/components/setting/cascaderDepartment';
  import selectUser from '@/components/setting/selectUser';
  import selectUserMultiple from '@/components/setting/selectUserMultiple';

  export default {
    name: 'add',
    props: ['item', 'teachers'],
    components: { cascaderDepartment, selectUser, selectUserMultiple },
    data() {
      return {
        form: {
          编号: 0,
          科室管理员编号: '',
          科室管理员姓名: '',
          最大学员人数: '',
          备注: ''
        },
        rules: {  //表单验证
          科室管理员姓名: [
            { required: true, message: '请设置科室管理员！', trigger: 'blur' }
          ],
          最大学员人数: [
            { required: true, message: '请输入最大学员人数！', trigger: 'blur' }
          ]
        },
        selectUsers: [],
        isLoad: false,
        isShow: false,
        isShowTeacher: false,
        names: ''
      };
    },
    directives: { clickoutside },
    mounted() {
      this.form = {
        编号: this.item.编号,
        名称: this.item.名称,
        科室管理员编号: this.item.科室管理员编号,
        科室管理员姓名: this.item.科室管理员姓名,
        最大学员人数: this.item.最大学员人数,
        备注: this.item.备注
      };
      let arr = [];
      let name = [];
      this.teachers.forEach(function(item) {
        arr.push(item.带教老师编号);
        name.push(item.姓名);
      });
      this.isLoad = true;
      this.selectUsers = arr;
      this.names = name.join();
    },
    methods: {
      getMyEvent(item) {
        this.form.科室管理员编号 = item.编号;
        this.form.科室管理员姓名 = item.姓名;
        this.isShow = false;
      },
      getMyEventMultiple(arr) {
        this.selectUsers = [];
        let name = [];
        arr.forEach((item) => {
          this.selectUsers.push(item.编号);
          name.push(item.姓名);
        });
        this.names = name.join();
      },
      clickUser() {
        this.isShow = true;
      },
      handleCloseUser() {
        this.isShow = false;
      },
      handleChange(value) {
        this.form.上级部门编号 = value[value.length - 1];
      },
      clickTeachers() {
        this.isShowTeacher = true;
      },
      handleClose(e) {
        this.isShowTeacher = false;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            let postData = {
              Model: this.form,
              List: []
            };
            this.selectUsers.forEach(function(item) {
              let data = {
                带教老师编号: item,
                备注: ''
              };
              postData.List.push(data);
            });
            this.addOrEditTeachingDepartment(postData);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addOrEditTeachingDepartment: async function(data) {
        await this.$http.myPost(URL_ORGANIZATION.POST_ADD_EDIT_TEACHING_DEPARTMENT_AND_TEACHER, data);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);
      },
      cancelHandler() {
        this.$emit('myEvent', false);
      }
    }
  };
</script>
<style></style>
<style type="text/scss" lang="scss" scoped>
  .content-box .paging {
    border-top: 1px solid #eee;
    padding-right: 15px;
    font-size: 12px !important;
  }

  .el-select {
    width: 100% !important;
  }

  .el-form-item.name {
    .el-input {
      width: 70%;
    }
  }
</style>
