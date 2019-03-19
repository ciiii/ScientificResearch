<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本信息">
        <ul class="servicel">
          <h4>合同基本信息</h4>
          <li>合同名称：
            <p>{{this.detailslList.合同名称}}</p>
          </li>
          <li>合同编号：{{this.detailslList.合同编号}}</li>
          <li>项目分类：{{this.detailslList.项目分类}}</li>
          <li>项目类型：{{this.detailslList.项目类型}}</li>
          <li>建立时间：{{startTime(this.detailslList.建立时间)}}</li>
          <li>是否为第一承建单位：{{conversionState(this.detailslList.是否为第一承建单位)}}</li>
          <li>项目负责人：{{this.detailslList.项目负责人姓名}}</li>
          <li>项目归属部门：{{this.detailslList.项目归属部门}}</li>
          <li>单位名称：{{this.detailslList.单位名称}}</li>
          <li>邮政编码：{{this.detailslList.邮政编码}}</li>
          <li>法定代表人：{{this.detailslList.法定代表人}}</li>
          <li>经费本编号：{{this.detailslList.经费本编号}}</li>
          <li>联系人：{{this.detailslList.联系人}}</li>
          <li>联系人电话：{{this.detailslList.联系人电话}}</li>
          <li>通讯地址：{{this.detailslList.通讯地址}}</li>
          <li>档案编号：{{this.detailslList.档案编号}}</li>
          <li>财务简称：{{this.detailslList.财务简称}}</li>
          <li>课题来源：{{this.detailslList.课题来源}}</li>
          <h4>合同文件</h4>
          <li>合同文件：</li>
          <li>
            <a :href="this.detailslList.合同文件路径" download>{{Interception(this.detailslList.合同文件路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="合作方信息">
        <ul class="servicel">
          <h4>合作方信息</h4>
          <li>
            <span>类型：{{this.detailslList.合作方关系}}</span>
            <span>类型：{{this.detailslList.合作方契约关系}}</span>
          </li>
          <li>名称：{{this.detailslList.合作方单位名称}}</li>
          <li>法定代表人：{{this.detailslList.合作方法定代表人}}</li>
          <li>项目类型：{{this.detailslList.项目类型}}</li>
          <li>单位联系人：{{this.detailslList.合作方单位联系人}}</li>
          <li>联系电话：{{this.detailslList.合作方联系电话}}</li>
          <li>邮箱：{{this.detailslList.合作方邮箱}}</li>
          <li>邮政编码：{{this.detailslList.合作方邮政编码}}</li>
          <li>合作方所在行政区域：{{this.detailslList.合作方所在省}} {{this.detailslList.合作方所在市}} {{this.detailslList.合作方所在地区}}</li>
          <li>法人代码：{{this.detailslList.合作方法人或组织机构代码}}</li>
        </ul>
      </van-tab>
      <van-tab title="合同信息">
        <ul class="servicel">
          <h4>合同详情信息</h4>
          <li>合同金额：￥{{NumFormat(this.detailslList.合同金额)}}</li>
          <li>签订时间：{{startTime(this.detailslList.签订时间)}}</li>
          <li>付款方式：{{this.detailslList.付款方式}}</li>
          <li>合作方式：{{this.detailslList.合作方式}}</li>
          <li>合同开始时间：{{startTime(this.detailslList.合同开始时间)}}</li>
          <li>合同结束时间：{{startTime(this.detailslList.合同结束时间)}}</li>
          <li>研究类型：{{this.detailslList.研究类型}}</li>
          <li>技术领域：{{this.detailslList.技术领域}}</li>
          <li>合同类型：{{this.detailslList.合同类型}}</li>
          <li>技术合同类型：{{this.detailslList.技术合同类型}}</li>
          <li>是否申请技术合同认定：{{conversionState(this.detailslList.是否申请技术合同认定)}}</li>
          <li>备注：{{this.detailslList.备注}}</li>
          <h4>技术合同认定登记信息</h4>
          <li>合同技术交易额：￥{{NumFormat(this.detailslList.合同技术交易额)}}</li>
          <li>知识产权：{{this.detailslList.知识产权}}</li>
          <li>计划来源：{{this.detailslList.计划来源}}</li>
          <li>合作方所属国民经济行业：{{this.detailslList.合作方所属国民经济行业}}</li>
          <li>技术服务的国民经济行业：{{this.detailslList.技术服务的国民经济行业}}</li>
          <li>合同的社会经济目标：{{this.detailslList.合同的社会经济目标}}</li>
          <li>合作方性质：{{this.detailslList.合作方性质}}</li>
          <li>是否高新性质：{{conversionState(this.detailslList.是否高新性质)}}</li>
          <h4>合同认定登记承诺书</h4>
          <li>登记承诺书：</li>
          <li>
            <a
              :href="this.detailslList.合同认定登记承诺书路径"
              download
            >{{Interception(this.detailslList.合同认定登记承诺书路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="财务信息">
        <h3>项目预算</h3>
        <div class="total">
          <span>经费预算合计：</span>
          <span>{{NumFormat(this.total)}}</span>
        </div>
        <ul class="servicel" v-for="(item,key) in authorInformation" :key="key">
          <li>项目支出类型：{{item.项目支出类型}}</li>
          <li>预算科目：{{item.财务科目}}</li>
          <li>预算金额（元）：{{item.批准经费}}</li>
          <li>编制依据：{{item.编制依据}}</li>
        </ul>
      </van-tab>
      <van-tab title="参与人信息">
        <ul class="servicel" v-for="(item,key) in relatedProjects" :key="key">
          <h4>参与人信息</h4>
          <li>参与人姓名：{{item.姓名}}</li>
          <li>部门名称：{{item.部门名称}}</li>
          <li>工作量占比(%)：{{item.工作量占比}}</li>
          <li>建立时间：{{startTime(item.建立时间)}}</li>
          <li>备注：{{item.备注}}</li>
        </ul>
      </van-tab>
      <van-tab title="审核记录">
        <h3>审核记录</h3>
        <ul v-for="(item,key) in auditRecords" :key="key" class="audit">
          <li>步骤名称：{{item.名称}}</li>
          <li>处理人：{{item.姓名}}</li>
          <li>部门名称：{{item.部门名称}}</li>
          <li class="state">
            <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
            <span>
              <i class="icon iconfont icon-shijian1" v-show="condition"></i>
              {{startTime(item.执行时间)}}
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
      flag: "审核通过",
      total: null,
      condition: true,
      state: "待审核"
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
        横向项目编号: this.$route.params.item
      };
      this.$http.getXDetails(para).then(res => {
        this.detailslList = res.data.基本信息;
        this.authorInformation = res.data.财务信息;
        this.relatedProjects = res.data.参与人信息;
        this.auditRecords = res.data.审核记录;
        this.authorInformation.forEach((item, index) => {
          this.total += item.批准经费;
        });
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
    span {
      font-size: 16px;
      font-weight: bold;
      vertical-align: middle;
    }
    span:nth-child(2) {
      color: red;
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
