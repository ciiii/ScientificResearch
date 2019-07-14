<template>
  <div class="details flow-path-details">
    <div class="content-box">
      <div class="steps-box">
        <el-steps direction="vertical" :space="250" >
          <el-step :title="item.Name" v-for="(item,$index) in list" :key="$index"
                   :description="item.可操作人+'（'+item.可用操作+'）'"></el-step>
        </el-steps>
      </div>
    </div>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">关 闭</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_PERMISSION } from '@/assets/js/connect/ConSysUrl'

  export default {
    name: 'ServiceDetails',
    props: ['item'],
    data() {
      return {
        list: []
      }
    },
    mounted() {
      this.getList()
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      getList: async function() {
        let postData = {
          办事流程编号: this.item.Id
        }
        let data = await this.$http.myGet(URL_PERMISSION.GET_LOW_PATH_DETAILS, postData)
        if (data && data.length > 0) {
          this.list = data
        } else {
          this.list = []
        }
      }
    }
  }
</script>
<style type="text/scss" lang="scss">
  @import "src/assets/scss/Variable";
  .flow-path-details {
    .el-step__title.is-wait {
      color: #333;
    }

    .el-step__description.is-wait {
      color: #666;
    }
  }
</style>

