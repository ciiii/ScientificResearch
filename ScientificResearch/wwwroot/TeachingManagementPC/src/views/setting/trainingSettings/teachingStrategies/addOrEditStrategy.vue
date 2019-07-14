<template>
  <div class="content-box">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px" size="small">
      <el-form-item label="策略名称" prop="名称">
        <el-input v-model="form.名称"></el-input>
      </el-form-item>
      <el-form-item label="教学专业" prop="教学专业编号">
        <el-select v-model="form.教学专业编号" placeholder="请选择">
          <el-option v-for="item in majors" :key="item.编号" :label="item.名称+' - '+item.年份"
                     :value="item.编号">
            <span style="float: left">{{ item.名称 }}</span>
            <span style="float: right; color: #8492a6; font-size: 13px">{{ item.年份 }}</span>
          </el-option>
        </el-select>
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
      <el-form-item label="备注" prop="备注">
        <el-input v-model="form.备注" type="textarea"></el-input>
      </el-form-item>
    </el-form>
    <div slot="footer" class="dialog-footer">
      <el-button @click="cancelHandler">取 消</el-button>
      <el-button type="primary" @click="confirmHandler">确 定</el-button>
    </div>
  </div>
</template>

<script>
  import { URL_SETTING } from '@/assets/js/connect/ConSysUrl';
  import { _debounce, deepCopy, formatDate } from '@/assets/js/Common';

  export default {
    name: 'addStrategy',
    props: ['item', 'isAdd', 'majors'],
    data() {
      return {
        list: [],
        form: {
          编号: 0,
          名称: '',
          教学专业编号: '',
          专业基地管理员编号: 0,
          是否启用: true,
          建立日期: formatDate(new Date(), 'yyyy-MM-dd'),
          备注: ''
        },
        rules: {
          名称: [
            { required: true, message: '请输入名称！', trigger: 'blur' }
          ],
          教学专业编号: [
            { required: true, message: '请选择教学专业！', trigger: 'blur' }
          ]
        },
        title: ''
      };
    },
    mounted() {
      if (!this.isAdd) {
        this.form = deepCopy(this.item);
      }
    },
    methods: {
      cancelHandler() {
        this.$emit('myEvent', false);
      },
      confirmHandler: _debounce(function() {
        this.$refs.form.validate((valid) => {
          if (valid) {
            this.addEditStrategy(this.form);
          } else {
            this.$message.error('信息有误！');
            return false;
          }
        });
      }, 300),
      addEditStrategy: async function(data) {
        await this.$http.myPost(URL_SETTING.POST_ADD_EDIT_HOSPITAL_STRATEGY, data);
        this.$message.success('提交成功！');
        this.$emit('myEvent', false);
      }
    }
  };
</script>
<style type="text/scss" lang="scss" scoped>
  .el-form-item {
    float: none !important;
    width: 100% !important;
  }

  .tinymce {
    padding-right: 10px;
  }

  .el-form {
    height: auto;
  }
</style>
