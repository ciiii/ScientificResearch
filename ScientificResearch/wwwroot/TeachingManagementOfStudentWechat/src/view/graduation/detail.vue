<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <van-tabs v-model="active">
       <van-tab title="基本信息">
          <van-cell-group title="学员信息">
            <van-cell title="学员姓名" :value="form.姓名" />
            <van-cell title="工号" :value="form.工号" />
            <van-cell title="往届应届" :value="form.往届应届" />
            <van-cell title="培训年届(年限)	" >
              {{form.学员培训年界}}({{form.学员培训年限}})
            </van-cell>
            <van-cell title="学员类型" :value="form.学员类型名称" />
            <van-cell title="教学专业" :value="form.专业名称" />
            <van-cell title="教学本院策略" :value="form.教学本院策略名称" />

            <van-cell title="报到时间" :value="form.报到时间" />

            <van-cell title="计划开始培训日期" :value="form.计划开始培训日期" />
            <van-cell title="计划结束培训日期" :value="form.计划结束培训日期" />

            <van-cell title="实际开始培训日期" :value="form.实际开始培训日期" />
            <van-cell title="实际结束培训日期" :value="form.实际结束培训日期" />

             <van-cell title="证书" :value="form.证书" />
            <van-cell title="状态" :value="form.StateName" />

             <van-cell title="送培方式" :value="form.送培方式" />
            <van-cell title="建立时间" :value="form.建立时间" />
          </van-cell-group>
          <van-cell-group title="结业信息">
            <van-cell title="创建人" :value="form.CreatorInfo" />
            <van-cell title="创建人类型" :value="form.CreatorType" />
            <van-cell title="申请结业日期" :value="form.申请结业日期" />
            <van-cell title="结业日期" :value="form.结业日期" />
            <van-cell title="说明" :value="form.说明" />
          
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
      path: "/graduation"
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    }
  },
  mounted() {
    var title = this.$route.query.name;
    this.path = "/graduation";
    if (this.$route.query.source) {
      this.path = "/do?name=" + title;
    }

    this.setNavTitle({ title });
    this.GetInfo();
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    GetInfo() {
      let _this = this;
      GetAuditDetail({ id: this.id, type: 4 }).then(res => {
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



