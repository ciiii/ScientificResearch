<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="著作信息">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li>
          <span>著作名称</span>
          <span>
            <p>{{this.detailslList.著作名称}}</p>
          </span>
        </li>
        <li>
          <span>出版社名称</span>
          <span>{{this.detailslList.出版社名称}}</span>
        </li>
        <li>
          <span>出版日期</span>
          <span>{{startTime(this.detailslList.著作出版日期)}}</span>
        </li>
        <li>
          <span>著作形式</span>
          <span>{{this.detailslList.著作形式}}</span>
        </li>
        <li>
          <span>年度</span>
          <span>{{this.detailslList.年度}}</span>
        </li>
        <li>
          <span>奖励情况</span>
          <span>{{this.detailslList.奖励情况}}</span>
        </li>
        <li>
          <span>出版地</span>
          <span>{{this.detailslList.出版地}}</span>
        </li>
        <li>
          <span>出版社级别</span>
          <span>{{this.detailslList.出版社级别}}</span>
        </li>
        <li>
          <span>ISBN号</span>
          <span>{{this.detailslList.ISBN号}}</span>
        </li>
        <li>
          <span>著作字数</span>
          <span>{{this.detailslList.著作字数}}</span>
        </li>
        <li>
          <span>著作类型</span>
          <span>{{this.detailslList.著作类型}}</span>
        </li>
        <li>
          <span>语种</span>
          <span>{{this.detailslList.语种}}</span>
        </li>
        <li>
          <span>是否译为外文</span>
          <span>{{conversionState(this.detailslList.是否译为外文)}}</span>
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
          <span>发行价(元)</span>
          <span>{{NumFormat(this.detailslList.发行价)}}</span>
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
    <van-tab title="作者信息">
      <div v-if="authorInformation.length == 0" class="zanwu">
        <img src="@/assets/images/nothing-3.png" alt>
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
        <h4>封面相关文件</h4>
        <li>封面相关文件：</li>
        <li>
          <a
            :href="this.detailslList.封面相关文件路径"
            download
          >{{Interception(this.detailslList.封面相关文件路径)}}</a>
        </li>
        <h4>版权页相关文件</h4>
        <li>版权页：</li>
        <li>
          <a
            :href="this.detailslList.版权页相关文件路径"
            download
          >{{Interception(this.detailslList.版权页相关文件路径)}}</a>
        </li>
        <h4>前言页相关文件</h4>
        <li>前言页</li>
        <li>
          <a
            :href="this.detailslList.前言页相关文件路径"
            download
          >{{Interception(this.detailslList.前言页相关文件路径)}}</a>
        </li>
        <h4>完整目录页相关文件路径</h4>
        <li>完整目录页：</li>
        <li>
          <a
            :href="this.detailslList.完整目录页相关文件路径"
            download
          >{{Interception(this.detailslList.完整目录页相关文件路径)}}</a>
        </li>
        <h4>其他相关文件</h4>
        <li>其他相关文件：</li>
        <li>
          <a
            :href="this.detailslList.其他相关文件路径"
            download
          >{{Interception(this.detailslList.其他相关文件路径)}}</a>
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
      active: 0,
      flag: "审核通过"
    };
  },
  created() {
    document.title = "著作详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails(item) {
      var para = {
        著作编号: this.$route.params.item
      };
      this.$http.getWorkDetails(para).then(res => {
        console.log(res, "sss");
        this.detailslList = res.data.著作详情;
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
    },
    backtrack() {
      this.show = false;
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
