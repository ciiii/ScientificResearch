<template>
  <div class="body">
    <van-popup
      v-model="selectManVisiable"
      position="bottom"
      :style="{ height: '50%' }"
      :close-on-click-overlay="false"
    >
      <van-nav-bar
        title="选择人员"
        left-text="取消"
        right-text="确定"
        @click-left="cancel"
        @click-right="confirm"
      />
        <form action="/">
          <van-search
            v-model="form.name"
            placeholder="请输入搜索关键词"
            
            @search="search"
          
          />
        </form>
      <div class="selectContent">
      
        <van-radio-group v-model="selected">
          <van-cell-group>
            <van-list
              v-model="loading"
              :finished="finished"
              :error.sync="error"
              error-text="请求失败，点击重新加载"
              :finished-text="finishText"
              @load="getlist"
            >
              <van-cell
                v-for="item in list"
                :title="item.姓名"
                :key="item.编号"
                clickable
                @click="selectItem(item)"
              >
                <van-radio slot="right-icon" :name="item.编号" />
              </van-cell>
            </van-list>
          </van-cell-group>
        </van-radio-group>
      </div>
    </van-popup>
  </div>
</template>
<script>
import { List, Button, Popup, Search, RadioGroup, Radio, NavBar } from "vant";
import { mapActions } from "vuex";
import { GetList } from "@/api/permission";
import {  GetStudentList } from "@/api/organization";
export default {
  name: "SelectMan",
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Search.name]: Search,
    [RadioGroup.name]: RadioGroup,
    [Radio.name]: Radio,
    [NavBar.name]: NavBar,
    [Popup.name]: Popup
  },
  props: {
    visiable: {
      type: Boolean,
      default: false
    },
    callback: {
      type: Function,
      default: function() {}
    },
    typeid: {
      type: Number | String,
      default: 0
    }
  },
  data() {
    return {
      title: "",
      loading: false,
      finished: false,
      error: false,
      list: [],
      path: "",
      selected: "",
      form: {
        index: 0,
        size: 6,
        departmentid: "",
        typeid: "",
        name: ""
      },

      item: {}
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    },
    selectManVisiable: {
      get() {
        return this.visiable;
      },
      set() {}
    }
  },
  mounted() {},

  methods: {
    ...mapActions(["setNavTitle"]),
    search: function() {
      this.filter = true;
      this.getlist();
    },
    cancel() {
      this.callback(this.item);
    },
    confirm() {
      this.callback(this.item);
    },
    onCancel() {
      this.filter = true;
      this.getlist();
    },
    selectItem(item) {
      this.selected = item.编号;
      this.item = item;
    },
    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }
      this.form.index++;
      if (this.typeid == 0) {
        GetStudentList(this.form).then(res => {
          let data = res.data.data.list;
          for (var i = 0; i < data.length; i++) {
            var item = data[i];

            this.list.push(item);
          }
          this.finished = this.list.length >= res.data.data.total;
          this.loading = false;
        });
      } else {
        this.form.typeid = this.typeid;

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
  }
};
</script>
<style lang="less">
.body {
  position: relative;
}
.selectContent {
  margin: 0px 10px 5px;
  position: absolute;
  overflow-y: auto;
  bottom: 0px;
  top: 90px;
  left: 0px;
  right: 0px;
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
      display: inline;
    }
  }
}
</style>


