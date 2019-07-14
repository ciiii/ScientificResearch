<template>
  <div class="rotation-box">
    <i class="iconfont iconshouqi"></i>
    <span class="background"></span>
    <div class="filter-container">
      <el-input v-model="req.Like姓名" placeholder="请输入学员姓名" class="filter-item"
                @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
    </div>
    <ul>
      <li v-for="(item,index) in students" :key="item.编号"
          @click="clickLi(index,item)">
        <a href="javascript:;">
          <span class="name">{{item.姓名}}
            <el-tag size="mini" type="warning" v-if="item.专业名称">{{item.专业名称}}</el-tag>
          </span>
          <span class="type">
            <el-tag size="mini">{{item.学员类型名称}}</el-tag>
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
        layout="total, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </div>
  </div>
</template>

<script>
  import { URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson } from '@/assets/js/Common';

  export default {
    name: '',
    props: ['selectArr'],
    data() {
      return {
        req: {
          Index: 1,
          Size: 10,
          OrderType: false,
          Like学员类型名称: '',
          是否启用: '',
          Like姓名: ''
        },
        students: [],
        newSelectStudents: [],
        total: 0,
        loading: false,
        index: '',
        item: {}
      };
    },
    mounted() {
      this.newSelectStudents = this.selectArr;
      this.getStudents();
    },
    methods: {
      getStudents: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_PAGING_ALL_STUDENT, this.req);
        if (data && data.list.length > 0) {
          this.students = data.list;
          this.total = data.total;
        } else {
          this.students = [];
        }
        this.loading = false;
      },
      remoteMethod(query) {
        if (query !== '') {
          this.loading = true;
          this.req.Like姓名 = query;
          this.getStudents();
        } else {
          this.req.Like姓名 = '';
          this.getStudents();
        }
      },
      clickLi(index, item) {
        this.index = index;
        this.item = item;
        this.$emit('myEvent', item);
      },
      onSearch() {
        this.req.Index = 1;
        this.getStudents();
      },
      changeSelect(arr) {
        this.$emit('myEvent', arr);
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
      },
      handleCurrentChange(val) {
        this.req.Index = val;
        this.getStudents();
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
        padding: 2px 10px;
        font-size: 13px;
        border-bottom: 1px solid #f1f1f1;
        display: flex;

        .name {
          flex: 2;
        }

        .type {
          flex: 1;
          text-align: right;
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
