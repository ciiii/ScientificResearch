<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <h5>{{title}}</h5>
      <van-cell-group title="评价信息">
        <van-cell title="评价方向" :value="Param.direction.名称" />
        <van-cell title="评价人" :value="form.Model.评价人姓名" />
        <van-cell title="被评价人类型" :value="Param.direction.被评价人类型" />
        <van-field
          label="被评价人"
          readonly
          @click="openSelect"
          v-model="form.Model.被评价人"
          placeholder="请输选择被评价人"
        />
        <van-field
          v-model="form.Model.评价内容"
          label="评价内容"
          type="textarea"
          placeholder="请输入评价内容"
          rows="1"
          :readonly="isDetail"
          autosize
        />
      </van-cell-group>
      <van-cell-group v-for="item in Project" :key="item.编号" :title="item.分类信息.名称">
        <van-cell-group v-for="row in item.分类下的项目" :key="row.编号">
          <van-cell>{{row.名称}}</van-cell>
          <van-cell>
            <van-rate v-model="row.评分" :readonly="isDetail"></van-rate>
            <span class="rate">(总分:{{row.标准分}})</span>
            <span class="rate">当前得分:{{row.评分?row.评分*(row.标准分/5):'0'}}</span>
          </van-cell>
        </van-cell-group>
      </van-cell-group>
    </div>
    <div class="btns" v-show="!isDetail">
      <van-button size="large" type="primary" @click="submit">提 交</van-button>
    </div>
    <select-man :callback="selectMan" :typeid="typeid" :visiable="selectManVisiable"></select-man>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import SelectMan from "@/components/selectMan.vue";
import { mapActions } from "vuex";
import { Field, Rate } from "vant";
import { GetEvaluateItem } from "@/api/systemSetting";
import { GetInfo, Save } from "@/api/360Evaluate";

export default {
  components: {
    [Field.name]: Field,
    [Rate.name]: Rate,
    navbar,
    SelectMan
  },
  data() {
    return {
      Param: {
        isAdd: true,
        direction: {},
        from: "",
        to: "",
        item: {}
      },
      title: "添加评价",
      typeid: 0,
      selectManVisiable: false,
      isDetail: false,
      form: {
        Model: {
          编号: 0,
          来源类型: 0,
          评价人编号: 0,
          目标类型: 0,
          被评价人编号: 0,
          被评价人: "",
          评价内容: "",
          评价时间: new Date().format("yyyy-MM-dd HH:mm:ss"),
          备注: ""
        },
        List: []
      },
      Project: [],
      path: "/360Evaluate"
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    }
  },
  mounted() {
    var title = "360°评价-";
    this.isDetail = parseInt(this.$route.query.isDetail) == 1;
    if (sessionStorage.getItem("itemData")) {
      let itemData = JSON.parse(sessionStorage.getItem("itemData"));
      this.Param = itemData;
      title += this.Param.direction.名称;
      if (this.Param.item && this.Param.item.编号) {
        this.title = "修改评价";
        this.form.Model = itemData.item;
        this.form.Model.被评价人 = itemData.item.被评价人姓名;
      } else {
        this.title = "添加评价";
        if (localStorage.getItem("personnel")) {
          let personnel = JSON.parse(localStorage.getItem("personnel"));
          this.form.Model.评价人编号 = personnel.编号;
          this.form.Model.评价人姓名 = personnel.姓名;

          this.form.Model.来源类型 = itemData.from;
          this.form.Model.目标类型 = itemData.to;
        }
      }
      if (this.isDetail) {
        this.title = "查看评价详情";
      }
      this.getProject();
    }else{
        this.$router.push("/360Evaluate");
       
        return;
      
    }
    this.path =
      "/360Evaluate/evaluate360?name=" +
      title +
      "&from=" +
      this.Param.from +
      "&to=" +
      this.Param.to;
    this.setNavTitle({ title });
  },
  methods: {
    ...mapActions(["setNavTitle"]),

    submit() {
      let _this = this;
      if (!this.form.Model.被评价人编号) {
        this.$toast("请选择被评价人");
        return;
      }
      if (!this.form.Model.评价人编号) {
        this.$toast("评价人为空请重新登录!");
        return;
      }
      this.form.List = [];
      for (let i = 0; i < this.Project.length; i++) {
        let item = this.Project[i];
        for (let n = 0; n < item.分类下的项目.length; n++) {
          let row = item.分类下的项目[n];
          this.form.List.push({
            编号: 0,
            教学360评价项目编号: row.编号,
            评分: Math.floor(row.评分 * (row.标准分 / 5)),
            备注: ""
          });
        }
      }
      if (this.form.List.length == 0) {
        this.$toast("评分项不能为空");
        return;
      }
      Save(this.form).then(res => {
        if (!res.error) {
          this.$toast.success("操作成功");         
          _this.$router.push({ path: this.path });
        }
      });
    },
    openSelect() {
      if (!this.isDetail) {
        this.typeid = this.Param.to;
        this.selectManVisiable = true;
      }
    },
    selectMan(item) {
      if (item && item.编号) {
        this.form.Model.被评价人编号 = item.编号;
        this.form.Model.被评价人 = item.姓名;
      }
      this.selectManVisiable = false;
    },
    getinfoByid() {
      let _this = this;
      if (this.form.Model.编号 > 0) {
        GetInfo(this.form.Model.编号).then(res => {
          var data = res.data.data;
          for (let i = 0; i < _this.Project.length; i++) {
            let item = _this.Project[i];
            for (let n = 0; n < item.分类下的项目.length; n++) {
              let row = item.分类下的项目[n];
              for (let m = 0; m < data.length; m++) {
                let iitem = data[m];
                if (row.编号 == iitem.教学360评价项目编号) {
                  row.评分 = iitem.评分 * (5 / row.标准分);
                }
              }
            }
          }
        });
      }
    },
    getProject() {
      let _this = this;
      GetEvaluateItem(this.Param).then(res => {
        _this.Project = res.data.data;
        for (let i = 0; i < _this.Project.length; i++) {
          let item = _this.Project[i];
          for (let n = 0; n < item.分类下的项目.length; n++) {
            let row = item.分类下的项目[n];
            _this.$set(row, "评分", 0);
          }
        }
        _this.getinfoByid();
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



