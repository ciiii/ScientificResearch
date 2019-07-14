<template>
  <div v-if="isLoad" style="height: 385px" class="page-common">
    <h4 class="item-title">
      <i class="iconfont iconhangzhenggonggao" style="color: #ffbe42"></i> 通知公告
      <a class="more" href="javascript:;" @click="clickMore" v-if="list.length>5">
        更多 <i class="iconfont icongengduo_"></i>
      </a>
    </h4>
    <ul class="list">
      <li v-for="(el,$index) in list" :key="el.编号" @click="btnDetails(el)">
        <a href="javascript:;">
          <span class="title"><span class="type">{{el.通知类型}}</span>{{el.通知名称}}</span>
          <span class="time">{{el.建立时间}}<i class="iconfont iconright"></i></span>
        </a>
      </li>
    </ul>
    <div class="block paging" v-if="list.length>0">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page.sync="req.Index"
        :page-size="req.Size" background
        layout="total, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
    <div class="not-content" v-if="isLoad&&list.length==0"><img src="../../../assets/images/nothing.png"></div>
  </div>
</template>

<script>
  import { URL_HOME } from '@/assets/js/connect/ConSysUrl';

  export default {
    data() {
      return {
        list: [],
        req: {
          Index: 1,
          Size: 6,
          OrderType: false,
          是否已接收: '',
          是否必读: '',
          是否启用: true,
          通知类型: '',
          Like通知内容: '',
          Like发送人姓名: ''
        },
        isDialog: false,
        isAdd: false,
        item: {},
        types: [],
        total: 0,
        isLoad: false
      };
    },
    mounted() {
      this.isLoad = true;
      this.getList();
    },
    methods: {
      getList: async function() {
        let data = await this.$http.myGet(URL_HOME.GET_PAGING_NOTICE, this.req);
        if (data && data.list.length > 0) {
          this.total = data.total;
          data = data.list;
          this.list = data;
        } else {
          this.list = [];
        }
        this.isLoad = true;
      },
      btnDetails(item) {
        sessionStorage.setItem('item', JSON.stringify(item));
        this.$router.push({ path: '/noticeDetails' });
      },
      clickMore() {
        this.$router.push({ path: '/myNoticeList' });
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getList();
      }
    }
  };
</script>

<style scoped type="text/scss" lang="scss">
  @import "@/assets/scss/Variable.scss";
  .item-title {
    font-size: 18px;
    color: #4d4d4d;
    margin: 0;
    padding: 5px;
    position: relative;
    background: #fafafa;

    i {
      font-size: 20px;
      margin-right: 5px;
    }

    .more {
      position: absolute;
      right: 20px;
      top: 10px;
      font-size: 14px;
      color: #888;

      i {
        color: #888;
        font-size: 14px;
      }

      &:hover {
        color: $colorActive;

        i {
          color: $colorActive;;
        }
      }
    }
  }
  .list {
    padding: 0 10px;
    margin-top: 10px;

    li {
      margin-bottom: 8px;
      height: 36px;
      line-height: 36px;
      font-size: 13px;
      color: #606266;

      a {
        position: relative;
        border-bottom: 1px solid #f2f1f1;
        display: flex;

        .time {
          width: 200px;
          text-align: right;

          i {
            margin-left: 10px;
            margin-right: 5px;
          }
        }

        .title {
          display: inline-block;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          flex: 1;

          i {
            color: #ccc;
            margin-right: 5px;
            float: left;
          }

          .type {
            background: url("../../../assets/images/type-bg.png");
            background-size: 97px 35px;
            display: inline-block;
            width: 97px;
            height: 35px;
            color: #fff;
            font-size: 14px;
            padding-left: 20px;
            margin-right: 5px;
          }
        }
      }

      &:hover {
        a {
          color: $colorActive;
        }
      }
    }
    .not-received {
      .title {
        color: $colorActive;
        font-weight: bold;
      }

      .btn-icon {
        color: #f58220;
      }
    }
  }

  .paging {
    position: absolute;
    right: 0;
    bottom: 25px;
  }
</style>
