<template>
  <div>
    <div class="detail" v-if="loading">
      <van-tabs v-model="active">
        <van-tab title="基本信息">
          <van-cell-group>
            <van-cell title="学员姓名" :value="form.基本信息.姓名" />
            <van-cell title="学员工号" :value="form.基本信息.工号" />

            <van-cell title="学员类型" :value="form.基本信息.学员类型名称" />
            <van-cell
              title="专业方向"
            >{{form.基本信息.专业名称}}({{form.基本信息.学员培训年界}}级,学制:{{form.基本信息.学员培训年限}}年)</van-cell>
            <van-cell title="应届/往届" :value="form.基本信息.应届往届" />
            <van-cell title="家庭住址" :value="form.基本信息.家庭住址" />

            <van-cell title="证件类型" :value="form.基本信息.证件类型" />
            <van-cell title="证件号码" :value="form.基本信息.证件号码" />

            <van-cell title="出生日期" :value="form.基本信息.出生日期" />
            <van-cell title="手机号码" :value="form.基本信息.手机号码" />
            <van-cell title="电子邮箱" :value="form.基本信息.电子邮箱" />
            <van-cell title="QQ号码" :value="form.基本信息.QQ号码" />
            <van-cell title="微信号" :value="form.基本信息.微信号" />
            <van-cell title="政治面貌" :value="form.基本信息.政治面貌" />
            <van-cell title="取得执业证书日期" :value="form.基本信息.取得执业证书日期" />

            <van-cell title="执业证书编号" :value="form.基本信息.执业证书编号" />
            <van-cell title="取得医师资格证书日期" :value="form.基本信息.取得医师资格证书日期" />
            <van-cell title="医师资格证书编号" :value="form.基本信息.医师资格证书编号" />
            <van-cell title="毕业年份" :value="form.基本信息.毕业年份" />
            <van-cell title="毕业学校" :value="form.基本信息.毕业学校" />
            <van-cell title="送培方式" :value="form.基本信息.送培方式" />
            <van-cell title="工作单位" :value="form.基本信息.工作单位" />
            <van-cell title="医疗卫生机构" :value="form.基本信息.医疗卫生机构" />
            <van-cell title="最高学历" :value="form.基本信息.最高学历" />
          </van-cell-group>
        </van-tab>
        <van-tab title="培训情况">
          <van-cell-group>
            <van-cell title="学员姓名" :value="form.培训情况.姓名" />
            <van-cell title="学员类型" :value="form.培训情况.学员类型名称" />
            <van-cell
              title="专业方向"
            >{{form.培训情况.专业名称}}({{form.培训情况.学员培训年界}}级,学制:{{form.培训情况.学员培训年限}}年)</van-cell>
            <van-cell title="当前教学轮转本院科室" :value="form.培训情况.当前教学轮转本院科室名称" />
            <van-cell title="当前科室管理员" :value="form.培训情况.当前科室管理员姓名" />
            <van-cell title="教学本院策略" :value="form.培训情况.教学本院策略名称" />
            <van-cell title="报到时间" :value="form.培训情况.报到时间" />
            <van-cell title="计划开始培训日期" :value="form.培训情况.计划开始培训日期?form.培训情况.计划开始培训日期.format('yyyy-MM-dd'):''" />
            <van-cell title="计划结束培训日期" :value="form.培训情况.计划结束培训日期?form.培训情况.计划结束培训日期.format('yyyy-MM-dd'):''" />
            <van-cell title="实际开始培训日期" :value="form.培训情况.实际开始培训日期?form.培训情况.实际开始培训日期.format('yyyy-MM-dd'):''" />
            <van-cell title="实际结束培训日期" :value="form.培训情况.实际结束培训日期?form.培训情况.实际开始培训日期.format('yyyy-MM-dd'):''" />

            <van-cell title="结业日期" :value="form.培训情况.结业日期" />
            <van-cell title="退培日期" :value="form.培训情况.退培日期" />
            <van-cell title="备注" :value="form.培训情况.备注" />
          </van-cell-group>
        </van-tab>
      </van-tabs>
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { GetStudentsDetail } from "@/api/training";

import { Tab, Tabs } from "vant";

export default {
  name: "StudentInfo",
  props: {
    id: {
      type: Number | String,
      default: 0
    }
  },
  components: {
    [Tab.name]: Tab,
    [Tabs.name]: Tabs,
    navbar
  },
  data() {
    return {
      loading:false,
      active: 0,
      form: {},
      path: ""
    };
  },
  mounted() {
    this.GetInfo();
  },
  methods: {
    GetInfo() {
      let _this = this;
      GetStudentsDetail(this.id).then(res => {
        let data= res.data.data;

        _this.form =data;

        _this.loading=true;
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



