<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本信息">
        <ul class="servicel">
          <h4>合同基本信息</h4>
          <li>
            <span>合同名称</span>
            <span>
              <p>{{this.detailslList.合同名称}}</p>
            </span>
          </li>
          <li>
            <span>合同编号</span>
            <span>{{this.detailslList.合同编号}}</span>
          </li>
          <li>
            <span>项目分类</span>
            <span>{{this.detailslList.项目分类}}</span>
          </li>
          <li>
            <span>项目类型</span>
            <span>{{this.detailslList.项目类型}}</span>
          </li>
          <li>
            <span>建立时间</span>
            <span>{{startTime(this.detailslList.建立时间)}}</span>
          </li>
          <li>
            <span>是否为第一承建单位</span>
            <span>{{conversionState(this.detailslList.是否为第一承建单位)}}</span>
          </li>
          <li>
            <span>项目负责人</span>
            <span>{{this.detailslList.项目负责人姓名}}</span>
          </li>
          <li>
            <span>项目归属部门</span>
            <span>{{this.detailslList.项目归属部门}}</span>
          </li>
          <li>
            <span>单位名称</span>
            <span>{{this.detailslList.单位名称}}</span>
          </li>
          <li>
            <span>邮政编码</span>
            <span>{{this.detailslList.邮政编码}}</span>
          </li>
          <li>
            <span>法定代表人</span>
            <span>{{this.detailslList.法定代表人}}</span>
          </li>
          <li>
            <span>经费本编号</span>
            <span>{{this.detailslList.经费本编号}}</span>
          </li>
          <li>
            <span>联系人</span>
            <span>{{this.detailslList.联系人}}</span>
          </li>
          <li>
            <span>联系人电话</span>
            <span>{{this.detailslList.联系人电话}}</span>
          </li>
          <li>
            <span>通讯地址</span>
            <span>{{this.detailslList.通讯地址}}</span>
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
            <span>课题来源</span>
            <span>{{this.detailslList.课题来源}}</span>
          </li>
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
            <span>类型</span>
            <span>{{this.detailslList.合作方关系}}</span>
          </li>
          <li>
            <span>类型</span>
            <span>{{this.detailslList.合作方契约关系}}</span>
          </li>
          <li>
            <span>名称</span>
            <span>{{this.detailslList.合作方单位名称}}</span>
          </li>
          <li>
            <span>法定代表人</span>
            <span>{{this.detailslList.合作方法定代表人}}</span>
          </li>
          <li>
            <span>项目类型</span>
            <span>{{this.detailslList.项目类型}}</span>
          </li>
          <li>
            <span>单位联系人</span>
            <span>{{this.detailslList.合作方单位联系人}}</span>
          </li>
          <li>
            <span>联系电话</span>
            <span>{{this.detailslList.合作方联系电话}}</span>
          </li>
          <li>
            <span>邮箱</span>
            <span>{{this.detailslList.合作方邮箱}}</span>
          </li>
          <li>
            <span>邮政编码</span>
            <span>{{this.detailslList.合作方邮政编码}}</span>
          </li>
          <li>
            <span>合作方所在行政区域</span>
            <span>{{this.detailslList.合作方所在省}} {{this.detailslList.合作方所在市}} {{this.detailslList.合作方所在地区}}</span>
          </li>
          <li>
            <span>法人代码</span>
            <span>{{this.detailslList.合作方法人或组织机构代码}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="合同信息">
        <ul class="servicel">
          <h4>合同详情信息</h4>
          <li>
            <span>合同金额</span>
            <span>{{NumFormat(this.detailslList.合同金额)}}</span>
          </li>
          <li>
            <span>签订时间</span>
            <span>{{startTime(this.detailslList.签订时间)}}</span>
          </li>
          <li>
            <span>付款方式</span>
            <span>{{this.detailslList.付款方式}}</span>
          </li>
          <li>
            <span>合作方式</span>
            <span>{{this.detailslList.合作方式}}</span>
          </li>
          <li>
            <span>合同开始时间</span>
            <span>{{startTime(this.detailslList.合同开始时间)}}</span>
          </li>
          <li>
            <span>合同结束时间</span>
            <span>{{startTime(this.detailslList.合同结束时间)}}</span>
          </li>
          <li>
            <span>研究类型</span>
            <span>{{this.detailslList.研究类型}}</span>
          </li>
          <li>
            <span>技术领域</span>
            <span>{{this.detailslList.技术领域}}</span>
          </li>
          <li>
            <span>合同类型</span>
            <span>{{this.detailslList.合同类型}}</span>
          </li>
          <li>
            <span>技术合同类型</span>
            <span>{{this.detailslList.技术合同类型}}</span>
          </li>
          <li>
            <span>是否申请技术合同认定</span>
            <span>{{conversionState(this.detailslList.是否申请技术合同认定)}}</span>
          </li>
          <li>
            <span>备注</span>
            <span>{{this.detailslList.备注}}</span>
          </li>
          <h4>技术合同认定登记信息</h4>
          <li>
            <span>合同技术交易额</span>
            <span>{{NumFormat(this.detailslList.合同技术交易额)}}</span>
          </li>
          <li>
            <span>知识产权</span>
            <span>{{this.detailslList.知识产权}}</span>
          </li>
          <li>
            <span>计划来源</span>
            <span>{{this.detailslList.计划来源}}</span>
          </li>
          <li>
            <span>合作方所属国民经济行业</span>
            <span>{{this.detailslList.合作方所属国民经济行业}}</span>
          </li>
          <li>
            <span>技术服务的国民经济行业</span>
            <span>{{this.detailslList.技术服务的国民经济行业}}</span>
          </li>
          <li>
            <span>合同的社会经济目标</span>
            <span>{{this.detailslList.合同的社会经济目标}}</span>
          </li>
          <li>
            <span>合作方性质</span>
            <span>{{this.detailslList.合作方性质}}</span>
          </li>
          <li>
            <span>是否高新性质</span>
            <span>{{conversionState(this.detailslList.是否高新性质)}}</span>
          </li>
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
          <li>
            <span>项目支出类型</span>
            <span>{{item.项目支出类型}}</span>
          </li>
          <li>
            <span>预算科目</span>
            <span>{{item.财务科目}}</span>
          </li>
          <li>
            <span>预算金额（元）</span>
            <span>{{NumFormat(item.批准经费)}}</span>
          </li>
          <li>
            <span>编制依据</span>
            <span>{{item.编制依据}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="参与人信息">
        <ul class="servicel" v-for="(item,key) in relatedProjects" :key="key">
          <h4>参与人信息</h4>
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
              <span>
                <i class="icon iconfont icon-shijian1" v-show="condition"></i>
                {{startTime(item.执行时间)}}
              </span>
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
      flag: "审核通过",
      total: null,
      condition: true,
      state: "待审核"
    };
  },
  created() {
    document.title = "横向项目详情";
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
    span {
      font-size: 14px;
      font-weight: bold;
      color: #1162b5;
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
