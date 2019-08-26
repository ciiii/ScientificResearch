<template>
  <div>
    <div class="contentbody">
      <van-search placeholder="请输入搜索关键词" show-action @search="keywordSearch" v-model="form.name">
        <div slot="action" @click="search">更多搜索</div>
      </van-search>
      <van-list
        v-model="loading"
        :finished="finished"
        :error.sync="error"
        error-text="请求失败，点击重新加载"
        :finished-text="finishText"
        @load="getlist"
      >
        <div
          @click="selected(item)"
          v-for="item in list"
          :key="item.编号"
          :class="item.selected?'selectbox selected':'selectbox'"
        >
          <p>
            <label>学员姓名:</label>
            <span>{{item.学员信息.姓名}}</span>
          </p>
          <p>
            <label>学员工号:</label>
            <span>{{item.学员信息.工号}}</span>
          </p>
          <p v-if="item.学员信息.最高学历">
            <label>最高学历:</label>
            <span>{{item.学员信息.最高学历}}</span>
          </p>
          <p>
            <label>学员类型:</label>
            <span>{{item.学员信息.学员类型名称}}</span>
          </p>
          <p>
            <label>学员状态:</label>
            <span>{{item.学员信息.状态}}</span>
          </p>
          <div>
            <label>培训年界:</label>
            <span>{{item.学员信息.学员培训年界}}({{item.学员信息.学员培训年限}}年)</span>
          </div>
          <p>
            <label style="width:120px;">计划开始培训日期:</label>
            <span>{{item.学员信息.计划开始培训日期}}</span>
          </p>
          <p>
            <label style="width:120px;">计划结束培训日期:</label>
            <span>{{item.学员信息.计划结束培训日期}}</span>
          </p>

          <div class="actions" v-if="!isselect && item.轮转信息.length>0">
            <van-button
              plain
              icon="orders-o"
              type="primary"
              @click="callback(item)"
              size="small"
            >查看轮转信息</van-button>
          </div>
        </div>
      </van-list>
    </div>

    <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'85%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <van-field v-model="form.name" label="学员姓名" placeholder="学员姓名" />
          <select-picker label="学员类型:" v-model="form.typename" :data="studentType"></select-picker>
          <select-picker label="培训专业:" v-model="form.professionalcode" :data="professionals"></select-picker>
          <select-picker label="学员状态:" v-model="form.stateName" :data="states"></select-picker>
          <date-time type="date" v-model="form.start" placeholder="计划开始培训日期开始"></date-time>
          <date-time type="date" v-model="form.end" placeholder="计划开始培训日期结束"></date-time>
        </van-cell-group>
        <div class="btns">
          <van-button size="large" icon="search" type="primary" @click="getlist">查询</van-button>
        </div>
      </div>
    </van-popup>
    <van-submit-bar
      label="当前选中:"
      suffix-label="个"
      :price="selecteds.length*100"
      :decimal-length="0"
      currency
      v-if="isselect"
      :button-text="label"
      @submit="onSubmit"
    >
      <div v-if="multi" slot="tip" class="selectItem">
        <van-tag plain class="tag" v-for="item in selecteds" :key="item.学员信息.编号">
          {{item.学员信息.姓名}}
          <van-icon name="clear" @click="selected(item)" />
        </van-tag>
      </div>
    </van-submit-bar>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import SelectPicker from "@/components/SelectPicker.vue";
import DateTime from "@/components/DateTime.vue";
import {
  List,
  Button,
  Popup,
  Field,
  CellGroup,
  Divider,
  SubmitBar,
  Search,
  Tag
  
} from "vant";
import { mapActions } from "vuex";
import { GetStudentTurn } from "@/api/training";
import { GetStudentType, GetProfessional } from "@/api/systemSetting";
import { STUDENT_STATE } from "@/api/data";

