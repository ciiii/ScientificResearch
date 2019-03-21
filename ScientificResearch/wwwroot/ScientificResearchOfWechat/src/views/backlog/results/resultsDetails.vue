<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="基本信息">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li>
          <span>获奖名称</span>
          <span>
            <p>{{this.detailslList.获奖名称}}</p>
          </span>
        </li>
        <li>
          <span>获奖类别</span>
          <span>{{this.detailslList.获奖类别}}</span>
        </li>
        <li>
          <span>获奖级别</span>
          <span>{{this.detailslList.获奖级别}}</span>
        </li>
        <li>
          <span>获奖日期</span>
          <span>{{startTime(this.detailslList.获奖日期)}}</span>
        </li>
        <li>
          <span>获奖等级</span>
          <span>{{this.detailslList.获奖等级}}</span>
        </li>
        <li>
          <span>奖励情况</span>
          <span>{{this.detailslList.奖励情况}}</span>
        </li>
        <li>
          <span>联系人</span>
          <span>{{this.detailslList.联系人}}</span>
        </li>
        <li>
          <span>联系人手机</span>
          <span>{{this.detailslList.联系人手机}}</span>
        </li>
        <li>
          <span>项目开始时间</span>
          <span>{{startTime(this.detailslList.项目开始时间)}}</span>
        </li>
        <li>
          <span>项目结束时间</span>
          <span>{{startTime(this.detailslList.项目结束时间)}}</span>
        </li>
        <li>
          <span>应用开始时间</span>
          <span>{{startTime(this.detailslList.应用开始时间)}}</span>
        </li>
        <li>
          <span>应用结束时间</span>
          <span>{{startTime(this.detailslList.应用结束时间)}}</span>
        </li>
        <li>
          <span>年度</span>
          <span>{{this.detailslList.年度}}</span>
        </li>
        <li>
          <span>批文时间</span>
          <span>{{startTime(this.detailslList.批文时间)}}</span>
        </li>
        <li>
          <span>颁奖单位</span>
          <span>{{this.detailslList.颁奖单位}}</span>
        </li>
        <li>
          <span>完成人数</span>
          <span>{{this.detailslList.完成人数}} 人</span>
        </li>
        <li>
          <span>获奖证书编号</span>
          <span>{{this.detailslList.获奖证书编号}}</span>
        </li>
        <li>
          <span>获奖摘要</span>
          <span>{{this.detailslList.获奖摘要}}</span>
        </li>
        <li>
          <span>备注</span>
          <span>{{this.detailslList.备注}}</span>
        </li>
      </ul>
    </van-tab>
    <van-tab title="完成人信息">
      <div v-if="authorInformation.length == 0" class="zanwu">
        <img src="@/assets/images/nothing-3.png" alt>
      </div>
      <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
        <h4>相关项目</h4>
        <li>
          <span>完成人姓名</span>
          <span>{{item.姓名}}</span>
        </li>
        <li>
          <span>部门名称</span>
          <span>{{item.部门名称}}</span>
        </li>
        <li>
          <span>完成人排序</span>
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
        <h4>获奖单位文件</h4>
        <li>获奖单位文件：</li>
        <li>
          <a
            :href="this.detailslList.获奖单位文件路径"
            download
          >{{Interception(this.detailslList.获奖单位文件路径)}}</a>
        </li>
        <h4>获奖批文</h4>
        <li>获奖批文：</li>
        <li>
          <a :href="this.detailslList.获奖批文" download>{{Interception(this.detailslList.获奖批文)}}</a>
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
        <li>
          <span>状态</span>
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
import { Interception } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      detailslList: [],
      relatedProjects: [],
      authorInformation: [],
      auditRecords: [],
      state: "审核通过",
      show: false,
      active: 0
    };
  },
  created() {
    document.title = "获奖详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails(item) {
      var para = {
        获奖编号: this.$route.params.item
      };
      this.$http.getResultsDetails(para).then(res => {
        // console.log(res, "sss");
        this.detailslList = res.data.获奖详情;
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
    // 截取字符串
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
