<template>
  <div>
    <img src="@/assets/images/iocn/homeLogo.jpg" alt="科研logo">
    <span @click="toLogin" v-if='!personnel'>登 录</span>
  </div>
</template>
<script>
export default {
  data() {
    return {
      personnel: JSON.parse(localStorage.getItem("personnel"))
    };
  },
  computed: {
    // 计算属性的 getter
    // condition: function () {
    //   // `this` 指向 vm 实例
    //   return this.personnel != null;
    // }
  },
  created() {},
  mounted() {},
  methods: {
    toLogin() {
      if (this.personnel === null) {
        this.$router.push("/guidance");
      }
    }
  }
};
</script>
<style lang="less" scoped>
div {
  background-color: #fff;
  img {
    height: 50px;
  }
  span {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 16px;
    color: #a3a3a3;
  }
}
</style>
