<template>
  <div>
    <header class="content">
      <img v-if="this.list.头像路径 !== null"
           :src="url+this.list.头像路径">
      <img v-else
           :src="this.defaultImg">
      <div class="imgRight">
        <div>
          <p>
            {{list.姓名}}
          </p>
          <span>{{list.专业名称}} {{list.学员类型名称}}</span>
        </div>
      </div>
    </header>
    <section>
      <div class="searchBox">
        <van-cell-group>
          <van-field v-model="宿舍楼名称"
                     label="楼栋名称"
                     placeholder="请选择楼栋名称"
                     left-icon="arrow-down" />
          <van-field v-model="职位"
                     label="职位"
                     placeholder="请选择职位"
                     left-icon="arrow-down" />
          <van-field v-model="职位"
                     label="门牌号及床号"
                     placeholder="请输入门牌号及床号"
                     left-icon="arrow-down" />
        </van-cell-group>
      </div>
    </section>
  </div>
</template>
<script>
export default {
  data () {
    return {
      url:
        process.env.NODE_ENV === 'development'
          ? 'http://192.168.0.99:63739'
          : '',
      defaultImg: require('@/assets/images/default_avatar.png'),
      list: this.$route.params.item
    }
  },
  created () {
    console.log(this.list, '333')
  },
  mounted () {

  },
  methods: {
    // goDetails (item) {
    //   this.$router.push({
    //     path: '/studentInformation',
    //     name: 'studentInformation',
    //     params: {
    //       item
    //     }
    //   })
    // }
  }
}
</script>
<style lang="less" scoped>
.content {
  display: flex;
  background-color: #01b4fe;
  padding: 10px 20px;
  img {
    background-color: #fff;
    width: 80px;
    height: 80px;
    border-radius: 50%;
  }
  .imgRight {
    padding-left: 20px;
    text-align: left;
    display: flex;
    align-items: center;
    p {
      padding: 2px 0;
      margin: 0;
      font-size: 14px;
      color: #fff;
    }
    span {
      font-size: 14px;
      color: #f5f3fb;
    }
    small {
      display: block;
      color: #ccc;
    }
  }
}
</style>
