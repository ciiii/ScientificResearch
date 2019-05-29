<template>
  <div>
    <div class="content">
      <img v-if="this.list.头像路径 !== null"
           :src="url+this.list.头像路径">
      <img v-else
           :src="this.defaultImg">
      <div class="imgRight">
        <div>
          <p>
            {{list.姓名}} -
            <small>（ {{list.性别}} - {{list.名族}} ）</small>
            <span>{{list.学员类型名称}}</span>
          </p>
          <p>{{list.手机号码}}</p>
        </div>
      </div>
    </div>
    <div class="informmation">
      <ul>
        <li>
          <table>电子邮箱</table><span>{{list.电子邮箱}}</span>
        </li>
        <li>
          <table>专业方向</table><span>???</span>
        </li>
        <li>
          <table>往届/应届</table><span>{{list.往届应届}}</span>
        </li>
        <li>
          <table>出生日期</table><span>{{Time(list.出生日期)}}</span>
        </li>
        <li>
          <table>证件号码</table><span>{{list.证件号码}}</span>
        </li>
        <li>
          <table>政治面貌</table><span>{{list.政治面貌}}</span>
        </li>
        <li>
          <table>QQ号码</table><span>{{list.QQ号码}}</span>
        </li>
        <li>
          <table>微信号</table><span>{{list.微信号}}</span>
        </li>
        <li>
          <table>家庭住址</table><span>{{list.家庭住址}}</span>
        </li>
        <li>
          <table>是否取得执业证书</table><span>???</span>
        </li>
        <li>
          <table>执业证书编号</table><span>{{list.执业证书编号}}</span>
        </li>
        <li>
          <table>是否取得医师资格证书</table><span>???</span>
        </li>
        <li>
          <table>医师资格证编号</table><span>{{list.医师资格证编号}}</span>
        </li>
        <li>
          <table>最高学历</table><span>{{list.最高学历}}</span>
        </li>
        <li>
          <table>毕业年份</table><span>{{list.毕业年份}}</span>
        </li>
        <li>
          <table>毕业学校</table><span>{{list.毕业学校}}</span>
        </li>
        <li>
          <table>毕业专业</table><span>{{list.毕业专业}}</span>
        </li>
        <li>
          <table>学位证编码</table><span>{{list.学位证编码}}</span>
        </li>
        <li>
          <table>毕业证编码</table><span>{{list.毕业证编码}}</span>
        </li>
        <li>
          <table>送培方式</table><span>{{list.送培方式}}</span>
        </li>
        <li>
          <table>工作单位</table><span>{{list.工作单位}}</span>
        </li>
        <li>
          <table>医疗卫生机构</table><span>{{list.医疗卫生机构}}</span>
        </li>
        <li>
          <table>医院属性</table><span>???</span>
        </li>
        <li>
          <table>医院类型</table><span>???</span>
        </li>
        <li>
          <table>医院性质</table><span>???</span>
        </li>
        <li>
          <table>基层医疗卫生机构</table><span>???</span>
        </li>
        <li>
          <table>备注</table><span>{{list.备注}}</span>
        </li>
      </ul>
    </div>
    <ReturnBtn />
  </div>
</template>
<script>
import { Time } from '@/assets/js/common/filter'
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
    // console.log(this.list, '????')
  },
  mounted () {
  },
  methods: {
    Time (value) {
      return Time(value)
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
  }
}
.informmation {
  padding: 10px 0 110px 0;
  ul {
    font-size: 14px;
    background-color: #fff;
    li {
      display: flex;
      justify-content: space-between;
      padding: 10px 20px;
      border-bottom: 1px solid #f5f3fb;
      span {
        color: #888;
      }
    }
  }
}
</style>
