<template>
  <div>
    <van-pull-refresh v-model="isDownLoading" @refresh="onDownRefresh">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
        class="box"
      >
        <div class="title">
          <i class="icon iconfont icon-gerenhuojiang"></i>获奖管理
        </div>
        <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
          <ul class="backContentTop" @click="goDetails(item.编号)">
            <li>{{item.获奖名称}}</li>
            <li>
              <span>获奖级别：</span>
              <span>{{item.获奖级别}}</span>
            </li>
            <li>
              <span>获奖类别：</span>
              <span>{{item.获奖类别}}</span>
            </li>
            <li>
              <span>获奖等级：</span>
              <span>{{item.获奖等级}}</span>
            </li>
            <li>
              <span>颁奖单位：</span>
              <span>{{item.颁奖单位}}</span>
            </li>
            <li>
              <span>第一发明人：</span>
              <span>{{item.第一发明人}}</span>
            </li>
            <li>
              <span>第一完成人：</span>
              <span>{{item.第一完成人}}</span>
            </li>
            <li>
              <span>获奖日期：</span>
              <span>{{startTime(item.获奖日期)}}</span>
            </li>
            <li>
              <span>年度：</span>
              <span>{{item.年度}}</span>
            </li>
            <li>
              <span>当前步骤：</span>
              <span id="contentSpan">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
            </li>
            <li>
              <span>审核进度：</span>
              <span :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">{{item.审核进度}}</span>
            </li>
          </ul>
          <span class="audit" @click="audit(item,key)" v-show="item.步骤状态说明 === '待审核'">审核</span>
        </div>
        <van-popup v-model="show" class="popup">
          <Audit :message="message" @getMessage="getMessage"></Audit>
        </van-popup>
      </van-list>
    </van-pull-refresh>
    <ReturnTop/>
    <ReturnBtn/>
  </div>
</template>
<script>
import Audit from "@/components/audit/audit";
export default {
  inject: ["reload"],
  components: {
    Audit
  },
  data() {
    return {
      lectureList: [],
      index: 1,
      size: 15,
      total: 0,
      indexKey: null,
      loading: false,
      finished: false,
      isDownLoading: false,
      flag: "已完成-审核通过",
      show: false,
      message: ""
    };
  },
  methods: {
    // 子组件方法
    getMessage() {
      this.show = false;
    },
    onLoad(type) {
      this.$http.getResultsAllList(this.index, this.size).then(res => {
        this.total = res.data.total;
        const data = this.lectureList;
        if (type) {
          data.splice(this.indexKey, 1);
        } else {
          this.lectureList = data.concat(res.data.list);
        }
        this.loading = false;
        this.index++;
        if (this.lectureList.length >= this.total) {
          this.finished = true;
        }
      });
    },
    onDownRefresh() {
      setTimeout(() => {
        this.reload();
        this.isDownLoading = false;
      }, 1000);
    },
    // 查看详情
    goDetails(item) {
      this.$router.push({
        path: "/resultsDetails",
        name: "resultsDetails",
        params: {
          item: item
        }
      });
    },
    audit(item, key) {
      this.message = item;
      this.show = true;
      this.indexKey = key;
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return;
      }
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  padding: 12px;
  text-align: left;
  background-color: #f5f3fb;
  .title {
    font-size: 14px;
    padding: 10px;
    background-color: #fff;
    i {
      font-weight: 800;
      color: #d4237a;
      margin-right: 5px;
    }
  }
  .backContentBox {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    padding: 8px 15px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #ccc;
    margin-bottom: 20px;
    .backContentTop {
      font-size: 14px;
      li {
        padding: 4px 0;
        span:nth-child(1) {
          color: #888;
        }
        span:nth-child(2) {
          color: #5a5a5a;
        }
        #contentSpan {
          color: #ff976a;
        }
      }
      li:nth-child(1) {
        font-weight: 800;
        color: #1296db;
        margin: 10px 0;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
    }
    .audit {
      display: inline-block;
      width: 26px;
      font-size: 12px;
      padding: 5px 12px;
      background-color: #07c160;
      border-radius: 5px;
      color: #fff;
    }
  }
  .popup {
    width: 85%;
  }
}
</style>
