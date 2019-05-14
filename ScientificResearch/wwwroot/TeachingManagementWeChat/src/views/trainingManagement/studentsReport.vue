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
            <span>学员报到</span>
          </span>
        </div>
        <div class="backContentBox"
             v-for="(item,key) in list"
             :key='key'>
          <div class="bacnButtom">
            <ul @click="goDetails(item.编号)">
              <li>{{item.姓名}}</li>
              <li>
                <span>登录号码：</span>
                <span>{{item.工号}}</span>
              </li>
              <li>
                <span>学员类型：</span>
                <span>{{item.学员类型名称}}</span>
              </li>
              <li>
                <span>规培专业：</span>
                <span>{{item.专业名称}}</span>
              </li>
              <li>
                <span>责任导师：</span>
                <span>????</span>
              </li>
              <li>
                <span>计划开始培训时间：</span>
                <span>????</span>
              </li>
            </ul>
            <div class="requirements">
              <span @click="requirements()">修改导师</span>
            </div>
          </div>
        </div>
      </div>
    </van-list>
  </van-pull-refresh>
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
      var para = {
        index: this.index,
        size: this.size
      }
      let res = await this.$http.getStudents(para)
      this.total = res.data.total
      const data = this.list
      this.list = data.concat(res.data.list)
      this.loading = false
      this.index++
      if (this.list.length >= this.total) {
        this.finished = true
      }
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
      console.log('修改责任导师')
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  padding: 12px;
  text-align: left;
  background-color: #f5f3fb;
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
