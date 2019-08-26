<template>
  <div>
    <navbar :path="path" />
    <div class="content">
      <van-cell-group>
        <van-field v-model="name" label="教学活动:" readonly />

        <van-field v-model="submitForm.反馈内容" label="反馈内容:" type="textarea" row="2" required />
        <van-uploader
          v-model="fileList"
          :after-read="uploadAttachment"
          multiple
          upload-text="上传附件"
        />
        <van-field v-model="submitForm.备注" label="备注:" type="textarea" row="2" />
      </van-cell-group>
      <van-submit-bar :decimal-length="0" currency button-text="提交" @submit="onSubmit"></van-submit-bar>
    </div>
  </div>
</template>
<script>
import { Button, Field, Cell, CellGroup, SubmitBar, Uploader } from "vant";
import navbar from "@/components/navbar.vue";
import { SaveFeedback, GetFeedback, upload } from "@/api/activities";

export default {
  components: {
    [Button.name]: Button,
    [Field.name]: Field,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [SubmitBar.name]: SubmitBar,
    [Uploader.name]: Uploader,
    navbar
  },

  data() {
    return {
      loading: true,
      fileList: [],
      personnel: {},
      name: "",
      path: "",
      submitForm: {
        编号: 0,
        教学活动编号: 0,
        学员编号: 0,
        反馈内容: "",
        附件: "",
        建立时间: new Date().format("yyyy-MM-dd HH:mm:ss"),
        备注: ""
      },
      list: []
    };
  },
  mounted() {
    this.submitForm.教学活动编号 = this.$route.query.id;
    if (localStorage.getItem("personnel")) {
      this.personnel = JSON.parse(localStorage.getItem("personnel"));
    }
    this.path =
      "/activities/list?typeid=" +
      this.$route.query.typeid +
      "&name=" +
      this.$route.query.name;
    this.name = this.$route.query.name;
    let _this = this;
    GetFeedback({
      id: this.submitForm.教学活动编号,
      studentId: this.personnel.编号
    }).then(res => {
      let data = res.data.data[0];
      if (data) {
        let arr = data.附件.split(",");
        arr.forEach(item => {
          this.fileList.push({
            path: item,
            file: {
              name: item.split("/")[item.split("/").length - 1]
            }
          });
        });
        this.submitForm.附件 = data.附件;
        this.submitForm.反馈内容 = data.反馈内容;
        this.submitForm.备注 = data.备注;
      }
      this.submitForm.编号 = data.编号;
      _this.loading = false;
    });
  },
  methods: {
    uploadAttachment(obj) {
      upload(obj.file).then(res => {
        let data = res.data.data;
        this.fileList[this.fileList.indexOf(obj)].path = data[0];
      });
    },
    onSubmit() {
      let _this = this;
      if (_this.submitForm.教学活动编号 == "") {
        _this.$toast("教学活动编号不存在");
        return;
      }

      if (_this.submitForm.反馈内容 == "") {
        _this.$toast("请输反馈内容");
        return;
      }

      if (!_this.submitForm.creator) {
        if (localStorage.getItem("personnel")) {
          let userInfo = JSON.parse(localStorage.getItem("personnel"));
          _this.submitForm.学员编号 = userInfo.编号;
        }
      }
      this.submitForm.附件 = this.fileList
        .map(item => {
          return item.path;
        })
        .join(",");
      SaveFeedback(_this.submitForm).then(res => {
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

</style>


