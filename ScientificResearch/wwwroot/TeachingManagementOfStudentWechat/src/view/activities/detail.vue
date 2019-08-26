<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <van-cell-group title="基本信息">
        <van-cell
          v-for="item in activities.BaseInfo"
          :key="item.key"
          :title="item.key"
          :value="item.value"
        />
      </van-cell-group>
      <van-cell-group title="可参与者">
        <van-cell>
          <span v-for="item in participants" :key="item.编号">{{item.学员姓名}}&nbsp;&nbsp;</span>
        </van-cell>
      </van-cell-group>

      <van-cell-group title="病人信息">
        <van-cell
          v-for="item in activities.patient"
          :key="item.key"
          :title="item.key"
          :value="item.value"
        />
      </van-cell-group>

      <van-cell-group title="附件"  v-show="attachment.length>0">
        <van-cell>
          <div class="attachment">
            <ul>
              <li v-for="item in attachment" :key="item.path">
                <a target="_blank" :href="item.path">{{item.name}}</a>
              </li>
            </ul>
          </div>
        </van-cell>
      </van-cell-group>
      <van-cell-group title="活动内容">
        <van-cell>
          <div class="content" v-html="activities.content"></div>
        </van-cell>
      </van-cell-group>
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { GetDetail } from "@/api/activities";
import { mapActions } from "vuex";
import sysConfig from "@/config";
export default {
  components: {
    navbar
  },
  data() {
    return {
      
      attachment: [],
      participants: [],
      activities: {
        BaseInfo: [
          { key: "活动主题" },
          { key: "活动类别", alias: "教学活动类型名称" },
          { key: "活动开始时间" },
          { key: "活动结束时间" },
          { key: "活动地点" },
          { key: "主讲人", alias: "主讲人姓名" },
          { key: "教学科室", alias: "主讲人部门名称" },
          { key: "教学病例" }
        ],
        participants: [], //可参与者
        patient: [
          { key: "病人姓名" },
          { key: "病人编号" },
          { key: "病人性别" },
          { key: "病人出生日期" },
          { key: "病人住院号" },
          { key: "病人住院床号" },
          { key: "病人入院日期" },
          { key: "病人出院日期" },
          { key: "病人次要诊断" }
        ], //病人信息
        content: ""
      },

      path: "/activities/list"
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    }
  },
  mounted() {
    var title = this.$route.query.name;
    var typeid = this.$route.query.typeid;
    this.path = "/activities/list?name=" + title + "&typeid=" + typeid;
    this.setNavTitle({ title });
    this.GetInfo();
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    GetInfo() {
      let _this = this;

      GetDetail(this.id).then(res => {
        let data = res.data.data;
        _this.participants = data.可参与者;
        var activities = data.教学活动;
        _this.activities.content = activities.活动内容;
        let title=_this.$route.query.name+'-'+activities.活动主题;
          this.setNavTitle({ title });
        for (let k in activities) {
          for (let i = 0; i < _this.activities.BaseInfo.length; i++) {
            let item = _this.activities.BaseInfo[i];
            if (k == item.key || k == item.alias) {
              item.value = activities[k];
            }
          }
          for (let i = 0; i < _this.activities.patient.length; i++) {
            let item = _this.activities.patient[i];
            if (k == item.key || k == item.alias) {
              item.value = activities[k];
            }
          }
        }
        var attachments = activities.附件.split(",");
        for (let i = 0; i < attachments.length; i++) {
          var n = attachments[i].split("/");
          _this.attachment.push({
            name: n[n.length - 1],
            path: sysConfig.baseUrl.pro + attachments[i]
          });
        }
      });
    }
  }
};
</script>
<style lang="less">
.detail {
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
</style>



