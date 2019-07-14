<template>
  <div class="page-common">
    <el-row>
      <el-col :span="4">
        <div class="department">
          <div class="header">
            <h5>组织架构</h5>
            <el-input class="seach-department" placeholder="请输入部门" size="small" v-model="filterText">
              <i slot="prefix" class="el-input__icon el-icon-search"></i>
            </el-input>
            <el-button type="primary" size="small" @click="addDepartment('添加部门',true)" class="add-department"
                       plain><i class="iconfont icontianjia"></i> 添加部门
            </el-button>
          </div>
          <el-tree :data="departments" :props="defaultProps" ref="tree" accordion :filter-node-method="filterNode"
                   class="filter-tree" @node-click="handleNodeClick" node-key="编号" highlight-current
                   :default-expanded-keys="[departmentId]">
            <span class="custom-tree-node" slot-scope="{ node, data }" align="center">
              <span align="center" class="title" :class="!data.是否启用?'title-disable':''">
                <i class="iconfont iconwenjian"/> {{node.label}}</span>
              <span class="btn-box">
                <el-tooltip class="item" effect="dark" content="修改部门" placement="top">
                  <el-button type="text" size="mini" @click="addDepartment('修改部门',false)" class="btn-edit">
                    <i class="iconfont iconicon-edit"></i>
                  </el-button>
                 </el-tooltip>
                <el-tooltip class="item" effect="dark" :content="data.是否启用?'已启用':'已禁用'" placement="top">
                  <el-button type="text" size="mini" @click="btnEnableDisabled(data)"
                             :class="data.是否启用?'btn-enable':'btn-disable'">
                   <i class="iconfont iconzhongzhitiaojian"></i>
                  </el-button>
                </el-tooltip>
              </span>
            </span>
          </el-tree>
        </div>
      </el-col>
      <el-col :span="20">
        <div class="content app-container ">
          <div class="department-box" v-if="isShowDepartmentInfo">
            <h4>
              <i class="iconfont icon-department"></i><span> {{departmentInfo.名称}} </span>
              <span v-if="departmentInfo.负责人姓名" class="name">（ 部门负责人：{{departmentInfo.负责人姓名}} ）</span>
              <el-button class="filter-item add-department" type="warning" round size="mini"
                         @click="setTeachingDepartment">
                <i class="iconfont icon-set"></i> 科室设置
              </el-button>
            </h4>
          </div>
          <div class="title-box" v-if="isShowDepartmentInfo&&departmentInfo.是否教学科室">
            <h4>
              <i class="iconfont iconkeshikucunguanli"></i><span> 科室信息 </span>
              <span class="name">（ 科室管理员：{{departmentInfo.科室管理员姓名}} </span>
              <span class="name">，最大学员人数：{{departmentInfo.最大学员人数?departmentInfo.最大学员人数:0}} 人） </span>
            </h4>
          </div>
          <div class="user-box" v-if="teachers&&teachers.length>0">
            <el-table class="tableone"
                      v-loading="listLoading" :data="teachers" element-loading-text="Loading" fit
                      highlight-current-row stripe>
              <el-table-column label="序号" align="center" width="80">
                <template slot-scope="scope">
                  {{ scope.$index+1 }}
                </template>
              </el-table-column>
              <el-table-column label="带教老师" align="left" prop="姓名"></el-table-column>
              <el-table-column label="手机" align="center" prop="手机"></el-table-column>
            </el-table>
          </div>
          <div class="title-box">
            <h4>
              <i class="iconfont iconicon1"></i><span> 部门人员（{{total}}人）</span>
            </h4>
          </div>
          <div class="filter-container">
            <el-button class="filter-item add-department" type="success" size="small" @click="addUser('添加人员',true,'')"
            ><i class="iconfont icontianjia"></i> 添加人员
            </el-button>
            <el-button class="filter-item btn-import" type="primary" size="small" @click="importUser"
                       plain><i class="iconfont icon-update"></i> 导入人员
            </el-button>
            <el-input v-model="reqUser.LikeAllName" placeholder="请输入姓名或部门" style="width: 200px;" class="filter-item"
                      @keyup.enter.native="onSearch" prefix-icon="el-icon-search"/>
            <div class="filter-item">
              状态
              <el-select v-model="reqUser.是否启用" placeholder="请选择" class="filter-item" @change="onSearch">
                <el-option label="全部" :value="''"></el-option>
                <el-option label="启用" :value="true"></el-option>
                <el-option label="禁用" :value="false"></el-option>
              </el-select>
            </div>
            <el-button class="filter-item" type="primary" size="small" icon="el-icon-search" @click="onSearch">查询
            </el-button>
          </div>
          <div class="user-box" v-if="users&&users.length>0">
            <el-table class="tableone"
                      v-loading="listLoading" :data="users"
                      element-loading-text="Loading" border fit
                      highlight-current-row stripe>
              <el-table-column label="序号" align="center" prop="number" width="80"></el-table-column>
              <el-table-column label="姓名" align="center" prop="姓名"></el-table-column>
              <el-table-column label="工号" align="center" prop="工号"></el-table-column>
              <el-table-column label="性别" align="center" prop="性别" width="80"></el-table-column>
              <el-table-column label="手机" align="center" prop="手机"></el-table-column>
              <el-table-column label="部门名称" align="center" prop="部门名称"></el-table-column>
              <el-table-column label="学历" align="center" prop="学历"></el-table-column>
              <el-table-column label="入职日期" align="center">
                <template slot-scope="scope">
                  <span>{{scope.row.入职日期|dataFormat('yyyy-MM-dd')}}</span>
                </template>
              </el-table-column>
              <el-table-column label="状态" property="是否启用" align="center" width="150">
                <template slot-scope="scope">
                  <el-switch class="switch"
                             style="display: block"
                             v-model="scope.row.是否启用"
                             active-color="#13ce66"
                             inactive-color="#ff4949"
                             @change="switchChange(scope.row)"
                             active-text="启用">
                  </el-switch>
                </template>
              </el-table-column>
              <el-table-column label="操作" align="center" width="150">
                <template slot-scope="scope">
                  <el-button size="mini" type="success" icon="el-icon-edit" plain
                             @click="addUser('修改人员',false,scope.row)">编辑
                  </el-button>
                  <el-button size="mini" type="primary" plain @click="btnDetails(scope.row)">详情</el-button>
                </template>
              </el-table-column>
            </el-table>
            <div class="block paging">
              <el-pagination
                @size-change="handleSizeChange"
                @current-change="handleCurrentChange"
                :current-page.sync="reqUser.Index"
                :page-size="reqUser.Size" background
                layout="total, prev, pager, next, jumper"
                :total="total">
              </el-pagination>
            </div>
          </div>
          <div class="not-content" v-if="isLoad&&users.length==0"><img src="@/assets/images/nothing.png"></div>
        </div>
      </el-col>
    </el-row>
    <el-dialog :title="title" :visible.sync="isDialog" v-if='isDialog' :close-on-click-modal="false" width="30%"
               :class="{'big-dialog':isUser}" class="common-dialog">
      <addUser v-if="isUser" ref="child" @myEvent="getUserMyEvent" :item="item" :isAdd="isAdd"></addUser>
      <addDepartment v-else ref="child" @myEvent="getDepartmentMyEvent" :item="departmentInfo"
                     :isAdd="isAdd"></addDepartment>
    </el-dialog>
    <el-dialog title="人员导入" :visible.sync="isImportDialog" v-if='isImportDialog' :close-on-click-modal="false"
               class="common-dialog">
      <importUser ref="child" @myEvent="getImportMyEvent"></importUser>
    </el-dialog>
    <el-dialog title="查看详情" :visible.sync="isDetailsDialog" v-if='isDetailsDialog' :close-on-click-modal="false"
               class="big-dialog common-dialog">
      <userDetails ref="child" :item="item" @myEvent="getMyEvent"></userDetails>
    </el-dialog>
    <el-dialog title="科室设置" :visible.sync="isSetDialog" v-if='isSetDialog' :close-on-click-modal="false"
               class="common-dialog">
      <setTeachingDepartment ref="child" :item="departmentInfo" @myEvent="getSetTeachingMyEvent"
                             :teachers="teachers"></setTeachingDepartment>
    </el-dialog>
  </div>
