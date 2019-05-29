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
    <van-cell-group>
      <van-field @click="chooseDormitory"
                 v-model="list.宿舍楼名称"
                 label="楼栋名称"
                 placeholder="请选择楼栋名称"
                 readonly />
      <van-field @click="choosePosition"
                 v-model="list.职位"
                 label="职位"
                 placeholder="请选择职位"
                 readonly
                 required />
      <van-field v-model="list.门牌号及床号"
                 label="门牌号及床号"
                 placeholder="请输入门牌号及床号"
                 clearable
                 required />
      <van-field v-model="list.水起数"
                 label="水起数"
                 placeholder="请输入水起数"
                 clearable />
      <van-field v-model="list.电起数"
                 label="电起数"
                 placeholder="请输入电起数"
                 clearable />
      <van-field v-model="list.气起数"
                 label="气起数"
                 placeholder="请输入气起数"
                 clearable />
      <van-field v-model="list.入住日期"
                 label="入住时间"
                 placeholder="请输入入住时间"
                 clearable />
      <van-field v-model="list.退出日期"
                 label="退出时间"
                 placeholder="请输入退出时间"
                 clearable />
      <van-field v-model="list.退出原因"
                 label="退出原因"
                 placeholder="请输入退出原因"
                 clearable />
      <van-field v-model="list.滞纳金比例"
                 label="滞纳金比例"
                 placeholder="0.00"
                 clearable />
      <van-field v-model="list.宿舍安排说明"
                 label="宿舍安排说明"
                 placeholder="请输入宿舍安排说明"
                 type="textarea"
                 rows="1"
                 autosize
                 clearable />
    </van-cell-group>
    <van-button class="sumitBtn"
                :disabled="disabled"
                @click="submitModify"
                size="large">确认修改</van-button>
    <van-actionsheet v-model="show"
                     title="选择职位">
      <van-radio-group v-model="radio">
        <van-cell-group>
          <van-cell title="无"
                    clickable
                    @click="radio = '1'">
            <van-radio name="1" />
          </van-cell>
          <van-cell title="室长"
                    clickable
                    @click="radio = '2'">
            <van-radio name="2" />
          </van-cell>
          <van-cell title="管理员"
                    clickable
                    @click="radio = '3'">
            <van-radio name="3" />
          </van-cell>
        </van-cell-group>
      </van-radio-group>
    </van-actionsheet>
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
      list: this.$route.params.item,
      show: false,
      radio: '1'
    }
  },
  created () {
    console.log(this.list, '333')
  },
  computed: {
    disabled () {
      if (this.list.职位 && this.list.门牌号及床号 !== '') {
        return false
      }
      return true
    }
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
    chooseDormitory () {
      this.$toast('选择楼栋!')
    },
    choosePosition () {
      this.show = true
    },
    submitModify () {
      this.$toast('确认修改!')
    }
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
.van-cell-group {
  text-align: left;
  margin-bottom: 50px;
}
.sumitBtn {
  background-color: #01b4fe;
  color: #fff;
  position: fixed;
  bottom: 0;
  left: 0;
}
</style>
