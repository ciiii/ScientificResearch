(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-520656e4"],{2464:function(t,l,e){},"58e0":function(t,l,e){"use strict";e.r(l);var a=function(){var t=this,l=t.$createElement,e=t._self._c||l;return e("section",{staticClass:"box"},[e("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:t.active,callback:function(l){t.active=l},expression:"active"}},[e("van-tab",{attrs:{title:"基本信息"}},[e("van-cell-group",{staticClass:"input"},[e("van-field",{attrs:{label:"姓名",placeholder:"请输入姓名",required:"",clearable:""},model:{value:t.list.姓名,callback:function(l){t.$set(t.list,"姓名",l)},expression:"list.姓名"}}),e("van-field",{attrs:{label:"身份证",placeholder:"请输入证件号",required:"",clearable:""},model:{value:t.list.身份证,callback:function(l){t.$set(t.list,"身份证",l)},expression:"list.身份证"}}),e("van-field",{attrs:{label:"工号",placeholder:"请输入工号",required:"",clearable:""},model:{value:t.list.工号,callback:function(l){t.$set(t.list,"工号",l)},expression:"list.工号"}}),e("van-field",{attrs:{label:"部门或院系",placeholder:"请输入所属部门或院系",required:"",clearable:"",disabled:""},model:{value:t.list.部门名称,callback:function(l){t.$set(t.list,"部门名称",l)},expression:"list.部门名称"}})],1)],1),e("van-tab",{attrs:{title:"人事信息"}},[e("div",{on:{click:t.prompt}},[e("van-cell-group",[e("van-field",{attrs:{label:"入职日期",clearable:"",readonly:!0},model:{value:t.list.入职日期,callback:function(l){t.$set(t.list,"入职日期",l)},expression:"list.入职日期"}}),e("van-field",{attrs:{label:"人员类别",clearable:"",readonly:!0},model:{value:t.list.人员类别,callback:function(l){t.$set(t.list,"人员类别",l)},expression:"list.人员类别"}}),e("van-field",{attrs:{label:"岗位性质",clearable:"",readonly:!0},model:{value:t.list.岗位性质,callback:function(l){t.$set(t.list,"岗位性质",l)},expression:"list.岗位性质"}}),e("van-field",{attrs:{label:"岗位类型",clearable:"",readonly:!0},model:{value:t.list.岗位类型,callback:function(l){t.$set(t.list,"岗位类型",l)},expression:"list.岗位类型"}}),e("van-field",{attrs:{label:"岗位名称",clearable:"",readonly:!0},model:{value:t.list.岗位名称,callback:function(l){t.$set(t.list,"岗位名称",l)},expression:"list.岗位名称"}}),e("van-field",{attrs:{label:"合同开始日期",clearable:"",readonly:!0},model:{value:t.list.合同开始日期,callback:function(l){t.$set(t.list,"合同开始日期",l)},expression:"list.合同开始日期"}}),e("van-field",{attrs:{label:"合同结束日期",clearable:"",readonly:!0},model:{value:t.list.合同结束日期,callback:function(l){t.$set(t.list,"合同结束日期",l)},expression:"list.合同结束日期"}}),e("van-field",{attrs:{label:"参加工作时间",clearable:"",readonly:!0},model:{value:t.list.参加工作时间,callback:function(l){t.$set(t.list,"参加工作时间",l)},expression:"list.参加工作时间"}})],1)],1)]),e("van-button",{staticClass:"btn",attrs:{disabled:t.disabled},on:{click:t.submit}},[t._v("确认修改")]),e("ReturnBtn")],1)],1)},s=[],i=e("6ce6"),n={data:function(){return{active:0,list:[]}},computed:{disabled:function(){return!this.list.姓名||!this.list.身份证||""==this.list.工号}},mounted:function(){this.getPersonnelDetails()},methods:{getPersonnelDetails:function(){var t=this,l={"人员编号":JSON.parse(localStorage.getItem("personnel")).编号};this.$http.getSomePersonnelDetails(l).then(function(l){console.log(l,"ffgg"),t.list=l.data})},submit:Object(i["a"])(function(){var t=this,l={"编号":JSON.parse(localStorage.getItem("personnel")).编号,"姓名":this.list.姓名,"工号":this.list.工号,"身份证":this.list.身份证,"部门编号":this.list.部门编号,"密码":this.list.密码,"是否启用":this.list.是否启用};this.$http.ChangeAccount(l).then(function(l){l.error?t.$toast(l.error):t.$toast.success("修改成功！")})},500),prompt:function(){this.$toast("请到PC端修改！")}}},c=n,o=(e("6745"),e("2877")),r=Object(o["a"])(c,a,s,!1,null,"674381b1",null);r.options.__file="accountChange.vue";l["default"]=r.exports},6745:function(t,l,e){"use strict";var a=e("2464"),s=e.n(a);s.a},"6ce6":function(t,l,e){"use strict";function a(t,l){var e;l=l||200;return function(){var a=this,s=arguments;e&&clearTimeout(e),e=setTimeout(function(){e=null,t.apply(a,s)},l)}}e.d(l,"a",function(){return a})}}]);