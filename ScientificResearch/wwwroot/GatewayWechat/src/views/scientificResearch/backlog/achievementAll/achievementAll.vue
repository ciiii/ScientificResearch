<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-overview"></i>成果总览
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <ul class="backContentTop" @click="goDetails(item,item.成果编号)">
        <li>{{item.成果名称}}</li>
        <li><span>成果类型：</span><span>{{item.成果类型}}</span></li>
        <li><span>发起人：</span><span>{{item.发起人姓名}}</span></li>
        <li><span>发起人部门：</span><span>{{item.发起人部门名称}}</span></li>
        <li><span>年度：</span><span>{{item.年度}}</span></li>
      </ul>
    </div>
    <ReturnBtn/>
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
    font-size: 14px;
    padding: 8px 15px;
    border: 1px dashed #ccc;
    background-color: #fff;
    box-shadow: 6px 6px 6px #ccc;
    margin-bottom: 20px;
    .backContentTop {
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
        margin: 10px 0;
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
}
</style>
