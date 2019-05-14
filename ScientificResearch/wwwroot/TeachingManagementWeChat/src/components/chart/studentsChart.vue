<template>
  <div class="box">
    <div class="backlog">
      <i class="icon iconfont iconxueyuanliebiao-copy"></i>
      <span>全院规培学员情况</span>
    </div>
    <ve-line :data="chartData"
             height='300px'></ve-line>
  </div>
</template>
<script>
export default {
  data () {
    return {
      chartData: {
        columns: ['年度', '招生人数', '平均值'],
        rows: [
          { '年度': '2015', '招生人数': 10, '平均值': 161.2 },
          { '年度': '2016', '招生人数': 33, '平均值': 161.2 },
          { '年度': '2017', '招生人数': 57, '平均值': 161.2 },
          { '年度': '2018', '招生人数': 617, '平均值': 161.2 },
          { '年度': '2019', '招生人数': 89, '平均值': 161.2 }
        ]
      }
    }
  }
}
</script>
<style lang="less" scoped>
.box {
  padding: 10px;
  background-color: #fff;
  text-align: left;
  .backlog {
    padding: 5px 0;
    background-color: #f4f4f4;
    font-size: 14px;
    .iconxueyuanliebiao-copy {
      padding-right: 8px;
      color: rgb(25, 186, 235);
    }
    span {
      padding: 5px 0;
    }
  }
}
</style>
