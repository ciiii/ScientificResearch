<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
    <div class="backContentBox" v-for="(item, key) in list" :key="key">
      <ul class="backContentTop">
        <li>{{item.流程名称}}</li>
        <li @click="details">
          查看详情
          <span style="font-family: 宋体">></span>
        </li>
      </ul>
      <div class="backContentButtom">
        <ul>
          <li>{{item.项目名称}}</li>
          <li>{{item.发起人姓名}}</li>
          <li>
            <span class="currentState">{{item.状态名称}}</span>
            <span class="stepState">{{item.步骤状态说明}}</span>
          </li>
          <li>{{item.步骤名称}} - {{item.步骤状态说明}}</li>
        </ul>
        <div class="auditBtn" @click="review">
          <span>复核</span>
        </div>
      </div>
    </div>
  </van-list>
</template>
<script>
export default {
  data() {
    return {
      index:1,
      size:15,
      list: [],
      loading: false,
      finished: false
    };
  },
  mounted() {
    if(localStorage.token){
      this.getBacklog()
    }
  },
  methods: {
    // 获取待办流程
    getBacklog() {
      this.$http
        .getBacklogProcess(this.index, this.size)
        .then(res => {
          console.log(res, "获取待办流程");
          this.list = res.data.list;
        })
        .catch(error => {
          console.log(error);
        });
    },
    review() {
      console.log("复核");
    },
    details() {
      console.log("详情");
    },
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        for (let i = 0; i < 0; i++) {
          this.list.push(this.list.length + 1);
        }
        // 加载状态结束
        this.loading = false;

        // 数据全部加载完成
        if (this.list.length >= 0) {
          this.finished = true;
        }
      }, 500);
    }
  }
};
</script>
<style scoped>
.backContentBox {
  font-size: 16px;
  padding: 10px;
  box-shadow: 6px 6px 6px #888888;
  border: 1px dashed #ccc;
  margin-bottom: 20px;
}
.backContentTop {
  display: flex;
  justify-content: space-between;
  text-align: left;
  padding: 10px 6px;
}
.backContentTop > li:nth-child(1) {
  font-weight: 800;
  font-size: 14px;
}
.backContentTop > li:nth-child(2) {
  font-size: 14px;
}
.backContentButtom {
  background-color: #fffef9;
  padding: 0 6px 10px 6px;
  display: flex;
  justify-content: space-between;
  text-align: left;
}
.backContentButtom > ul > li {
  font-size: 14px;
  padding: 6px 0;
}
.stepState,
.currentState {
  padding: 4px;
  color: #fff;
  border-radius: 4px;
  font-size: 12px;
  background-color: #ff976a;
}
.currentState {
  margin-right: 10px;
  background-color: #ed1941;
}
.auditBtn {
  display: flex;
  align-items: flex-end;
}
.auditBtn > span {
  padding: 4px 10px;
  background-color: #07c160;
  border-radius: 4px;
  color: #fff;
  font-size: 12px;
}
</style>