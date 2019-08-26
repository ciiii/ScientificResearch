<template>
  <div>
    <navbar :isSearch="true" :path="path" :search="search" />
    <van-list
      v-model="loading"
      :finished="finished"
      :error.sync="error"
      error-text="请求失败，点击重新加载"
      :finished-text="finishText"
      @load="getlist"
      class="content"
    >
      <van-cell v-for="item in list" :key="item.编号" class="row">
        <h3>{{item.通知名称}}</h3>
        <p>发布人:{{item.发送人姓名}}</p>
        <p>发布部门:{{item.发送人部门名称}}</p>
        <p>建立时间:{{item.建立时间}}</p>
        <div class="detail">
          <van-button
            plain
            type="primary"
            :to="'/message/list/detail?id='+item.编号+'&name='+title"
            size="small"
            
          >查看详情</van-button>
        </div>
      </van-cell>
    </van-list>
    <van-popup v-model="filter" position="right" :style="{ height: '100%',width:'70%' }">
      <div class="filter">
        <van-divider :style="{ color: '#1989fa', borderColor: '#1989fa', padding: '0 16px' }">查询条件</van-divider>
        <van-cell-group>
          <van-field v-model="form.title" placeholder="通知名称" />
          <van-field v-model="form.sendman" placeholder="发布人姓名" />
        </van-cell-group>
        <div class="btns">
          <van-button size="large" icon="search" type="primary" @click="getlist">查询</van-button>
        </div>
      </div>
    </van-popup>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { List, Button, Popup, Field, Cell, CellGroup, Divider } from "vant";
import { mapActions } from "vuex";
import { GetNotes } from "@/api/notes";

export default {
  components: {
    [List.name]: List,
    [Button.name]: Button,
    [Popup.name]: Popup,
    [Field.name]: Field,
    [Cell.name]: Cell,
    [CellGroup.name]: CellGroup,
    [Divider.name]: Divider,
    navbar
  },
  data() {
    return {
      title: "",
      loading: false,
      finished: false,
      error: false,
      list: [],
      path: "",
      filter: false,
      form: { index: 0, size: 3, type: 0, title: "", sendman: "" }
    };
  },
  computed: {
    finishText: function() {
      return this.list.length > 0 ? "没有更多了" : "暂无数据";
    }
  },
  mounted() {
    this.title = this.$route.query.name;
    this.form.type = this.title;
    this.path = "/message";
    this.setNavTitle({ title: this.title });
  },

  methods: {
    ...mapActions(["setNavTitle"]),
    search: function() {
      this.filter = true;
    },
    getlist() {
      if (this.filter) {
        this.form.index = 0;
        this.list = [];
        this.filter = false;
      }
      this.form.index++;
      GetNotes(this.form).then(res => {
        let data = res.data.data.list;
        for (var i = 0; i < data.length; i++) {
          this.list.push(data[i]);
        }
        this.finished = this.list.length >= res.data.data.total;
        this.loading = false;
      });
    }
  }
};
</script>
<style lang="less">
.content {
  margin-top: 50px;
  .row {
    position: relative;
  }
  p {
    padding: 0px;
    margin: 0px;
  }
  .detail {
    position: absolute;
    right: 5px;
    bottom: 2px;
  }
}
.filter {
  .btns {
    margin-top: 20px;
    text-align: center;
  }
}
</style>


