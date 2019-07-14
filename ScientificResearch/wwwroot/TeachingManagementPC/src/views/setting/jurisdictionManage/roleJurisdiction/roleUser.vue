<template>
  <div class="content-box">
    <template>
      <div style="text-align: center">
        <el-transfer
          style="text-align: left; display: inline-block"
          v-model="checkUsers"
          filterable
          :titles="['所有人员', '已选人员']"
          :button-texts="['移除', '添加']"
          filter-placeholder="请输入姓名或部门"
          :filter-method="filterMethod"
          :props="defaultProps"
          :data="allUser">
          <span slot-scope="{ option }">{{ option.姓名 }}
            <span class="department">{{ option.部门名称 }}</span>
          </span>
        </el-transfer>
      </div>
    </template>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_PERMISSION ,URL_USER} from '@/assets/js/connect/ConSysUrl'
  import { _debounce, deepCopy, arrayToJson, jsonToArray } from '@/assets/js/Common'

  export default {
    name: 'RoleJurisdiction',
    props: ['item'],
    data() {
      return {
        allUser: [],
        checkUsers: [],
        reqOne: {
          OrderType: false,
          是否启用: true,
          部门编号: '',
          LikeAllName: ''
        },
        reqTwo: {
          教学角色编号: '',
          OrderType: false,
          是否启用: true,
          部门编号: '',
          LikeAllName: ''
        },
        defaultProps:{
          key: '编号',
          label: '姓名',
          department: '部门名称'
        },
        filterMethod(query, item) {
          return item.AllName.indexOf(query) > -1
        }
      }
    },
    mounted() {
      this.reqTwo.教学角色编号 = this.item.编号
      this.getUsers()
      this.getCheckUsers()
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      getUsers: async function() {
        let data = await this.$http.myGet(URL_USER.GET_ALL_USER, this.reqOne)
        if (data && data.length > 0) {
          this.allUser = data
        } else {
          this.allUser = []
        }
      },
      getCheckUsers: async function() {
        let data = await this.$http.myGet(URL_PERMISSION.GET_ROLE_USERS, this.reqTwo)
        if (data && data.length > 0) {
          let newData = []
          data.forEach(function(item) {
            newData.push(item.编号)
          })
          this.checkUsers = newData
        } else {
          this.checkUsers = []
        }
      },
      confirmHandler: _debounce(function() {
        let arr = []
        this.checkUsers.forEach(function(item) {
          let obj = {
            人员编号: item
          }
          arr.push(obj)
        })
        let postData = {
          id: this.item.编号,
          list: arr
        }
        this.editRoleUser(postData)
      }, 300),
      editRoleUser: async function(data) {
        await this.$http.myPost(URL_PERMISSION.POST_ADD_EDIT_ROLE_USER, data)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      }
    }
  }
</script>
<style type="text/scss" lang="scss" scope>
  .el-transfer-panel {
    width: 380px;

    .department {
      color: #666;
      float: right;
      padding-right: 10px;
      width: 100px;
      display: block;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      text-align: right;
    }
  }

  .el-transfer-panel__list.is-filterable {
    height: 352px;
  }

  .el-transfer-panel__body {
    height: 400px;
  }
</style>
