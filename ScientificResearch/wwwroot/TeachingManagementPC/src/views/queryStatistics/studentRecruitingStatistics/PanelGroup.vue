<template>
  <el-row :gutter="20" class="panel-group" v-if="isLoad">
    <el-col :lg="4" class="card-panel-col" v-for="el in chartData" :key="el.分类">
      <div class="card-panel">
        <div class="card-panel-icon-wrapper" :class="getClass(el.分类)">
          <i class="iconfont" :class="getName(el.分类)"></i>
        </div>
        <div class="card-panel-description">
          <div class="card-panel-text">
            {{el.分类}}
          </div>
          <count-to :start-val="0" :end-val="el.数量" :duration="2600" class="card-panel-num"/>
          <span>人</span>
        </div>
      </div>
    </el-col>
  </el-row>
</template>

<script>
  import CountTo from 'vue-count-to';

  export default {
    props: ['chartData'],
    components: {
      CountTo
    },
    data() {
      return {
        itemWidth: null,
        isLoad: false,
        total: 0
      };
    },
    mounted() {
      let dataLength = this.chartData.length;
      this.itemWidth = 24 / dataLength;
      this.chartData.forEach((item) => {
        this.total += item.数量;
      });
      let data = {
        分类: '总人数',
        数量: this.total
      };
      this.chartData.unshift(data);
      this.isLoad = true;
    },
    methods: {
      getName(type) {
        switch (type) {
          case '总人数':
            return 'iconbumenrenyuanguanli';
          case '结业':
            return 'iconboshimao';
          case '轮转计划已安排':
            return 'iconliucheng';
          case '退培':
            return 'icontuichu3';
          case '未报到':
            return 'iconicon1';
            case '已报到':
            return 'iconicon1';
          case '在培':
            return 'iconicon-edit';
        }
      },
      getClass(type) {
        switch (type) {
          case '总人数':
            return 'icon-total';
          case '结业':
            return 'icon-shopping';
          case '轮转计划已安排':
            return 'icon-message';
          case '退培':
            return 'icon-money';
          case '未报到':
            return 'icon-not';
            case '已报到':
            return 'icon-not';
          case '在培':
            return 'icon-people';
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
          background: #45b97c
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
        color: #45b97c
      }

      .card-panel-icon-wrapper {
        float: left;
        margin: 10px 0 0 14px;
        padding: 16px;
        transition: all 0.38s ease-out;
        border-radius: 6px;

        .svg-icon {
          width: 1.2em;
          height: 1.2em;
        }

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
