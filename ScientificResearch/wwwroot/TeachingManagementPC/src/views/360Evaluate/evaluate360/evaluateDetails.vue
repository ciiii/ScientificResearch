<template>
  <div class="app-container page-common page-addStudent page-addEvaluate" v-if="isLoad">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)">
        <i class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <h5 class="title">评价信息：（ <span>{{item.评价人类型}}对{{item.被评价人类型}}</span> ）</h5>
    <table class="mailTable">
      <tr>
        <th>评价方向</th>
        <td colspan="5">{{item.评价人类型}}对{{item.被评价人类型}}</td>
      </tr>
      <tr>
        <th>评价人</th>
        <td>{{item.评价人姓名}}</td>
        <th>评价人类型</th>
        <td>{{item.评价人类型}}</td>
        <th>被评价人</th>
        <td>{{item.被评价人姓名}}</td>
      </tr>
      <tr>
        <th>被评价人类型</th>
        <td>{{item.被评价人类型}}</td>
        <th>平均得分</th>
        <td>{{item.平均评分}}分</td>
        <th>评价时间</th>
        <td>{{item.评价时间|dataFormat('yyyy-MM-dd hh:mm:ss')}}</td>
      </tr>
      <tr>
        <th>评价内容</th>
        <td colspan="5">{{item.评价内容}}</td>
      </tr>
    </table>
    <div class="content">
      <h5 class="title">评价项目得分详情：</h5>
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
                  <el-rate v-model="scopeChild.row.rete" :max="defaultVal" show-text disabled></el-rate>
                </template>
              </el-table-column>
              <el-table-column label="说明" prop="备注"></el-table-column>
            </el-table>
          </template>
        </el-table-column>
        <el-table-column label="评价项目" prop="分类信息.名称" align="left"></el-table-column>
      </el-table>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_360EVALUATE, URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { getHtmlDocName, getUrl } from '@/assets/js/Common';

  export default {
    name: 'activitiesDetails',
    data() {
      return {
        isLoad: false,
        item: {},
        defaultVal: 5,
        scorings: [],
        projects: [],
        getRowKeys(row) {
          return row.分类信息.编号;
        }
      };
    },
    mounted() {
      if (sessionStorage.getItem('item')) {
        this.item = JSON.parse(sessionStorage.getItem('item'));
        this.getEvaluationScoring(this.item.编号);
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
      getEvaluationScoring: async function(id) {
        let postData = {
          教学360评价编号: id
        };
        let data = await this.$http.myGet(URL_360EVALUATE.GET_EVALUATE_SCORE, postData);
        if (data && data.length > 0) {
          this.scorings = data;
          this.getTypeAndProject(this.item.目标类型);
          this.isLoad = true;
        }
      },
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
</style>
