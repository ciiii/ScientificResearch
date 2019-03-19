<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本资料">
        <ul class="servicel">
          <h4>立项基本信息</h4>
          <li>项目中文名称：{{this.detailslList.项目中文名称}}</li>
          <li>项目英文名称：{{this.detailslList.项目英文名称}}</li>
          <li>项目编号：{{this.detailslList.项目编号}}</li>
          <li>项目分类：{{this.detailslList.项目分类}}</li>
          <li>成果归属部门：{{this.detailslList.成果归属部门}}</li>
          <li>负责人：{{this.detailslList.负责人姓名}}</li>
          <li>立项年度：{{this.detailslList.立项年度}}</li>
          <li>登记日期：{{startTime(this.detailslList.登记日期)}}</li>
          <li>批准日期：{{startTime(this.detailslList.批准日期)}}</li>
          <li>登记人：{{this.detailslList.登记人姓名}}</li>
          <li>经费卡号：{{this.detailslList.经费卡号}}</li>
          <li>项目等级：{{this.detailslList.项目等级}}</li>
          <li>计划完成日期：{{startTime(this.detailslList.计划完成日期)}}</li>
          <li>学科门类：{{this.detailslList.学科门类}}</li>
          <li>学科类型：{{this.detailslList.学科类型}}</li>
          <li>研究类型：{{this.detailslList.研究类型}}</li>
          <li>项目类型：{{this.detailslList.项目类型}}</li>
          <li>项目级别：{{this.detailslList.项目级别}}</li>
          <li>档案编号：{{this.detailslList.档案编号}}</li>
          <li>财务简称：{{this.detailslList.财务简称}}</li>
          <li>亚类说明：{{this.detailslList.亚类说明}}</li>
          <li>附注说明：{{this.detailslList.附注说明}}</li>
          <li>纵向项目合同类型：{{this.detailslList.纵向项目合同类型}}</li>
          <li>国民经济行业：{{this.detailslList.国民经济行业}}</li>
          <li>合作方式：{{this.detailslList.合作形式}}</li>
          <li>社会经济目标：{{this.detailslList.社会经济目标}}</li>
          <li>伦理批文编号：{{this.detailslList.伦理批文编号}}</li>
          <li>伦理批文时间：{{startTime(this.detailslList.伦理批文时间)}}</li>
          <li>备注：{{this.detailslList.备注}}</li>
          <h4>相关文件</h4>
          <li>伦理批文附件：</li>
          <li>
            <a :href="this.detailslList.伦理批文路径" download>{{Interception(this.detailslList.伦理批文路径)}}</a>
          </li>
          <li>立项文件：</li>
          <li>
            <a :href="this.detailslList.立项文件路径" download>{{Interception(this.detailslList.立项文件路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="参与人信息">
        <h3>参与人信息</h3>
        <ul class="servicel" v-for="(item,key) in relatedProjects" :key="key">
          <li>参与人姓名：{{item.姓名}}</li>
          <li>部门名称：{{item.部门名称}}</li>
          <li>工作量占比(%)：{{item.工作量占比}}</li>
          <li>建立时间：{{startTime(item.建立时间)}}</li>
          <li>备注：{{item.备注}}</li>
        </ul>
      </van-tab>
      <van-tab title="项目预算">
        <h3>项目预算</h3>
        <div class="total">
          <li>
            <span>批准经费(元)：</span>
            <span>{{NumFormat(this.detailslList.批准经费)}}</span>
          </li>
          <li>
            <span>配套经费(元)：</span>
            <span>{{NumFormat(this.detailslList.配套经费)}}</span>
          </li>
        </div>
        <ul class="servicel" v-for="(item,key) in authorInformation" :key="key">
          <li>项目支出类型：{{item.项目支出类型}}</li>
          <li>预算科目：{{item.财务科目}}</li>
          <li>预算金额（批准经费：元）：{{NumFormat(item.批准经费)}}</li>
          <li>预算金额（配套经费：元）：{{NumFormat(item.配套经费)}}</li>
          <li>编制依据：{{item.编制依据}}</li>
        </ul>
      </van-tab>
      <van-tab title="计划与目标">
        <div v-if="PlansandObjectives.length === 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in PlansandObjectives" :key="key">
          <li>计划开始时间：{{item.计划开始时间}}</li>
          <li>计划结束时间：{{item.计划结束时间}}</li>
          <li>计划内容：{{item.计划内容}}</li>
        </ul>
      </van-tab>
      <van-tab title="专家评审">
        <h3>专家评审</h3>
        <ul class="servicel" v-for="(item,key) in expertReview" :key="key">
          <li>专家姓名：{{item.专家姓名}}</li>
          <li>部门：{{item.专家部门名称}}</li>
          <li>评分类型：{{item.评分项}}</li>
          <li>评分：{{item.评分}}</li>
          <li>评审时间：{{startTime(item.建立时间)}}</li>
          <li>专家推荐意见：{{item.备注}}</li>
        </ul>
      </van-tab>
      <van-tab title="审核记录">
        <h3>审核记录</h3>
        <ul v-for="(item,key) in auditRecords" :key="key" class="audit">
          <li>步骤名称：{{item.名称}}</li>
          <li>处理人：{{item.姓名}}</li>
          <li>处理人部门：{{item.部门名称}}</li>
          <li class="state">
            <span :style="{'color':(item.状态说明 == flag ? '#FF976A' : '#31BD5D')}">{{item.状态说明}}</span>
            <span>
              <i class="icon iconfont icon-shijian1"></i>
              {{startTimeB(item.执行时间)}}
            </span>
          </li>
          <li>备注：{{item.备注}}</li>
        </ul>
      </van-tab>
      <ReturnBtn/>
    </van-tabs>
  </section>
</template>
<script>
import { NumFormat, Interception } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      active: 0,
      detailslList: [],
      relatedProjects: [],
      authorInformation: [],
      auditRecords: [],
      PlansandObjectives: [],
      expertReview: [],
      flag: "待审核"
    };
  },
  created() {
    document.title = "纵向项目中检详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        纵向项目中检编号: this.$route.params.item
      };
      this.$http.getYProcessInspectionDetails(para).then(res => {
        this.detailslList = res.data.立项基本信息;
        this.relatedProjects = res.data.参与人信息;
        this.authorInformation = res.data.财务信息;
        this.PlansandObjectives = res.data.项目计划与目标;
        this.expertReview = res.data.中检专家评审;
        this.auditRecords = res.data.中检审核记录;
      });
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return "待定";
      }
    },
    startTimeB(item) {
      if (item === null) {
        return "待定";
      } else {
        return item;
      }
    },
    //转换金额格式
    NumFormat(item) {
      return NumFormat(item);
    },
    Interception(item) {
      return Interception(item);
    },
    conversionState(item) {
      return item == true ? "是" : item == false ? "否" : " ";
    }
  }
};
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
  .zanwu {
    display: flex;
    img {
      margin: 0 auto;
    }
  }
  .van-tab__pane {
    padding: 10px;
  }
  h3 {
    font-size: 14px;
    margin: 5px 0;
    padding: 5px;
    color: #1296db;
    background-color: #e7e7e7;
  }
  .total {
    background-color: #f5f5f5;
    padding-left: 10px;
    li {
      list-style: none;
      span {
        font-size: 14px;
        font-weight: bold;
        vertical-align: middle;
      }
      span:nth-child(2) {
        color: red;
      }
    }
  }
  .audit,
  .servicel {
    font-size: 14px;
    padding: 10px;
    margin-bottom: 20px;
    border-bottom: 2px solid #ccc;
    background-color: #fff;
    h4 {
      margin: 5px 0;
      padding: 5px;
      color: #1296db;
      background-color: #e7e7e7;
    }
    li {
      justify-content: space-between;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
      padding: 5px 0;
      display: flex;
      span {
        width: 50%;
        justify-content: space-between;
      }
      i {
        color: rgb(6, 167, 6);
      }
    }
  }
}
</style>
