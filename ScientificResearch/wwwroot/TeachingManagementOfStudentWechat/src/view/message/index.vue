<template>
  <div>
    <van-cell-group>
      <van-cell v-for="item in list" :title="item.值" :key="item.编号" icon="chat-o" is-link :to="'/message/list?type='+item.编号+'&name='+item.值"></van-cell>     
    </van-cell-group>
  
  </div>
</template>
<script>
import { Row, Col, Icon, Cell, CellGroup } from "vant";
import{GetDictionaryByType} from '@/api/systemSetting';


export default {
  components: {
    Row,
    Col,
    Icon,
    Cell,
    CellGroup
  
   
  },
  data() {
    return {
      list:[]
    };
  },
  mounted(){
      let type='通知类型';
      GetDictionaryByType({type}).then(res => {
                      this.list = res.data.data;
                       
                    });
  }
};
</script>
<style lang="less">
</style>


