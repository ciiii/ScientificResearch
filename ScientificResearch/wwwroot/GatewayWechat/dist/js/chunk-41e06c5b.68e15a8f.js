(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-41e06c5b"],{"19f8":function(t,s,a){"use strict";var e=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("van-panel",{staticClass:"box",attrs:{title:"审核"}},[a("i",{staticClass:"icon iconfont icon-guanbi",on:{click:t.back}}),a("van-cell-group",[a("van-field",{attrs:{label:"审核说明：",type:"textarea",placeholder:"请输入审核说明···",rows:"5",autosize:t.maxHeight},model:{value:t.value,callback:function(s){t.value=s},expression:"value"}}),a("div",{staticClass:"btn"},[a("van-button",{attrs:{type:"primary",size:"small"},on:{click:t.pass}},[t._v("通过")]),a("van-button",{attrs:{type:"warning",size:"small"},on:{click:t.fail}},[t._v("不通过")]),a("van-button",{attrs:{type:"danger",size:"small"},on:{click:t.termination}},[t._v("终止")])],1)],1)],1)},i=[],n={props:["message","getBacklog"],data:function(){return{value:"",maxHeight:{maxHeight:90},state:{pass:1,fail:-1,termination:-2},falg:!0}},mounted:function(){},methods:{back:function(){this.$emit("getMessage"),this.value=""},pass:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.pass,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()},fail:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.fail,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()},termination:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.termination,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()}}},o=n,c=(a("c4e2"),a("2877")),l=Object(c["a"])(o,e,i,!1,null,"3f17f889",null);l.options.__file="audit.vue";s["a"]=l.exports},"27da":function(t,s,a){},4513:function(t,s,a){"use strict";a.r(s);var e=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("van-list",{staticClass:"box",attrs:{finished:t.finished,"finished-text":"没有更多了"},on:{load:t.onLoad},model:{value:t.loading,callback:function(s){t.loading=s},expression:"loading"}},[a("div",{staticClass:"title"},[a("i",{staticClass:"icon iconfont icon-zhuanli"}),t._v("专利管理\n  ")]),t._l(t.lectureList,function(s,e){return a("div",{key:e,staticClass:"backContentBox"},[a("ul",{staticClass:"backContentTop",on:{click:function(a){t.goDetails(s.编号)}}},[a("li",[t._v(t._s(s.专利名称))]),a("li",[a("span",[t._v("审核进度：")]),a("span",{style:{color:s.审核进度==t.flag?"#31BD5D":"#FF976A"}},[t._v(t._s(s.审核进度))])]),a("li",[a("span",[t._v("专利权人：")]),a("span",[t._v(t._s(s.专利权人名称))])]),a("li",[a("span",[t._v("专利类型：")]),a("span",[t._v(t._s(s.专利类型))])]),a("li",[a("span",[t._v("是否授权：")]),a("span",[t._v(t._s(t.conversionState(s.是否授权)))])]),a("li",[a("span",[t._v("年度：")]),a("span",[t._v(t._s(s.年度))])]),a("li",[a("span",[t._v("第一发明人：")]),a("span",[t._v(t._s(s.第一发明人))])]),a("li",[a("span",[t._v("当前步骤：")]),a("span",{attrs:{id:"contentSpan"}},[t._v(t._s(s.步骤名称)+" - "+t._s(s.步骤状态说明))])])]),a("span",{directives:[{name:"show",rawName:"v-show",value:t.isShow,expression:"isShow"}],staticClass:"audit",on:{click:function(a){t.audit(s)}}},[t._v("审核")])])}),a("van-popup",{staticClass:"popup",model:{value:t.show,callback:function(s){t.show=s},expression:"show"}},[a("Audit",{attrs:{message:t.message},on:{getMessage:t.getMessage}})],1),a("ReturnBtn")],2)},i=[],n=(a("ac6a"),a("19f8")),o={components:{Audit:n["a"]},data:function(){return{lectureList:[],index:1,size:5,loading:!1,finished:!1,flag:"已完成-审核通过",show:!1,isShow:!1,message:""}},mounted:function(){this.getPaper()},methods:{getMessage:function(){this.show=!1},getPaper:function(){var t=this;this.$http.getPatentAllList(this.index,this.size).then(function(s){console.log(s),t.lectureList=s.data.list,t.lectureList.forEach(function(s,a){"待审核"===s.步骤状态说明&&(t.isShow=!0)})})},goDetails:function(t){this.$router.push({path:"/patentDetails",name:"patentDetails",params:{item:t}})},audit:function(t){this.message=t,this.show=!0},onLoad:function(){var t=this;setTimeout(function(){for(var s=0;s<0;s++)t.lectureList.push(t.lectureList.length+1);t.loading=!1,t.lectureList.length>=0&&(t.finished=!0)},500)},conversionState:function(t){return 1==t?"是":0==t?"否":" "}}},c=o,l=(a("d260"),a("2877")),u=Object(l["a"])(c,e,i,!1,null,"219e6e0c",null);u.options.__file="patentManagement.vue";s["default"]=u.exports},b9d0:function(t,s,a){},c4e2:function(t,s,a){"use strict";var e=a("b9d0"),i=a.n(e);i.a},d260:function(t,s,a){"use strict";var e=a("27da"),i=a.n(e);i.a}}]);