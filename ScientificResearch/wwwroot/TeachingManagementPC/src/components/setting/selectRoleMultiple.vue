<template>
  <el-select v-model="newSelectRoles" multiple placeholder="请选择(可多个)" style="display: block" @change="changeSelect">
    <el-option
      v-for="item in roles"
      :key="item.编号"
      :label="item.名称"
      :value="item.编号">
    </el-option>
  </el-select>
</template>

<script>
  import { URL_PERMISSION } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson } from '@/assets/js/Common';

  export default {
    name: '',
    props: ['selectArr'],
    data() {
      return {
        roles: [],
        newSelectRoles: [],
      };
    },
    mounted() {
      this.newSelectRoles = this.selectArr;
      this.getRoles();
    },
    methods: {
      getRoles: async function() {
        let data = await this.$http.myGet(URL_PERMISSION.GET_ROLE_LIST, '')
        if (data && data.length > 0) {
          this.roles = data
        } else {
          this.roles = [];
        }
      },
      changeSelect(arr) {
        this.$emit('myEvent', arr);
      },
    }
  };
</script>

<style scoped>

</style>
