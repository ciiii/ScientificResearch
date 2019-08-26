<template>
  <div>
    <div class="filter">
      <van-divider
        :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }"
      >{{title}}</van-divider>
      <van-cell-group>
        <select-patient v-if="!form.编号" label="选择病人" v-model="form.病人编号" :required="true"></select-patient>
        <van-field v-else v-model="form.病人姓名" label="病人" readonly />
        <van-cell title="是否全程陪护">
          <van-switch v-model="form.是否全程陪护" size="18px" />
        </van-cell>
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
import SelectPatient from "@/components/SelectPatient";
import { SaveMine } from "@/api/myPatient";
export default {
  name: "edit",
  components: {
    [Field.name]: Field,
    [Divider.name]: Divider,
    [Switch.name]: Switch,
    SelectPatient
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
      title: "添加我的教学管床病人",
      TrainingSituation: {},
      form: {
        编号: 0,
        教学轮转编号: 0,
        病人编号: 0,
        是否全程陪护: true,
        备注: "",
        病人姓名: ""
      }
    };
  },
  computed: {},
  watch: {
    data: {
      handler(val) {
        if (val && val.编号) {
          this.form.编号 = val.编号;
          this.form.病人编号 = val.病人编号;
          this.form.教学轮转编号 = val.教学轮转编号;
          this.form.是否全程陪护 = val.是否全程陪护;
          this.form.病人姓名 = val.病人姓名;
          this.form.备注 = val.备注;
          this.title = "编辑我的教学管床病人";
        } else {
          this.form.编号 = "";
          this.form.病人编号 = "";
          this.form.教学轮转编号 = "";
          this.form.是否全程陪护 = false;
          this.form.病人姓名 = "";
          this.form.备注 = "";
          this.title = "添加我的教学管床病人";
          if (localStorage.getItem("TrainingSituation")) {
            this.TrainingSituation = JSON.parse(
              localStorage.getItem("TrainingSituation")
            );
            this.form.教学轮转编号 = this.TrainingSituation.当前教学轮转编号;
          }
        }
      }
    }
  },
  mounted() {
    let val = this.data;
    if (val && val.编号) {
      this.form.编号 = val.编号;
      this.form.病人编号 = val.病人编号;
      this.form.教学轮转编号 = val.教学轮转编号;
      this.form.是否全程陪护 = val.是否全程陪护;
      this.form.病人姓名 = val.病人姓名;
      this.form.备注 = val.备注;
      this.title = "编辑我的教学管床病人";
    } else {
      this.form.编号 = 0;
      this.form.病人编号 = "";
      this.form.教学轮转编号 = "";
      this.form.是否全程陪护 = false;
      this.form.病人姓名 = "";
      this.form.备注 = "";
      this.title = "添加我的教学管床病人";
      if (localStorage.getItem("TrainingSituation")) {
        this.TrainingSituation = JSON.parse(
          localStorage.getItem("TrainingSituation")
        );
        this.form.教学轮转编号 = this.TrainingSituation.当前教学轮转编号;
      }
    }
  },
  methods: {
    cancel() {
      this.callback(false);
    },
    save() {
      let _this = this;
      if (_this.form.病人编号 == "") {
        _this.$toast("请选择病人");
        return;
      }
      if (_this.form.教学轮转编号 == "") {
        return this.$router.push("/home");
      }
      // if (_this.submitForm.skillsScore == "") {
      //   _this.$toast("技能考试成绩不能为空");
      //   return;
      // }

      SaveMine(_this.form).then(res => {
        if (!res.error) {
          _this.$toast.success("操作成功");
          _this.editVisiable = false;
          _this.form = {
            编号: 0,
            教学轮转编号: 0,
            病人编号: 0,
            是否全程陪护: true,
            备注: "",
            病人姓名: ""
          };
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



