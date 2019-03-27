<template>
  <ul>
    <li v-for="(item,index) in iocnList" :key="index">
      <a @click="path(item)">
        <img :src="item.Logo" :alt="item.名称">
        <p>{{item.名称}}</p>
      </a>
    </li>
  </ul>
</template>
<script>
export default {
  data() {
    return {
      iocnList: []
    };
  },
  created() {},
  mounted() {
    this.getServiceName();
  },
  methods: {
    getServiceName() {
      var personnel = localStorage.getItem("personnel");
      // var personnel = JSON.parse(localStorage.getItem("personnel"));
      if (personnel === null) {
        
        console.log("456456");
        // this.$http.LoginWithOpenId(code).then(res => {
        //   console.log(res, "sss");
        // });
      }
      // var name = personnel.DbKey;
      // var para = {
      //   医院名称: name
      // };
      // this.$http.getServiceList(para).then(res => {
      //   // console.log(res, "2222");
      //   this.iocnList = res.data;
      // });
    },
    path(item) {
      if (item.手机链接地址 === null) {
        this.$toast.fail({
          duration: 1000,
          message: "请先购买服务!"
        });
      } else {
        var path = item.手机链接地址;
        if (path.indexOf("?") != -1) {
          this.$router.push(`/${path}&accountId=${item.编号}`);
        } else {
          this.$router.push(`/${path}?accountId=${item.编号}`);
        }
      }
    }
  }
};
</script>
<style lang="less" scoped>
ul {
  display: flex;
  flex-wrap: wrap;
  padding: 8px;
  li {
    width: 25%;
    padding: 10px 0;
    img {
      width: 40px;
      height: 40px;
    }
    p {
      margin: 0;
      font-size: 14px;
      color: #000;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      //   width:80px;
    }
  }
}
</style>
