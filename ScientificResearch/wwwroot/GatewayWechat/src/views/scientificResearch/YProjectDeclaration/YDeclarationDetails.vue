<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本信息">
        <ul class="servicel">
          <h4>申报基本信息</h4>
          <li>
            <span>项目名称</span>
            <p>{{this.detailslList.项目名称}}</p>
          </li>
          <li>
            <span>申报人</span>
            <span>{{this.detailslList.姓名}}</span>
          </li>
          <li>
            <span>成果归属部门</span>
            <span>{{this.detailslList.部门名称}}</span>
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
            <span>项目类型</span>
            <span>{{this.detailslList.项目类型}}</span>
          </li>
          <li>
            <span>项目级别</span>
            <span>{{this.detailslList.项目级别}}</span>
          </li>
          <li>
            <span>项目来源单位</span>
            <span>{{this.detailslList.项目来源单位}}</span>
          </li>
          <li>
            <span>申报时间</span>
            <span>{{startTime(this.detailslList.申报时间)}}</span>
          </li>
          <li>
            <span>申请经费</span>
            <span>{{NumFormat(this.detailslList.申请经费)}}</span>
          </li>
          <li>
            <span>申报年度</span>
            <span>{{this.detailslList.申报年度}}</span>
          </li>
          <li>
            <span>计划开始日期</span>
            <span>{{startTime(this.detailslList.计划开始日期)}}</span>
          </li>
          <li>
            <span>计划完成日期</span>
            <span>{{startTime(this.detailslList.计划完成日期)}}</span>
          </li>
          <li>
            <span>项目等级</span>
            <span>{{this.detailslList.项目等级}}</span>
          </li>
          <li>
            <span>伦理批文编号</span>
            <span>{{this.detailslList.伦理批文编号}}</span>
          </li>
          <li>
            <span>是否委托外单位进行实验或实验分析</span>
            <span>{{conversionState(this.detailslList.是否委托外单位进行实验或实验分析)}}</span>
          </li>
          <li>
            <span>实验委托检测内容</span>
            <span>{{this.detailslList.实验委托检测内容}}</span>
          </li>
          <li>
            <span>项目摘要</span>
            <span>{{this.detailslList.项目摘要}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="参与人信息">
        <div v-if="authorInformation.length == 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
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
        </ul>
      </van-tab>
      <van-tab title="相关文件">
        <ul class="servicel">
          <h4>伦理批文附件</h4>
          <li>附件：</li>
          <li>
            <a :href="this.detailslList.伦理批文路径" download>{{Interception(this.detailslList.伦理批文路径)}}</a>
          </li>
          <h4>项目申报书</h4>
          <li>项目申报书：</li>
          <li>
            <a :href="this.detailslList.项目申报书路径">{{Interception(this.detailslList.项目申报书路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="评审记录">
        <h3>专家评审记录</h3>
        <div v-if="relatedProjects.length == 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in relatedProjects" :key="key">
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
        <div v-if="auditRecords.length == 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul v-for="(item,key) in auditRecords" :key="key" v-else class="audit">
          <li>
            <span>步骤名称</span>
            <span>{{item.名称}}</span>
          </li>
          <li>
            <span>处理人</span>
            <span>{{item.姓名}}</span>
          </li>
          <li>
            <span>部门名称</span>
            <span>{{item.部门名称}}</span>
          </li>
          <li class="state">
            <span>状态</span>
            <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
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
      flag: "审核通过"
    };
  },
  created() {
    document.title = "纵向申报详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        纵向项目申报编号: this.$route.params.item
      };
      this.$http.getYDeclarationDetails(para).then(res => {
        this.detailslList = res.data.申报基本信息;
        this.authorInformation = res.data.参与人信息;
        this.relatedProjects = res.data.专家评审记录;
        this.auditRecords = res.data.审核记录;
      });
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return;
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
