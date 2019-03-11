<template>
  <div class="box">
    <div class="title">
      <i class="icon iconfont icon-xuexi"></i> 科研管理 - 学术活动
    </div>
    <van-cell-group>
      <van-cell @click="applyFor" title="主办讲座" is-link icon="flag-o"/>
      <van-cell @click="attend" title="参会信息" is-link icon="records"/>
    </van-cell-group>
    <!-- <div class="contentBox">
      <h3>学术活动</h3>
      <ul class="content">
        <li @click="applyFor">
          <div>
            <i class="icon iconfont icon-daiban1"></i>主办讲座
          </div>
        </li>
        <li @click="attend">
          <div>
            <i class="icon iconfont icon-daiban1"></i>参会信息
          </div>
        </li>
      </ul>
    </div> -->
    <!-- <van-tabs @click="onClick" v-model="active">
      <van-tab title="主办讲座">
        <div class="backContentButtom" v-for="(item,key) in lectureList" :key="key">
          <ul>
            <li>{{item.项目名称}}</li>
            <li>{{item.发起人姓名}}</li>
            <li>
              <span class="currentState">{{item.状态名称}}</span>
              <span class="stepState">{{item.步骤状态说明}}</span>
            </li>
            <li>{{item.步骤名称}} - {{item.步骤状态说明}}</li>
          </ul>
          <div class="auditBtn" @click="review">
            <span>复核</span>
          </div>
        </div>
      </van-tab>
      <van-tab title="参会信息">参会信息</van-tab>
    </van-tabs> -->
    <navFooter/>
  </div>
</template>
<script>
import navFooter from "@/../src/components/footer/footer";
export default {
  components: {
    navFooter
  },
  data() {
    return {
      // active: 0,
      
    };
  },
  created() {
    document.title = "科研管理 - 活动";
  },
  mounted() {},
  methods: {
    
    applyFor() {
      this.$router.push("/lecture");
      console.log("申请学术讲座");
    },
    attend() {
      console.log("参加学术讲座");
    }
  }
};
</script>
<style lang="less" scoped>
.box {
  text-align: left;
  padding: 10px;
  // background-color: #f5f3fb;
  .title {
    font-size: 14px;
    padding: 10px 15px;
    i {
      font-weight: 800;
      color: #d4237a;
    }
  }
  // .contentBox {
  //   padding: 10px;
  //   border: 1px dashed #ccc;
  //   h3 {
  //     margin: 0 0 10px 0;
  //     padding: 5px 10px;
  //     font-size: 14px;
  //     background-color: #f5f3fb;
  //   }
  //   .content {
  //     font-size: 14px;
  //     display: flex;
  //     justify-content: space-between;
  //     li {
  //       width: 45%;
  //       div {
  //         padding: 20px 5px;
  //         border: 1px solid #ccc;
  //         border-radius: 10px;
  //         background-color: aqua;
  //       }
  //     }
  //   }
  // }
}
</style>
