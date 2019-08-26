<template>
  <div>
    <van-field
      v-model="selectText"
      label-width="80"
      @click="showDialog"
      :label="label"
      :required="required"
      placeholder="请选择"
      readonly
    />
    <van-popup v-model="selectValueVisiable" round position="bottom" :style="{ height: '50%' }">
      <van-nav-bar
        title="选择人员"
        left-text="取消"
        right-text="确定"
        @click-left="cancel"
        @click-right="confirm"
      />

      <van-search v-model="form.name" placeholder="请输入搜索关键词" :show-action="!mine" @search="search">
        <div slot="action">
          <van-button @click="add" plain size="small" hairline type="primary">新增病人</van-button>
        </div>
      </van-search>

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
                v-for="item in data"
                :title="item.text"
                :key="item.value"
                clickable
                @click="selectItem(item)"
              >
                <van-radio slot="right-icon" :name="item.value" />
              </van-cell>
            </van-list>
          </van-cell-group>
        </van-radio-group>
      </div>
    </van-popup>
    <van-popup v-model="editVisiable" position="bottom" :style="{ height: '90%',width:'100%' }">
      <edit-patient :callback="editSuccess" />
    </van-popup>
  </div>
</template>
<script>
import {
  Field,
  List,
  Button,
  Popup,
  Search,
  RadioGroup,
  Radio,
  NavBar
} from "vant";
import { GetList, GetMineList } from "@/api/myPatient";
import EditPatient from "@/components/EditPatient";
export default {
  name: "SelectPatient",
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Search.name]: Search,
    [RadioGroup.name]: RadioGroup,
    [Radio.name]: Radio,
    [NavBar.name]: NavBar,
    [Popup.name]: Popup,
    [Field.name]: Field,
    EditPatient
  },
  props: {
    give: {
      type: Number | String,
      default: ""
    },
    label: String,
    required: {
      type: Boolean,
      default: false
    },
    mine: {
      type: Boolean,
      default: false
    }
  },
  model: {
    prop: "give",
    event: "returnBack"
  },
  data() {
    return {
      editVisiable: false,
      selectValueVisiable: false,
      selected: "",
      selectText: "",

      data: [],

      loading: false,
      finished: false,
      error: false,
      form: {
        index: 0,
        size: 6,
        departmentid: "",
        typeid: "",
        name: ""
      }
    };
  },
  computed: {
    finishText: function() {
      return this.data.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  mounted() {},
  methods: {
    add() {
      this.editVisiable = true;
    },
    editSuccess() {
      this.form.index = 0;
      this.data = [];
      this.getlist();
      this.editVisiable = false;
    },
    showDialog() {
      this.selected = this.give;
      if (!this.selected && this.data.length > 0) {
        this.selected = this.data[0].value;
        this.selectText = this.data[0].text;
        this.$emit("returnBack", this.selected);
      } else {
        this.data.forEach(item => {
          if (item.value == this.selected) {
            this.selectText = item.text;
            this.$emit("returnBack", this.selected);
          }
        });
      }
      this.selectValueVisiable = true;
    },
    search: function() {
      this.filter = true;
      this.form.index = 0;
      this.data = [];
      this.getlist();
    },
    cancel() {
      this.selectValueVisiable = false;
    },
    confirm() {
      this.data.forEach(item => {
        if (item.value == this.selected) {
          this.selectText = item.text;
        }
      });
      this.$emit("returnBack", this.selected);
      this.selectValueVisiable = false;
    },
    selectItem(item) {
      this.selected = item.value;
      this.item = item;
    },
    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }
      this.form.index++;
      let _this = this;
      if (this.mine) {
        GetMineList(this.form).then(res => {
          let data = res.data.data.list;

          data.forEach(item => {
            _this.data.push({
              value: item.病人编号,
              text: item.病人姓名
            });
            if (item.value == _this.give) {
              _this.selectText = item.text;
            }
          });
          this.finished = this.data.length >= res.data.data.total;
          this.loading = false;
        });
        return;
      }
      GetList(this.form).then(res => {
        let data = res.data.data.list;

        data.forEach(item => {
          _this.data.push({
            value: item.编号,
            text: item.姓名
          });
          if (item.value == _this.give) {
            _this.selectText = item.text;
          }
        });
        this.finished = this.data.length >= res.data.data.total;
        this.loading = false;
      });
    }
  }
};
</script>
<style lang="less" scoped>
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