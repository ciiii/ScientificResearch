(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-683bcfe5"],{"5d3d":function(t,e,a){"use strict";var r=a("b6b3"),l=a.n(r);l.a},"6aca":function(t,e,a){"use strict";a.r(e);var r,l=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("navbar",{attrs:{path:t.path}}),a("div",{staticClass:"detail"},[a("van-tabs",{model:{value:t.active,callback:function(e){t.active=e},expression:"active"}},[a("van-tab",{attrs:{title:"基本信息"}},[a("van-cell-group",{attrs:{title:"学员信息"}},[a("van-cell",{attrs:{title:"学员姓名",value:t.form.姓名}}),a("van-cell",{attrs:{title:"工号",value:t.form.工号}}),a("van-cell",{attrs:{title:"往届应届",value:t.form.往届应届}}),a("van-cell",{attrs:{title:"培训年届(年限)\t"}},[t._v("\n            "+t._s(t.form.学员培训年界)+"("+t._s(t.form.学员培训年限)+")\n          ")]),a("van-cell",{attrs:{title:"学员类型",value:t.form.学员类型名称}}),a("van-cell",{attrs:{title:"教学专业",value:t.form.专业名称}}),a("van-cell",{attrs:{title:"教学本院策略",value:t.form.教学本院策略名称}}),a("van-cell",{attrs:{title:"报到时间",value:t.form.报到时间}}),a("van-cell",{attrs:{title:"计划开始培训日期",value:t.form.计划开始培训日期}}),a("van-cell",{attrs:{title:"计划结束培训日期",value:t.form.计划结束培训日期}}),a("van-cell",{attrs:{title:"实际开始培训日期",value:t.form.实际开始培训日期}}),a("van-cell",{attrs:{title:"实际结束培训日期",value:t.form.实际结束培训日期}}),a("van-cell",{attrs:{title:"证书",value:t.form.证书}}),a("van-cell",{attrs:{title:"状态",value:t.form.StateName}}),a("van-cell",{attrs:{title:"送培方式",value:t.form.送培方式}}),a("van-cell",{attrs:{title:"建立时间",value:t.form.建立时间}})],1),a("van-cell-group",{attrs:{title:"结业信息"}},[a("van-cell",{attrs:{title:"创建人",value:t.form.CreatorInfo}}),a("van-cell",{attrs:{title:"创建人类型",value:t.form.CreatorType}}),a("van-cell",{attrs:{title:"申请结业日期",value:t.form.申请结业日期}}),a("van-cell",{attrs:{title:"结业日期",value:t.form.结业日期}}),a("van-cell",{attrs:{title:"说明",value:t.form.说明}})],1)],1),a("van-tab",{attrs:{title:"审核记录"}},[a("audit-step",{attrs:{flowid:t.form.FlowId}})],1)],1)],1)],1)},n=[],i=(a("2338"),a("f763"),a("fb37"),a("a506")),o=(a("fe49"),a("d382")),c=(a("0f82"),a("7657")),s=a("9d8d"),v=a("92d9"),u=a("591a"),f=a("9a6e");function m(t,e){var a=Object.keys(t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);e&&(r=r.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),a.push.apply(a,r)}return a}function b(t){for(var e=1;e<arguments.length;e++){var a=null!=arguments[e]?arguments[e]:{};e%2?m(a,!0).forEach(function(e){Object(i["a"])(t,e,a[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(a)):m(a).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(a,e))})}return t}var d={name:"detail",components:(r={},Object(i["a"])(r,c["a"].name,c["a"]),Object(i["a"])(r,o["a"].name,o["a"]),Object(i["a"])(r,"navbar",s["a"]),Object(i["a"])(r,"AuditStep",f["a"]),r),data:function(){return{active:0,isDetail:!0,attachment:[],form:{},path:"/graduation"}},computed:{id:function(){return this.$route.query.id}},mounted:function(){var t=this.$route.query.name;this.path="/graduation",this.$route.query.source&&(this.path="/do?name="+t),this.setNavTitle({title:t}),this.GetInfo()},methods:b({},Object(u["b"])(["setNavTitle"]),{GetInfo:function(){var t=this;Object(v["a"])({id:this.id,type:4}).then(function(e){var a=e.data.data;t.form=Object.assign({},a)})}})},p=d,h=(a("5d3d"),a("6691")),O=Object(h["a"])(p,l,n,!1,null,null,null);e["default"]=O.exports},b6b3:function(t,e,a){}}]);