<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-shouquanicon"></i>著作管理
    </div>
    <div class="backContentBox" v-for="(item, key) in lectureList" :key="key">
      <!-- <ul class="backContentTop" @click="goDetails(item.编号)">
        <li>{{item.著作名称}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>-->
      <!-- <div > -->
      <ul class="backContentTop" @click="goDetails(item.编号)">
        <li>{{item.著作名称}}</li>
        <li>出版社名称：{{item.出版社名称}}</li>
        <li>著作类型：{{item.著作类型}}</li>
        <li>主编：{{item.主编}}</li>
        <li>年度：{{item.年度}}</li>
        <li class="contentSpan">审核进度：{{item.步骤名称}} - {{item.步骤状态说明}}</li>
        <li :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">当前步骤：{{item.审核进度}}</li>
        <li>
          <span>出版日期:{{startTime(item.著作出版日期)}}</span>
        </li>
      </ul>
      <!-- <div class="audit"> -->
      <span class="audit" @click="audit(item)" v-show="isShow">审核</span>
      <!-- </div> -->
      <!-- </div> -->
    </div>
    <van-popup v-model="show" class="popup">
      <Audit :message="message" @getMessage="getMessage"></Audit>
    </van-popup>
    <ReturnBtn/>
  </van-list>
</template>
<script>
import Audit from "@/components/audit/audit";
export default {
  components: {
    Audit
  },
  data() {
    return {
      lectureList: [],
      index: 1,
      size: 5,
      loading: false,
      finished: false,
      flag: "已完成-审核通过",
      show: false,
      isShow: true,
      message: ""
    };
  },
  created() {
    document.title = "著作管理";
  },
  mounted() {
    this.getPaper();
  },
  methods: {
    // 子组件方法
    getMessage() {
      this.show = false;
    },
    getPaper() {
      this.$http.getWorkAllList(this.index, this.size).then(res => {
        console.log(res);
        this.lectureList = res.data.list;
        this.lectureList.forEach((item, index) => {
          if (item.步骤状态说明 === "待审核") {
            this.isShow = true;
          }
        });
      });
    },
    // 查看详情
    goDetails(item) {
      this.$router.push({
        path: "/workDetails",
        name: "workDetails",
        params: {
          item: item
        }
      });
    },
    audit(item) {
      this.message = item;
      this.show = true;
    },
    goMeetingsList() {
      console.log("lt-ie9");
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return;
      }
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
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    padding: 8px 15px;
    border: 1px dashed #ccc;
    font-size: 14px;
    background-color: #fff;
    box-shadow: 6px 6px 6px #888888;
    margin-bottom: 20px;
    .backContentTop {
      padding: 4px 0;
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
    // .backContentTop {
    //   display: flex;
    //   font-weight: 800;
    //   li:nth-child(1) {
    //     overflow: hidden;
    //     text-overflow: ellipsis;
    //     display: -webkit-box;
    //     -webkit-line-clamp: 1;
    //     -webkit-box-orient: vertical;
    //     flex-grow: 1;
    //   }
    // }
    // ul {
    //   font-size: 14px;
    //   li {
    //     display: flex;
    //     padding: 4px 0;
    //     span:nth-child(1) {
    //       flex-grow: 1;
    //     }
    //     span:nth-child(2) {
    //       font-size: 12px;
    //       padding: 5px 12px;
    //       background-color: #07c160;
    //       border-radius: 5px;
    //       color: #fff;
    //     }
    //   }
    //   .contentSpan {
    //     color: #ff976a;
    //   }
    // }
  }
  .popup {
    width: 85%;
  }
}
</style>
