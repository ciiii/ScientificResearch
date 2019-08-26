<template>
  <div>
    <navbar :isSearch="true" :path="path" :search="search" />

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
            <label style="letter-spacing:2px;">评价人:</label>
            <span>{{item.评价人姓名}}</span>
          </div>
          <div>
            <label>被评价人:</label>
            <span>{{item.被评价人姓名}}</span>
          </div>
          <div>
            <label style="letter-spacing:10px;">满分:</label>
            <span>{{item.所有项目满分}}</span>
          </div>
          <div>
            <label style="letter-spacing:10px;">评分:</label>
            <span>
              <van-rate v-model="item.得分星数" readonly />

              <span class="rate">得分:{{item.所有项目总得分}}</span>
            </span>
          </div>
          <div>
            <label>评价时间:</label>
            <span>
              {{item.评价时间
              }}
            </span>
          </div>

          <div>
            <label>评价内容:</label>
            <span>{{item.评价内容}}</span>
          </div>

          <div class="actions">
            <van-button plain icon="orders-o" type="primary" @click="edit(item,1)" size="small">查看详情</van-button>
          </div>
        </div>
      </van-list>
    </div>
    <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'70%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <van-field v-model="form.EvaluationMan" placeholder="评价人姓名" />
        </van-cell-group>
        <div class="btns">
          <van-button size="large" icon="search" type="primary" @click="getlist">查询</van-button>
        </div>
      </div>
    </van-popup>
  </div>
</template>
<script>
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
import { GetList } from "@/api/360Evaluate";
import { GetDirection } from "@/api/systemSetting";

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
    navbar
  },
  data() {
    return {
      title: "",
      loading: false,
      finished: false,
      error: false,
      list: [],
      path: "",
      filter: false,
      form: {
        index: 0,
        size: 6,
        from: "",
        to: "",
        ByEvaluationMan: "",
        EvaluationMan: ""
      },
      direction: {}
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  mounted() {
    this.title = this.$route.query.name;
    this.form.from = this.$route.query.from;
    this.form.to = this.$route.query.to;

    if (localStorage.getItem("personnel")) {
      let personnel = JSON.parse(localStorage.getItem("personnel"));
      this.form.ByEvaluationMan = personnel.姓名;
    }
    this.getlist();
    this.path = "/360Evaluate";
    this.setNavTitle({ title: this.title });
  },

  methods: {
    ...mapActions(["setNavTitle"]),
    search: function() {
      this.filter = true;
    },
    edit(item, isDetail) {
      this.form.from = item.来源类型;
      this.form.to = item.目标类型;
      GetDirection(this.form).then(res => {
        this.direction = res.data.data[0];
        let itemData = {
          direction: this.direction,
          from: item.来源类型,
          to: item.目标类型,
          item: item
        };

        isDetail = isDetail ? isDetail : 0;
        sessionStorage.setItem("itemData", JSON.stringify(itemData));
        this.$router.push("/360Evaluate/evaluate360/edit?isDetail=" + isDetail);
      });
    },

    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }
      this.form.index++;
      GetList(this.form).then(res => {
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
      width: 80px;
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


