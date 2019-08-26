<template>
  <div>
    <navbar :path="path" />
    <div class="content ">
      <h5 class="red">评价列表(得分:{{factTotal}}/{{total}} 分）</h5>
      <div class="box">
        <van-cell-group>
          <van-cell-group v-for="(row,index) in list" :key="row.编号">
            <van-cell>{{index+1}}.{{row.名称}}</van-cell>
            <van-cell>
              <van-rate v-model="row.评分"></van-rate>
              <span class="rate">(总分:{{row.标准分}})</span>
              <span class="rate">当前得分:{{row.评分?row.评分*(row.标准分/5):'0'}}</span>
            </van-cell>
            <van-cell>
              <van-field v-model="row.备注" type="textarea" placeholder="评价说明" rows="1" autosize />
            </van-cell>
          </van-cell-group>
        </van-cell-group>
      </div>
    </div>
    <van-submit-bar :decimal-length="0" currency button-text="提交" @submit="onSubmit"></van-submit-bar>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import {
  List,
  SubmitBar,
  Popup,
  Field,
  Cell,
  CellGroup,
  Divider,
  Rate
} from "vant";
import { mapActions } from "vuex";
import { GetEvaluation, GetEvaluationItem, SaveEvaluation } from "@/api/activities";

export default {
  components: {
    [List.name]: List,
    [SubmitBar.name]: SubmitBar,
    [Popup.name]: Popup,
    [Field.name]: Field,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [Divider.name]: Divider,
    [Rate.name]: Rate,
    navbar
  },

  data() {
    return {
      total: 0,

      title: "",
      loading: false,
      finished: false,
      error: false,
      list: [],
      path: "",
      personnel: {},
      form: {
        typeid: "",
        id: "",
        studentId: 0,
        list: []
      }
    };
  },
  computed: {
    factTotal: function() {
      let total = 0;
      for (let n = 0; n < this.list.length; n++) {
        let row = this.list[n];
        total += Math.floor(
          (isNaN(row.评分) ? 0 : row.评分) * (row.标准分 / 5)
        );
      }
      return isNaN(total) ? 0 : total;
    }
  },
  mounted() {
    this.title =
      this.$route.query.name + "-" + this.$route.query.n + "-" + "评价";
    this.form.id = this.$route.query.id;
    this.form.typeid = this.$route.query.typeid;
    this.path =
      "/activities/list?typeid=" +
      this.form.typeid +
      "&name=" +
      this.$route.query.name;
    this.setNavTitle({ title: this.title });
    if (localStorage.getItem("personnel")) {
      this.personnel = JSON.parse(localStorage.getItem("personnel"));
      this.form.studentId = this.personnel.编号;
    }
    this.getlist();
  },

  methods: {
    ...mapActions(["setNavTitle"]),
    onSubmit() {
      let _this = this;
      this.form.list = [];

      for (let i = 0; i < this.list.length; i++) {
        let row = this.list[i];
        if (!isNaN(row.评分) || row.备注) {
          this.form.list.push({
            编号: row.编号,
            评价人编号: this.personnel.编号,
            评价人类型: this.personnel.人员类型,
            教学活动编号: this.form.id,
            教学活动评价项目编号: row.教学活动评价项目编号,
            评分: Math.floor(isNaN(row.评分) ? 0 : row.评分 * (row.标准分 / 5)),
            备注: row.备注
          });
        }
      }
      if (this.form.list.length == 0) {
        this.$toast("评分项不能为空");
        return;
      }
      SaveEvaluation(this.form.list).then(res => {
        if (!res.error) {
          this.$toast.success("操作成功");
          _this.$router.push({ path: this.path });
        }
      });
    },
    getlist() {
      GetEvaluationItem(this.form.typeid).then(res => {
        let data = res.data.data;

        GetEvaluation(this.form).then(res => {
          let list = res.data.data;
          this.list = [];
          for (var i = 0; i < data.length; i++) {
            var item = data[i];
            this.total += item.标准分;
            item.教学活动评价项目编号 = item.编号;
            item.编号 = 0;
            for (var n = 0; n < list.length; n++) {
              var row = list[n];
              if (item.教学活动评价项目编号 == row.教学活动评价项目编号) {
                item.评分 = row.评分 * (5 / item.标准分);
                item.备注 = row.备注;
                item.编号 = row.编号;
              }
            }
            this.list.push(item);
          }
        });
      });
    }
  }
};
</script>
<style lang="less">

.content {
  h5 {
  margin-top: 50px;
  color: red;
  padding: 10px 10px 5px;
  text-align: center;
}
  .box {
    border: 1px #ebedf0 solid;
    border-radius: 5px;
    background: #fff;
    margin-bottom: 10px;
    -moz-box-shadow: 0px 2px 10px #ebedf0;
    -webkit-box-shadow: 0px 2px 10px #ebedf0;
    box-shadow: 0px 2px 10px #ebedf0;
    padding: 15px;
    .van-rate {
      display: inline-block;
    }
    .rate {
      margin-left: 1px;
      float: right;
    }
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
}
</style>


