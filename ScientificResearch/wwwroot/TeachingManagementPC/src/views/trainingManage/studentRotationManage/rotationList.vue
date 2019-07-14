<template>
  <div class="app-container page-common page-rotaion">
    <h4 class="page-title" align="center">学员轮转管理</h4>
    <div class="btn-box">
      <el-button class="filter-item" type="success" @click="btnAutomaticRotation" size="small">
        <i class="iconfont iconliucheng"></i> 自动分配轮转
      </el-button>
      <el-button class="filter-item" type="warning" @click="btnDepartmentReport" size="small">
        <i class="iconfont iconkeshikucunguanli"></i> 按科室统计
      </el-button>
     <!-- <el-button class="filter-item" type="primary" @click="btnBatchReport('导入轮转安排',true,'')" size="small">
        <i class="iconfont icon-update"></i> 导入轮转安排
      </el-button>-->
      <el-button class="filter-item" type="danger" @click="btnBatchDel" size="small">
        <i class="iconfont iconshanchu"></i> 批量删除轮转计划
      </el-button>
      <span class="explain">(说明：点击科室可修改学员轮转。)</span>
    </div>
    <rotationList @myEvent="myEvent" @myEventSelect="myEventSelect" :state="state"></rotationList>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT } from '@/assets/js/connect/ConSysUrl';
  import rotationList from '@/components/rotation/rotationList';

  export default {
    components: { rotationList },
    data() {
      return {
        item: {},
        isShow: false,
        multipleSelection: [],
        state: '轮转计划已安排'
      };
    },
    created() {
      if (this.$route.query.state) {
        this.state = this.$route.query.state;
      }
    },
    methods: {
      btnBatchDel() {
        if (this.state == '轮转计划已安排') {
          if (this.multipleSelection.length == 0) {
            this.$message.error('请先勾选需要删除的学员轮转计划安排！');
          } else {
            this.$confirm('确认删除已选学员轮转计划安排吗?', '提示', {
              type: 'warning'
            }).then(() => {
              let arr = [];
              this.multipleSelection.forEach((item) => {
                arr.push(item.学员信息.编号);
              });
              this.delRotationArrange(arr);
              this.$router.push({ path: '/editRotation' });
            });
          }
        } else {
          this.$message.error('学员状态必须是【未入科】才可以删除！');
        }
      },
      btnAutomaticRotation() {
        this.$router.push({ path: '/automaticRotation' });
      },
      btnDepartmentReport() {
        this.$router.push({ path: '/departmentReportStatistics' });
      },
      editRotation(item) {
        if (this.state == '轮转计划已安排') {
          sessionStorage.setItem('item', JSON.stringify(item));
          this.$router.push({ path: '/editRotation' });
        }
      },
      delRotationArrange: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.POST_BATCH_DELETE_ROTATION_ARRANGE, data);
        this.$message.success('提交成功！');
        this.$router.push({ path: '/rotationList' });
      },
      myEvent(item, state) {
        this.state = state;
        this.editRotation(item);
      },
      myEventSelect(arr, state) {
        this.state = state;
        this.multipleSelection = arr;
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .btn-box {
    margin-bottom: 10px;
  }
</style>