</template>

<script>
  import { URL_ORGANIZATION, URL_USER, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl'
  import { arrayToJson } from '@/assets/js/Common'
  import addUser from './addUser'
  import addDepartment from './addDepartment'
  import userDetails from './userDetails'
  import importUser from './importUser'
  import setTeachingDepartment from './setTeachingDepartment'

  export default {
    components: { addUser, addDepartment, userDetails, importUser, setTeachingDepartment },
    data() {
      return {
        departments: [],
        users: [],
        reqDepartment: {
          Like名称: '',
          上级部门编号: ''
        },
        reqUser: {
          Index: 1,
          Size: 10,
          OrderType: false,
          部门编号: '',
          是否启用: '',
          LikeAllName: ''
        },
        listLoading: true,
        isDialog: false,
        isAdd: false,
        isLoad: false,
        isRoleUser: false,
        item: {},
        defaultProps: {
          children: 'children',
          label: '名称',
          id: '编号',
          isLeaf: '上级部门编号'
        },
        choosedRole: [],
        total: 0,
        isUser: false,
        name: '',
        department: '',
        filterText: '',
        isAdd: false,
        isDetailsDialog: false,
        isImportDialog: false,
        isSetDialog: false,
        isShowDepartmentInfo: false,
        departmentId: '',
        teachers: [],
        departmentInfo: []
      }
    },
    mounted() {
      this.listLoading = true
      this.getDepartments()
      this.getUsers()
    },
    watch: {
      filterText(val) {
        this.$refs.tree.filter(val)
      }
    },
    methods: {
      filterNode(value, data) {
        if (!value) return true
        return data.名称.indexOf(value) !== -1
      },
      getDepartments: async function() {
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_TEACHING_DEPARTMENT_LIST, this.reqDepartment)
        if (data && data.length > 0) {
          this.departments = arrayToJson(data, '编号', '上级部门编号')
          if (this.departmentId) {
            this.$nextTick(function() {
              this.$refs.tree.setCurrentKey(this.departmentId)
              let item = this.$refs.tree.getCurrentNode()
              this.departmentInfo = item
            })
          }
        } else {
          this.departments = []
        }
      },
      addDepartment(title, isAdd) {
        this.title = title
        this.isUser = false
        this.isAdd = isAdd
        this.isDialog = true
      },
      btnEnableDisabled(data) {
        let title = '启用'
        if (data.是否启用) {
          title = '禁用'
        } else {
          title = '启用'
        }
        this.enableDisabledDepartment(title, data)
      },
      enableDisabledDepartment(title, data) {
        this.$confirm('您确定要【' + title + '】此部门吗', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (data.是否启用) {
            this.disableDepartment(data.编号)
          } else {
            this.enableDepartment(data.编号)
          }
        }).catch(() => {
          data.是否启用 = !data.是否启用
        })
      },
      enableDepartment: async function(id) {
        await this.$http.myPost(URL_ORGANIZATION.POST_ENABLE_DEPARTMENT, id)
        this.$message.success('启用成功！')
        this.getDepartments()
      },
      disableDepartment: async function(id) {
        await this.$http.myPost(URL_ORGANIZATION.POST_DISABLE_DEPARTMENT, id)
        this.$message.success('禁用成功！')
        this.getDepartments()
      },
      setTeachingDepartment() {
        this.isSetDialog = true
      },
      handleNodeClick(data, node, oneself) {
        this.reqUser.部门编号 = data.编号
        this.departmentInfo = data
        this.isShowDepartmentInfo = true
        this.departmentId = data.编号
        this.onSearch()
        this.getTeachers(this.departmentInfo.编号)
      },
      getTeachers: async function(id) {
        let postData = {
          科室编号: id
        }
        let data = await this.$http.myGet(URL_ORGANIZATION.GET_DEPARTMENT_TEACHING_TEACHER, postData)
        if (data && data.length > 0) {
          this.teachers = data
        } else {
          this.teachers = []
        }
      },
      onSearch() {
        this.reqUser.Index = 1
        this.listLoading = true
        this.list = []
        this.getUsers()
      },
      getUsers: async function() {
        let data = await this.$http.myGet(URL_USER.GET_PAGING_ALL_USER, this.reqUser)
        if (data && data.list.length > 0) {
          this.total = data.total
          data = data.list
          let number = (this.reqUser.Index - 1) * this.reqUser.Size + 1
          data.forEach(function(item) {
            item.number = number
            number++
          })
          this.users = data

        } else {
          this.users = []
          this.total = 0
        }
        this.listLoading = false
        this.isLoad = true
      },
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`)
      },
      handleCurrentChange(val) {
        this.reqUser.Index = val
        this.getUsers()
      },
      addUser(title, isAdd, item) {
        this.isAdd = isAdd
        this.title = title
        this.isUser = true
        this.isDialog = true
        this.item = item
      },
      btnDetails(item) {
        this.item = item
        this.isDetailsDialog = true
      },
      enableUser: async function(id) {
        await this.$http.myPost(URL_USER.POST_ENABLE_USER, id)
        this.$message.success('启用成功！')
      },
      disableUser: async function(id) {
        await this.$http.myPost(URL_USER.POST_DISABLE_USER, id)
        this.$message.success('禁用成功！')
      },
      switchChange(el) {
        let title = '启用'
        if (el.是否启用) {
          title = '启用'
        } else {
          title = '禁用'
        }
        this.enableDisableUser(title, el)
      },
      enableDisableUser(title, el) {
        this.$confirm('您确定要【' + title + '】此用户吗', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          if (el.是否启用) {
            this.enableUser(el.编号)
          } else {
            this.disableUser(el.编号)
          }
        }).catch(() => {
          el.是否启用 = !el.是否启用
        })
      },
      getUserMyEvent(val) {
        this.getUsers()
        this.isDialog = val
      },
      getDepartmentMyEvent(val) {
        this.getDepartments()
        this.isDialog = val
      },
      importUser() {
        this.isImportDialog = true
      },
      getImportMyEvent(val) {
        this.getUsers()
        this.isImportDialog = val
      },
      getSetTeachingMyEvent(val) {
        this.getDepartments()
        this.getTeachers(this.departmentInfo.编号)
        this.isSetDialog = val
      },
      getMyEvent(val) {
        this.isDetailsDialog = val
      }
    }
  }
</script>
<style type="text/scss" lang="scss" scoped>
  @import "@/assets/scss/Variable.scss";

  .page-common {
    .department {
      overflow-y: auto;
      border-right: 1px solid #ececec;
      height: 90vh;
      padding: 0 5px;

      .header {
        overflow: hidden;
      }

      .seach-department {
        width: 140px;
        margin-left: 10px;
      }

      h5 {
        width: 80%;
        background: $colorActive;
        color: #fff;
        font-size: 16px;
        text-align: center;
        display: block;
        margin: 15px auto;
        padding: 10px 0;
        border-radius: 5px;
        font-weight: normal;
      }

      .add-department {
        float: right;
        clear: right;
        margin-right: 10px;
        padding: 9px 12px;
      }
    }

    .el-tree {
      clear: left;
    }

    .el-tree-node {
      .el-tree-node__content {
        height: 32px;
        line-height: 32px;

        .custom-tree-node {
          width: 100%;
          overflow: hidden;
          height: 26px;
          line-height: 26px;
        }

        .title {
          font-size: 14px;
          color: #666;
          background: none;
          float: left;

          i {
            color: #bfdaf7;
            font-size: 15px;
          }
        }

        .title-disable {
          color: #999;

          i {
            color: #d5d6d6;
          }
        }

        &:hover {
          .btn-box {
            display: block;
          }

          .title {
            color: $colorActive;
          }
        }

        .btn-box {
          float: right;
          padding-right: 10px;
          display: none;

          .el-button + .el-button {
            margin-left: 0;
          }

          .el-button:hover {
            font-size: 16px;
          }

          .btn-add {
            color: #67c23a;
          }

          .btn-edit {
            color: #36a3f7;
          }

          .btn-disable {
            color: red;
          }

          .btn-enable {
            color: #67c23a;
          }

          .btn-add, .btn-edit, .btn-disable, .btn-enable {
            border: 1px solid #fff;
            border-radius: 3px;
            padding: 2px;
            margin: 0 3px;
            background: #fff;

            &:hover {
              border-color: $loginColor;

            }
          }
        }
      }
    }

    .is-current {
      > .el-tree-node__content .custom-tree-node {
        background: $colorActive;

        .title {
          color: #fff !important;
        }
      }
    }

    .content {
      background: #fff;

      .department-box, .title-box {
        margin-bottom: 10px;

        .name {
          font-size: 15px;
          color: #666;
        }

        h4 {
          margin: 0;
          font-size: 18px;
          color: #333;
          font-weight: normal;

          i {
            font-size: 20px;
          }

          .el-button i {
            font-size: 16px;
          }
        }
      }

      .title-box {
        background: #eceff4;
        padding: 6px 15px;
      }

      .department-box {
        /*margin-bottom: 10px;*/
      }
    }
  }
</style>

