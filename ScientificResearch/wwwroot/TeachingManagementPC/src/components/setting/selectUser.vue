<template>
  <div class="rotation-box">
    <i class="iconfont iconshouqi"></i>
    <span class="background"></span>
    <div class="filter-container">
      <el-input v-model="req.LikeAllName" placeholder="请输入姓名" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
    </div>
    <ul>
      <li v-for="(item) in users" :key="item.编号"
          @click="clickLi(item)">
        <a href="javascript:;">
          <span class="name">{{item.姓名}}</span>
          <span class="type">
            <el-tag size="mini" v-if="item.部门名称">{{item.部门名称}}</el-tag>
          </span>
        </a>
      </li>
    </ul>
    <div class="block paging">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page.sync="req.Index"
        :page-size="req.Size" background
        layout="total,prev, pager, next"
        :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import { URL_USER } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson } from '@/assets/js/Common';

  export default {
    name: '',
    props: ['number'],
    data() {
      return {
        req: {
          Index: 1,
          Size: 10,
          OrderType: false,
          部门编号: '',
          LikeAllName: ''
        },
        users: [],
        total: 0,
        id: '',
        index: ''
      };
    },
    mounted() {
      this.id = this.number;
      this.getUser();
    },
    methods: {
      getUser: async function() {
        let data = await this.$http.myGet(URL_USER.GET_ENABLE_PAGING_ALL_USER, this.req);
        console.info(data);
        if (data && data.list.length > 0) {
          this.users = data.list;
          this.total = data.total;
        } else {
          this.users = [];
        }
      },
      onSearch() {
        this.req.Index = 1;
        this.getUser();
      },
      clickLi(item) {
        this.$emit('myEvent', item);
      },
      changeSelect(val) {
        this.$emit('myEvent', val);
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getUser();
      }
    }
  };
</script>

<style scoped type="text/scss" lang="scss">
  @import "@/assets/scss/Variable.scss";

  ::-webkit-scrollbar {
    display: none
  }

  .rotation-box {
    width: 90%;
    margin: 10px 0;
    height: 400px;
    border-radius: 5px;
    position: absolute;
    left: 0;
    top: 35px;
    border: 1px solid $border;
    background: #fff;
    z-index: 9;

    .iconshouqi {
      position: absolute;
      left: 50%;
      top: -20px;
      margin-left: -8px;
      color: $border;
      z-index: 10;
    }

    span.background {
      background: #fff;
      display: inline-block;
      height: 16px;
      width: 10px;
      position: absolute;
      left: 50%;
      margin-left: -5px;
      top: -10px;
    }
    .filter-container{
      background: none;
      padding: 10px;
      .filter-item{
        margin: 0;
      }
    }
    ul {
      padding: 0 10px;
      margin: 0;
      height: 300px;
      overflow-y: scroll;
    }

    li {
      border-radius: 5px;
      overflow: hidden;
      border: 1px solid #fff;

      a {
        display: block;
        padding: 0 10px;
        font-size: 13px;
        display: flex;

        .name {
          flex: 2;
          display: block;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }

        .type {
          flex: 1;
          text-align: right;
          display: block;
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
        }
      }

      &:hover {
        background: #f0f3f9;
        box-shadow: 0 1px 4px rgba(0, 21, 41, .08);
        border: 1px solid #e9edf7;

        a {
          color: $colorActive;
        }
      }
    }

    .paging {
      margin-top: 0;
    }
  }
</style>
