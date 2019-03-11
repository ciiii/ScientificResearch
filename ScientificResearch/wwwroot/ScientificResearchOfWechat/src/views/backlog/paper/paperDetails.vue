<template>
  <section>
    <van-tabs v-model="active" swipeable class="popup">
      <van-tab title="论文信息">
        <ul class="servicel">
          <h4>基本信息</h4>
          <li>论文标题：
            <p>{{this.detailslList.论文标题}}</p>
          </li>
          <li>论文Online日期：{{startTime(this.detailslList.论文Online日期)}}</li>
          <li>正式出版日期：{{startTime(this.detailslList.论文正式出版日期)}}</li>
          <li>
            <span>他引次数：{{this.detailslList.他引次数}}</span>
            <span>年度：{{this.detailslList.年度}}</span>
          </li>
          <li>收稿日期：{{startTime(this.detailslList.收稿日期)}}</li>
          <li>版面费(元)：{{NumFormat(this.detailslList.版面费)}}</li>
          <li>超额版面费(元)：{{NumFormat(this.detailslList.超额版面费)}}</li>
          <li>超额费用来源：{{this.detailslList.超额费用来源}}</li>
          <li>奖励情况：{{this.detailslList.奖励情况}}</li>
          <li>论文字数：{{this.detailslList.论文字数}}</li>
          <li>
            <span>计划来源：{{this.detailslList.计划来源}}</span>
            <span>论文版面：{{this.detailslList.论文版面}}</span>
          </li>
          <li>
            <span>学科门类：{{this.detailslList.学科门类}}</span>
            <span>一级学科：{{this.detailslList.一级学科}}</span>
          </li>
          <li>
            <span>二级学科：{{this.detailslList.二级学科}}</span>
            <span>三级学科：{{this.detailslList.三级学科}}</span>
          </li>
          <li>
            <span>作者人数：{{this.detailslList.作者人数}}</span>
            <span>通讯作者：{{this.detailslList.通讯作者}}</span>
          </li>
          <li>
            <span>文献类型：{{this.detailslList.文献类型}}</span>
          </li>
        </ul>
      </van-tab>
      <van-tab title="刊物信息">
        <ul class="servicel">
          <h4>刊物信息</h4>
          <li>刊物名称：{{this.detailslList.刊物名称}}</li>
          <li>影响因子：{{this.detailslList.影响因子}}</li>
          <li>特征因子分值：{{this.detailslList.特征因子分值}}</li>
          <li>主办单位：{{this.detailslList.主办单位}}</li>
          <li>编目名称：{{this.detailslList.编目名称}}</li>
          <li>
            <span>CN号:{{this.detailslList.CN号}}</span>
            <span>ISSN号:{{this.detailslList.ISSN号}}</span>
          </li>
          <li>
            <span>卷号：{{this.detailslList.卷号}}</span>
            <span>期号：{{this.detailslList.期号}}</span>
          </li>
          <li>页码范围：{{this.detailslList.页码范围起}} ~ {{this.detailslList.页码范围止}}</li>
        </ul>
      </van-tab>
      <van-tab title="相关项目">
        <div v-if="relatedProjects.length == 0" class="zanwu">
          <img src="../../../assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in relatedProjects" :key="key">
          <h4>相关项目</h4>
          <li>项目名称：{{item.项目名称}}</li>
          <li>项目编号：{{item.项目编号}}</li>
          <li>项目类型名称：{{item.项目类型名称}}</li>
        </ul>
      </van-tab>
      <van-tab title="作者信息">
        <div v-if="authorInformation.length == 0" class="zanwu">
          <img src="../../../assets/images/nothing-3.png" alt>
        </div>
        <ul class="servicel" v-else v-for="(item,key) in authorInformation" :key="key">
          <h4>相关项目</h4>
          <li>作者姓名：{{item.姓名}}</li>
          <li>部门名称：{{item.部门名称}}</li>
          <li>作者级别：{{item.作者级别}}</li>
          <li>工作量占比(%)：{{item.工作量占比}}</li>
        </ul>
      </van-tab>
      <van-tab title="相关文件">
        <ul class="servicel">
          <h4>检索信息页相关文件</h4>
          <li>检索信息页相关文件路径：</li>
          <li>
            <a
              :href="this.detailslList.检索信息页相关文件路径"
              download
            >{{Interception(this.detailslList.检索信息页相关文件路径)}}</a>
          </li>
          <h4>论文正文</h4>
          <li>论文正文：</li>
          <li>
            <a :href="this.detailslList.论文正文路径">{{Interception(this.detailslList.论文正文路径)}}</a>
          </li>
          <h4>其他相关文件</h4>
          <li>其他相关文件：</li>
          <li>
            <a :href="this.detailslList.其他相关文件路径">{{Interception(this.detailslList.其他相关文件路径)}}</a>
          </li>
        </ul>
      </van-tab>
      <van-tab title="审核记录">
        <div v-if="auditRecords.length == 0" class="zanwu">
          <img src="../../../assets/images/nothing-3.png" alt>
        </div>
        <ul v-for="(item,key) in auditRecords" :key="key" v-else class="audit">
          <li>步骤名称：{{item.名称}}</li>
          <li>处理人：{{item.姓名}}</li>
          <li class="state">
            <span :style="{'color':(item.状态说明 == flag ? '#31BD5D' : '#FF976A')}">{{item.状态说明}}</span>
            <span>
              <i class="icon iconfont icon-shijian1"></i>
              {{item.执行时间}}
            </span>
          </li>
          <li>备注：{{item.备注}}</li>
        </ul>
      </van-tab>
      <ReturnBtn/>
    </van-tabs>
  </section>
</template>
<script>
import { NumFormat } from "@/assets/js/common/filter.js";
import { Interception } from "@/assets/js/common/filter.js";
export default {
  data() {
    return {
      active: 0,
      detailslList: [],
      relatedProjects: [],
      authorInformation: [],
      auditRecords: [],
      flag: "审核通过"
    };
  },
  created() {
    document.title = "论文详情";
  },
  mounted() {
    this.goDetails();
  },
  methods: {
    // 查看详情
    goDetails() {
      var para = {
        论文编号: this.$route.params.item
      };
      this.$http.getpaperDetails(para).then(res => {
        console.log(res, "sss");
        this.detailslList = res.data.论文详情;
        this.relatedProjects = res.data.成果项目;
        this.authorInformation = res.data.成果作者;
        this.auditRecords = res.data.审核情况;
      });
    },
    // 截取时间
    startTime(item) {
      if (item != null) {
        return item.slice(0, 10);
      } else {
        return;
      }
    },
    //转换金额格式
    NumFormat(item) {
      return NumFormat(item);
    },
    Interception(item) {
      return Interception(item);
    }
  }
};
</script>
<style lang="less" scoped>
.popup {
  text-align: left;
  .zanwu {
    display: flex;
    img {
      margin: 0 auto;
    }
  }
  .van-tab__pane {
    padding: 10px;
  }
  .audit,
  .servicel {
    font-size: 14px;
    padding: 10px;
    margin-bottom: 20px;
    border-bottom: 2px solid #ccc;
    background-color: #fff;
    h4 {
      margin: 5px 0;
      padding: 5px;
      color: #1296db;
      background-color: #e7e7e7;
    }
    li {
      padding: 5px 0;
      display: flex;
      p {
        font-size: 14px;
        margin: 0;
        width: 79%;
        justify-content: space-between;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
      }
      span {
        width: 50%;
        justify-content: space-between;
      }
      i {
        color: rgb(6, 167, 6);
      }
    }
  }
}
</style>
