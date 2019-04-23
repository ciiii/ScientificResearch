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
          <i class="icon iconfont icon-fankui"></i>论文管理
        </div>
        <div class="backContentBox" v-for="(item, key) in detailsList" :key="key">
          <ul class="backContentTop" @click="goDetails(item.编号)">
            <li>{{item.论文标题}}</li>
            <li>
              <span>刊物名称：</span>
              <span>{{item.刊物名称}}</span>
            </li>
            <li>
              <span>第一作者：</span>
              <span>{{item.第一作者}}</span>
            </li>
            <li>
              <span>影响因子：</span>
              <span>{{item.影响因子}}</span>
            </li>
            <li>
              <span>当前步骤：</span>
              <span id="contentSpan">{{item.步骤名称}} - {{item.步骤状态说明}}</span>
            </li>
            <li>
              <span>审核进度：</span>
              <span :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">{{item.审核进度}}</span>
            </li>
            <li>
              <span>Online日期：</span>
              <span>{{startTime(item.论文Online日期)}}</span>
            </li>
            <li>
              <span>正式出版日期：</span>
              <span>{{startTime(item.论文正式出版日期)}}</span>
            </li>
            <li>
              <span>认领人：</span>
              <span>{{item.认领人姓名}}</span>
            </li>
          </ul>
          <div class="audit">
            <span @click="audit(item)" v-show="item.步骤状态说明 === '待审核'">审核</span>
          </div>
        </div>
        <van-popup v-model="show" class="popup">
          <Audit :message="message" @getMessage="getMessage"></Audit>
        </van-popup>
      </van-list>
    </van-pull-refresh>
    <ReturnBtn/>
  </div>
</template>
<script>
import Audit from "@/components/audit/audit";
export default {
  inject:['reload'],
  components: {
    Audit
  },
  data() {
    return {
      index: 1,
      size: 15,
      total: 0,
      indexKey: null,
      isDownLoading: false,
      loading: false,
      finished: false,
      detailsList: [],
      flag: "已完成-审核通过",
      show: false,
      isShow: false,
      message: ""
    };
  },
  methods: {
    // 子组件方法
    getMessage() {
      this.show = false;
    },
    goDetails(item) {
      this.$router.push({
        path: "/paperDetails",
        name: "paperDetails",
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
    onLoad(type) {
      this.$http.getPaperAllList(this.index, this.size).then(res => {
        this.total = res.data.total;
        const data = this.detailsList;
        if (type) {
          data.splice(this.indexKey, 1);
        } else {
          this.detailsList = data.concat(res.data.list);
        }
        this.loading = false;
        this.index++;
        if (this.detailsList.length >= this.total) {
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
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
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
    padding: 10px 15px;
    font-size: 14px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #ccc;
    margin-bottom: 20px;
    .backContentTop {
      li {
        font-size: 14px;
        padding: 4px 0;
        span:nth-child(1) {
          color: #888;
        }
        span:nth-child(2) {
          color: #5a5a5a;
        }
      }
      li:nth-child(1) {
        margin: 10px 0;
        font-weight: 800;
        color: #1296db;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      li:nth-child(2) {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      #contentSpan {
        color: #ff976a;
      }
    }
    .audit {
      span {
        display: inline-block;
        width: 32px;
        font-size: 14px;
        padding: 8px 16px;
        background-color: #07c160;
        border-radius: 5px;
        color: #fff;
      }
    }
  }
  .popup {
    width: 85%;
  }
}
</style>