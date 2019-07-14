<template>
  <div class="app-container page-common page-addStudent page-addEvaluate">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h5 class="title">{{direction.名称}}</h5>
    <el-form ref="form" :model="form" :rules="rules" label-width="150px" size="small" class="demo-ruleForm"
             v-if="isLoad">
      <el-form-item label="评价方向">
        <el-input v-model="direction.名称" disabled></el-input>
      </el-form-item>
      <el-form-item label="评价人" prop="Model.评价人姓名">
        <el-input v-model="form.Model.评价人姓名" disabled></el-input>
      </el-form-item>
      <el-form-item label="被评价人" prop="Model.被评价人姓名" v-clickoutside="handleClose">
        <el-input v-model="form.Model.被评价人姓名" @focus="isShow=true"/>
        <div v-if="isShow">
          <selectStudent @myEvent="myEventUser" v-if="form.Model.目标类型==0"></selectStudent>
          <selectRoleUser @myEvent="myEventUser" :roleId="form.Model.目标类型" v-else></selectRoleUser>
        </div>
      </el-form-item>
      <el-form-item label="被评价人类型">
        <el-input v-model="direction.被评价人类型" disabled></el-input>
      </el-form-item>
      <el-form-item label="评价内容" prop="Model.评价内容" class="el-form-item-block">
        <el-input v-model="form.Model.评价内容" type="textarea" style="width: 90%;"></el-input>
      </el-form-item>
    </el-form>
    <div class="content">
      <h5 class="title">评价项目打分：</h5>
      <el-table :data="projects" style="width: 100%" default-expand-all :row-key="getRowKeys">
        <el-table-column type="expand">
          <template slot-scope="scope">
            <el-table :data="scope.row.分类下的项目" style="width: 100%" border>
              <el-table-column label="序号" width="60" align="center">
                <template slot-scope="scopeChild">{{scopeChild.$index+1}}</template>
              </el-table-column>
              <el-table-column label="名称" prop="名称"></el-table-column>
              <el-table-column align="center" label="标准分" prop="标准分" width="100"></el-table-column>
              <el-table-column label="实际得分" prop="实际得分">
                <template slot-scope="scopeChild">
                  <el-rate v-model="scopeChild.row.rete" :max="defaultVal" show-text
                           @change="changeRate(scopeChild.row.rete,scopeChild.row)"></el-rate>
                </template>
              </el-table-column>
              <el-table-column label="说明" prop="备注"></el-table-column>
            </el-table>
          </template>
        </el-table-column>
        <el-table-column label="评价项目" prop="分类信息.名称" align="left"></el-table-column>
      </el-table>
    </div>
    <div slot="footer" class="dialog-footer footer-box">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_360EVALUATE, URL_SETTING, HTTP_URL_HOST } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl, clickoutside } from '@/assets/js/Common';
  import selectStudent from '@/components/setting/selectStudent';
  import selectRoleUser from '@/components/setting/selectRoleUser';

  export default {
    name: 'addEvaluation360',
    components: { selectStudent, selectRoleUser },
    data() {
      return {
        form: {
          Model: {
            编号: 0,
            来源类型: 0,
            评价人编号: 0,
            评价人姓名: '',
            目标类型: 0,
            被评价人编号: 0,
            被评价人姓名: '',
            评价内容: '',
            评价时间: formatDate(new Date(), 'yyyy-MM-dd'),
            备注: ''
          },
          List: []
        },
        rules: {
          评价人编号: [
            { required: true, message: '请选择评价人！', trigger: 'blur' }
          ],
          被评价人编号: [
            { required: true, message: '请选择被评价人！', trigger: 'blur' }
          ]
        },
        reqUer: {},
        list: [],
        isDialog: false,
        isAdd: true,
        isLoad: false,
        isShow: false,
        direction: '',
        projects: [],
        scorings: [],
        directives: { clickoutside },
        defaultVal: 5,
        getRowKeys(row) {
          return row.分类信息.编号;
        }
      };
    },
    directives: { clickoutside },
    mounted() {
      if (sessionStorage.getItem('itemData')) {
        let itemData = JSON.parse(sessionStorage.getItem('itemData'));
        this.direction = itemData.direction;
        console.info(itemData);
        this.isAdd = itemData.isAdd;
        if (!this.isAdd) {
          this.$route.meta.title = '修改评价';
          this.form.Model = itemData.item;
          this.getEvaluationScoring(itemData.item.编号);
        } else {
          this.$route.meta.title = '添加评价';
          if (localStorage.getItem('userInfo')) {
            let userInfo = JSON.parse(localStorage.getItem('userInfo')).人员;
            this.form.Model.评价人编号 = userInfo.编号;
            this.form.Model.评价人姓名 = userInfo.姓名;
            this.form.Model.来源类型 = itemData.来源类型;
            this.form.Model.目标类型 = itemData.目标类型;
          }
          this.isLoad = true;
        }
        this.getTypeAndProject(itemData.目标类型);
      }
    },
    methods: {
      getTypeAndProject: async function(id) {
        let postData = {
          目标类型: id
        };
        let data = await this.$http.myGet(URL_SETTING.GET_360_EVALUATE_CLASSIFY_AND_PROJECT, postData);
        if (data && data.length > 0) {
          if (!this.isAdd) {
            data.forEach((item) => {
              if (item.分类下的项目.length > 0) {
                item.分类下的项目.forEach((child) => {
                  this.scorings.find((item) => {
                    if (child.编号 == item.教学360评价项目编号) {
                      child.实际得分 = item.评分;
                      child.rete = Math.round(child.实际得分 / child.标准分 * this.defaultVal);
                    }
                  });
                });
              }
            });
          }
          this.projects = data;
        }
      },
      changeRate(value, item) {
        item.实际得分 = Math.round(item.标准分 / this.defaultVal * value);
      },
      getEvaluationScoring: async function(id) {
        let postData = {
          教学360评价编号: id
        };
        let data = await this.$http.myGet(URL_360EVALUATE.GET_EVALUATE_SCORE, postData);
        if (data && data.length > 0) {
          this.scorings = data;
          this.isLoad = true;
        }
      },
      handleClose(e) {
        this.isShow = false;
      },
      getNewList() {
        let arr = [];
        this.projects.forEach((item) => {
          if (item.分类下的项目.length > 0) {
            item.分类下的项目.forEach((child) => {
              if (child.实际得分 && child.实际得分 > 0) {
                let data = {
                  编号: 0,
                  教学360评价项目编号: child.编号,
                  评分: child.实际得分
                };
                arr.push(data);
              }
            });
          }
        });
        this.form.List = arr;
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.getNewList();
            if (!this.form.List || this.form.List.length == 0) {
              this.$message.error('请给评价项目打分！');
              return false;
            }
            this.addEdit360Evaluation(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEdit360Evaluation: async function(data) {
        await this.$http.myPost(URL_360EVALUATE.POST_ADD_EDIT_360EVALUATE, data);
        this.$message.success('提交成功！');
        this.$router.go(-1);
      },
      myEventUser(item) {
        this.form.Model.被评价人姓名 = item.姓名;
        this.form.Model.被评价人编号 = item.编号;
        this.isShow = false;
      }
    }
  };
</script>
<style type="text/scss" lang="scss">
  .page-addEvaluate {
    .el-table__expanded-cell {
      padding: 0 50px;
    }
  }
</style>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/AddStudent.scss";

  .page-addEvaluate {
    .demo-ruleForm {
      overflow: unset;

      .el-form-item {
        width: 49%;
        float: none;
        display: inline-block;
      }

      .el-form-item-block {
        width: 100%;
      }
    }

    .rotation-box {
      width: 80%;
    }
  }

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

</style>
