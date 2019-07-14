<template>
  <el-card class="box-card-component" style="margin-left:8px;">
    <div slot="header" class="box-card-header">
      <img src="@/assets/images/e.jpg">
    </div>
    <div style="position:relative;" v-if="isLoad">
      <pan-thumb image="src/assets/images/user.gif" class="panThumb"/>
      <mallki class-name="mallki-text" :text="'轮转统计（'+this.total+'）'"/>
      <div :style="$index==0?'padding-top:35px;':''" class="progress-item" v-for="(el,$index) in chartData"
           :key="el.分类">
        <span>{{el.分类}}</span>
        <el-progress :percentage="getNumber(el.数量)" :color="getColor(el.分类)"></el-progress>
      </div>
    </div>
  </el-card>
</template>

<script>
  import { URL_STATISTICS, mapGetters } from 'vuex';
  import PanThumb from '@/components/PanThumb';
  import Mallki from '@/components/TextHoverEffect/Mallki';

  export default {
    components: { PanThumb, Mallki },
    props: ['chartData'],
    filters: {
      statusFilter(status) {
        const statusMap = {
          success: 'success',
          pending: 'danger'
        };
        return statusMap[status];
      }
    },
    data() {
      return {
        statisticsData: {
          article_count: 1024,
          pageviews_count: 1024
        },
        total: 0,
        isLoad: false
      };
    },
    mounted() {
      this.chartData.forEach((item) => {
        this.total += item.数量;
      });
      this.isLoad = true;
    },
    computed: {
      ...mapGetters([
        'name',
        'avatar',
        'roles'
      ])
    },
    methods: {
      getNumber(value) {
        let number = Math.round(value / this.total * 100);
        if (number) {
          return number;
        } else {
          return 0;
        }
      },
      getColor(type) {
        switch (type) {
          case '未入科':
            return '';
          case '已出科':
            return '#f4516c';
          case '在科':
            return '#40c9c6';
        }
      }
    }
  };
</script>

<style lang="scss" type="text/scss">
  .box-card-component {
    .el-card__header {
      padding: 0px !important;
    }
  }
</style>
<style lang="scss" scoped type="text/scss">
  .box-card-component {
    .box-card-header {
      position: relative;
      height: 220px;

      img {
        width: 100%;
        height: 100%;
        transition: all 0.2s linear;

        &:hover {
          transform: scale(1.1, 1.1);
          filter: contrast(130%);
        }
      }
    }

    .mallki-text {
      position: absolute;
      top: 0px;
      right: 0px;
      font-size: 18px;
      font-weight: bold;
      /*color: #38acf0;*/
    }

    .panThumb {
      z-index: 100;
      height: 70px !important;
      width: 70px !important;
      position: absolute !important;
      top: -45px;
      left: 0px;
      border: 5px solid #ffffff;
      background-color: #fff;
      margin: auto;
      box-shadow: none !important;

      /deep/ .pan-info {
        box-shadow: none !important;
      }
    }

    .progress-item {
      margin-bottom: 10px;
      font-size: 14px;
    }

    @media only screen and (max-width: 1510px) {
      .mallki-text {
        display: none;
      }
    }
  }
</style>
