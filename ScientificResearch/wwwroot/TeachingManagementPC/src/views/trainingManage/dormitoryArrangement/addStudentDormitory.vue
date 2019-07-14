<template>
  <div class="add-user">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small" v-if="isLoad">
      <div class="item-box">
        <el-form-item label="学员">
          <el-input v-model="names" disabled></el-input>
        </el-form-item>
        <el-form-item label="宿舍楼" prop="宿舍楼编号">
          <el-select v-model="form.宿舍楼编号" placeholder="请选择">
            <el-option v-for="item in dormitorys" :key="item.编号" :label="item.名称" :value="item.编号"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="门禁卡卡号" prop="门禁卡卡号">
          <el-input v-model="form.门禁卡卡号"></el-input>
        </el-form-item>
        <el-form-item label="门牌号及床号" prop="门牌号及床号">
          <el-input v-model="form.门牌号及床号"></el-input>
        </el-form-item>
        <el-form-item label="水起数">
          <el-input v-model="form.水起数"></el-input>
        </el-form-item>
        <el-form-item label="电起数">
          <el-input v-model="form.电起数"></el-input>
        </el-form-item>
        <el-form-item label="气起数">
          <el-input v-model="form.气起数"></el-input>
        </el-form-item>
        <el-form-item label="宿舍职位" prop="职位">
          <el-select v-model="form.职位" placeholder="请选择">
            <el-option v-for="item in posts" :key="item.编号" :label="item.值" :value="item.值"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="入住日期" prop="入住日期">
          <selectDate ref="date" :date="form.入住日期" type="date" format="yyyy-MM-dd" @myEvent="myGetCheckInDate"
                      title="选择日期"></selectDate>
        </el-form-item>
        <el-form-item label="退出日期" prop="退出日期">
          <selectDate ref="date" :date="form.退出日期" type="date" format="yyyy-MM-dd" @myEvent="myGetCheckOutDate"
                      title="选择日期"></selectDate>
        </el-form-item>
        <el-form-item label="退出原因" class="el-form-item-block">
          <el-input v-model="form.退出原因" type="textarea"></el-input>
        </el-form-item>
        <el-form-item label="滞纳金比例">
          <el-input v-model="form.滞纳金比例" type="number">
            <template slot="append">%</template>
          </el-input>
          <p class="explain">注意：此处只能输入数字，保留两位小数</p>
        </el-form-item>
        <el-form-item label="宿舍安排说明" class="el-form-item-block">
          <el-input v-model="form.宿舍安排说明" type="textarea"></el-input>
        </el-form-item>
      </div>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler"><i class="el-icon-loading" v-if="isLoading"></i> 确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_TEACHING_MANAGEMENT, URL_BASE_INFO } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate, getUrl } from '@/assets/js/Common';
  import selectDate from '@/components/selectDate';

  export default {
    name: 'addDownload',
    props: ['item', 'isAdd', 'arr', 'nameArr'],
    components: { selectDate },
    data() {
      return {
        form: {
          编号: 0,
          宿舍楼编号: '',
          门禁卡卡号: '',
          门牌号及床号: '',
          职位: '',
          水起数: 0,
          电起数: 0,
          气起数: 0,
          滞纳金比例: 0,
          入住日期: formatDate(new Date(), 'yyyy-MM-dd'),
          退出日期: '',
          退出原因: '',
          宿舍安排说明: '',
          建立时间: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        dormitorys: [],
        posts: [],
        isLoad: false,
        isLoading: false,
        names: '',
        rules: {  //表单验证
          宿舍楼编号: [
            { required: true, message: '请选择宿舍楼！', trigger: 'blur' }
          ],
          门牌号及床号: [
            { required: true, message: '请输入门牌号及床号！', trigger: 'blur' }
          ],
          职位: [
            { required: true, message: '请选择职位！', trigger: 'blur' }
          ],
          入住日期: [
            { required: true, message: '请选择入住日期！', trigger: 'blur' }
          ]
        }
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
        console.info(this.form);
      }
      this.names = this.nameArr;
      this.getDormitory();
      this.getDormitoryPost();
      this.isLoad = true;
    },
    methods: {
      getDormitory: async function() {
        let data = await this.$http.myGet(URL_BASE_INFO.GET_DORMITORY_LIST, '');
        if (data && data.length > 0) {
          this.dormitorys = data.reverse();
        }
      },
      getDormitoryPost: async function() {
        let postData = {
          分类: '宿舍职位'
        };
        let data = await this.$http.myGet(URL_BASE_INFO.GET_TYPE_DICTIONARY, postData);
        if (data && data.length > 0) {
          this.posts = data.reverse();
        }
      },
      myGetCheckInDate(value) {
        this.form.入住日期 = value;
      },
      myGetCheckOutDate(value) {
        this.form.退出日期 = value;
      },
      confirmHandler: _debounce(function() {
        this.isLoading = true;
        this.$refs.form.validate((valid) => {
          if (valid) {
            let arr = [];
            this.arr.forEach(item => {
              let data = {
                编号: item,
                宿舍楼编号: this.form.宿舍楼编号,
                门禁卡卡号: this.form.门禁卡卡号,
                门牌号及床号: this.form.门牌号及床号,
                职位: this.form.职位,
                水起数: this.form.水起数,
                电起数: this.form.电起数,
                气起数: this.form.气起数,
                滞纳金比例: this.form.滞纳金比例,
                入住日期: this.form.入住日期,
                退出日期: this.form.退出日期,
                退出原因: this.form.退出原因,
                宿舍安排说明: this.form.宿舍安排说明,
                建立时间: this.form.建立时间,
                备注: this.form.备注
              };
              arr.push(data);
              console.info(arr);
              this.addEditStudentDormitory(arr);
            });
          } else {
            this.$message.error('信息有误！');
            this.isLoading = false;
            return false;
          }
        });
      }, 300),
      addEditStudentDormitory: async function(data) {
        await this.$http.myPost(URL_TEACHING_MANAGEMENT.URL_POST_BATCH_ADD_EDIT_STUDENT_DORMITORY, data);
        this.$message.success('提交成功！');
        this.isLoading = false;
        this.$emit('myEvent', false);
      },
      cancelHandler() {
        this.$emit('myEvent', false);
      }
    }
  };
</script>
