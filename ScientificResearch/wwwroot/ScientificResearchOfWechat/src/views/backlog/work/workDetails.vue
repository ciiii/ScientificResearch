<template>
  <van-tabs v-model="active" swipeable class="popup">
    <van-tab title="著作信息">
      <ul class="servicel">
        <h4>基本信息</h4>
        <li>著作名称：
          <p>{{this.detailslList.著作名称}}</p>
        </li>
        <li>出版社名称：{{this.detailslList.出版社名称}}</li>
        <li>出版日期：{{startTime(this.detailslList.著作出版日期)}}</li>
        <li>
          <span>著作形式：{{this.detailslList.著作形式}}</span>
          <span>年度：{{this.detailslList.年度}}</span>
        </li>
        <li>奖励情况：{{this.detailslList.奖励情况}}</li>
        <li>出版地：{{this.detailslList.出版地}}</li>
        <li>出版社级别：{{this.detailslList.出版社级别}}</li>
        <li>
          <span>ISBN号：{{this.detailslList.ISBN号}}</span>
          <span>著作字数：{{this.detailslList.著作字数}}</span>
        </li>
        <li>
          <span>著作类型：{{this.detailslList.著作类型}}</span>
          <span>语种：{{this.detailslList.语种}}</span>
        </li>
        <li>
          <span>是否译为外文：{{conversionState(this.detailslList.是否译为外文)}}</span>
          <span>学科门类：{{this.detailslList.学科门类}}</span>
        </li>
        <li>
          <span>一级学科：{{this.detailslList.一级学科}}</span>
          <span>二级学科：{{this.detailslList.二级学科}}</span>
        </li>
        <li>
          <span>三级学科：{{this.detailslList.三级学科}}</span>
          <span>作者人数：{{this.detailslList.作者人数}}</span>
        </li>
        <li>发行价(元)：￥{{NumFormat(this.detailslList.发行价)}}</li>
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
    <van-tab title="作者信息">
      <div v-if="authorInformation.length == 0" class="zanwu">
        <img src="../../../assets/images/nothing-3.png" alt>
      </div>
      <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
        <h4>相关项目</h4>
        <li>作者姓名：{{item.姓名}}</li>
        <li>部门名称：{{item.部门名称}}</li>
        <li>作者级别：{{item.作者级别}}</li>
        <li>工作量占比(%)：{{item.工作量占比}}</li>
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
        <img src="../../../assets/images/nothing-3.png" alt>
      </div>
      <ul v-for="(item,key) in auditRecords" :key="key" v-else class="audit">
        <li>步骤名称：{{item.名称}}</li>
        <li>处理人：{{item.姓名}}</li>
        <li class="state">
          <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
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
      active: 0,
      flag: "已完成-审核通过"
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
