<template>
  <div>
    <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
      <div class="backContentBox" v-for="(item, key) in list" :key="key">
        <ul class="backContentTop">
          <li>{{item.流程名称}}</li>
          <li @click="details()">
            查看详情
            <span style="font-family: 宋体">></span>
          </li>
        </ul>
        <div class="backContentButtom">
          <ul>
            <li>{{item.项目名称}}</li>
            <li>{{item.发起人姓名}}</li>
            <li>{{item.步骤名称}}</li>
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
      <van-popup v-model="show" class="popup">
        <van-tabs v-model="active" swipeable>
          <!-- <van-tab title="参加会议详情">
            <ul class="servicel">
              <h4>基本信息</h4>
              <li>{{this.servicelList.会议名称}}</li>
              <li>
                <span>主办单位：{{this.servicelList.会议主办单位}}</span>
                <span>承办单位：{{this.servicelList.会议承办单位}}</span>
              </li>
              <li>
                <span>申请人：{{this.servicelList.申请人姓名}}</span>
                <span>申请人部门：{{this.servicelList.申请人部门名称}}</span>
              </li>
              <li>
                <span>研讨领域：{{this.servicelList.研讨领域}}</span>
                <span>学科类型：{{this.servicelList.学科类型}}</span>
              </li>
              <li>
                <span>开始：{{startTime(this.servicelList.会议开始时间)}}</span>
                <span>结束：{{startTime(this.servicelList.会议结束时间)}}</span>
              </li>
              <li>
                会议网址：
                <a :href="this.servicelList.会议网址">{{this.servicelList.会议网址}}</a>
              </li>
              <li>
                <span>会议地址：{{this.servicelList.会议地址}}</span>
                <span>往返时间：{{this.servicelList.往返时间}} 天</span>
              </li>
              <h4>会议简介及申请理由</h4>
              <li>会议简介：{{this.servicelList.会议简介及申请理由}}</li>
              <h4>参会相关文件</h4>
              <li>参会相关文件：{{this.servicelList.参会相关文件路径}}</li>
            </ul>
          </van-tab>-->
          <!-- <van-tab title="申请记录">
            <ul v-for="(item,key) in auditList" :key="key" class="audit">
              <li>步骤名称：{{item.名称}}</li>
              <li>处理人：{{item.姓名}}</li>
              <li class="state">
                <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
                <span>
                  <i class="icon iconfont icon-shijian1"></i>
                  {{conversionTime(item.执行时间)}}
                </span>
              </li>
              <li>备注：{{item.备注}}</li>
            </ul>
          </van-tab>-->
        </van-tabs>
        <div class="backtrack" @click="backtrack">
          <i class="icon iconfont icon-fanhui"></i> 返回
        </div>
      </van-popup>
    </van-list>
  </div>
</template>
<script>
export default {
  data() {
    return {
      index: 1,
      size: 15,
      list: [],
      loading: false,
      finished: false,
      show: false,
      active: 0
    };
  },
  mounted() {
    if (localStorage.token) {
      this.getBacklog();
    }
  },
  methods: {
    // 获取待办流程
    getBacklog() {
      this.$http
        .getBacklogProcess(this.index, this.size)
        .then(res => {
          // console.log(res, "获取待办流程");
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
      console.log('查看待办详情')
      // this.show = true;
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
    },
    // 关闭弹窗
    backtrack() {
      this.show = false;
    }
  }
};
</script>
<style lang="less" scoped>
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
.popup {
  width: 100%;
  height: 100%;
  transform: none;
  top: 0;
  left: 0;
  background-color: #f5f3fb;
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
</style>