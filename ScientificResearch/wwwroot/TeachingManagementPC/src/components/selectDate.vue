<template>
  <el-date-picker
    v-model="time"
    :type="type"
    :format="format"
    :value-format="format"
    :placeholder="title"
    @change="changeDate">
  </el-date-picker>
</template>

<script>
  export default {
    name: 'UploadFile',
    props: ['date', 'type', 'format', 'title'],
    data() {
      return {
        time: '',
      }
    },
    mounted() {
      if (this.date) {
        if (this.type == 'year') {
          this.time = this.date.toString()
        } else {
          this.time = new Date(this.date)
        }
      } else {
        this.time = ''
      }
    },
    methods: {
      changeDate(value) {
        this.$emit('myEvent', value)
      }
    }
  }
</script>
