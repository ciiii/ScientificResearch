<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad" class="box">
    <div class="title">
      <i class="icon iconfont icon-fankui"></i>论文管理
    </div>
    <div class="backContentBox" v-for="(item, key) in detailsList" :key="key">
      <ul class="backContentTop" @click="goDetails(item.编号)">
        <!-- <van-checkbox :name="item"></van-checkbox> -->
        <li>{{item.论文标题}}</li>
        <li>
          <i class="icon iconfont icon-you"></i>
        </li>
      </ul>
      <ul>
        <li>刊物名称：{{item.刊物名称}}</li>
        <li>第一作者：{{item.第一作者}}</li>
        <li>影响因子:{{item.影响因子}}</li>
        <li class="contentSpan">审核进度：{{item.步骤名称}} - {{item.步骤状态说明}}</li>
        <li :style="{'color':(item.审核进度 == flag ? '#31BD5D' : '#FF976A')}">当前步骤：{{item.审核进度}}</li>
        <li>Online日期：{{startTime(item.论文Online日期)}}</li>
        <li>正式出版日期：{{startTime(item.论文正式出版日期)}}</li>
        <li>
          <span>认领人：{{item.认领人姓名}}</span>
          <span @click="audit">审核</span>
        </li>
      </ul>
    </div>
    <van-popup v-model="show"  message='show' class="popup">
      <Audit></Audit>
    </van-popup>
    <!-- <van-submit-bar button-text="全部通过" @submit="onSubmit">
      <van-checkbox v-model="checked">全选</van-checkbox>
    </van-submit-bar>-->
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
      index: 1,
      size: 5,
      loading: false,
      finished: false,
      detailsList: [],
      flag: "已完成-审核通过",
      // checked: true,
      show: false
    };
  },
  created() {
    document.title = "论文管理";
  },
  mounted() {
    this.getPaperAll();
  },
  methods: {
    getPaperAll() {
      this.$http.getPaperAllList(this.index, this.size).then(res => {
        console.log(res, "aaaaa");
        this.detailsList = res.data.list;
      });
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
    audit() {
      // this.$router.push('/audit')
      this.show = true;
    },

    // onSubmit() {
    //   console.log("1122");
    // },
    onLoad() {
      console.log("121");
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
    padding: 10px 0;
    background-color: #fff;
    i {
      font-weight: 800;
      color: #d4237a;
      margin-right: 5px;
    }
  }
  .backContentBox {
    padding: 10px 15px;
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
      li {
        display: flex;
        padding: 4px 0;
        span:nth-child(1) {
          flex-grow: 1;
        }
        span:nth-child(2) {
          font-size: 12px;
          padding: 5px 12px;
          background-color: #07c160;
          border-radius: 5px;
          color: #fff;
        }
      }
      .contentSpan {
        color: #ff976a;
      }
    }
  }
  .van-checkbox {
    padding-left: 10px;
  }
  .popup {
    width: 85%;
  }
}
</style>