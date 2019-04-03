<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本资料">
        <ul class="servicel">
          <h4>立项基本信息</h4>
          <li>
            <span>项目中文名称</span>
            <p>{{this.detailslList.项目中文名称}}</p>
          </li>
          <li>
            <span>项目英文名称</span>
            <span>{{this.detailslList.项目英文名称}}</span>
          </li>
          <li>
            <span>项目编号</span>
            <span>{{this.detailslList.项目编号}}</span>
          </li>
          <li>
            <span>项目分类</span>
            <span>{{this.detailslList.项目分类}}</span>
          </li>
          <li>
            <span>成果归属部门</span>
            <span>{{this.detailslList.成果归属部门}}</span>
          </li>
          <li>
            <span>负责人</span>
            <span>{{this.detailslList.负责人姓名}}</span>
          </li>
          <li>
            <span>立项年度</span>
            <span>{{this.detailslList.立项年度}}</span>
          </li>
          <li>
            <span>登记日期</span>
            <span>{{startTime(this.detailslList.登记日期)}}</span>
          </li>
          <li>
            <span>批准日期</span>
            <span>{{startTime(this.detailslList.批准日期)}}</span>
          </li>
          <li>
            <span>登记人</span>
            <span>{{this.detailslList.登记人姓名}}</span>
          </li>
          <li>
            <span>经费卡号</span>
            <span>{{this.detailslList.经费卡号}}</span>
          </li>
          <li>
            <span>项目等级</span>
            <span>{{this.detailslList.项目等级}}</span>
          </li>
          <li>
            <span>计划完成日期</span>
            <span>{{startTime(this.detailslList.计划完成日期)}}</span>
          </li>
          <li>
            <span>学科门类</span>
            <span>{{this.detailslList.学科门类}}</span>
          </li>
          <li>
            <span>学科类型</span>
            <span>{{this.detailslList.学科类型}}</span>
          </li>
          <li>
            <span>研究类型</span>
            <span>{{this.detailslList.研究类型}}</span>
          </li>
          <li>
            <span>项目类型</span>
            <span>{{this.detailslList.项目类型}}</span>
          </li>
          <li>
            <span>项目级别</span>
            <span>{{this.detailslList.项目级别}}</span>
          </li>
          <li>
            <span>档案编号</span>
            <span>{{this.detailslList.档案编号}}</span>
          </li>
          <li>
            <span>财务简称</span>
            <span>{{this.detailslList.财务简称}}</span>
          </li>
          <li>
            <span>亚类说明</span>
            <span>{{this.detailslList.亚类说明}}</span>
          </li>
          <li>
            <span>附注说明</span>
            <span>{{this.detailslList.附注说明}}</span>
          </li>
          <li>
            <span>纵向项目合同类型</span>
            <span>{{this.detailslList.纵向项目合同类型}}</span>
          </li>
          <li>
            <span>国民经济行业</span>
            <span>{{this.detailslList.国民经济行业}}</span>
          </li>
          <li>
            <span>合作方式</span>
            <span>{{this.detailslList.合作形式}}</span>
          </li>
          <li>
            <span>社会经济目标</span>
            <span>{{this.detailslList.社会经济目标}}</span>
          </li>
          <li>
            <span>伦理批文编号</span>
            <span>{{this.detailslList.伦理批文编号}}</span>
          </li>
          <li>
            <span>伦理批文时间</span>
            <span>{{startTime(this.detailslList.伦理批文时间)}}</span>
          </li>
          <li>
            <span>备注</span>
            <span>{{this.detailslList.备注}}</span>
          </li>
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
          <li>
            <span>参与人姓名</span>
            <span>{{item.姓名}}</span>
          </li>
          <li>
            <span>部门名称</span>
            <span>{{item.部门名称}}</span>
          </li>
          <li>
            <span>工作量占比(%)</span>
            <span>{{item.工作量占比}}</span>
          </li>
          <li>
            <span>建立时间</span>
            <span>{{startTime(item.建立时间)}}</span>
          </li>
          <li>
            <span>备注</span>
            <span>{{item.备注}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="项目预算">
        <h3>项目预算</h3>
        <div class="total">
          <li>
            <span>批准经费(元)</span>
            <span>{{NumFormat(this.detailslList.批准经费)}}</span>
          </li>
          <li>
            <span>配套经费(元)</span>
            <span>{{NumFormat(this.detailslList.配套经费)}}</span>
          </li>
        </div>
        <ul class="servicel" v-for="(item,key) in authorInformation" :key="key">
          <li>
            <span>项目支出类型</span>
            <span>{{item.项目支出类型}}</span>
          </li>
          <li>
            <span>预算科目</span>
            <span>{{item.财务科目}}</span>
          </li>
          <li>
            <span>预算金额（批准经费：元）</span>
            <span>{{NumFormat(item.批准经费)}}</span>
          </li>
          <li>
            <span>预算金额（配套经费：元）</span>
            <span>{{NumFormat(item.配套经费)}}</span>
          </li>
          <li>
            <span>编制依据</span>
            <span>{{item.编制依据}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="计划与目标">
        <div v-if="PlansandObjectives.length === 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in PlansandObjectives" :key="key">
          <li>
            <span>计划开始时间</span>
            <span>{{item.计划开始时间}}</span>
          </li>
          <li>
            <span>计划结束时间</span>
            <span>{{item.计划结束时间}}</span>
          </li>
          <li>
            <span>计划内容</span>
            <span>{{item.计划内容}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="专家评审">
        <h3>专家评审</h3>
        <ul class="servicel" v-for="(item,key) in expertReview" :key="key">
          <li>
            <span>专家姓名</span>
            <span>{{item.专家姓名}}</span>
          </li>
          <li>
            <span>部门</span>
            <span>{{item.专家部门名称}}</span>
          </li>
          <li>
            <span>评分类型</span>
            <span>{{item.评分项}}</span>
          </li>
          <li>
            <span>评分</span>
            <span>{{item.评分}}</span>
          </li>
          <li>
            <span>评审时间</span>
            <span>{{startTime(item.建立时间)}}</span>
          </li>
          <li>
            <span>专家推荐意见</span>
            <span>{{item.备注}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="审核记录">
        <h3>审核记录</h3>
        <ul v-for="(item,key) in auditRecords" :key="key" class="audit">
          <li>
            <span>步骤名称</span>
            <span>{{item.名称}}</span>
          </li>
          <li>
            <span>处理人</span>
            <span>{{item.姓名}}</span>
          </li>
          <li>
            <span>处理人部门</span>
            <span>{{item.部门名称}}</span>
          </li>
          <li class="state">
            <span>状态</span>
            <span :style="{'color':(item.状态说明 == flag ? '#FF976A' : '#31BD5D')}">{{item.状态说明}}</span>
          </li>
          <li>
            <span>执行时间</span>
            <span>
              <i class="icon iconfont icon-shijian1"></i>
              {{startTimeB(item.执行时间)}}
            </span>
          </li>
          <li>
            <span>备注</span>
            <span>{{item.备注}}</span>
          </li>
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
    height: 100vh;
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
      padding: 10px 0;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #f2f2f2;
      p {
        font-size: 14px;
        color: #5a5a5a;
        margin: 0;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      span:nth-child(1) {
        color: #888;
      }
      span:nth-child(2) {
        color: #5a5a5a;
      }
      i {
        color: rgb(6, 167, 6);
      }
    }
  }
}
</style>
