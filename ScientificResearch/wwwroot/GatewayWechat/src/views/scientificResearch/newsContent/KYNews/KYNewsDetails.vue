<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="通知内容">
        <ul class="servicel">
          <h4>通知内容</h4>
          <div v-html="this.detailslList.通知内容" :class="{active:active==this.detailslList.通知内容}"></div>
        </ul>
      </van-tab>
      <van-tab title="相关文件">
        <ul class="servicel">
          <h4>相关文件</h4>
          <li>附件：</li>
          <li>
            <a :href="this.detailslList.相关文件路径" download>{{Interception(this.detailslList.相关文件路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="基本信息">
        <h3>基本信息</h3>
        <ul class="servicel">
          <li class="title">
            <span>通知名称</span>
            <span>{{this.detailslList.通知名称}}</span>
          </li>
          <li>
            <span>通知类型</span>
            <span>{{this.detailslList.通知类型}}</span>
          </li>
          <li>
            <span>发布人</span>
            <span>{{this.detailslList.发送人姓名}}</span>
          </li>
          <li>
            <span>部门</span>
            <span>{{this.detailslList.发送人部门名称}}</span>
          </li>
          <li>
            <span>接收人数</span>
            <span>{{this.detailslList.接收人数}}</span>
          </li>
          <li>
            <span>已接收人数</span>
            <span>{{this.detailslList.已接收人数}}</span>
          </li>
          <li>
            <span>是否必读</span>
            <span>{{conversionState(this.detailslList.是否必读)}}</span>
          </li>
          <li>
            <span>发布时间</span>
            <span>{{startTime(this.detailslList.建立时间)}}</span>
          </li>
          <li>
            <span>关闭时间</span>
            <span>{{startTime(this.detailslList.关闭时间)}}</span>
          </li>
          <li>
            <span>状态</span>
            <span>{{conversionStateB(this.detailslList.是否启用)}}</span>
          </li>
        </ul>
        <h3>接受条件</h3>
        <ul class="servicel" v-for="(item,key) in relatedProjects" :key="key">
          <li>
            <span>接收者类型</span>
            <span>{{item.接收者类型名称}}</span>
          </li>
          <li>
            <span>接收者</span>
            <span>{{item.接收者名称}}</span>
          </li>
        </ul>
      </van-tab>
      <ReturnTop/>
      <ReturnBtn/>
    </van-tabs>
  </section>
</template>
<script>
import { Interception } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      active: 0,
      detailslList: [],
      relatedProjects: []
    };
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        编号: this.$route.params.item
      };
      this.$http.getKYNewsDetails(para).then(res => {
        this.detailslList = res.data.通知公告;
        this.relatedProjects = res.data.接收条件;
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
    Interception(item) {
      return Interception(item);
    },
    conversionState(item) {
      return item == true ? "是" : item == false ? "否" : " ";
    },
    conversionStateB(item) {
      return item == true ? "正常" : item == false ? "未启用" : " ";
    }
  }
};
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
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
    li {
      padding: 10px 0;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #f2f2f2;
      span:nth-child(1) {
        color: #888;
      }
      span:nth-child(2) {
        color: #5a5a5a;
      }
    }
    .title {
      display: flex;
      align-items: center;
      span:nth-child(1) {
        width: 30%;
      }
      span:nth-child(2) {
        padding-left: 10px;
      }
    }
    /deep/ img {
      max-width: 100%;
      height: auto;
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 5px;
    }
    h4 {
      margin: 5px 0;
      padding: 5px;
      color: #1296db;
      background-color: #e7e7e7;
    }
    li {
      padding: 5px 0;
    }
  }
}
</style>

