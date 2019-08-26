<template>
  <div>
    <van-field
      v-model="give"
      label-width="80"
      @click="showDialog"
      :label="label"
      :placeholder="placeholder"
      :required="required"
      :min-date="minDate"
      readonly
    />
    <van-popup v-model="selectDateVisiable" round position="bottom" :style="{ height: '50%' }">
      <van-datetime-picker
        v-model="selectDate"
        cancel-button-text="清空"
        :type="type"
        :min-date="minDate"
        :max-date="maxDate"
        @confirm="confirm"
        @cancel="cancel"
      />
    </van-popup>
  </div>
</template>
<script>
import { Popup, Field, DatetimePicker } from "vant";
export default {
  name: "DateTime",
  components: {
    [Popup.name]: Popup,
    [Field.name]: Field,
    [DatetimePicker.name]: DatetimePicker
  },
  props: {
    give: String,
    label: String,
    placeholder: String,
    required: {
      type: Boolean,
      default: false
    },
    type: {
      type: String,
      default: "datetime"
    },
    min: {
      type: String,
      default: null
    },
    max: {
      type: String,
      default: null
    }
  },
  model: {
    prop: "give",
    event: "returnBack"
  },
  data() {
    return {
      selectDateVisiable: false,
      selectDate: ""
    };
  },
  computed: {
    minDate() {
      let date = new Date().DateAdd("y", -10);
      if (this.min) {
        date = this.min.ToDate();
      }
      return date;
    },
    maxDate() {
      let date = new Date().DateAdd("y", 10);
      if (this.max) {
        date = this.max.ToDate();
      }
      return date;
    },
  },
  methods: {
    showDialog() {
      let time = this.give.replace(/-/g, "/");
      if (time != "") {
        this.selectDate = new Date(time);
      } else {
        this.selectDate = "";
      }
      this.selectDateVisiable = true;
    },
    confirm() {
      let format = "yyyy-MM-dd HH:mm:ss";
      if (this.type == "date") {
        format = "yyyy-MM-dd";
      }
      this.$emit("returnBack", this.selectDate.format(format));
      this.selectDateVisiable = false;
    },
    cancel() {
      this.selectDate = "";
      this.$emit("returnBack", "");
      this.selectDateVisiable = false;
    }
  }
};
</script>
<style lang="less" scoped>
</style>