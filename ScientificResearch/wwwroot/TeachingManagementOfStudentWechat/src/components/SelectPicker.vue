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
      <van-picker
        show-toolbar
        :default-index="index"
        :columns="columns"
        @cancel="cancel"
        @change="change"
        @confirm="confirm"
      />
    </van-popup>
  </div>
</template>
<script>
import { Popup, Field, Picker } from "vant";
export default {
  name: "SelectPicker",
  components: {
    [Popup.name]: Popup,
    [Field.name]: Field,
    [Picker.name]: Picker
  },
  props: {
    give: {
      type: Number | String,
      default: ""
    },
    data: {
      type: Array,
      default: null
    },
    label: String,
    required: {
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
      selectValueVisiable: false,
      selectValue: "",
      selectText: "",
      columns: [],
      index: 0
    };
  },
  mounted() {
    let _this = this;
    this.data.forEach((item, index) => {
      _this.columns.push(item.text);
      if (item.value == _this.give) {
        _this.selectText = item.text;
        _this.index = index;
      }
    });
  },
  methods: {
    showDialog() {
      this.selectValue = this.give;
      if (!this.selectValue && this.data.length > 0) {
        this.selectValue = this.data[0].value;
        this.selectText = this.data[0].text;
        this.$emit("returnBack", this.selectValue);
      } else {
        this.data.forEach(item => {
          if (item.value == this.selectValue) {
            this.selectText = item.text;
            this.$emit("returnBack", this.selectValue);
          }
        });
      }
      this.selectValueVisiable = true;
    },
    change(Picker, value, index) {
      this.selectValue = this.data[index].value;
      this.selectText = this.data[index].text;
    },
    confirm() {
      this.$emit("returnBack", this.selectValue);
      this.selectValueVisiable = false;
    },
    cancel() {
      this.selectValueVisiable = false;
    }
  }
};
</script>
<style lang="less" scoped>
</style>