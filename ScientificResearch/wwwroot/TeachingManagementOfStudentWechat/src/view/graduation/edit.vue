<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <!-- <h5>{{title}}</h5> -->
      <van-cell-group>
        <date-time
          v-model="form.申请结业日期"
          :min="TrainingSituation.实际开始培训日期"
          :max="RotaryManual.计划结束培训日期"
          :required="true"
          type="date"
          label="申请结业日期:"
        ></date-time>

        <van-field
          v-model="form.说明"
          label="说明"
          type="textarea"
          placeholder="请输入说明"
          rows="3"
          autosize
          required
        />
        <van-field
          v-model="form.备注"
          label="备注"
          type="textarea"
          placeholder="请输入备注"
          rows="3"
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
        学员编号: 0,
        说明: "",
        申请结业日期: "",
        建立时间: new Date().format("yyyy-MM-dd HH:mm:ss"),
        备注: ""
      },
      TrainingSituation: {},
      RotaryManual: {},
      path: "/graduation"
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    }
  },
  mounted() {
    var title = "";
    this.form.编号 = this.id;
    if (this.form.编号) {
      this.title = "修改结业申请";
    } else {
      this.title = "发起结业申请";
    }
    if (localStorage.getItem("TrainingSituation")) {
      this.TrainingSituation = JSON.parse(
        localStorage.getItem("TrainingSituation")
      );
      this.form.教学轮转编号 = this.TrainingSituation.当前教学轮转编号;
    }
    if (localStorage.getItem("RotaryManual")) {
      let RotaryManual = JSON.parse(localStorage.getItem("RotaryManual"));
      RotaryManual.forEach(item => {
        if (item.轮转基本信息.编号 == this.form.教学轮转编号) {
          this.RotaryManual = item.轮转基本信息;
          // this.form.申请出科日期 = new Date(
          //   this.RotaryManual.计划出科日期
          // ).format("yyyy-MM-dd");
        }
      });
    }

    title = this.title;
    this.setNavTitle({ title });
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    submit() {
      let _this = this;
      // if (!this.form.说明) {
      //   this.$toast("说明不能为空!");
      //   return;
      // }

      SaveSend({
        type: 4,
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



