<template>
  <div>
    <navbar  :path="path" :search="search" />
    <add-btn :callback="edit" v-if="!editVisiable &&TrainingSituation.当前教学轮转编号" />
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
            <label style="width:100px;">病人姓名:</label>
            <span>{{item.病人姓名}}</span>
          </div>
          <div>
            <label style="width:100px;">病人性别:</label>
            <span>{{item.病人性别}}</span>
          </div>
          <div v-if="item.病人出生日期">
            <label style="width:100px;">病人出生日期:</label>
            <span>{{item.病人出生日期.format('yyyy-MM-dd')}}</span>
          </div>
          <div>
            <label style="width:100px;">病人住院号:</label>
            <span>{{item.病人住院号}}</span>
          </div>
          <div>
            <label style="width:100px;">病人住院床号:</label>
            <span>{{item.病人住院床号}}</span>
          </div>
          <div v-if="item.病人入院日期">
            <label style="width:100px;">病人入院日期:</label>
            <span>{{item.病人入院日期.format('yyyy-MM-dd')}}</span>
          </div>
          <div v-if="item.病人出院日期">
            <label style="width:100px;">病人出院日期:</label>
            <span>{{item.病人出院日期.format('yyyy-MM-dd')}}</span>
          </div>
          <div>
            <label style="width:100px;">病人主要诊断:</label>
            <span>{{item.病人主要诊断}}</span>
          </div>
          <div>
            <label style="width:100px;">病人次要诊断:</label>
            <span>{{item.病人次要诊断}}</span>
          </div>
          <div>
            <label style="width:100px;">是否全程陪护:</label>
            <span>{{item.是否全程陪护?'是':'否'}}</span>
          </div>
          <div v-if="item.备注">
            <label style="width:100px;">备注:</label>
            <span>{{item.备注}}</span>
          </div>
          <div class="actions" v-if="item.教学轮转编号==TrainingSituation.当前教学轮转编号">
            <van-button plain icon="edit" type="danger" @click="edit(item)" size="small">修改</van-button>
          </div>
        </div>
      </van-list>
    </div>
    <!-- <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'70%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <van-field v-model="form.ByEvaluationMan" placeholder="被评价人姓名" />
        </van-cell-group>
        <div class="btns">
          <van-button size="large" icon="search" type="primary" @click="getlist">查询</van-button>
        </div>
      </div>
    </van-popup>-->
    <van-popup v-model="editVisiable" position="bottom" :style="{ height: '90%',width:'100%' }">
      <edit :data="currentItem"  :callback="editSuccess"/>
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
  Switch
} from "vant";
import { mapActions } from "vuex";
import { GetMineList } from "@/api/myPatient";

import edit from "@/view/myPatient/edit";
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
    [Switch.name]: Switch,
    navbar,
    AddBtn,
    edit
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
      currentItem: null,
      form: {
        index: 0,
        size: 6
      },
      TrainingSituation: {},
      editVisiable: false
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  mounted() {
    this.path = "/home";
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
    edit(item) {        
      if (!item.编号) {
        item = null;
      }
      this.currentItem = item;
      this.editVisiable = true;
    },
    editSuccess() {
      this.editVisiable = false;
      this.form.index = 0;
      this.list = [];
        this.currentItem=null;
      this.getlist();
       
    },
    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }

      this.form.index++;
      GetMineList(this.form).then(res => {
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


