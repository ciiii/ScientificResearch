<template>
  <el-date-picker
    v-model="time"
    :type="type"
    :format="format"
    :value-format="format"
    :placeholder="title"
    :picker-options="pickerOptionsStart"
    @change="changeDate">
  </el-date-picker>
</template>

<script>
  export default {
    name: 'UploadFile',
    props: ['date', 'type', 'format', 'title','dateTime'],
    data() {
      return {
        time: '',
        pickerOptionsStart: {}
      };
    },
    mounted() {
      if (this.date) {
        if (this.type == 'year') {
          this.time = this.date.toString();
        } else {
          this.time = new Date(this.date);
        }
      } else {
        this.time = '';
      }
      this.pickerOptions();
    },
    methods: {
      changeDate(value) {
        this.$emit('myEvent', value);
      },
      pickerOptions() {
        if (!this.date || this.date == '') {
          this.pickerOptionsStart = {
            disabledDate(time) {
              return time.getTime() < Date.now() - (1000 * 60 * 60 * 24);
            }
          };
        } else {
          let _this = this;
          this.pickerOptionsStart = {
            disabledDate(time) {
              return time.getTime() < new Date(_this.date).getTime();
            }
          };
        }
      }
    }
  };
</script>
