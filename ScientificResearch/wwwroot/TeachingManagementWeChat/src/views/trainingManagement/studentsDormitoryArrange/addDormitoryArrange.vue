<template>
  <!-- <div>
    <van-list v-model="loading"
              :finished="finished"
              finished-text="没有更多了"
              @load="onLoad"
              class="box">
      <ul>
        <van-checkbox v-model="item.checked"></van-checkbox>
      <li class="checked-item"
          @click="singleSelect(row, index)"
          v-for="(row, index) in goods"
          :key="row.id">
        <input type="checkbox"
               :checked="row.checked" />{{row.name}}
      </li>
    </ul>
    <div>
      <span @click="allSelect">
        <input type="checkbox"
               :checked="isAllSelected" />
        <button>全选</button>
      </span>
      <span class="checked-count"
            v-if="checkedGoodIds.length > 0">已选择：{{checkedGoodIds.length}}项</span>
    </div>
      <div>
      <span>
        <van-checkbox v-model="isAllSelected"></van-checkbox>
        <button>全选</button>
      </span>
      <span class="checked-count"
            v-if="checkedGoodIds.length > 0">已选择：{{checkedGoodIds.length}}项</span>
    </div>

      <div class="backlogBox">
        <div class="backlog">
          <span>
            <i class="icon iconfont iconxueyuanliebiao-copy"></i>
            <span>宿舍安排</span>
          </span>
        </div>
        <div class="backContentBox"
             v-for="item of list"
             :key='item.编号'>
          <van-checkbox class="checked"
                        v-model="item.checked"></van-checkbox>
          <div class="bacnButtom">
            <ul>
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
          </div>
        </div>
      </div>
    </van-list>
  </div> -->
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
              <span>宿舍安排</span>
            </span>
          </div>
          <div class="backContentBox"
               v-for="item of list"
               :key='item.编号'>
            <div class="bacnButtom">
              <van-checkbox v-model="item.checked"></van-checkbox>
              <ul>
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
            </div>
          </div>
        </div>
      </van-list>
    </van-pull-refresh>
    <ReturnBtn />
  </div>
</template>
<script>
export default {
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
  computed: {
    // 是否全选
    isAllSelected () {
      return this.goods.every((el) => {
        return el.checked
      })
    },
    // 选中商品的id
    checkedGoodIds () {
      let filterArr = this.goods.filter((el) => {
        return el.checked
      })
      return filterArr.map((el) => {
        return el.id
      })
    }
  },
  mounted () {

  },
  methods: {
    async onLoad () {
      var para = {
        index: this.index,
        size: this.size
        // 是否已安排宿舍: false
      }
      let res = await this.$http.getDormitoryarrange(para)
      // console.log(res, '6666')
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
    allSelect () {
      let checked = true
      // 全选
      if (this.isAllSelected) {
        checked = false
      }
      this.goods = this.goods.map(el => {
        el.checked = checked
        return el
      })
    },
    // 单选
    singleSelect (row, index) {
      row.checked = !row.checked
      this.goods.splice(index, 1, row)
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  text-align: left;
  background-color: #f5f3fb;
  .backlogBox {
    padding: 10px;
    .backlog {
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
      border-radius: 10px;
      box-shadow: 6px 6px 6px #ccc;
      margin-bottom: 20px;
      .bacnButtom {
        display: flex;
        .van-checkbox {
          padding-right: 10px;
          margin-top: 4px;
        }
        ul {
          width: 100%;
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
        }
      }
    }
  }
}
</style>
