<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <login/>
    <HelloWorld msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'
import Login from './login.vue'

export default {
  name: 'home',
  components: {
    Login,
    HelloWorld
  }
}
</script>
