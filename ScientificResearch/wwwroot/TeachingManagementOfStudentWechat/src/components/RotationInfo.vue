<template>
  <div>
    <div class="contentbody">
      <div
        @click="selected(item)"
        v-for="item in list"
        :key="item.编号"
        :class="item.selected?'selectbox selected':'selectbox'"
      >
        <department-info :data="item"></department-info>

        <!-- <div class="actions" v-if="!isselect">
          <van-button
            plain
            icon="orders-o"
            type="primary"
            :to="'/training/myStudent/detail?id='+item.编号+'&name='+item.姓名"
            size="small"
          >查看轮转信息</van-button>
        </div>-->
      </div>
    </div>

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
        <van-tag plain class="tag" v-for="item in selecteds" :key="item.编号">
          {{item.本院科室名称}}
          <van-icon name="clear" @click="selected(item)" />
        </van-tag>
      </div>
    </van-submit-bar>
  </div>
</template>
<script>
import DepartmentInfo from "@/components/DepartmentInfo";
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
    DepartmentInfo
  },
  data() {
    return {
      title: "",
      loading: false,
      finished: false,
      error: false,
      list: [],
      selecteds: []
    };
  },

  props: {
    give: {
      type: Array,
      default: null
    },
    data: {
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
    this.list = this.data;
  },
  watch: {
    data: {
      handler(val) {
        this.list = val;
      },
      deep:true
      
    }
  },
  methods: {
    onSubmit() {
      this.callback(this.selecteds);
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
    .van-cell-group,
    .van-cell {
      background-color: rgb(7, 193, 96);
      color: #fff;
    }
  }
}
</style>


