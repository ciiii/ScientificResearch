<template>
  <div class="app-container page-common page-addStudent">
    <div class="btn-back-box">
      <el-button class="btn-back" type="primary" size="mini" plain @click="$router.go(-1)"><i
        class="iconfont iconfanhui"></i> 返回
      </el-button>
    </div>
    <el-form ref="form" :model="form" :rules="rules" label-width="155px" size="small">
      <el-row>
        <el-col :span="5" align="center" class="left-content">
          <el-tooltip class="item" effect="dark" content="上传头像" placement="top">
            <uploadImg v-model="form.头像路径" @myEvent="myEvent" :img="form.头像路径" :postUrl="postUrl" :UploadType="2"
                       ref="img" v-if="isLoad"></uploadImg>
          </el-tooltip>
          <p class="name">{{form.姓名}}</p>
          <p class="explain">说明：上传图片只能是 JPG或PNG 格式，大小不能超过 2MB</p>
        </el-col>
        <el-col :span="19" class="right-content">
          <h5 class="personal-title">学员个人信息</h5>
          <h5 class="title">基本信息</h5>
          <div class="item-box">
            <el-form-item label="姓名" prop="姓名">
              <el-input v-model.trim="form.姓名"></el-input>
            </el-form-item>
            <el-form-item label="工号" prop="工号">
              <el-input v-model="form.工号"></el-input>
            </el-form-item>
            <el-form-item label="密码" prop="密码" v-if="isAdd">
              <el-input v-model="form.密码"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="性别">
              <el-radio-group v-model="form.性别">
                <el-radio label="男"></el-radio>
                <el-radio label="女"></el-radio>
              </el-radio-group>
            </el-form-item>
            <el-form-item label="民族" prop="民族">
              <el-select v-model="form.民族" placeholder="请选择">
                <el-option v-for="item in nation" :key="item.编号" :label="item.值" :value="item.值"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="出生日期" prop="出生日期">
              <selectDate ref="date" :date="form.出生日期" type="date" format="yyyy-MM-dd" @myEvent="myBirthdayDate"
                          title="选择日期" v-if="isLoad"></selectDate>
            </el-form-item>
            <el-form-item label="证件类型" prop="证件类型">
              <el-select v-model="form.证件类型" placeholder="请选择">
                <el-option label="身份证" value="身份证"></el-option>
                <el-option label="其他" value="其他"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="证件号码" prop="证件号码">
              <el-input v-model="form.证件号码"></el-input>
            </el-form-item>
            <el-form-item label="手机号码" prop="手机号码">
              <el-input v-model="form.手机号码" type="number"></el-input>
            </el-form-item>
            <el-form-item label="电子邮箱" prop="电子邮箱">
              <el-input v-model="form.电子邮箱"></el-input>
            </el-form-item>
            <el-form-item label="政治面貌" prop="政治面貌">
              <el-input v-model="form.政治面貌"></el-input>
            </el-form-item>
            <el-form-item label="QQ号码" prop="QQ号码">
              <el-input v-model="form.QQ号码"></el-input>
            </el-form-item>
            <el-form-item label="微信号" prop="微信号">
              <el-input v-model="form.微信号"></el-input>
            </el-form-item>
            <el-form-item label="家庭住址" prop="家庭住址" class="el-form-item-block">
              <el-input v-model="form.家庭住址"></el-input>
            </el-form-item>
            <el-form-item label="说明信息" prop="备注" class="el-form-item-block">
              <el-input type="textarea" v-model="form.备注"></el-input>
            </el-form-item>
          </div>
          <h5 class="title">医师资格信息</h5>
          <div class="item-box">
            <el-form-item label="取得执业证书日期" prop="取得执业证书日期">
              <selectDate ref="date" :date="form.取得执业证书日期" type="date" format="yyyy-MM-dd" @myEvent="myPractisingDate"
                          title="选择日期" v-if="isLoad"></selectDate>
            </el-form-item>
            <el-form-item label="执业证书编号" prop="执业证书编号">
              <el-input v-model="form.执业证书编号"></el-input>
            </el-form-item>
            <el-form-item label="取得医师资格证书日期" prop="取得医师资格证书日期">
              <selectDate ref="date" :date="form.取得医师资格证书日期" type="date" format="yyyy-MM-dd" @myEvent="myPhysicianDate"
                          title="选择日期" v-if="isLoad"></selectDate>
            </el-form-item>
            <el-form-item label="医师资格证书编号" prop="医师资格证书编号">
              <el-input v-model="form.医师资格证书编号"></el-input>
            </el-form-item>
          </div>
          <h5 class="title">学历信息</h5>
          <div class="item-box">
            <el-form-item label="最高学历" prop="最高学历">
              <el-select v-model="form.最高学历" placeholder="请选择">
                <el-option v-for="item in education" :key="item.编号" :label="item.值" :value="item.值"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="毕业年份" prop="毕业年份">
              <selectDate ref="date" :date="form.毕业年份" type="year" format="yyyy" title="选择年" @myEvent="myGraduationYear"
                          v-if="isLoad"></selectDate>
            </el-form-item>
            <el-form-item label="毕业学校" prop="毕业学校">
              <el-input v-model="form.毕业学校"></el-input>
            </el-form-item>
            <el-form-item label="毕业专业" prop="毕业专业">
              <el-input v-model="form.毕业专业"></el-input>
            </el-form-item>
            <el-form-item label="毕业证编码" prop="毕业证编码">
              <el-input v-model="form.毕业证编码"></el-input>
            </el-form-item>
            <el-form-item label="学位证编码" prop="学位证编码">
              <el-input v-model="form.学位证编码"></el-input>
            </el-form-item>
          </div>
          <h5 class="title">培训信息</h5>
          <div class="item-box">
            <el-form-item label="学员培训年界" prop="学员培训年界">
              <selectDate ref="date" :date="form.学员培训年界" type="year" format="yyyy" title="选择年" @myEvent="myTrainYear"
                          v-if="isLoad"></selectDate>
            </el-form-item>
            <el-form-item label="学员培训年限" prop="学员培训年限">
              <el-input v-model="form.学员培训年限">
                <template slot="append">年</template>
              </el-input>
            </el-form-item>
            <el-form-item label="往届应届" prop="往届应届">
              <el-select v-model="form.往届应届" placeholder="请选择">
                <el-option label="往届" value="往届"></el-option>
                <el-option label="应届" value="应届"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="学员类型" prop="学员类型编号">
              <el-select v-model="form.学员类型编号" placeholder="请选择">
                <el-option v-for="item in types" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="专业方向" prop="专业编号">
              <el-select v-model="form.专业编号" placeholder="请选择">
                <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份" :value="item.编号">
                  <span style="float: left">{{ item.名称 }}</span>
                  <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="送培方式" prop="送培方式">
              <el-select v-model="form.送培方式" placeholder="请选择">
                <el-option v-for="item in modes" :key="item.编号" :label="item.值" :value="item.值"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="工作单位" prop="工作单位">
              <el-input v-model="form.工作单位"></el-input>
            </el-form-item>
            <el-form-item label="医疗卫生机构" prop="医疗卫生机构">
              <el-select v-model="form.医疗卫生机构" placeholder="请选择">
                <el-option v-for="item in organs" :key="item.编号" :label="item.值" :value="item.值"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item class="el-form-item-block">
              <el-checkbox-group v-model="start">
                <el-checkbox label="自动添加到报到信息表中，并以今天为培训开始时间！" name="type"></el-checkbox>
              </el-checkbox-group>
              <p class="explain">说明：如果勾选此报到选项，将以编辑学员信息的时间作为规培报到时间，如果已经报过到了的，则此勾选无效！</p>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="$router.go(-1)">返回</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import {
    HTTP_URL_HOST,
    URL_BASE_INFO,
    URL_ORGANIZATION,
    URL_SETTING
  } from '@/assets/js/connect/ConSysUrl'
  import { _debounce, onlyNum, getUrl, formatDate } from '@/assets/js/Common'
  import { validateIdNo, validateEMail, validatePhone } from '@/assets/js/Validate'
  import uploadImg from '@/components/uploadImg'
  import selectDate from '@/components/selectDate'

  export default {
    name: 'addUser',
    components: { uploadImg, selectDate },
    data() {
      return {
        rules: {  //表单验证
          姓名: [
            { required: true, message: '请输入姓名！', trigger: 'blur' }
          ],
          工号: [
            { required: true, message: '请输入工号！', trigger: 'blur' }
          ],
          密码: [
            { required: true, message: '请输入密码！', trigger: 'blur' }
          ],
          学员类型编号: [
            { required: true, message: '请选择学员类型！', trigger: 'blur' }
          ],
          证件类型: [
            { required: true, message: '请选择证件类型！', trigger: 'blur' }
          ],
          证件号码: [
            { required: true, message: '请输入证件号码！', trigger: 'blur' }
          ],
          手机号码: [
            { required: true, message: '请输入正确的手机号码！', trigger: 'blur' }, { validator: validatePhone }
          ],
          学员培训年界: [
            { required: true, message: '请选择学员培训年界！', trigger: 'blur' }
          ],
          学员培训年限: [
            { required: true, message: '请输入学员培训年限！', trigger: 'blur' }
          ],
          专业编号: [
            { required: true, message: '请选择专业方向！', trigger: 'blur' }
          ],
          送培方式: [
            { required: true, message: '请选择送培方式！', trigger: 'blur' }
          ],
          医疗卫生机构: [
            { required: true, message: '请选择医疗卫生机构！', trigger: 'blur' }
          ]
        },
        nation: [],
        education: [],
        types: [],
        majors: [],
        modes: [],
        organs: [],
        form: {
          编号: 0,
          学员类型编号: '',
          工号: '',
          密码: '',
          头像路径: '',
          姓名: '',
          性别: '',
          民族: '',
          证件类型: '',
          证件号码: '',
          出生日期: '',
          手机号码: '',
          政治面貌: '',
          电子邮箱: '',
          QQ号码: '',
          微信号: '',
          家庭住址: '',
          取得执业证书日期: '',
          执业证书编号: '',
          取得医师资格证书日期: '',
          医师资格证书编号: '',
          最高学历: '',
          毕业年份: '',
          毕业学校: '',
          毕业专业: '',
          毕业证编码: '',
          学位证编码: '',
          学员培训年界: '',
          学员培训年限: '',
          往届应届: '',
          专业编号: '',
          送培方式: '',
          工作单位: '',
          医疗卫生机构: '',
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        title: '',
        isAdd: false,
        start: false,
        isLoad: false,
        postUrl: getUrl(HTTP_URL_HOST + URL_ORGANIZATION.POST_UPLOAD_STUDENT_IMG)
      }
    },
    mounted() {
      this.isAdd = this.$route.params.isAdd
      if (!this.isAdd) {
        if (sessionStorage.getItem('item')) {
          this.form = JSON.parse(sessionStorage.getItem('item'))
        }
        this.$route.meta.title = '修改学员'
      } else {
        this.$route.meta.title = '添加学员'
      }
      this.isLoad = true
      this.getNations()
      this.getEducation()
      this.getStudentType()
      this.getMajors()
      this.getMode()
      this.getOrgans()
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false)
      },
      getNations: async function() {
        let postData = {
          分类: '民族'
        }
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData)
        if (data && data.length > 0) {
          this.nation = data
        }
      },
      getEducation: async function() {
        let postData = {
          分类: '学历'
        }
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData)
        if (data && data.length > 0) {
          this.education = data.reverse()
        }
      },
      getMode: async function() {
        let postData = {
          分类: '送培方式'
        }
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData)
        if (data && data.length > 0) {
          this.modes = data
        }
      },
      getOrgans: async function() {
        let postData = {
          分类: '医疗卫生机构类型'
        }
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData)
        if (data && data.length > 0) {
          this.organs = data
        }
      },
      getStudentType: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_STUDENT_TYPE, '')
        if (data && data.length > 0) {
          this.types = data
        } else {
          this.types = []
        }
      },
      getMajors: async function() {
        let data = await this.$http.myGet(URL_SETTING.GET_TRAINING_MAJOR_LIST, '')
        if (data && data.length > 0) {
          this.majors = data
        } else {
          this.majors = []
        }
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            delete this.form.number
            this.form.毕业年份 = Number(this.form.毕业年份)
            this.form.学员培训年界 = Number(this.form.学员培训年界)
            this.addOrEditStudent(this.form)
          } else {
            this.$message.error('信息有误！')
            return false
          }
        })
      }, 300),
      addOrEditStudent: async function(data) {
        await this.$http.myPost(URL_ORGANIZATION.POST_ADD_OR_EDIT_STUDENT, data)
        this.$message.success('提交成功！')
        this.$router.push({ path: '/studentFiles' })
      },
      myBirthdayDate(value) {
        this.form.出生日期 = value
      },
      myPractisingDate(value) {
        this.form.取得执业证书日期 = value
      },
      myPhysicianDate(value) {
        this.form.取得医师资格证书日期 = value
      },
      myGraduationYear(value) {
        this.form.毕业年份 = value
      },
      myTrainYear(value) {
        this.form.学员培训年界 = value
      },
      myEvent(imageUrl) {
        this.form.头像路径 = imageUrl
      },
      cancelHandler() {
        this.$emit('myEvent', false)
      }
    }
  }
</script>
<style type="text/scss" lang="scss">
  .page-addStudent {
    .el-date-editor {
      width: 90% !important;
    }
    .el-select{
      width: 100%;
    }

    .left-content {
      .avatar {
        width: 120px;
        height: 120px;
      }
    }
  }
</style>
<style scoped type="text/scss" lang="scss">
  @import "@/assets/scss/AddStudent.scss";
  .btn-back-box{
    margin-bottom: 0;
  }
</style>
