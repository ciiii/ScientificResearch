(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-23edb448"],{1823:function(t,i,a){"use strict";var e=a("d012"),o=a.n(e);o.a},"432e":function(t,i,a){"use strict";a.r(i);var e,o=function(){var t=this,i=t.$createElement,a=t._self._c||i;return a("div",[a("div",{staticClass:"filter"},[a("van-divider",{style:{color:"#1989fa",borderColor:"#1989fa",padding:"0 16px"}},[t._v(t._s(t.title))]),a("van-cell-group",[t.form.编号?a("van-field",{attrs:{label:"病人",readonly:""},model:{value:t.form.病人姓名,callback:function(i){t.$set(t.form,"病人姓名",i)},expression:"form.病人姓名"}}):a("select-patient",{attrs:{label:"选择病人",required:!0},model:{value:t.form.病人编号,callback:function(i){t.$set(t.form,"病人编号",i)},expression:"form.病人编号"}}),a("van-cell",{attrs:{title:"是否全程陪护"}},[a("van-switch",{attrs:{size:"18px"},model:{value:t.form.是否全程陪护,callback:function(i){t.$set(t.form,"是否全程陪护",i)},expression:"form.是否全程陪护"}})],1),a("van-field",{attrs:{label:"备注",type:"textarea",placeholder:"请输入备注",rows:"1",autosize:""},model:{value:t.form.备注,callback:function(i){t.$set(t.form,"备注",i)},expression:"form.备注"}})],1),a("div",{staticClass:"actionsbtn"},[a("van-button",{attrs:{type:"info"},on:{click:t.cancel}},[t._v("取消")]),a("van-button",{attrs:{type:"primary"},on:{click:t.save}},[t._v("提交")])],1)],1)])},n=[],r=a("a506"),s=(a("006b"),a("b460")),l=(a("a39d"),a("bca4")),c=(a("0f0c"),a("3607")),f=a("e3db"),m=a("ed55"),u={name:"edit",components:(e={},Object(r["a"])(e,c["a"].name,c["a"]),Object(r["a"])(e,l["a"].name,l["a"]),Object(r["a"])(e,s["a"].name,s["a"]),Object(r["a"])(e,"SelectPatient",f["a"]),e),props:{data:{type:Object,default:null},callback:{type:Function,default:function(){}}},data:function(){return{selectManVisiable:!1,title:"添加我的教学管床病人",TrainingSituation:{},form:{"编号":0,"教学轮转编号":0,"病人编号":0,"是否全程陪护":!0,"备注":"","病人姓名":""}}},computed:{},watch:{data:{handler:function(t){t&&t.编号?(this.form.编号=t.编号,this.form.病人编号=t.病人编号,this.form.教学轮转编号=t.教学轮转编号,this.form.是否全程陪护=t.是否全程陪护,this.form.病人姓名=t.病人姓名,this.form.备注=t.备注,this.title="编辑我的教学管床病人"):(this.form.编号="",this.form.病人编号="",this.form.教学轮转编号="",this.form.是否全程陪护=!1,this.form.病人姓名="",this.form.备注="",this.title="添加我的教学管床病人",localStorage.getItem("TrainingSituation")&&(this.TrainingSituation=JSON.parse(localStorage.getItem("TrainingSituation")),this.form.教学轮转编号=this.TrainingSituation.当前教学轮转编号))}}},mounted:function(){var t=this.data;t&&t.编号?(this.form.编号=t.编号,this.form.病人编号=t.病人编号,this.form.教学轮转编号=t.教学轮转编号,this.form.是否全程陪护=t.是否全程陪护,this.form.病人姓名=t.病人姓名,this.form.备注=t.备注,this.title="编辑我的教学管床病人"):(this.form.编号=0,this.form.病人编号="",this.form.教学轮转编号="",this.form.是否全程陪护=!1,this.form.病人姓名="",this.form.备注="",this.title="添加我的教学管床病人",localStorage.getItem("TrainingSituation")&&(this.TrainingSituation=JSON.parse(localStorage.getItem("TrainingSituation")),this.form.教学轮转编号=this.TrainingSituation.当前教学轮转编号))},methods:{cancel:function(){this.callback(!1)},save:function(){var t=this;if(""!=t.form.病人编号)return""==t.form.教学轮转编号?this.$router.push("/home"):void Object(m["d"])(t.form).then(function(i){i.error||(t.$toast.success("操作成功"),t.editVisiable=!1,t.form={"编号":0,"教学轮转编号":0,"病人编号":0,"是否全程陪护":!0,"备注":"","病人姓名":""},t.callback())});t.$toast("请选择病人")}}},h=u,d=(a("1823"),a("6691")),b=Object(d["a"])(h,o,n,!1,null,null,null);i["default"]=b.exports},d012:function(t,i,a){}}]);