export default {
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Popup.name]: Popup,
    [Field.name]: Field,

    [CellGroup.name]: CellGroup,
    [Divider.name]: Divider,
    [SubmitBar.name]: SubmitBar,
    [Search.name]: Search,
    [Tag.name]: Tag,
    navbar,
    SelectPicker,
    DateTime
  },
  data() {
    return {
      title: "",
      loading: false,
      finished: false,
      error: false,
      list: [],

      filter: false,
      selecteds: [],
      studentType: [],
      professionals: [],
      states: [],
      form: {
        index: 0,
        size: 6,
        typename: "",
        stateName: "",
        number: "",
        name: "",
        professionalcode: "",
        start: "",
        end: ""
      }
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  props: {
    stateName: {
      type: String,
      default: "轮转计划已安排"
    },
    give: {
      type: Array,
      default: null
    },
    multi: {
      type: Boolean,
      default: false
    },
    label: {
      type: String,
      default: "下一步"
    },
    callback: {
      type: Function,
      default: function() {}
    },
    isselect: {
      type: Boolean,
      default: true
    }
  },
  model: {
    prop: "give",
    event: "returnBack"
  },
  mounted() {
    if (this.give) {
      this.selecteds = this.give;
    }
    if (this.stateName) {
      this.form.stateName = this.stateName;
    }
    let _this = this;
    let list = [{ value: "", text: "请选择" }];
    STUDENT_STATE.forEach(item => {
      list.push({
        value: item,
        text: item
      });
    });
    _this.states = list;
    GetStudentType().then(res => {
      let list = [{ value: "", text: "请选择" }];
      res.data.data.forEach(item => {
        list.push({
          value: item.名称,
          text: item.名称
        });
      });
      _this.studentType = list;
    });
    GetProfessional().then(res => {
      let list = [{ value: "", text: "请选择" }];
      res.data.data.forEach(item => {
        list.push({
          value: item.编号,
          text: item.名称
        });
      });
      _this.professionals = list;
    });
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    onSubmit() {
      this.callback(this.selecteds);
    },
    keywordSearch() {
      this.form.index = 0;
      this.list = [];
      this.getlist();
    },
    search: function() {
      this.filter = true;
    },
    selected(item) {
      if (!this.isselect) {
        return;
      }
      let index = this.selecteds.indexOf(item);
      if (index > -1) {
        item.selected = false;
        this.selecteds.splice(index, 1);
      } else {
        if (!this.multi) {
          this.selecteds = [];
          this.list.forEach(item => {
            item.selected = false;
          });
        }
        item.selected = true;
        this.selecteds.push(item);
      }
      this.$emit("returnBack", this.selecteds);
    },
    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }
      let _this = this;
      this.form.index++;
      GetStudentTurn(this.form).then(res => {
        let data = res.data.data.list;
        for (var i = 0; i < data.length; i++) {
          var item = data[i];
          item.selected = false;
          _this.selecteds.forEach(row => {
            if (row.学员信息.编号 === item.学员信息.编号) {
              item.selected = true;
            }
          });
          if (item.学员信息.计划开始培训日期) {
            item.学员信息.计划开始培训日期 = item.学员信息.计划开始培训日期.format(
              "yyyy-MM-dd"
            );
          }
          if (item.学员信息.计划结束培训日期) {
            item.学员信息.计划结束培训日期 = item.学员信息.计划结束培训日期.format(
              "yyyy-MM-dd"
            );
          }

          _this.list.push(item);
        }
        this.finished = this.list.length >= res.data.data.total;
        this.loading = false;
      });
    }
  }
};
</script>
<style lang="less">
.selectItem {
  padding-top: 10px;
  span {
    margin-right: 20px;
    margin-bottom: 15px;
  }
  .tag {
    font-size: 18px;
    position: relative;
    padding-right: 20px;
  }
  .tag i {
    position: absolute;
    top: -5px;
    color: red;
    right: -5px;
  }
}
.contentbody {
  .selectbox {
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
  }
  .selected {
    background-color: rgb(7, 193, 96);
    color: #fff;
    span {
      color: #efefef;
    }
  }
}
</style>


