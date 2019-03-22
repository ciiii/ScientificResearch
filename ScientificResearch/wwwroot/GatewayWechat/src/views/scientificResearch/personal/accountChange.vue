<template>
  <section class="box">
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="基本信息">
        <van-cell-group class="input">
          <van-field v-model="list.姓名" label="姓名" placeholder="请输入姓名" required clearable/>
          <van-field v-model="list.身份证" label="身份证" placeholder="请输入证件号" required clearable/>
          <van-field v-model="list.工号" label="工号" placeholder="请输入工号" required clearable/>
          <van-field
            v-model="list.部门名称"
            label="部门或院系"
            placeholder="请输入所属部门或院系"
            required
            clearable
            disabled
          />
        </van-cell-group>
      </van-tab>
      <van-tab title="人事信息">
        <div @click="prompt">
          <van-cell-group>
            <van-field v-model="list.入职日期" label="入职日期" clearable :readonly="true"/>
            <van-field v-model="list.人员类别" label="人员类别" clearable :readonly="true"/>
            <van-field v-model="list.岗位性质" label="岗位性质" clearable :readonly="true"/>
            <van-field v-model="list.岗位类型" label="岗位类型" clearable :readonly="true"/>
            <van-field v-model="list.岗位名称" label="岗位名称" clearable :readonly="true"/>
            <van-field v-model="list.合同开始日期" label="合同开始日期" clearable :readonly="true"/>
            <van-field v-model="list.合同结束日期" label="合同结束日期" clearable :readonly="true"/>
            <van-field v-model="list.参加工作时间" label="参加工作时间" clearable :readonly="true"/>
          </van-cell-group>
        </div>
      </van-tab>
      <van-button class="btn" :disabled="disabled" @click="submit">确认修改</van-button>
      <ReturnBtn/>
    </van-tabs>
  </section>
</template>
<script>
import { _debounce } from "@/assets/js/common/debounce.js";
export default {
  data() {
    return {
      active: 0,
      list: []
    };
  },
  created() {
    document.title = "个人资料";
  },
  computed: {
    disabled() {
      if (this.list.姓名 && this.list.身份证 && this.list.工号 != "") {
        return false;
      }
      return true;
    }
  },
  mounted() {
    this.getPersonnelDetails();
  },
  methods: {
    getPersonnelDetails() {
      var para = {
        人员编号: JSON.parse(localStorage.getItem("personnel")).编号
      };
      this.$http.getSomePersonnelDetails(para).then(res => {
        console.log(res, "ffgg");
        this.list = res.data;
      });
    },
    submit: _debounce(function() {
      var para = {
        编号: JSON.parse(localStorage.getItem("personnel")).编号,
        姓名: this.list.姓名,
        工号: this.list.工号,
        身份证: this.list.身份证,
        部门编号: this.list.部门编号,
        密码: this.list.密码,
        是否启用: this.list.是否启用
      };
      this.$http.ChangeAccount(para).then(res => {
        if (!res.error) {
          this.$toast.success("修改成功！");
        } else {
          this.$toast(res.error);
        }
      });
    }, 500),
    prompt() {
      this.$toast("请到PC端修改！");
    }
  }
};
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
}
.box {
  padding: 10px;
  .btn {
    margin-top: 30px;
    background-color: #57d4ce;
    color: #fff;
    font-size: 16px;
    width: 100%;
    position: fixed;
    bottom: 0;
    left: 0;
  }
}
</style>
