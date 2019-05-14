<template>
  <div>
    <div class="content">
      <!-- <img :src="url+this.Logo || this.defaultImg"> -->
      <img :src="this.defaultImg">
      <div class="imgRight">
        <div>
          <p>
            陈少宇 -
            <small>（ 男,汉族,29岁 ）</small>
            <span>学员类型名称</span>
          </p>
          <p>手机号码:13245824897</p>
        </div>
      </div>
    </div>
    <div class="informmation">
      <van-cell-group>
        <van-field label="电子邮箱:"
                   :readonly="true" />
        <van-field label="专业方向:"
                   :readonly="true" />
        <van-field label="往届/应届:"
                   :readonly="true" />
        <van-field label="出生日期:"
                   :readonly="true" />
        <van-field label="证件号码:"
                   :readonly="true" />
        <van-field label="政治面貌:"
                   :readonly="true" />
        <van-field label="QQ号码:"
                   :readonly="true" />
        <van-field label="微信号:"
                   :readonly="true" />
        <van-field label="家庭住址:"
                   :readonly="true" />
        <van-field label="是否取得执业证书:"
                   :readonly="true" />
        <van-field label="执业证书编号:"
                   :readonly="true" />
        <van-field label="是否取得医师资格证书:"
                   :readonly="true" />
        <van-field label="医师资格证编号:"
                   :readonly="true" />
        <van-field label="最高学历:"
                   :readonly="true" />
        <van-field label="毕业年份:"
                   :readonly="true" />
        <van-field label="毕业学校:"
                   :readonly="true" />
        <van-field label="毕业专业:"
                   :readonly="true" />
        <van-field label="学位证编码:"
                   :readonly="true" />
        <van-field label="毕业证编码:"
                   :readonly="true" />
        <van-field label="送培方式:"
                   :readonly="true" />
        <van-field label="工作单位:"
                   :readonly="true" />
        <van-field label="医疗卫生机构:"
                   :readonly="true" />
        <van-field label="医院属性:"
                   :readonly="true" />
        <van-field label="医院类型:"
                   :readonly="true" />
        <van-field label="医院性质:"
                   :readonly="true" />
        <van-field label="基层医疗卫生机构:"
                   :readonly="true" />
        <van-field label="备注:"
                   :readonly="true" />
      </van-cell-group>
    </div>
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
      Logo: '',
      defaultImg: require('@/assets/images/default_avatar.png')
    }
  },
  created () {
  },
  mounted () {
  },
  methods: {

  }
}
</script>
<style lang="less" scoped>
.content {
  display: flex;
  justify-content: space-between;
  background-color: #01b4fe;
  padding: 10px 20px;
  img {
    background-color: #fff;
    width: 80px;
    height: 80px;
    border-radius: 50%;
  }
  .imgRight {
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
  }
}
.informmation {
  padding: 10px 0;
}
</style>
