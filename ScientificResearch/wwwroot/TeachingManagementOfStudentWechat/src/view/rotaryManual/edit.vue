<template>
  <div>
    <navbar :path="path" />
    <div class="detail">
      <van-cell-group>
        <select-picker
          v-if="rotaryManualTypes.length>0"
          label="类型"
          v-model="form.轮转手册.教学轮转手册类型编号"
          :data="rotaryManualTypes"
          :required="true"
        ></select-picker>
        <select-picker
          v-if="TeacherRoomTaskType.length>0"
          label="任务类型"
          v-model="form.轮转手册.教学专业科室任务类型编号"
          :data="TeacherRoomTaskType"
          :required="true"
        ></select-picker>
        <date-time v-model="form.轮转手册.操作时间" :required="true" type="date" label="操作时间:" />
        <select-patient label="选择病人" :mine="true" v-model="form.轮转手册.病人编号" :required="true" />
        <van-field
          v-model="form.轮转手册.概要"
          label="概要"
          type="textarea"
          placeholder="请输入概要"
          rows="1"
          autosize
          required
        />
        <van-field
          v-model="form.轮转手册.内容"
          label="内容"
          type="textarea"
          placeholder="请输入内容"
          rows="1"
          autosize
          required
        />
        <van-field
          v-model="form.轮转手册.备注"
          label="备注"
          type="textarea"
          placeholder="请输入备注"
          rows="1"
          autosize
        />
        <van-uploader
          v-model="fileList"
          :after-read="uploadAttachment"
          multiple
          upload-text="上传附件"
        />
      </van-cell-group>
      <van-cell-group title="已完成任务" v-if="checkTask.length>0">
        <van-checkbox-group v-model="taskItem">
          <van-cell-group>
            <van-cell
              v-for="(item,index) in checkTask"
              clickable
              :key="item.编号"
              @click="toggle(index)"
              :title=" item.项目名称"
            >
              <van-checkbox :name="item" ref="checkboxes" slot="right-icon" />
            </van-cell>
          </van-cell-group>
        </van-checkbox-group>
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
import SelectPatient from "@/components/SelectPatient";
import { mapActions } from "vuex";
import { Field, Uploader, Checkbox, CheckboxGroup } from "vant";
import SelectPicker from "@/components/SelectPicker.vue";
import { GetTeacherRoomTaskType } from "@/api/systemSetting";
import {
  SaveSend,
  upload,
  GetCheckTask,
  GetRolationType
} from "@/api/WorkFlow";

export default {
  components: {
    [Field.name]: Field,
    [Uploader.name]: Uploader,
    [Checkbox.name]: Checkbox,
    [CheckboxGroup.name]: CheckboxGroup,

    navbar,
    DateTime,
    SelectPicker,
    SelectPatient
  },
  data() {
    return {
      title: "",
      fileList: [],
      form: {
        轮转手册: {
          编号: 0,
          教学轮转编号: 0,
          教学轮转手册类型编号: 0,
          教学专业科室任务类型编号: 0,
          操作时间: new Date().format("yyyy-MM-dd HH:mm:ss"),
          病人编号: 0,
          概要: "",
          内容: "",
          附件: "",
          建立时间: new Date().format("yyyy-MM-dd HH:mm:ss"),
          备注: ""
        },
        完成任务编号列表: []
      },
      taskItem: [],
      rotaryManualTypes: [],
      TeacherRoomTaskType: [],
      checkTask: [],
      TrainingSituation: {},
      path: "/rotaryManual"
    };
  },
  watch: {
    "form.轮转手册.教学轮转手册类型编号": {
      handler() {
        this.GetTask();
      }
    },
    "form.轮转手册.教学专业科室任务类型编号": {
      handler() {
        this.GetTask();
      }
    }
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    },
    days() {
      let day = "";
      if (this.form.请假结束日期 && this.form.请假开始日期) {
        day = new Date(this.form.请假开始日期).DateDiff(
          new Date(this.form.请假结束日期)
        );
      }
      //this.form.请假天数=day;
      return day;
    }
  },
  mounted() {
    var title = "";
    let _this = this;
    this.form.编号 = this.id;
    if (this.form.编号) {
      this.title = "修改轮转手册";
    } else {
      this.title = "添加轮转手册";
    }
    if (localStorage.getItem("TrainingSituation")) {
      this.TrainingSituation = JSON.parse(
        localStorage.getItem("TrainingSituation")
      );
      this.form.轮转手册.教学轮转编号 = this.TrainingSituation.当前教学轮转编号;
    }
    title = this.title;
    this.setNavTitle({ title });

    this.rotaryManualTypes = [];
    GetRolationType().then(res => {
      let data = res.data.data;
      data.forEach(item => {
        _this.rotaryManualTypes.push({
          value: item.编号,
          text: item.名称
        });
      });
    });
    this.TeacherRoomTaskType = [];
    GetTeacherRoomTaskType().then(res => {
      let data = res.data.data;
      data.forEach(item => {
        _this.TeacherRoomTaskType.push({
          value: item.编号,
          text: item.名称
        });
      });
    });
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    toggle(index) {
      this.$refs.checkboxes[index].toggle();
    },
    uploadAttachment(obj) {
      upload(obj.file).then(res => {
        let data = res.data.data;
        this.fileList[this.fileList.indexOf(obj)].path = data[0];
      });
    },
    GetTask() {
      let _this = this;
      if (!_this.form.轮转手册.教学轮转编号) {
        return;
      }
      if (!_this.form.轮转手册.教学轮转手册类型编号) {
        return;
      }
      if (!_this.form.轮转手册.教学专业科室任务类型编号) {
        return;
      }
      GetCheckTask(this.form.轮转手册).then(res => {
        _this.checkTask = res.data.data;
      });
    },
    submit() {
      let _this = this;
      if (!this.form.轮转手册.教学轮转手册类型编号) {
        this.$toast("请选择类型!");
        return;
      }
      if (!this.form.轮转手册.教学专业科室任务类型编号) {
        this.$toast("请选择任务类型!");
        return;
      }
      if (!this.form.轮转手册.病人编号) {
        this.$toast("请选择病人!");
        return;
      }
      if (!this.form.轮转手册.概要) {
        this.$toast("概要不能为空!");
        return;
      }
      if (!this.form.轮转手册.内容) {
        this.$toast("内容不能为空!");
        return;
      }
      this.form.轮转手册.附件 = this.fileList
        .map(item => {
          return item.path;
        })
        .join(",");
      this.form.完成任务编号列表 = [];
      this.taskItem.forEach(item => {
        this.form.完成任务编号列表.push(item.编号);
      });
      SaveSend({
        type: 3,
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



