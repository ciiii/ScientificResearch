<template>
  <div class="item-box" v-if="isLoad">
    <h5 class="title">审核记录（{{userName}}）</h5>
    <el-timeline>
      <el-timeline-item :timestamp="item.OperatorDatetime" placement="top"
                        v-for="(item,$index) in list" :key="$index" :color="getColor($index)"
                        :icon="getIcon($index)" size="large">
        <el-card>
          <h4>{{item.StepTemplateName}}</h4>
          <p v-if="item.OperatorDatetime">{{item.OpeartorInfo}}【{{item.OperatorType}}】 提交于
            {{item.OperatorDatetime}}</p>
          <el-tag :type="item.StateName|operatorState" size="small">{{item.StateName}}</el-tag>
        </el-card>
      </el-timeline-item>
    </el-timeline>
  </div>
</template>

<script>
  import { URL_WORK_FLOW } from '@/assets/js/connect/ConSysUrl';

  export default {
    name: 'auditRecord',
    props: ['flowId', 'userName'],
    data() {
      return {
        isLoad: false,
        req: {
          流程编号: ''
        },
        list: []
      };
    },
    mounted() {
      this.req.流程编号 = this.flowId;
      this.getRecord();

    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent');
      },
      getRecord: async function() {
        let data = await this.$http.myGet(URL_WORK_FLOW.GET_WORK_FLOW_RECORD, this.req);
        if (data && data.length > 0) {
          this.list = data.reverse();
        }
        this.isLoad = true;
      },
      getColor(index) {
        if (index == 0) {
          return '#409EFF';
        }
      },
      getIcon(index) {
        if (index == 0) {
          return 'el-icon-location';
        }
      },
      getStates(state) {
        switch (state) {
          case '未入科':
            return 'warning';
          case '在科':
            return 'success';
          case '已出科':
            return 'primary';
        }
      },
      getOperatorStates(state) {
        switch (state) {
          case '待完善':
            return '';
          case '待医审核':
            return 'warning';
          case '待审核':
            return 'warning';
          case '审核通过':
            return 'success';
          case '审核不通过':
            return 'danger';
          case '作废':
            return 'danger';
        }
      }
    }
  };
</script>

<style type="text/scss" lang="scss">
.el-timeline-item__node{
  i{
    font-size: 12px;
  }
}

</style>
