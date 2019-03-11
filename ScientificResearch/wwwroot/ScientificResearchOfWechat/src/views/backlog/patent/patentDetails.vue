<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="专利信息">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li>专利名称：{{this.detailslList.专利名称}}</li>
        <li>
          <span>专利国别：{{this.detailslList.专利国别}}</span>
          <span>是否授权：{{conversionState(this.detailslList.是否授权)}}</span>
        </li>
        <li>专利类型：{{this.detailslList.专利类型}}</li>
        <li>专利范围：{{this.detailslList.专利范围}}</li>
        <li>代理机构：{{this.detailslList.代理机构}}</li>
        <li>
          <span>年度：{{this.detailslList.年度}}</span>
          <span>专利权人：{{this.detailslList.专利权人名称}}</span>
        </li>
        <li>申请号：{{this.detailslList.申请号}}</li>
        <li>申请日期：{{startTime(this.detailslList.申请日期)}}</li>
        <li>公开号：{{this.detailslList.公开号}}</li>
        <li>公开日期：{{startTime(this.detailslList.公开日期)}}</li>
        <li>专利号：{{this.detailslList.专利号}}</li>
        <li>国际专利主分类号：{{this.detailslList.国际专利主分类号}}</li>
        <li>证书号：{{this.detailslList.证书号}}</li>
        <li>授权公告日：{{startTime(this.detailslList.授权公告日)}}</li>
        <li>
          <span>是否职务发明：{{conversionState(this.detailslList.是否职务发明)}}</span>
          <span>是否生效：{{conversionState(this.detailslList.是否生效)}}</span>
        </li>
        <li>奖励金额：￥{{NumFormat(this.detailslList.奖励金额)}}</li>
        <li>超额费用：￥{{NumFormat(this.detailslList.超额费用)}}</li>
        <li>超额费用来源：{{this.detailslList.超额费用来源}}</li>
        <li>专利摘要：{{this.detailslList.专利摘要}}</li>
        <li>备注：{{this.detailslList.备注}}</li>
      </ul>
    </van-tab>
    <van-tab title="发明人信息">
      <div v-if="authorInformation.length == 0" class="zanwu">
        <img src="../../../assets/images/nothing-3.png" alt>
      </div>
      <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
        <h4>相关项目</h4>
        <li>发明人姓名：{{item.姓名}}</li>
        <li>部门名称：{{item.部门名称}}</li>
        <li>发明人排序：{{item.作者级别}}</li>
        <li>工作量占比(%)：{{item.工作量占比}}</li>
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
        <li>代理费金额：￥{{NumFormat(this.detailslList.代理费金额)}}</li>
        <li>代理费发票号：{{this.detailslList.代理费发票号}}</li>
        <li>代理费付款日期：{{startTime(this.detailslList.代理费付款日期)}}</li>
        <li>代理资助金额：￥{{NumFormat(this.detailslList.代理资助金额)}}</li>
        <li>代理办理资助日期：{{startTime(this.detailslList.代理办理资助日期)}}</li>
        <li>代理费到账日期：{{startTime(this.detailslList.代理费到账日期)}}</li>

        <h4>申请费</h4>
        <li>申请费是否减缓：{{conversionState(this.detailslList.申请费是否减缓)}}</li>
        <li>申请费用金额：{{NumFormat(this.detailslList.申请费金额)}}</li>
        <li>申请费收据号：{{this.detailslList.申请费收据号}}</li>
        <li>申请费支付日期{{startTime(this.detailslList.申请费支付日期)}}</li>
        <li>申请费资助金额：{{NumFormat(this.detailslList.申请费资助金额)}}</li>
        <li>申请费办理资助日期{{startTime(this.detailslList.申请费办理资助日期)}}</li>
        <li>申请费到账日期：{{startTime(this.detailslList.申请费到账日期)}}</li>

        <h4>申请审查费</h4>
        <li>申请审查费是否延缓：{{conversionState(this.detailslList.申请审查费是否延缓)}}</li>
        <li>申请审查费用：￥{{NumFormat(this.detailslList.申请审查费用)}}</li>
        <li>申请审查费收据编号：{{this.detailslList.申请审查费收据编号}}</li>
        <li>申请审查费付款日期：{{startTime(this.detailslList.申请审查费付款日期)}}</li>
        <li>申请审查费资助金额：￥{{NumFormat(this.detailslList.申请审查费资助金额)}}</li>
        <li>申请审查费资助日期{{startTime(this.detailslList.申请审查费资助日期)}}</li>
        <li>申请审查费到账日期：{{startTime(this.detailslList.申请审查费到账日期)}}</li>

        <h4>授权费用</h4>
        <li>授权费是否减缓：{{conversionState(this.detailslList.授权费是否减缓)}}</li>
        <li>授权费用金额：￥{{NumFormat(this.detailslList.授权费用金额)}}</li>
        <li>授权费收据号：{{this.detailslList.授权费收据号}}</li>
        <li>授权费付款日期：{{startTime(this.detailslList.授权费付款日期)}}</li>
        <li>授权费资助金额：￥{{NumFormat(this.detailslList.授权费资助金额)}}</li>
        <li>授权费办理资助日期：{{startTime(this.detailslList.授权费办理资助日期)}}</li>
        <li>授权费到账日期：{{startTime(this.detailslList.授权费到账日期)}}</li>
      </ul>
    </van-tab>
    <van-tab title="相关项目">
      <div v-if="relatedProjects.length == 0" class="zanwu">
        <img src="../../../assets/images/nothing-3.png" alt>
      </div>
      <ul class="servicel" v-else v-for="(item,key) in relatedProjects" :key="key">
        <h4>相关项目</h4>
        <li>项目名称：{{item.项目名称}}</li>
        <li>项目编号：{{item.项目编号}}</li>
        <li>项目类型名称：{{item.项目类型名称}}</li>
      </ul>
    </van-tab>
    <van-tab title="审核记录">
      <div v-if="auditRecords.length == 0" class="zanwu">
        <img src="../../../assets/images/nothing-3.png" alt>
      </div>
      <ul v-for="(item,key) in auditRecords" :key="key" v-else class="audit">
        <li>步骤名称：{{item.名称}}</li>
        <li>处理人：{{item.姓名}}</li>
        <li class="state">
          <span :style="{'color':(item.状态说明 == state ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
          <span>
            <i class="icon iconfont icon-shijian1"></i>
            {{item.执行时间}}
          </span>
        </li>
        <li>备注：{{item.备注}}</li>
      </ul>
    </van-tab>
    <ReturnBtn/>
  </van-tabs>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
import { Interception } from "@/assets/js/common/filter.js";
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
        console.log(res, "sss");
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
