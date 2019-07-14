<template>
  <div class="department-box">
    <el-tree
      ref="tree"
      :data="list"
      show-checkbox
      node-key="编号"
      default-expand
      :default-expanded-keys="choosedRole"
      :default-checked-keys="choosedRole"
      :props="defaultProps"
      @node-click="handleNodeClick"
      @check-change="getCheckedNodes"
    >
    </el-tree>
  </div>

</template>

<script>
  import { URL_ORGANIZATION } from '@/assets/js/connect/ConSysUrl';
  import { arrayToJson, deepCopy, _debounce } from '@/assets/js/Common';

  export default {
    name: 'selectDepartment',
    props: ['selectArr'],
    data() {
      return {
        defaultProps: {
          children: 'children',
          label: '名称',
          isLeaf: '上级部门编号'
        },
        choosedRole: [],
        list: []
      };
    },
    mounted() {
      this.getDepartment();
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      getDepartment: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_ENABLE_DEPARTMENT_LIST, '');
        if (data && data.length > 0) {
          this.list = arrayToJson(data, '编号', '上级部门编号');
          this.choosedRole = this.selectArr;
        } else {
          this.list = [];
        }
      },
      handleNodeClick(data, node, oneself) {
        node.checked = !node.checked;
        this.isChildNodes(node);
      },
      isChildNodes(node) {
        if (node.childNodes.length > 0) {
          node.childNodes.forEach((item) => {
            item.checked = !item.checked;
            this.isChildNodes(item);
          });
        }
      },
      getCheckedNodes() {
        let nodes = this.$refs.tree.getCheckedNodes();
        this.$emit('myEvent', nodes);
      }
    }
  };
</script>

<style scoped type="text/scss" lang="scss">
  @import "@/assets/scss/Variable.scss";

  .department-box {
    border: 1px solid $border;
    padding: 10px 15px;
    height: 350px;
    overflow-y: auto;
    position: absolute;
    left: 0;
    top: 40px;
    z-index: 2;
    width: 80%;
    border-radius: 4px;
    background: #fff;
  }
</style>
