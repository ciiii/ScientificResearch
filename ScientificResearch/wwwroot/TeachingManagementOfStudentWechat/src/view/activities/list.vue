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
          <p>
            <label>活动主题:</label>
            <span>{{item.活动主题}}</span>
          </p>
          <p>
            <label>活动类别:</label>
            <span>{{item.教学活动类型名称}}</span>
          </p>
          <p>
            <label>活动时间:</label>
            <span class="red">{{item.活动开始时间.format('yyyy-MM-dd HH:mm')}}至{{item.活动结束时间.format('yyyy-MM-dd HH:mm')}}</span>
          </p>
          <p>
            <label>教学地点:</label>
            <span>{{item.活动地点}}</span>
          </p>
          <p>
            <label>主 讲 人:</label>
            <span>{{item.主讲人姓名}}</span>
          </p>
          <p>
            <label>教学科室:</label>
            <span>{{item.主讲人部门名称}}</span>
          </p>

          <div class="actions">
            <van-button
              plain
              icon="edit"
              type="warning"
              :to="'/activities/list/evaluation?id='+item.编号+'&name='+title+'&typeid='+form.typeid+'&n='+item.活动主题"
              size="small"
            >评价</van-button>
            <van-button
              plain
              icon="comment-o"
              type="info"
              :to="'/activities/list/feedback?id='+item.编号+'&name='+title+'&typeid='+form.typeid+'&n='+item.活动主题"
              size="small"
            >反馈</van-button>
            <van-button
              plain
              icon="orders-o"
              type="primary"
              :to="'/activities/list/detail?id='+item.编号+'&name='+title+'&typeid='+form.typeid"
              size="small"
            >查看详情</van-button>
          </div>
        </div>
      </van-list>
    </div>
    <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'70%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <van-field v-model="form.title" placeholder="活动主题" />
          <van-field v-model="form.speaker" placeholder="主讲人" />
          <van-field v-model="form.start" @click="datafocus(true)" readonly placeholder="活动开始时间" />
          <van-field v-model="form.end" @click="datafocus(false)" readonly placeholder="活动结束时间" />
        </van-cell-group>
        <div class="btns">
          <van-button size="large" icon="search" type="primary" @click="getlist">查询</van-button>
        </div>
      </div>
    </van-popup>
    <van-popup v-model="selectVisiable" round position="bottom" :style="{ height: '50%' }">
      <van-datetime-picker
        v-model="selectDate"
        cancel-button-text="清空"
        type="datetime"
        @confirm="confirm"
        @cancel="cancel"
      />
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
  DatetimePicker
} from "vant";
import { mapActions } from "vuex";
import { GetList } from "@/api/activities";

export default {
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Popup.name]: Popup,
    [Field.name]: Field,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [Divider.name]: Divider,
    [DatetimePicker.name]: DatetimePicker,
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
        typeid: "",
        title: "",
        speaker: "",
        start: "",
        end: ""
      },
      startFlag: true,
      selectVisiable: false,
      selectDate: ""
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  mounted() {
    this.title = this.$route.query.name;
    this.form.typeid = this.$route.query.typeid;
    this.path = "/activities";
    this.setNavTitle({ title: this.title });
  },

  methods: {
    ...mapActions(["setNavTitle"]),
    search: function() {
      this.filter = true;
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
    },
    confirm(date) {
      if (this.startFlag) {
        this.form.start = date.format("yyyy/MM/dd HH:mm:ss");
      } else {
        this.form.end = date.format("yyyy/MM/dd HH:mm:ss");
      }
      this.selectVisiable = false;
    },
    cancel() {
      this.selectVisiable = false;
      if (this.startFlag) {
        this.form.start = "";
      } else {
        this.form.end = "";
      }
    },
    datafocus(startFlag) {
      this.startFlag = startFlag;
      this.selectVisiable = true;
      if (startFlag) {
        if (this.form.start != "") {
          this.selectDate = new Date(this.form.start);
        } else {
          this.selectDate = new Date();
        }
      } else {
        if (this.form.end != "") {
          this.selectDate = new Date(this.form.end);
        } else {
          this.selectDate = new Date();
        }
      }
    }
  }
};
</script>
<style lang="less">
.content {
  margin: 50px 10px 5px;
  .box {
    border: 1px #ebedf0 solid;
    border-radius: 5px;
    background: #fff;
    margin-bottom: 10px;
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
      font-size:12px;
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
  }
}
</style>


