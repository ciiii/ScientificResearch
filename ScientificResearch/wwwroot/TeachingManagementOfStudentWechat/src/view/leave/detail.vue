<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <van-tabs v-model="active">
        <van-tab title="基本信息">
          <van-cell-group title="轮转信息">
            <van-cell title="学员姓名" :value="form.学员姓名" />
            <van-cell title="带教老师" :value="form.带教老师姓名" />
            <van-cell title="本院科室" :value="form.本院科室名称" />
            <van-cell title="科室管理员	" :value="form.科室管理员姓名" />
            <van-cell title="教学本院策略" :value="form.教学本院策略名称" />
            <van-cell title="状态" :value="form.状态" />

            <van-cell title="计划入科日期" :value="form.计划入科日期" />
            <van-cell title="计划出科日期" :value="form.计划出科日期" />
            <van-cell title="实际入科日期" :value="form.实际入科日期" />
            <van-cell title="实际出科日期" :value="form.实际出科日期" />
          </van-cell-group>
          <van-cell-group title="请假信息">
            <van-cell title="创建人" :value="form.CreatorInfo" />
            <van-cell title="创建人类型" :value="form.CreatorType" />
            <van-cell title="请假开始日期" :value="form.请假开始日期" />
            <van-cell title="请假天数" :value="form.请假天数" />
            <van-cell title="请假事由" :value="form.请假事由" />
          </van-cell-group>
        </van-tab>
        <van-tab title="审核记录">
          <audit-step :flowid="form.FlowId"></audit-step>
        </van-tab>
      </van-tabs>
     
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { GetAuditDetail } from "@/api/WorkFlow";
import { mapActions } from "vuex";
import { Tab, Tabs } from "vant";
import AuditStep from "@/components/AuditStep.vue";

export default {
  name: "detail",
  components: {
    [Tab.name]: Tab,
    [Tabs.name]: Tabs,
    navbar,
    AuditStep
    
  },
  data() {
    return {
      active: 0,
      isDetail: true,
      attachment: [],
      form: {},
      path: "/leave"
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    }
  },
  mounted() {
    var title = this.$route.query.name;
    this.path = "/leave" ;
    if(this.$route.query.source)
    {
        this.path = "/do?name=" + title;
    }
   
    this.setNavTitle({ title });
    this.GetInfo();
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    GetInfo() {
      let _this = this;
      GetAuditDetail({ id: this.id, type: 1 }).then(res => {
        let data = res.data.data;
        _this.form = Object.assign({}, data);
      });
    }    
  }
};
</script>
<style lang="less">
.detail {
  margin-top: 50px;
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
</style>



