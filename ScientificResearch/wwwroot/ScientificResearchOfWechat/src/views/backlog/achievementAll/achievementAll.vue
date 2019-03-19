<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-overview"></i>成果总览
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goDetails(item,item.成果编号)">
        <li>{{item.成果名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>成果类型：{{item.成果类型}}</li>
        <li>发起人：{{item.发起人姓名}}</li>
        <li>发起人部门：{{item.发起人部门名称}}</li>
        <li>年度：{{item.年度}}</li>
      </ul>
    </div>
  </van-list>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      lectureList: [],
      index: 1,
      size: 15,
      loading: false,
      finished: false,
      typeList: {
        论文成果: "paperDetails",
        著作成果: "workDetails",
        专利成果: "patentDetails",
        获奖成果: "resultsDetails"
      }
    };
  },
  created() {
    document.title = "成果总览";
  },
  mounted() {
    this.getPaper();
  },
  methods: {
    getPaper() {
      this.$http.getAchievementAllList(this.index, this.size).then(res => {
        console.log(res);
        this.lectureList = res.data.list;
      });
    },
    // 查看详情
    goDetails(item, code) {
      for (let key in this.typeList) {
        if (key == item.成果类型) {
          this.$router.push({
            path: `/${this.typeList[key]}`,
            name: `${this.typeList[key]}`,
            params: {
              item: code
            }
          });
        }
      }
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
    backtrack() {
      this.show = false;
    },

    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 0; i++) {
          this.lectureList.push(this.lectureList.length + 1);
        }
        // 加载状态结束
        this.loading = false;
        // 数据全部加载完成
        if (this.lectureList.length >= 0) {
          this.finished = true;
        }
      }, 500);
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
    padding: 8px 15px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #888888;
    margin-bottom: 20px;
    .backContentTop {
      display: flex;
      font-weight: 800;
      li:nth-child(1) {
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        flex-grow: 1;
      }
    }
    ul {
      font-size: 14px;
      .contentLi {
        color: #07c160;
      }
      li {
        display: flex;
        padding: 4px 0;
        span:nth-child(2) {
          text-align: right;
        }
        .auditBtn {
          font-size: 12px;
          text-align: right;
          padding: 5px 12px;
          background-color: #07c160;
          border-radius: 5px;
          color: #fff;
        }
        span:nth-child(1) {
          flex-grow: 1;
          i {
            color: rgb(6, 167, 6);
          }
        }
      }
    }
  }
  .popup {
    width: 100%;
    height: 100%;
    transform: none;
    top: 0;
    left: 0;
    background-color: #f5f3fb;
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
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        padding: 5px 0;
        display: flex;
        span {
          width: 50%;
          justify-content: space-between;
        }
        i {
          color: rgb(6, 167, 6);
        }
      }
    }
    .backtrack {
      font-size: 14px;
      color: #fff;
      width: 60px;
      height: 20px;
      padding: 5px;
      text-align: center;
      position: fixed;
      bottom: 20px;
      right: 20px;
      border-radius: 20px;
      background-color: rgba(28, 134, 238, 0.5);
    }
  }
}
</style>
