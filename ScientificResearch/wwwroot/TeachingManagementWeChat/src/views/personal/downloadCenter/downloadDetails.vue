<template>
  <section>
    <div class="popup">
      <h3>基本信息</h3>
      <ul class="servicel">
        <li class="title">
          <span>文件名称</span>
          <span>{{this.detailslList.文件名称}}</span>
        </li>
        <li>
          <span>文件类型</span>
          <span>{{this.detailslList.文件类型}}</span>
        </li>
        <li>
          <span>状态</span>
          <span>{{conversionStateB(this.detailslList.是否启用)}}</span>
        </li>
        <li>
          <span>发布人</span>
          <span>{{this.detailslList.上传人姓名}}</span>
        </li>
        <li>
          <span>发布人部门</span>
          <span>{{this.detailslList.上传人部门名称}}</span>
        </li>
        <li>
          <span>发布时间</span>
          <span>{{this.detailslList.建立时间}}</span>
        </li>
      </ul>
      <h3>文件</h3>
      <ul class="servicel">
        <li>文件</li>
        <li>
          <a :href="this.detailslList.文件路径"
             download>{{Interception(this.detailslList.文件路径)}}</a>
        </li>
      </ul>
      <h3>文件说明</h3>
      <ul class="servicel">
        <li>说明</li>
        <li>{{this.detailslList.备注}}</li>
      </ul>
    </div>
    <ReturnTop />
    <ReturnBtn />
  </section>
</template>
<script>
import { Interception } from '@/assets/js/common/filter.js'
export default {
  data () {
    return {
      detailslList: this.$route.params.item
    }
  },
  methods: {
    // 截取时间
    startTime (item) {
      if (item != null) {
        return item.slice(0, 10)
      } else {
        return item
      }
    },
    Interception (item) {
      return Interception(item)
    },
    conversionStateB (item) {
      return item === true ? '正常' : item === false ? '未启用' : ''
    }
  }
}
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
  padding: 10px;
  height: 100vh;
  h3 {
    font-size: 14px;
    margin: 5px 0;
    padding: 5px;
    color: #1296db;
    background-color: #e7e7e7;
  }
  .servicel {
    font-size: 14px;
    padding: 10px;
    margin-bottom: 20px;
    border-bottom: 2px solid #ccc;
    background-color: #fff;
    li {
      padding: 10px 0;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #f2f2f2;
      span:nth-child(1) {
        color: #888;
      }
      span:nth-child(2) {
        color: #5a5a5a;
      }
    }
    .title {
      display: flex;
      align-items: center;
      span:nth-child(1) {
        width: 30%;
      }
      span:nth-child(2) {
        padding-left: 10px;
      }
    }
  }
}
</style>
