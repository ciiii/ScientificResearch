<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="到账信息">
        <ul class="servicel">
          <h4>到账信息</h4>
          <li>
            <span>拨款单位</span>
            <span>{{this.detailslList.拨款单位}}</span>
          </li>
          <li>
            <span>到账金额</span>
            <span>{{NumFormat(this.detailslList.到账金额)}}</span>
          </li>
          <li>
            <span>到账日期</span>
            <span>{{startTime(this.detailslList.到账日期)}}</span>
          </li>
          <li>
            <span>管理费用</span>
            <span>{{NumFormat(this.detailslList.管理费用)}}</span>
          </li>
          <li>
            <span>到账单位</span>
            <span>{{this.detailslList.到账单位}}</span>
          </li>
          <li>
            <span>技术合同认定服务费</span>
            <span>{{NumFormat(this.detailslList.技术合同认定服务费)}}</span>
          </li>
          <li>
            <span>技术交易额</span>
            <span>{{NumFormat(this.detailslList.技术交易额)}}</span>
          </li>
          <li>
            <span>增值税</span>
            <span>{{NumFormat(this.detailslList.增值税)}}</span>
          </li>
          <li>
            <span>到账单位</span>
            <span>{{this.detailslList.到账单位}}</span>
          </li>
          <li>
            <span>备注</span>
            <span>{{this.detailslList.备注}}</span>
          </li>
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
          <li>
            <span>合同名称</span>
            <p>{{this.relatedProjects.合同名称}}</p>
          </li>
          <li>
            <span>合同编号</span>
            <span>{{this.relatedProjects.合同编号}}</span>
          </li>
          <li>
            <span>项目负责人</span>
            <span>{{this.relatedProjects.项目负责人姓名}}</span>
          </li>
          <li>
            <span>负责人部门</span>
            <span>{{this.relatedProjects.项目负责人部门名称}}</span>
          </li>
          <li>
            <span>归属部门</span>
            <span>{{this.relatedProjects.项目归属部门}}</span>
          </li>
          <li>
            <span>合同金额</span>
            <span>{{NumFormat(this.relatedProjects.合同金额)}}</span>
          </li>
          <li>
            <span>合同总经费</span>
            <span>{{NumFormat(this.relatedProjects.经费)}}</span>
          </li>
          <li>
            <span>未到账经费</span>
            <span>{{NumFormat(this.relatedProjects.未到经费)}}</span>
          </li>
          <li>
            <span>待审核到账</span>
            <span>{{NumFormat(this.relatedProjects.待审核到账)}}</span>
          </li>
          <li>
            <span>已审核到账</span>
            <span>{{NumFormat(this.relatedProjects.已审核到账)}}</span>
          </li>
          <li>
            <span>签订时间</span>
            <span>{{startTime(this.relatedProjects.签订时间)}}</span>
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
          <li>
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
      auditRecords: [],
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
        横向项目到账编号: this.$route.params.item
      };
      this.$http.getXFundsToTheAccountDetails(para).then(res => { 
        console.log(res, ">>>>>");
        this.detailslList = res.data.横向项目到账详情;
        this.relatedProjects = res.data.横向项目立项详情;
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
      display: flex;
      justify-content: space-between;
      padding: 10px 0;
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
