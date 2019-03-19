<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本信息">
        <ul class="servicel">
          <h4>申报基本信息</h4>
          <li>项目名称：
            <p>{{this.detailslList.项目名称}}</p>
          </li>
          <li>申报人：{{this.detailslList.姓名}}</li>
          <li>成果归属部门：{{this.detailslList.部门名称}}</li>
          <li>
            <span>学科门类：{{this.detailslList.学科门类}}</span>
            <span>学科类型：{{this.detailslList.学科类型}}</span>
          </li>
          <li>
            <span>项目类型：{{this.detailslList.项目类型}}</span>
            <span>项目级别：{{this.detailslList.项目级别}}</span>
          </li>
          <li>项目来源单位：{{this.detailslList.项目来源单位}}</li>
          <li>申报时间：{{startTime(this.detailslList.申报时间)}}</li>
          <li>申请经费：{{NumFormat(this.detailslList.申请经费)}}</li>
          <li>申报年度：{{this.detailslList.申报年度}}</li>
          <li>计划开始日期：{{startTime(this.detailslList.计划开始日期)}}</li>
          <li>计划完成日期：{{startTime(this.detailslList.计划完成日期)}}</li>
          <li>项目等级：{{this.detailslList.项目等级}}</li>
          <li>伦理批文编号：{{this.detailslList.伦理批文编号}}</li>
          <li>是否委托外单位进行实验或实验分析：{{this.detailslList.是否委托外单位进行实验或实验分析}}</li>
          <li>实验委托检测内容：{{this.detailslList.实验委托检测内容}}</li>
          <li>项目摘要：{{this.detailslList.项目摘要}}</li>
        </ul>
      </van-tab>
      <van-tab title="参与人信息">
        <div v-if="authorInformation.length == 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
          <li>参与人姓名：{{item.姓名}}</li>
          <li>部门名称：{{item.部门名称}}</li>
          <li>工作量占比(%)：{{item.工作量占比}}</li>
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
        <div v-if="auditRecords.length == 0" class="zanwu">
          <img src="@/assets/images/nothing-3.png" alt>
        </div>
        <ul v-for="(item,key) in auditRecords" :key="key" v-else class="audit">
          <li>步骤名称：{{item.名称}}</li>
          <li>处理人：{{item.姓名}}</li>
          <li>部门名称：{{item.部门名称}}</li>
          <li class="state">
            <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
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
      padding: 5px 0;
      display: flex;
      p {
        font-size: 14px;
        margin: 0;
        width: 79%;
        justify-content: space-between;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
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
