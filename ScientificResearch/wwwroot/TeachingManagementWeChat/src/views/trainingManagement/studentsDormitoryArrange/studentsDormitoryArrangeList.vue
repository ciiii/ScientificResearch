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
              <span>学员宿舍安排</span>
            </span>
            <van-button @click="arrangeDormitory"
                        plain
                        hairline
                        size="small"
                        type="primary">安排宿舍</van-button>
          </div>
          <div class="backContentBox"
               v-for="item of list"
               :key='item.编号'>
            <div class="bacnButtom">
              <ul @click="requirements(item)">
                <li>{{item.姓名}}</li>
                <li>
                  <span>登录号码：</span>
                  <span>???</span>
                </li>
                <li>
                  <span>联系方式：</span>
                  <span>{{item.手机号码}}</span>
                </li>
                <li>
                  <span>培训专业：</span>
                  <span>{{item.专业名称}}</span>
                </li>
                <li>
                  <span>楼栋名称：</span>
                  <span>{{item.宿舍楼名称}}</span>
                </li>
                <li>
                  <span>门牌号及床号：</span>
                  <span>{{item.门牌号及床号}}</span>
                </li>
                <li>
                  <span>入住时间：</span>
                  <span>{{item.入住日期}}</span>
                </li>
                <li>
                  <span>退出时间：</span>
                  <span>{{item.退出日期}}</span>
                </li>
                <li>
                  <span>职务：</span>
                  <span>{{item.职位}}</span>
                </li>
              </ul>
              <!-- <div class="requirements">
                <span @click="requirements()">修 改</span>
              </div> -->
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
      size: 15,
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
        size: this.size,
        是否已安排宿舍: false
      }
      let res = await this.$http.getDormitoryarrange(para)
      console.log(res, '6666')
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
    arrangeDormitory () {
      this.$toast('安排宿舍')
    },
    requirements (item) {
      this.$router.push({
        path: '/ModifyDormitoryArrange',
        name: 'ModifyDormitoryArrange',
        params: {
          item
        }
      })
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  // padding: 12px 0;
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
      padding-bottom: 2px;
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
        // .requirements {
        //   position: absolute;
        //   right: 0;
        //   bottom: 10px;
        //   span {
        //     font-size: 14px;
        //     padding: 8px;
        //     background-color: #07c160;
        //     border-radius: 5px;
        //     color: #fff;
        //   }
        // }
      }
    }
  }
}
</style>
