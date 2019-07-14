<template>
  <el-date-picker class="filter-item"
                  v-model="time"
                  :type="type"
                  align="right"
                  unlink-panels
                  range-separator="至"
                  :start-placeholder="placeholder.start"
                  :end-placeholder="placeholder.end"
                  :picker-options="pickerOptions"
                  @change="changeTime"
  >
  </el-date-picker>
</template>
<script>
  import { pickerOptions } from '@/assets/js/Common';

  export default {
    name: 'UploadFile',
    props: ['date','type', 'placeholder'],
    data() {
      return {
        time: [],
        pickerOptions: pickerOptions
      };
    },
    mounted() {
      if (this.date) {
        this.time = this.date;
      } else {
        this.time = [];
      }
    },
    methods: {
      changeTime(time) {
        this.$emit('myEvent', time);
      }
    }
  };
</script>
