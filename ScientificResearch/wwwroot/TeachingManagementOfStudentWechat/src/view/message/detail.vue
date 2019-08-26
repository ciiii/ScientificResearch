<template>
  <div>
    <navbar :path="path"/>
    <div class="detail">
      <h3>{{name}}</h3>
      <p class="subtitle">
          <span>发布人:{{auther}}</span><span>发布时间:{{time}}</span>
      </p>
      <p class="attachment" v-show="attachment.length>0">
         <ul>
             <li v-for="item in attachment" :key="item.path">
                 <a target="_blank" :href="item.path">{{item.name}}</a>
             </li>
         </ul>
      </p>
      <div class="content" v-html="content"></div>
    </div>
  </div>
</template>
<script>
import navbar from "@/components/navbar.vue";
import { GetDetail } from "@/api/notes";
import { mapActions } from "vuex";
import sysConfig from "@/config";
export default {
  components: {
    navbar
  },
  data() {
    return {
      name: "",
      time: "",
      auther: "",
      attachment: [],
      content: "",
      path:""
    };
  },
  computed: {
    id: function() {
      return this.$route.query.id;
    },
    
  },
  mounted() {
    var title = this.$route.query.name;
    this.path='/message/list?name='+title;
    this.setNavTitle({ title });
    this.GetDInfo();
  },
  methods: {
    ...mapActions(["setNavTitle"]),
    GetDInfo() {
      let _this = this;
      GetDetail(this.id).then(res => {
        let data = res.data.data;
        _this.name = data.通知名称;
        _this.content = data.通知内容;
        _this.auther=data.发送人姓名;
        _this.time=data.建立时间;
        var attachments=data.相关文件路径.split(',');
        for(var i=0;i<attachments.length;i++)
        {
            var n=attachments[i].split('/');
            _this.attachment.push({
                name:n[n.length-1],
                path:sysConfig.baseUrl.pro+attachments[i]
            });
        }
      });
    }
  }
};
</script>
<style lang="less">
.detail {
  margin-top: 50px;
  h3 {
    text-align: center;
  }
  padding: 10px;
  background: #fff;
  .subtitle{ 
      border: 1px solid #d3d3d3; padding: 4px;
      font-size: 12px; color: gray;
  text-align: center;
  span:last-child{ margin-left:20px; }
  }
}
</style>



