<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="专利信息">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li>
          <span>专利名称</span>
          <span>{{this.detailslList.专利名称}}</span>
        </li>
        <li>
          <span>专利国别</span>
          <span>{{this.detailslList.专利国别}}</span>
        </li>
        <li>
          <span>是否授权</span>
          <span>{{conversionState(this.detailslList.是否授权)}}</span>
        </li>
        <li>
          <span>专利类型</span>
          <span>{{this.detailslList.专利类型}}</span>
        </li>
        <li>
          <span>专利范围</span>
          <span>{{this.detailslList.专利范围}}</span>
        </li>
        <li>
          <span>代理机构</span>
          <span>{{this.detailslList.代理机构}}</span>
        </li>
        <li>
          <span>年度</span>
          <span>{{this.detailslList.年度}}</span>
        </li>
        <li>
          <span>专利权人</span>
          <span>{{this.detailslList.专利权人名称}}</span>
        </li>
        <li>
          <span>申请号</span>
          <span>{{this.detailslList.申请号}}</span>
        </li>
        <li>
          <span>申请日期</span>
          <span>{{startTime(this.detailslList.申请日期)}}</span>
        </li>
        <li>
          <span>公开号</span>
          <span>{{this.detailslList.公开号}}</span>
        </li>
        <li>
          <span>公开日期</span>
          <span>{{startTime(this.detailslList.公开日期)}}</span>
        </li>
        <li>
          <span>专利号</span>
          <span>{{this.detailslList.专利号}}</span>
        </li>
        <li>
          <span>国际专利主分类号</span>
          <span>{{this.detailslList.国际专利主分类号}}</span>
        </li>
        <li>
          <span>证书号</span>
          <span>{{this.detailslList.证书号}}</span>
        </li>
        <li>
          <span>授权公告日</span>
          <span>{{startTime(this.detailslList.授权公告日)}}</span>
        </li>
        <li>
          <span>是否职务发明</span>
          <span>{{conversionState(this.detailslList.是否职务发明)}}</span>
        </li>
        <li>
          <span>是否生效</span>
          <span>{{conversionState(this.detailslList.是否生效)}}</span>
        </li>
        <li>
          <span>奖励金额</span>
          <span>{{NumFormat(this.detailslList.奖励金额)}}</span>
        </li>
        <li>
          <span>超额费用</span>
          <span>{{NumFormat(this.detailslList.超额费用)}}</span>
        </li>
        <li>
          <span>超额费用来源</span>
          <span>{{this.detailslList.超额费用来源}}</span>
        </li>
        <li>
          <span>专利摘要</span>
          <span>{{this.detailslList.专利摘要}}</span>
        </li>
        <li>
          <span>备注</span>
          <span>{{this.detailslList.备注}}</span>
        </li>
      </ul>
    </van-tab>
    <van-tab title="发明人信息">
      <div v-if="authorInformation.length == 0" class="zanwu">
        <img src="@/assets/images/nothing-3.png" alt>
      </div>
      <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
        <h4>相关项目</h4>
        <li>
          <span>发明人姓名</span>
          <span>{{item.姓名}}</span>
        </li>
        <li>
          <span>部门名称</span>
          <span>{{item.部门名称}}</span>
        </li>
        <li>
          <span>发明人排序</span>
          <span>{{item.作者级别}}</span>
        </li>
        <li>
          <span>工作量占比(%)</span>
          <span>{{item.工作量占比}}</span>
        </li>
      </ul>
    </van-tab>
    <van-tab title="相关文件">
      <ul class="servicel">
        <h4>相关文件</h4>
        <li>相关文件：</li>
        <li>
          <a :href="this.detailslList.相关文件路径" download>{{Interception(this.detailslList.相关文件路径)}}</a>
        </li>
      </ul>
    </van-tab>
    <van-tab title="相关费用">
      <ul class="servicel">
        <h4>代理费</h4>
        <li>
          <span>代理费金额</span>
          <span>{{NumFormat(this.detailslList.代理费金额)}}</span>
        </li>
        <li>
          <span>代理费发票号</span>
          <span>{{this.detailslList.代理费发票号}}</span>
        </li>
        <li>
          <span>代理费付款日期</span>
          <span>{{startTime(this.detailslList.代理费付款日期)}}</span>
        </li>
        <li>
          <span>代理资助金额</span>
          <span>{{NumFormat(this.detailslList.代理资助金额)}}</span>
        </li>
        <li>
          <span>代理办理资助日期</span>
          <span>{{startTime(this.detailslList.代理办理资助日期)}}</span>
        </li>
        <li>
          <span>代理费到账日期</span>
          <span>{{startTime(this.detailslList.代理费到账日期)}}</span>
        </li>
        <h4>申请费</h4>
        <li>
          <span>申请费是否减缓</span>
          <span>{{conversionState(this.detailslList.申请费是否减缓)}}</span>
        </li>
        <li>
          <span>申请费用金额</span>
          <span>{{NumFormat(this.detailslList.申请费金额)}}</span>
        </li>
        <li>
          <span>申请费收据号</span>
          <span>{{this.detailslList.申请费收据号}}</span>
        </li>
        <li>
          <span>申请费支付日期</span>
          <span>{{startTime(this.detailslList.申请费支付日期)}}</span>
        </li>
        <li>
          <span>申请费资助金额</span>
          <span>{{NumFormat(this.detailslList.申请费资助金额)}}</span>
        </li>
        <li>
          <span>申请费办理资助日期</span>
          <span>{{startTime(this.detailslList.申请费办理资助日期)}}</span>
        </li>
        <li>
          <span>申请费到账日期</span>
          <span>{{startTime(this.detailslList.申请费到账日期)}}</span>
        </li>
        <h4>申请审查费</h4>
        <li>
          <span>申请审查费是否延缓</span>
          <span>{{conversionState(this.detailslList.申请审查费是否延缓)}}</span>
        </li>
        <li>
          <span>申请审查费用</span>
          <span>{{NumFormat(this.detailslList.申请审查费用)}}</span>
        </li>
        <li>
          <span>申请审查费收据编号</span>
          <span>{{this.detailslList.申请审查费收据编号}}</span>
        </li>
        <li>
          <span>申请审查费付款日期</span>
          <span>{{startTime(this.detailslList.申请审查费付款日期)}}</span>
        </li>
        <li>
          <span>申请审查费资助金额</span>
          <span>{{NumFormat(this.detailslList.申请审查费资助金额)}}</span>
        </li>
        <li>
          <span>申请审查费资助日期</span>
          <span>{{startTime(this.detailslList.申请审查费资助日期)}}</span>
        </li>
        <li>
          <span>申请审查费到账日期</span>
          <span>{{startTime(this.detailslList.申请审查费到账日期)}}</span>
        </li>
        <h4>授权费用</h4>
        <li>
          <span>授权费是否减缓</span>
          <span>{{conversionState(this.detailslList.授权费是否减缓)}}</span>
        </li>
        <li>
          <span>授权费用金额</span>
          <span>{{NumFormat(this.detailslList.授权费用金额)}}</span>
        </li>
        <li>
          <span>授权费收据号</span>
          <span>{{this.detailslList.授权费收据号}}</span>
        </li>
        <li>
          <span>授权费付款日期</span>
          <span>{{startTime(this.detailslList.授权费付款日期)}}</span>
        </li>
        <li>
          <span>授权费资助金额</span>
          <span>{{NumFormat(this.detailslList.授权费资助金额)}}</span>
        </li>
        <li>
          <span>授权费办理资助日期</span>
          <span>{{startTime(this.detailslList.授权费办理资助日期)}}</span>
        </li>
        <li>
          <span>授权费到账日期</span>
          <span>{{startTime(this.detailslList.授权费到账日期)}}</span>
        </li>
      </ul>
    </van-tab>
    <van-tab title="相关项目">
      <div v-if="relatedProjects.length == 0" class="zanwu">
        <img src="@/assets/images/nothing-3.png" alt>
      </div>
      <ul class="servicel" v-else v-for="(item,key) in relatedProjects" :key="key">
        <h4>相关项目</h4>
        <li>
          <span>项目名称</span>
          <span>{{item.项目名称}}</span>
        </li>
        <li>
          <span>项目编号</span>
          <span>{{item.项目编号}}</span>
        </li>
        <li>
          <span>项目类型名称</span>
          <span>{{item.项目类型名称}}</span>
        </li>
      </ul>
    </van-tab>
    <van-tab title="审核记录">
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
        <li class="state">
          <span>状态说明</span>
          <span :style="{'color':(item.状态说明 == state ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
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
</template>
<script>
import { NumFormat, Interception } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      detailslList: [],
      relatedProjects: [],
      authorInformation: [],
      auditRecords: [],
      state: "审核通过",
      active: 0
    };
  },
  created() {
    document.title = "专利详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails(item) {
      var para = {
        专利编号: this.$route.params.item
      };
      this.$http.getPatentDetails(para).then(res => {
        this.detailslList = res.data.专利详情;
        this.relatedProjects = res.data.成果项目;
        this.authorInformation = res.data.成果作者;
        this.auditRecords = res.data.审核情况;
      });
      this.show = true;
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
