<template>
  <el-row :gutter="20" class="panel-group" v-if="isLoad">
    <el-col :lg="6" class="card-panel-col" v-for="el in newArr" :key="el.分类">
      <div class="card-panel">
        <div class="card-panel-icon-wrapper" :class="getClass(el.分类)">
          <i class="iconfont" :class="getName(el.分类)"></i>
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            {{el.分类}}
          </div>
          <count-to :start-val="0" :end-val="el.数量" :duration="2600" class="card-panel-num"/>
          <span v-if="el.分类=='总完成率'">%</span>
          <span v-else>个</span>
        </div>
      </div>
    </el-col>
  </el-row>
</template>

<script>
  import CountTo from 'vue-count-to';

  export default {
    props: ['taskData','totalSuccess'],
    components: {
      CountTo
    },
    data() {
      return {
        itemWidth: null,
        typeTask: 0,
        isLoad: false,
        newArr: []
      };
    },
    mounted() {
      this.typeTask = this.taskData.规定技能类任务数量 + this.taskData.规定疾病类任务数量 + this.taskData.规定门诊类任务数量 + this.taskData.规定病房类任务数量 + this.taskData.规定医技类任务数量;
      let arr = [
        {
          分类: '轮转总数',
          数量: this.taskData.轮转总数
        },
        {
          分类: '任务数量',
          数量: this.typeTask
        },
        {
          分类: '已完成总数',
          数量: this.totalSuccess
        },
        {
          分类: '总完成率',
          数量: this.totalSuccess / this.typeTask * 100
        }
      ];
      this.newArr = arr;
      this.isLoad = true;
    },
    methods: {
      getName(type) {
        switch (type) {
          case '轮转总数':
            return 'iconliucheng';
          case '任务数量':
            return 'iconbumen';
          case '已完成总数':
            return 'iconyanshoutongguo';
          case '总完成率':
            return 'icon-type';
        }
      },
      getClass(type) {
        switch (type) {
          case '轮转总数':
            return 'icon-money';
          case '任务数量':
            return 'icon-total';
          case '已完成总数':
            return 'icon-shopping';
          case '总完成率':
            return 'icon-not';
        }
      },
      handleSetLineChartData(type) {
        this.$emit('handleSetLineChartData', type);
      }
    }
  };
</script>

<style lang="scss" scoped type="text/scss">
  .panel-group {
    margin-top: 18px;

    .card-panel-col {
      margin-bottom: 25px;
    }

    .card-panel {
      height: 108px;
      cursor: pointer;
      font-size: 12px;
      position: relative;
      overflow: hidden;
      color: #666;
      background: #fff;
      box-shadow: 4px 4px 40px rgba(0, 0, 0, .05);
      border-color: rgba(0, 0, 0, .05);

      &:hover {
        .card-panel-icon-wrapper {
          color: #fff;
        }

        .icon-total {
          background: #36a3f7;
        }

        .icon-people {
          background: #40c9c6;
        }

        .icon-message {
          background: #9b95c9;
        }

        .icon-not {
          background: #ffce7b;
        }

        .icon-money {
          background: #f4516c;
        }

        .icon-shopping {
          background: #2EC7C9
        }
      }

      .icon-total {
        color: #36a3f7;
      }

      .icon-people {
        color: #40c9c6;
      }

      .icon-message {
        color: #9b95c9
      }

      .icon-not {
        color: #ffce7b
      }

      .icon-money {
        color: #f4516c;
      }

      .icon-shopping {
        color: #2EC7C9
      }

      .card-panel-icon-wrapper {
        float: left;
        margin: 5px 0 0 14px;
        padding: 16px;
        transition: all 0.38s ease-out;
        border-radius: 6px;

        i {
          font-size: 55px;
        }
      }

      .card-panel-icon {
        float: left;
        font-size: 48px;
      }

      .card-panel-description {
        float: right;
        font-weight: bold;
        margin: 26px;
        margin-left: 0px;

        .card-panel-text {
          line-height: 18px;
          color: rgba(0, 0, 0, 0.45);
          font-size: 16px;
          margin-bottom: 12px;
        }

        .card-panel-num {
          font-size: 20px;
        }
      }
    }
  }

</style>
