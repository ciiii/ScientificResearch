<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="论文信息">
        <ul class="servicel">
          <h4>基本信息</h4>
          <li class="title">
            <span>论文标题</span>
            <p>{{this.detailslList.论文标题}}</p>
          </li>
          <li>
            <span>论文Online日期</span>
            <span>{{startTime(this.detailslList.论文Online日期)}}</span>
          </li>
          <li>
            <span>正式出版日期</span>
            <span>{{startTime(this.detailslList.论文正式出版日期)}}</span>
          </li>
          <li>
            <span>他引次数</span>
            <span>{{this.detailslList.他引次数}}</span>
          </li>
          <li>
            <span>年度</span>
            <span>{{this.detailslList.年度}}</span>
          </li>
          <li>
            <span>收稿日期</span>
            <span>{{startTime(this.detailslList.收稿日期)}}</span>
          </li>
          <li>
            <span>版面费(元)</span>
            <span>{{NumFormat(this.detailslList.版面费)}}</span>
          </li>
          <li>
            <span>超额版面费(元)</span>
            <span>{{NumFormat(this.detailslList.超额版面费)}}</span>
          </li>
          <li>
            <span>超额费用来源</span>
            <span>{{this.detailslList.超额费用来源}}</span>
          </li>
          <li>
            <span>奖励情况</span>
            <span>{{this.detailslList.奖励情况}}</span>
          </li>
          <li>
            <span>论文字数</span>
            <span>{{this.detailslList.论文字数}}</span>
          </li>
          <li>
            <span>计划来源</span>
            <span>{{this.detailslList.计划来源}}</span>
          </li>
          <li>
            <span>论文版面</span>
            <span>{{this.detailslList.论文版面}}</span>
          </li>
          <li>
            <span>学科门类</span>
            <span>{{this.detailslList.学科门类}}</span>
          </li>
          <li>
            <span>一级学科</span>
            <span>{{this.detailslList.一级学科}}</span>
          </li>
          <li>
            <span>二级学科</span>
            <span>{{this.detailslList.二级学科}}</span>
          </li>
          <li>
            <span>三级学科</span>
            <span>{{this.detailslList.三级学科}}</span>
          </li>
          <li>
            <span>作者人数</span>
            <span>{{this.detailslList.作者人数}}</span>
          </li>
          <li>
            <span>通讯作者</span>
            <span>{{this.detailslList.通讯作者}}</span>
          </li>
          <li>
            <span>文献类型</span>
            <span>{{this.detailslList.文献类型}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="刊物信息">
        <ul class="servicel">
          <h4>刊物信息</h4>
          <li>
            <span>刊物名称</span>
            <span>{{this.detailslList.刊物名称}}</span>
          </li>
          <li>
            <span>影响因子</span>
            <span>{{this.detailslList.影响因子}}</span>
          </li>
          <li>
            <span>特征因子分值</span>
            <span>{{this.detailslList.特征因子分值}}</span>
          </li>
          <li>
            <span>主办单位</span>
            <span>{{this.detailslList.主办单位}}</span>
          </li>
          <li>
            <span>编目名称</span>
            <span>{{this.detailslList.编目名称}}</span>
          </li>
          <li>
            <span>CN号</span>
            <span>{{this.detailslList.CN号}}</span>
          </li>
          <li>
            <span>ISSN号</span>
            <span>{{this.detailslList.ISSN号}}</span>
          </li>
          <li>
            <span>卷号</span>
            <span>{{this.detailslList.卷号}}</span>
          </li>
          <li>
            <span>期号</span>
            <span>{{this.detailslList.期号}}</span>
          </li>
          <li>
            <span>页码范围</span>
            <span>{{this.detailslList.页码范围起}} ~ {{this.detailslList.页码范围止}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="相关项目">
        <div v-if="relatedProjects.length == 0" class="zanwu">
          <img src="../../../assets/images/nothing-3.png" alt>
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
      <van-tab title="作者信息">
        <div v-if="authorInformation.length == 0" class="zanwu">
          <img src="../../../assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
          <h4>相关项目</h4>
          <li>
            <span>作者姓名</span>
            <span>{{item.姓名}}</span>
          </li>
          <li>
            <span>部门名称</span>
            <span>{{item.部门名称}}</span>
          </li>
          <li>
            <span>作者级别</span>
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
          <h4>检索信息页相关文件</h4>
          <li>检索信息页相关文件路径：</li>
          <li>
            <a
              :href="this.detailslList.检索信息页相关文件路径"
              download
            >{{Interception(this.detailslList.检索信息页相关文件路径)}}</a>
          </li>
          <h4>论文正文</h4>
          <li>论文正文：</li>
          <li>
            <a :href="this.detailslList.论文正文路径">{{Interception(this.detailslList.论文正文路径)}}</a>
          </li>
          <h4>其他相关文件</h4>
          <li>其他相关文件：</li>
          <li>
            <a :href="this.detailslList.其他相关文件路径">{{Interception(this.detailslList.其他相关文件路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="审核记录">
        <div v-if="auditRecords.length == 0" class="zanwu">
          <img src="../../../assets/images/nothing-3.png" alt>
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
    document.title = "论文详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        论文编号: this.$route.params.item
      };
      this.$http.getpaperDetails(para).then(res => {
        console.log(res, "sss");
        this.detailslList = res.data.论文详情;
        this.relatedProjects = res.data.成果项目;
        this.authorInformation = res.data.成果作者;
        this.auditRecords = res.data.审核情况;
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
        width: 80%;
        color: #5a5a5a;
        margin: 0;
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
    .title span{
      display: flex;
      align-items: center; 
    }
  }
}
</style>
