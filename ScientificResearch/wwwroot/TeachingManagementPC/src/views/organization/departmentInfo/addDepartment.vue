<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="small">
      <el-form-item label="上级部门" prop="上级部门编号">
        <el-cascader
          :options="departments"
          :show-all-levels="false"
          v-model="selected"
          @change="handleChange"
        ></el-cascader>
      </el-form-item>
      <el-form-item label="部门名称" prop="名称">
        <el-input v-model="form.名称"></el-input>
      </el-form-item>
      <el-form-item label="部门负责人" prop="负责人编号" v-if="isLoad">
        <selectUser ref="child" :number="form.负责人编号" @myEvent="getMyEvent"></selectUser>
      </el-form-item>
      <el-form-item label="是否启用" prop="是否启用">
        <template slot-scope="scope">
          <el-switch class="switch"
                     style="display: block"
                     v-model="form.是否启用"
                     active-color="#13ce66"
                     inactive-color="#ff4949"
                     active-text="启用">
          </el-switch>
        </template>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_ORGANIZATION, URL_USER } from '@/assets/js/connect/ConSysUrl'
  import { _debounce, arrayToJson, deepCopy } from '@/assets/js/Common'
  import cascaderDepartment from '@/components/setting/cascaderDepartment'
  import selectUser from '@/components/setting/selectUser'

  export default {
    name: 'add',
    props: ['item', 'isAdd'],
    components: { cascaderDepartment, selectUser },
    data() {
      return {
        departments: [],
        name: '',
        defaultProps: {
          children: 'children',
          label: '名称',
          isLeaf: '上级编号'
        },
        reqUser: {
          Index: 1,
          Size: 8,
          OrderType: false,
          部门编号: '',
          LikeAllName: ''
        },
        isShow: false,
        form: {
          编号: 0,
          上级部门编号: 0,
          名称: '',
          负责人编号: '',
          排序值: 0,
          备注: '',
          是否启用: true
        },
        rules: {  //表单验证
          名称: [
            { required: true, message: '请输入部门名称！', trigger: 'blur' }
          ],
          负责人编号: [
            { required: true, message: '请设置部门负责人！', trigger: 'blur' }
          ]
        },
        users: [],
        total: 0,
        selected: [],
        departments: [],
        isLoad: false
      }
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item)
      }
      this.getDepartment()
      this.isLoad=true
    },
    methods: {
      getDepartment: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_ENABLE_DEPARTMENT_LIST, '')
        if (data && data.length > 0) {
          data.forEach(function(item) {
            item.label = item.名称
            item.value = item.编号
          })
          this.selected = []
          data.find((itemA, index, arr) => {
            if (itemA.编号 == this.item.上级部门编号) {
              this.isPartent(data, itemA.上级部门编号)
            }
          })
          this.departments = arrayToJson(data, '编号', '上级部门编号')
          this.selected.push(this.item.上级部门编号)

        } else {
          this.departments = []
        }
      },
      isPartent(data, partentId) {
        if (partentId != 0) {
          this.selected.unshift(partentId)
          data.find((itemB, index, arr) => {
            if (itemB.编号 === partentId) {
              this.isPartent(data, itemB.上级部门编号)
            }
          })
        }
      },
      getMyEvent(value) {
        this.form.负责人编号 = value
      },
      handleChange(value) {
        this.form.上级部门编号 = value[value.length - 1]
      },
      confirmHandler: _debounce(function() {
        this.addOrEditDepartment(this.form)
      }, 300),
      addOrEditDepartment: async function(data) {
        await this.$http.myPost(URL_ORGANIZATION.POST_ADD_OR_EDIT_DEPARTMENT, data)
        this.$message.success('提交成功！')
        this.$emit('myEvent', false)
      },
      cancelHandler() {
        this.$emit('myEvent', false)
      }
    }
  }
</script>
<style></style>
<style type="text/scss" lang="scss" scope>
  .content-box .paging {
    border-top: 1px solid #eee;
    padding-right: 15px;
    font-size: 12px !important;
  }
</style>
