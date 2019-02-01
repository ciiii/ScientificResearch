<template>
  <div class="backlog">
    <toDoList/>
    <navFooter/>
  </div>
</template>
<script>
import toDoList from '@/components/toDoList/toDoList'
import navFooter from '@/../src/components/footer/footer'
export default {
  components: {
    navFooter,
    toDoList
  },
  data() {
    return {
      
    }
  },
  created() {
    document.title = '我的待办列表'
  },
  mounted() {
    
  },
  methods: {
    
  },
}

</script>
<style scoped>

</style>