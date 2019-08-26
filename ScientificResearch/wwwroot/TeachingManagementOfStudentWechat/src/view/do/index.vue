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
            <label style="letter-spacing:2px;">事项类别:</label>
            <span>{{item.FlowTemplateName}}</span>
          </div>
          <div>
            <label style="letter-spacing:2px;">创建人:</label>
            <span>{{item.CreatorInfo}}</span>
          </div>
          <div>
            <label>创建人类型:</label>
            <span>{{item.CreatorType}}</span>
          </div>

          <div>
            <label>建立时间:</label>
            <span>{{item.CreateDateTime}}</span>
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
            <van-button
              plain
              icon="edit"
              v-show="item.IsCanOperate"
              type="danger"
              @click="edit(item)"
              size="small"
            >编辑</van-button>
            <van-button plain icon="orders-o" type="primary" @click="edit(item,1)" size="small">查看详情</van-button>
          </div>
        </div>
      </van-list>
    </div>
    <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'70%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <van-field v-model="form.name" placeholder="创建人" />
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
import { mapActions } from "vuex";
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

import { GetAuditList } from "@/api/WorkFlow";

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
      title: "待办事宜",
      loading: false,
      finished: false,
      error: false,
      list: [],
      path: "",
      filter: false,
      form: {
        index: 0,
        size: 6,
        StateName: "",
        name: "",
        type: 0
      }
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  mounted() {
    this.path = "/home";
    this.setNavTitle({ title: this.title });
  },

  methods: {
    ...mapActions(["setNavTitle"]),
    search: function() {
      this.filter = true;
    },
    edit(item, isDetail) {
      isDetail = isDetail ? isDetail : 0;
      let path = "";
      switch (item.LastViewStepComponentName) {
        case "leaveDetails": {
          path = "leave";
          break;
        }
        case "outDepartmentDetails": {
          path = "outDepartment";
          break;
        }
        case "rotationDetails": {
          path = "rotaryManual";
          break;
        }
        case "graduationDetails": {
          path = "graduation";
          break;
        }
      }
      if (isDetail == 1) {
        this.$router.push(
          "/" +
            path +
            "/detail?id=" +
            item.SourceId +
            "&isDetail=" +
            isDetail +
            "&name=" +
            item.FlowTemplateName +
            "&source=do"
        );
      } else {
        this.$router.push(
          "/" +
            path +
            "/edit?id=" +
            item.SourceId +
            "&isDetail=" +
            isDetail +
            "&name=" +
            item.FlowTemplateName +
            "&source=do"
        );
      }
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


