<template>
  <van-pull-refresh v-model="isDownLoading"
                    @refresh="onDownRefresh">
    <van-list v-model="loading"
              :finished="finished"
              finished-text="没有更多了"
              @load="onLoad"
              class="box">
      <div class="backlogBox">
        <div class="backlog">
          <span>
            <i class="icon iconfont iconxueyuanliebiao-copy"></i>
            <span>带教学员情况查询</span>
          </span>
        </div>
        <div class="backContentBox"
             v-for="(item,key) in 5"
             :key='key'>
          <div class="bacnButtom">
            <h3 @click="studentDetails()">赵云</h3>
            <ul @click="goDetails()">
              <li>
                <span>规培专业：</span>
                <span>内科</span>
              </li>
              <li>
                <span>轮转总科室数：</span>
                <span><i>0</i> / <i>5</i></span>
              </li>
              <li>
                <span>总轮转时间：</span>
                <span><i>426</i> / <i>457</i></span>
              </li>
              <li>
                <span>入科时间：</span>
                <span>2018-03-09</span>
              </li>
              <li>
                <span>科室时间：</span>
                <span id="currentState"><i>426</i> / <i>62</i></span>
              </li>
            </ul>
            <div class="requirements">
              <span @click="requirements()">任务要求</span>
            </div>
          </div>
        </div>
      </div>
    </van-list>
  </van-pull-refresh>
</template>
<script>
import { setTimeout } from 'timers'
export default {
  inject: ['reload'],
  data () {
    return {
      list: [],
      index: 1,
      size: 5,
      total: 0,
      isDownLoading: false,
      loading: false,
      finished: false
    }
  },
  created () {

  },
  mounted () {

  },
  methods: {
    onDownRefresh () {
      console.log('下拉刷新')
      setTimeout(() => {
        this.reload()
        this.isDownLoading = false
      }, 1000)
    },
    onLoad () {
      console.log('上拉加载更多')
      setTimeout(() => {
        this.loading = false
        this.finished = true
      }, 1000)
    },
    goDetails () {
      console.log('查看培训详情')
    },
    requirements () {
      console.log('查看任务要求')
    },
    studentDetails () {
      console.log('查看学员详情')
      this.$router.push('/studentInformation')
    }
  }
}
</script>
<style lang="less" scoped>
.backlogBox {
  padding: 10px;
  background-color: #fff;
  .backlog {
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    margin-bottom: 10px;
    span {
      padding: 5px 0;
      .iconxueyuanliebiao-copy {
        padding-right: 8px;
        color: rgb(25, 186, 235);
      }
    }
  }
  .backContentBox {
    padding: 10px 15px;
    border: 1px dashed #ccc;
    // background-color: #fff;
    box-shadow: 6px 6px 6px #ccc;
    margin-bottom: 20px;
    .bacnButtom {
      position: relative;
      h3 {
        text-align: left;
        font-size: 14px;
        padding: 4px 0;
        margin: 0;
        color: #1296db;
      }
      li {
        display: flex;
        font-size: 14px;
        padding: 4px 0;
        span:nth-child(1) {
          color: #888;
        }
        span:nth-child(2) {
          color: #5a5a5a;
        }
        #currentState {
          color: #ed1941;
        }
        i {
          font-style: normal;
        }
      }
      .requirements {
        position: absolute;
        right: 0;
        bottom: 10px;
        span {
          // display: inline-block;
          font-size: 14px;
          padding: 8px;
          background-color: #07c160;
          border-radius: 5px;
          color: #fff;
        }
      }
    }
  }
}
</style>
