(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c9db4df2"],{"26d5":function(t,e,a){"use strict";var r=a("a220"),l=a.n(r);l.a},"43fc":function(t,e,a){"use strict";a.r(e);var r,l=function(){var t=this,e=t.$createElement,a=t._self._c||e;return a("div",[a("navbar",{attrs:{path:t.path}}),a("div",{staticClass:"detail"},[a("van-tabs",{model:{value:t.active,callback:function(e){t.active=e},expression:"active"}},[a("van-tab",{attrs:{title:"基本信息"}},[a("van-cell-group",{attrs:{title:"轮转信息"}},[a("van-cell",{attrs:{title:"学员姓名",value:t.form.学员姓名}}),a("van-cell",{attrs:{title:"带教老师",value:t.form.带教老师姓名}}),a("van-cell",{attrs:{title:"本院科室",value:t.form.本院科室名称}}),a("van-cell",{attrs:{title:"科室管理员\t",value:t.form.科室管理员姓名}}),a("van-cell",{attrs:{title:"教学本院策略",value:t.form.教学本院策略名称}}),a("van-cell",{attrs:{title:"状态",value:t.form.状态}}),a("van-cell",{attrs:{title:"计划入科日期",value:t.form.计划入科日期}}),a("van-cell",{attrs:{title:"计划出科日期",value:t.form.计划出科日期}}),a("van-cell",{attrs:{title:"实际入科日期",value:t.form.实际入科日期}}),a("van-cell",{attrs:{title:"实际出科日期",value:t.form.实际出科日期}})],1),a("van-cell-group",{attrs:{title:"轮转手册信息"}},[a("van-cell",{attrs:{title:"创建人",value:t.form.CreatorInfo}}),a("van-cell",{attrs:{title:"创建人类型",value:t.form.CreatorType}}),a("van-cell",{attrs:{title:"轮转手册类型",value:t.form.教学轮转手册类型名称}}),a("van-cell",{attrs:{title:"病人姓名",value:t.form.病人姓名}}),a("van-cell",{attrs:{title:"操作时间",value:t.form.操作时间}}),a("van-cell",{attrs:{title:"建立时间",value:t.form.建立时间}}),a("van-cell",{attrs:{title:"内容",value:t.form.内容}})],1),a("van-cell-group",{directives:[{name:"show",rawName:"v-show",value:t.attachment.length>0,expression:"attachment.length>0"}],attrs:{title:"附件"}},[a("van-cell",{staticClass:"attachment"},[a("ul",t._l(t.attachment,function(e){return a("li",{key:e.path},[a("a",{attrs:{target:"_blank",href:e.path}},[t._v(t._s(e.name))])])}),0)])],1)],1),a("van-tab",{attrs:{title:"审核记录"}},[a("audit-step",{attrs:{flowid:t.form.FlowId}})],1)],1),a("audit-btn",{directives:[{name:"show",rawName:"v-show",value:!t.isDetail&&t.form.IsCanOperate,expression:"!isDetail && form.IsCanOperate"}],attrs:{item:t.form,type:"3",callback:t.save}})],1)],1)},n=[],i=(a("2338"),a("f763"),a("fb37"),a("7bc1"),a("a506")),s=(a("6e95"),a("4de6")),c=(a("d300"),a("ee8d")),o=a("9d8d"),u=a("92d9"),v=a("591a"),f=a("9a6e"),p=a("d3ec"),m=a("f121");function h(t,e){var a=Object.keys(t);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(t);e&&(r=r.filter(function(e){return Object.getOwnPropertyDescriptor(t,e).enumerable})),a.push.apply(a,r)}return a}function d(t){for(var e=1;e<arguments.length;e++){var a=null!=arguments[e]?arguments[e]:{};e%2?h(a,!0).forEach(function(e){Object(i["a"])(t,e,a[e])}):Object.getOwnPropertyDescriptors?Object.defineProperties(t,Object.getOwnPropertyDescriptors(a)):h(a).forEach(function(e){Object.defineProperty(t,e,Object.getOwnPropertyDescriptor(a,e))})}return t}var b={name:"detail",components:(r={},Object(i["a"])(r,c["a"].name,c["a"]),Object(i["a"])(r,s["a"].name,s["a"]),Object(i["a"])(r,"navbar",o["a"]),Object(i["a"])(r,"AuditStep",f["a"]),Object(i["a"])(r,"AuditBtn",p["a"]),r),data:function(){return{active:0,isDetail:!0,attachment:[],form:{},path:""}},computed:{id:function(){return this.$route.query.id}},mounted:function(){var t=this.$route.query.name;this.path="/Audit/rotationAudit?name="+t,this.$route.query.source&&(this.path="/do?name="+t),this.isDetail=1==parseInt(this.$route.query.isDetail),this.setNavTitle({title:t}),this.GetInfo()},methods:d({},Object(v["b"])(["setNavTitle"]),{GetInfo:function(){var t=this;Object(u["a"])({id:this.id,type:3}).then(function(e){var a=e.data.data;t.form=Object.assign({},a);for(var r=a.附件.split(","),l=0;l<r.length;l++){var n=r[l].split("/");t.attachment.push({name:n[n.length-1],path:m["a"].baseUrl.pro+r[l]})}})},save:function(){this.$toast.success("提交成功！"),this.$router.push({path:this.path})}})},O=b,w=(a("26d5"),a("6691")),j=Object(w["a"])(O,l,n,!1,null,null,null);e["default"]=j.exports},a220:function(t,e,a){}}]);