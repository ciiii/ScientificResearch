<template>
  <van-list v-model="loading" :finished="finished" finished-text="没有更多了" @load="onLoad">
    <div class="backContentBox" v-for="(item, key) in list" :key="key">
      <div class="bacnButtom">
        <ul @click="goDetails(item,item.项目编号)">
          <li>{{item.流程名称}}</li>
          <li>
            <span>项目名称：</span>
            <span>{{item.项目名称}}</span>
          </li>
          <li>
            <span>步骤名称：</span>
            <span>{{item.步骤名称}}</span>
          </li>
          <li>
            <span>发起人姓名：</span>
            <span>{{item.发起人姓名}}</span>
          </li>
          <li>
            <i class="currentState">{{item.状态名称}}</i>
            <i class="stepState">{{item.步骤状态说明}}</i>
          </li>
          <li class="contentSpan">
            <span>当前步骤：</span>
            <span>{{item.步骤名称}} - {{item.步骤状态说明}}</span>
          </li>
          <li>
            <span>创建时间：</span>
            <span>{{startTime(item.流程创建时间)}}</span>
          </li>
        </ul>
        <div class="audit">
          <span @click="audit(item,key)" v-show="isShow">审核</span>
        </div>
      </div>
    </div>
    <van-popup v-model="show" class="popup">
      <Audit :message="message" @getMessage="getMessage" @getBacklog="getBacklog"></Audit>
    </van-popup>
  </van-list>
</template>
<script>
import Audit from "../audit/audit";
export default {
  components: {
    Audit
  },
  data() {
    return {
      index: 0,
      size: 0,
      total: 0,
      list: [],
      loading: false,
      finished: false,
      show: false,
      isShow: false,
      message: "",
      indexKey: null,
      typeList: {
        论文成果: "paperDetails",
        著作成果: "workDetails",
        专利成果: "patentDetails",
        获奖成果: "resultsDetails",
        纵向项目申报: "YDeclarationDetails",
        纵向项目中检: "YProcessInspectionDetails",
        纵向项目经费到账: "YFundsToTheAccount",

        横向项目: "XDetails",
        横向项目经费到账: "XFundsToTheAccount",
        报销: "reimbursementDetails"
      }
    };
  },
  methods: {
    // 子组件方法
    getMessage() {
      this.show = false;
    },
    // 获取待办列表
    getBacklog(type) {
      let data = {
        index: this.index + 1
      };
      this.$http.getBacklogProcess(data).then(res => {
        console.log(res,"123")
        this.total = res.data.total;
        const data = this.list;
        if (type) {
          data.splice(this.indexKey, 1);
        } else {
          this.list = data.concat(res.data.list);
        }
        this.list.forEach((item, index) => {
          if (item.步骤状态说明 === "待审核") {
            this.isShow = true;
          }
        });
        this.loading = false;
        this.index++;
        if (this.index >= this.total) {
          this.finished = true;
        }
      });
    },
    // 获取待办流程
    onLoad() {
      // 异步更新数据
      setTimeout(() => {
        this.getBacklog();
      }, 500);
    },
    goDetails(item, code) {
      // console.log(item, code, "详情");
      for (let key in this.typeList) {
        if (key == item.流程名称) {
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
    audit(item, key) {
      this.message = item;
      this.show = true;
      this.indexKey = key;
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
.backContentBox {
  text-align: left;
  padding: 10px 15px;
  border: 1px dashed #ccc;
  background-color: #fff;
  box-shadow: 6px 6px 6px #ccc;
  margin-bottom: 20px;
  .bacnButtom {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    li {
      display: flex;
      font-size: 14px;
      padding: 4px 0;
      span:nth-child(1) {
        color: #888;
      }
      span:nth-child(2) {
        color: #5a5a5a;
      }
      .stepState,
      .currentState {
        padding: 4px;
        color: #07c160;
        border-radius: 4px;
        font-size: 12px;
        border: 1px solid #07c160;
        font-style: normal;
      }
      .currentState {
        margin-right: 10px;
        color: #ed1941;
        border: 1px solid #ed1941;
      }
    }
    li:nth-child(1) {
      font-weight: 800;
      color: #1296db;
    }
    li:nth-child(2) {
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
    }
    .contentSpan {
      color: #ff976a;
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
}
.popup {
  width: 85%;
}
</style>