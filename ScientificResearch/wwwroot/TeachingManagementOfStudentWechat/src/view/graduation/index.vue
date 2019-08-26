<template>
  <div>
    <navbar :isSearch="true" :path="path" :search="search" />
    <add-btn :callback="edit" v-if="TrainingSituation.状态=='待结业'" />
    <div class="content">
      <van-list
        v-model="loading"
        :finished="finished"
        :error.sync="error"
        error-text="请求失败，点击重新加载"
        :finished-text="finishText"
        @load="getlist"
      >
        <div v-for="item in list" :key="item.编号" class="box">
          <div>
            <label style="letter-spacing:2px;">姓名:</label>
            <span>{{item.CreatorInfo}}</span>
          </div>
          <div>
            <label>学员类型:</label>
            <span>{{item.学员类型名称}}</span>
          </div>
          <div>
            <label>培训专业:</label>
            <span>{{item.专业名称}}</span>
          </div>
          <div>
            <label style="width:100px;">教学本院策略:</label>
            <span>{{item.教学本院策略名称}}</span>
          </div>

          <div>
            <label>培训年界:</label>
            <span class="red">{{item.学员培训年界}}({{item.学员培训年限}})</span>
          </div>
          <div>
            <label>建立时间:</label>
            <span>{{item.建立时间}}</span>
          </div>
          <div>
            <label>审核进度:</label>
            <span>{{item.StateName}}-{{item.LastStepStateName}}</span>
          </div>
          <div>
            <label>当前步骤:</label>
            <span>{{item.LastStepTemplateName}}-{{item.LastStepStateName}}</span>
          </div>

          <div class="actions">
            <!-- <van-button
              plain
              icon="eye-o"
              v-show="item.IsCanOperate"
              type="danger"
              @click="edit(item)"
              size="small"
            >审核</van-button>-->
            <van-button plain icon="orders-o" type="primary" @click="detail(item)" size="small">查看详情</van-button>
          </div>
        </div>
      </van-list>
    </div>
    <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'70%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <!-- <van-field v-model="form.name" placeholder="学员姓名" /> -->
          <select-picker label="状态" v-model="form.StateName" :data="stautes"></select-picker>
        </van-cell-group>
        <div class="btns">
          <van-button size="large" icon="search" type="primary" @click="getlist">查询</van-button>
        </div>
      </div>
    </van-popup>
  </div>
</template>
<script>
import SelectPicker from "@/components/SelectPicker.vue";
import navbar from "@/components/navbar.vue";
import {
  List,
  Button,
  Popup,
  Field,
  Cell,
  CellGroup,
  Divider,
  Rate
} from "vant";
import { mapActions } from "vuex";
import { GetAuditList } from "@/api/WorkFlow";
import { WORK_FLOW_STATE } from "@/api/data";
import AddBtn from "@/components/AddBtn";
export default {
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Popup.name]: Popup,
    [Field.name]: Field,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [Divider.name]: Divider,
    [Rate.name]: Rate,
    navbar,
    AddBtn,
    SelectPicker
  },
  data() {
    return {
      title: "结业申请",
      loading: false,
      finished: false,
      error: false,
      list: [],
      path: "",
      filter: false,
      TrainingSituation: {},
      form: {
        index: 0,
        size: 6,
        StateName: "",
        name: "",
        type: 4
      }
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    },
    stautes() {
      let list = [{ value: "", text: "全部" }];
      WORK_FLOW_STATE.forEach(item => {
        list.push({
          value: item,
          text: item
        });
      });
      return list;
    }
  },
  mounted() {
    //this.title = this.$route.query.name;
    this.path = "/home";
    this.setNavTitle({ title: this.title });
    if (localStorage.getItem("TrainingSituation")) {
      this.TrainingSituation = JSON.parse(
        localStorage.getItem("TrainingSituation")
      );
    }
  },

  methods: {
    ...mapActions(["setNavTitle"]),
    search: function() {
      this.filter = true;
    },
    showDetail() {},
    edit(item) {
      if (!item.编号) {
        this.$router.push("/graduation/edit");
      }
    },
    detail(item) {
      this.$router.push(
        "/graduation/detail?id=" + item.SourceId + "&name=" + this.title
      );
    },

    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }
      this.form.index++;
      GetAuditList(this.form).then(res => {
        let data = res.data.data.list;
        for (var i = 0; i < data.length; i++) {
          var item = data[i];
          this.list.push(item);
        }
        this.finished = this.list.length >= res.data.data.total;
        this.loading = false;
      });
    }
  }
};
</script>
<style lang="less">
.rate {
  margin-left: 10px;
  line-height: 20px;
  float: right;
}
.content {
  margin: 50px 10px 5px;
  .box {
    border: 1px #ebedf0 solid;
    border-radius: 5px;
    background: #fff;
    margin-bottom: 15px;
    -moz-box-shadow: 0px 2px 10px #ebedf0;
    -webkit-box-shadow: 0px 2px 10px #ebedf0;
    box-shadow: 0px 2px 10px #ebedf0;
    padding: 15px;
    p {
      margin: 0px;
    }
    label {
      width: 90px;
      display: inline-block;
    }
    span {
      color: #6c6c6e;
    }
    span.red {
      color: red;
    }
    .actions {
      border-top: 1px solid #ebedf0;
      text-align: right;
      margin-top: 5px;
      padding-top: 10px;
      button {
        margin-left: 20px;
      }
    }
    .van-rate {
      display: inline-block;
    }
  }
}
</style>


