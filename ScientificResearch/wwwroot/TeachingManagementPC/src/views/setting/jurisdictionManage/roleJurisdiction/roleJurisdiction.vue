<template>
  <div class="content-box">
    <el-form ref="form" label-width="100px" size="small">
      <el-form-item label="角色名称">
        <el-input :value="name" maxLength="200" disabled></el-input>
      </el-form-item>
      <el-form-item label="权限设置">
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
          @check-change="checkChange"
        >
        </el-tree>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_PERMISSION } from '@/assets/js/connect/ConSysUrl'
  import { _debounce, arrayToJson} from '@/assets/js/Common'

  export default {
    name: 'RoleJurisdiction',
    props: ['item'],
    data() {
      return {
        list: [],
        name: '',
        defaultProps: {
          children: 'children',
          label: '名称',
          isLeaf: '上级编号'
        },
        choosedRole: []
      }
    },
    mounted() {
      this.name = this.item.名称
      this.getRoleJurisdiction(this.item.编号)
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      getRoleJurisdiction: async function(id) {
        let postData = {
          教学角色编号: id
        }
        let data = await this.$http.myGet(URL_PERMISSION.GET_ROLE_JURISDICTION, postData)
        if (data && data.length > 0) {
          this.list = arrayToJson(data, '编号', '上级编号')
          let selectAyy = []
          data.forEach(function(item) {
            if (item.拥有) {
              selectAyy.push(item.编号)
            }
          })
          this.choosedRole = selectAyy
        } else {
          this.list = []
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
      checkChange(node, isCheck, childNode) {
        node.拥有 = isCheck
      },
      confirmHandler: _debounce(function() {
        let nodes = this.$refs.tree.getCheckedNodes(false,true)
        let arr = []
        nodes.forEach(function(item) {
          let obj = {
            教学权限编号: item.编号
          }
          arr.push(obj)
        })
        let postData = {
          id: this.item.编号,
          list: arr
        }
        this.editJurisdiction(postData)
      }, 300),
      editJurisdiction: async function(data) {
        await this.$http.myPost(URL_PERMISSION.POST_ADD_EDIT_ROLE_JURISDICTION, data)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      }
    }
  }
</script>
<style scoped type="text/scss" lang="scss">
  @import "@/assets/scss/Variable.scss";

  .el-tree {
    border: 1px solid $border;
    height: 420px;
    overflow-y: auto;
    border-radius: 4px;
  }
</style>
