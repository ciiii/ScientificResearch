<template>
  <div>
    <van-pull-refresh v-model="isDownLoading"
                      @refresh="onDownRefresh">
      <van-list v-model="loading"
                :finished="finished"
                offset:10
                finished-text="没有更多了"
                @load="onLoad"
                class="box">
        <div class="title">
          <i class="icon iconfont iconxiazaiguanli"></i>下载信息
        </div>
        <ul @click="newsDetails(item)"
            class="A_News"
            v-for="(item, key) in list"
            :key="key">
          <li>
            <p>【{{item.文件类型}}】{{item.文件名称}}</p>
          </li>
          <li><span>文件状态</span><span>{{conversionStateB(item.是否启用)}}</span></li>
          <li><span>发布人</span><span>{{item.上传人姓名}}</span></li>
          <li><span>发布人部门</span><span>{{item.上传人部门名称}}</span></li>
          <li>
            <span>发布时间</span>
            <span>{{item.建立时间}}</span>
          </li>
          <li><span>文件说明</span><span>{{item.备注}}</span></li>
        </ul>
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
      loading: false, // 是否处于加载状态
      finished: false, // 是否已加载完所有数据
      index: 1,
      size: 15,
      total: 0,
      isDownLoading: false,
      list: []
    }
  },
  methods: {
    async onLoad () {
      var para = {
        index: this.index,
        size: this.size
      }
      let res = await this.$http.getDownload(para)
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
    newsDetails (item) {
      this.$router.push({
        path: '/downloadDetails',
        name: 'downloadDetails',
        params: {
          item
        }
      })
    },
    conversionStateB (item) {
      return item === true ? '正常' : item === false ? '未启用' : ''
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  text-align: left;
  padding: 10px;
  .title {
    font-size: 14px;
    padding: 10px;
    background-color: #fff;
    i {
      font-weight: 800;
      color: #ffa031;
      margin-right: 5px;
    }
  }
  .A_News {
    background-color: #fff;
    border: 1px dashed #ccc;
    padding: 10px 15px;
    margin: 10px 0;
    font-size: 14px;
    box-shadow: 6px 6px 6px #ccc;
    li {
      display: flex;
      justify-content: space-between;
      padding: 4px 0;
      span:nth-child(1) {
        color: #888;
      }
      span:nth-child(2) {
        color: #5a5a5a;
      }
    }
    li:nth-child(1) {
      overflow: hidden;
      -webkit-line-clamp: 2;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      max-height: 40px;
      color: #1296db;
      p {
        margin: 0;
        line-height: 1.6;
      }
    }
  }
}
</style>
