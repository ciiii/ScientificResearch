<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <!-- <h5>{{title}}</h5> -->
      <van-cell-group>
        <date-time
          v-model="form.请假开始日期"
          :min="TrainingSituation.实际开始培训日期"
          :max="TrainingSituation.计划结束培训日期"
          :required="true"
          type="date"
          label="开始时间:"
        ></date-time>
        <date-time
          type="date"
          :min="form.请假开始日期"
          :max="TrainingSituation.计划结束培训日期"
          v-model="form.请假结束日期"
          :required="true"
          label="结束时间:"
        ></date-time>
        <van-field v-model="days" label="请假天数" readonly />
        <van-field
          v-model="form.请假事由"
          label="请假事由"
          type="textarea"
          placeholder="请输入请假事由"
          rows="1"
          autosize
          required
        />
        <van-field
          v-model="form.备注"
          label="备注"
          type="textarea"
          placeholder="请输入备注"
          rows="1"
          autosize
        />
      </van-cell-group>
    </div>
    <div class="btns">
      <van-button size="large" type="primary" @click="submit">提 交</van-button>
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import DateTime from "@/components/DateTime.vue";
import { mapActions } from "vuex";
import { Field } from "vant";

import { SaveSend } from "@/api/WorkFlow";

export default {
  components: {
    [Field.name]: Field,
    navbar,
    DateTime
  },
  data() {
    return {
      title: "",
      form: {
        编号: 0,
        教学轮转编号: 0,
        请假开始日期: new Date().format("yyyy-MM-dd"),
        请假结束日期: "",
        请假天数: 0,
        请假事由: "",
        建立人: 0,
        建立时间: new Date().format("yyyy-MM-dd HH:mm:ss"),
        备注: ""
      },
      TrainingSituation: {},
      path: "/leave"
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    },
    days() {
      let day = "";
      if (this.form.请假结束日期 && this.form.请假开始日期) {
        day = this.form.请假开始日期
          .ToDate()
          .DateDiff(this.form.请假结束日期.ToDate());
      }
      //this.form.请假天数=day;
      return day;
    }
  },
  mounted() {
    var title = "";
    this.form.编号 = this.id;
    if (this.form.编号) {
      this.title = "修改申请";
    } else {
      this.title = "发起请假申请";
    }
    if (localStorage.getItem("TrainingSituation")) {
      this.TrainingSituation = JSON.parse(
        localStorage.getItem("TrainingSituation")
      );
      this.form.教学轮转编号 = this.TrainingSituation.当前教学轮转编号;
    }
    title = this.title;
    this.setNavTitle({ title });
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    submit() {
      let _this = this;
      if (!this.form.请假事由) {
        this.$toast("请假事由不能为空!");
        return;
      }
      this.form.请假天数 = this.days;
      SaveSend({
        type: 1,
        Data: this.form
      }).then(res => {
        if (!res.error) {
          this.$toast.success("操作成功");
          _this.$router.push({ path: this.path });
        }
      });
    }
  }
};
</script>
<style lang="less">
.detail {
  h5 {
    text-align: center;
  }
  .van-rate {
    display: inline-block;
  }
  .rate {
    margin-left: 10px;
    float: right;
  }
  margin-top: 50px;
  h3 {
    text-align: center;
  }
  padding: 10px;

  .subtitle {
    border: 1px solid #d3d3d3;
    padding: 4px;
    font-size: 12px;
    color: gray;
    text-align: center;
    span:last-child {
      margin-left: 20px;
    }
  }
}
.btns {
  margin: 10px 0px 30px;
}
</style>



