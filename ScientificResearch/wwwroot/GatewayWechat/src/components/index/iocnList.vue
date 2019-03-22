<template>
  <ul>
    <li v-for="(item,index) in iocnList" :key="index">
      <a @click="path(item)">
        <img :src="item.Logo" :alt="item.名称">
        <p>{{item.名称}}</p>
      </a>
    </li>
    <!-- <img :src="item.path"> -->
  </ul>
</template>
<script>
export default {
  data() {
    return {
      iocnList: [],
      // imgList: {
      //   中国知网: require("../../assets/images/iocn/1.png"),
      //   万方医学网: require("../../assets/images/iocn/15.png"),
      //   科研系统: require("../../assets/images/iocn/17.png"),
      //   第一个测试服务: require("../../assets/images/iocn/3.png"),
      //   测试服务22: require("../../assets/images/iocn/5.png"),
      //   测试在是的: require("../../assets/images/iocn/6.png"),
      //   default: require("../../assets/images/iocn/9.png")
      // }
    };
  },
  mounted() {
    this.getServiceName();
  },
  methods: {
    getServiceName() {
      var personnel = JSON.parse(localStorage.getItem("personnel"));
      var name = personnel.DbKey;
      var para = {
        医院名称: name
      };
      this.$http.getServiceList(para).then(res => {
        // console.log(res, "2222");
        this.iocnList = res.data;
        // this.iocnList.forEach((item, index) => {
        //   for (let path in this.imgList) {
        //     if (path == item.名称) {
        //       item.path = this.imgList[path];
        //       break;
        //     }
        //     item.path = this.imgList.default;
        //   }
        // });
      });
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
