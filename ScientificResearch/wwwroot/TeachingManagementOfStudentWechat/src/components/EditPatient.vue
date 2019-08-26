<template>
  <div>
    <div class="filter">
      <van-divider
        :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }"
      >{{title}}</van-divider>
      <van-cell-group>
        <van-field v-model="form.姓名" label="姓名"  placeholder="请输入病人姓名" :required="true" />
        <select-picker label="性别" v-model="form.性别" :data="sexs" ></select-picker>
        <date-time v-model="form.出生日期"  min="1920-01-01"   placeholder="请选择出生日期"  type="date" label="出生日期:"></date-time>
        <van-field v-model="form.住院号" label="住院号"  placeholder="请输入住院号"/>
        <van-field v-model="form.住院床号" label="住院床号"   placeholder="请输入住院床号"/>

        <van-field
          v-model="form.主要诊断"
          label="主要诊断"
          type="textarea"
          placeholder="请输入主要诊断"
          rows="1"
          autosize
        />
        <van-field
          v-model="form.次要诊断"
          label="次要诊断"
          type="textarea"
          placeholder="请输入次要诊断"
          rows="1"
          autosize
        />
        <date-time v-model="form.入院日期"  placeholder="请选择入院日期"  type="date" label="入院日期:"></date-time>
        <date-time v-model="form.出院日期" placeholder="请选择出院日期"  type="date" label="出院日期:"></date-time>
        <van-field
          v-model="form.备注"
          label="备注"
          type="textarea"
          placeholder="请输入备注"
          rows="1"
          autosize
        />
      </van-cell-group>
      <div class="actionsbtn">
        <van-button type="info" @click="cancel">取消</van-button>
        <van-button type="primary" @click="save">提交</van-button>
      </div>
    </div>
  </div>
</template>
<script>
import { Field, Divider, Switch } from "vant";
import SelectPicker from "@/components/SelectPicker";
import { Save } from "@/api/myPatient";
import DateTime from "@/components/DateTime.vue";
export default {
  name: "edit",
  components: {
    [Field.name]: Field,
    [Divider.name]: Divider,
    [Switch.name]: Switch,
    SelectPicker,
    DateTime
  },
  props: {
    data: {
      type: Object,
      default: null
    },
    callback: {
      type: Function,
      default() {}
    }
  },
  data() {
    return {
      selectManVisiable: false,
      title: "添加病人",
      TrainingSituation: {},
      sexs: [
        { value: "未知", text: "未知" },
        { value: "男", text: "男" },
        { value: "女", text: "女" }
      ],
      form: {
        编号: 0,
        姓名: "",
        性别: "",
        出生日期: "",
        住院号: "",
        住院床号: "",
        主要诊断: "",
        次要诊断: "",
        入院日期: "",
        出院日期: "",
        备注: ""
      }
    };
  },
  computed: {},
  watch: {
    data: {
      handler(val) {
        if (val && val.编号) {
          this.form = {
            编号: val.编号,
            姓名: val.姓名,
            性别: val.性别,
            出生日期: val.出生日期,
            住院号: val.住院号,
            住院床号: val.住院床号,
            主要诊断: val.主要诊断,
            次要诊断: val.次要诊断,
            入院日期: val.入院日期,
            出院日期: val.出院日期,
            备注: val.备注
          };

          this.title = "编辑病人";
        } else {
          this.form = {
            编号: 0,
            姓名: "",
            性别: "",
            出生日期: "",
            住院号: "",
            住院床号: "",
            主要诊断: "",
            次要诊断: "",
            入院日期: "",
            出院日期: "",
            备注: ""
          };
          this.title = "添加病人";
          // if (localStorage.getItem("TrainingSituation")) {
          //   this.TrainingSituation = JSON.parse(
          //     localStorage.getItem("TrainingSituation")
          //   );
          //   this.form.教学轮转编号 = this.TrainingSituation.当前教学轮转编号;
          // }
        }
      }
    }
  },
  mounted() {},
  methods: {
    cancel() {
      this.callback(false);
    },
    save() {
      let _this = this;
      if (_this.form.姓名 == "") {
        _this.$toast("姓名不能为空");
        return;
      }

      Save(_this.form).then(res => {
        if (!res.error) {
          _this.$toast.success("操作成功");
          _this.editVisiable = false;
          _this.callback();
        }
      });
    }
  }
};
</script>
<style lang="less">
.actionsbtn {
  border-top: 1px solid #ebedf0;
  text-align: center;
  margin-top: 5px;
  padding-top: 10px;
  button {
    margin: 0px 30px;
    padding: 0px 40px;
  }
}
</style>



