<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="到账信息">
        <ul class="servicel">
          <h4>到账信息</h4>
          <li>拨款单位：{{this.detailslList.拨款单位}}</li>
          <li>到账金额：{{NumFormat(this.detailslList.到账金额)}}</li>
          <li>到账日期：{{startTime(this.detailslList.到账日期)}}</li>
          <li>管理费用{{NumFormat(this.detailslList.管理费用)}}</li>
          <li>到账单位：{{this.detailslList.到账单位}}</li>
          <li>技术合同认定服务费：{{NumFormat(this.detailslList.技术合同认定服务费)}}</li>
          <li>技术交易额：{{NumFormat(this.detailslList.技术交易额)}}</li>
          <li>增值税：{{NumFormat(this.detailslList.增值税)}}</li>
          <li>到账单位：{{this.detailslList.到账单位}}</li>
          <li>备注：{{this.detailslList.备注}}</li>
          <h4>到账凭证</h4>
          <li>附件：</li>
          <li>
            <a :href="this.detailslList.到账凭证路径" download>{{Interception(this.detailslList.到账凭证路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="基本信息">
        <ul class="servicel">
          <h4>项目基本信息</h4>
          <li>合同名称：{{this.relatedProjects.合同名称}}</li>
          <li>合同编号：{{this.relatedProjects.合同编号}}</li>
          <li>项目负责人：{{this.relatedProjects.项目负责人姓名}}</li>
          <li>负责人部门：{{this.relatedProjects.项目负责人部门名称}}</li>
          <li>归属部门：{{this.relatedProjects.项目归属部门}}</li>
          <li>合同金额：{{NumFormat(this.relatedProjects.合同金额)}}</li>
          <li>合同总经费：{{NumFormat(this.relatedProjects.经费)}}</li>
          <li>未到账经费：{{NumFormat(this.relatedProjects.未到经费)}}</li>
          <li>待审核到账：{{NumFormat(this.relatedProjects.待审核到账)}}</li>
          <li>已审核到账：{{NumFormat(this.relatedProjects.已审核到账)}}</li>
          <li>签订时间：{{startTime(this.relatedProjects.签订时间)}}</li>
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
      auditRecords: [],
      flag: "待审核"
    };
  },
  created() {
    document.title = "横向项目经费到账";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        横向项目到账编号: this.$route.params.item
      };
      this.$http.getXFundsToTheAccountDetails(para).then(res => {
        this.detailslList = res.data.横向项目到账详情;
        this.relatedProjects = res.data.纵向项目立项详情;
        this.auditRecords = res.data.横向项目到账审核记录;
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
