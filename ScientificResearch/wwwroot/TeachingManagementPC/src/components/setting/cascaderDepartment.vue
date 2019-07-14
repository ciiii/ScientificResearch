<template>
  <el-cascader
    :options="departments"
    :show-all-levels="false"
    v-model="selected"
    clearable
    @change="handleChange"
  ></el-cascader>
</template>

<script>
  import { URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson, deepCopy } from '@/assets/js/Common';

  export default {
    name: 'selectDepartment',
    props: ['departmentId'],
    data() {
      return {
        selected: [],
        departments: [],
        req: {
          是否启用: true
        }
      };
    },
    mounted() {
      this.getDepartment();
    },
    methods: {
      getDepartment: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_ENABLE_DEPARTMENT_LIST, this.req);
        if (data && data.length > 0) {
          data.forEach(function(item) {
            item.label = item.名称;
            item.value = item.编号;
          });
          this.selected = [];
          data.find((itemA, index, arr) => {
            if (itemA.编号 == this.departmentId) {
              this.isPartent(data, itemA.上级部门编号);
            }
          });
          this.departments = arrayToJson(data, '编号', '上级部门编号');
          this.selected.push(this.departmentId);
        } else {
          this.departments = [];
        }
      },
      isPartent(data, partentId) {
        if (partentId != 0) {
          this.selected.unshift(partentId);
          data.find((itemB, index, arr) => {
            if (itemB.编号 === partentId) {
              this.isPartent(data, itemB.上级部门编号);
            }
          });
        }
      },
      handleChange(value) {
        console.info(value[value.length - 1]);
        this.$emit('myEvent', value[value.length - 1]);
      }
    }
  };
</script>

<style scoped>

</style>
