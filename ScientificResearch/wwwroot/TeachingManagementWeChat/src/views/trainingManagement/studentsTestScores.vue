<template>
  <div>
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
              <span>学员考试成绩</span>
            </span>
          </div>
          <div class="backContentBox"
               v-for="(item,key) in 5"
               :key='key'>
            <div class="bacnButtom">
              <ul @click="goDetails(item.编号)">
                <li>学员姓名</li>
                <li>
                  <span>登录号码：</span>
                  <span>{{item.工号}}</span>
                </li>
                <li>
                  <span>专业方向：</span>
                  <span>内科</span>
                </li>
                <li>
                  <span>考试类型：</span>
                  <span>理论</span>
                </li>
                <li>
                  <span>考试时间：</span>
                  <span>2019-02-4</span>
                </li>
                <li>
                  <span>考试名称：</span>
                  <span>理论考试</span>
                </li>
                <li>
                  <span>试卷名称：</span>
                  <span>理论考试试卷</span>
                </li>
                <li>
                  <span>所属科室：</span>
                  <span>呼吸内科</span>
                </li>
                <li>
                  <span>成绩：</span>
                  <span>86.00</span>
                </li>
                <li>
                  <span>是否合格：</span>
                  <span>是</span>
                </li>
                <li>
                  <span>答卷：</span>
                  <span>查看</span>
                </li>
              </ul>
              <div class="requirements">
                <span @click="requirements()">修改</span>
              </div>
            </div>
          </div>
        </div>
      </van-list>
    </van-pull-refresh>
    <ReturnBtn />
    <ReturnTop />
  </div>
</template>
<script>
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
  methods: {
    async onLoad () {
      // var para = {
      //   index: this.index,
      //   size: this.size
      // }
      // let res = await this.$http.getStudents(para)
      // this.total = res.data.total
      // const data = this.list
      // this.list = data.concat(res.data.list)
      // this.loading = false
      // this.index++
      // if (this.list.length >= this.total) {
      //   this.finished = true
      // }
    },
    onDownRefresh () {
      setTimeout(() => {
        this.reload()
        this.isDownLoading = false
      }, 1000)
    },
    goDetails (item) {
      this.$router.push({
        path: '/studentInformation',
        nmae: 'studentInformation',
        params: {
          item
        }
      })
    },
    requirements () {
      console.log('修改退培')
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  // padding: 12px;
  text-align: left;
  background-color: #f5f3fb;
  .backlogBox {
    padding: 10px;
    // background-color: #fff;
    .backlog {
      display: flex;
      justify-content: space-between;
      font-size: 14px;
      margin-bottom: 10px;
      border-bottom: 2px solid rgb(25, 186, 235);
      span {
        padding: 5px 0;
        .iconxueyuanliebiao-copy {
          padding-right: 8px;
          color: rgb(25, 186, 235);
        }
      }
    }
    .backContentBox {
      background-color: #fff;
      padding: 10px 15px;
      // border: 1px dashed #ccc;
      border-radius: 10px;
      box-shadow: 6px 6px 6px #ccc;
      margin-bottom: 20px;
      .bacnButtom {
        position: relative;
        li:nth-child(1) {
          font-weight: 800;
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
        }
        .requirements {
          position: absolute;
          right: 0;
          bottom: 10px;
          span {
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
}
</style>
