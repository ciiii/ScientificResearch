(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-1fb9"],{"+4DE":function(t,e,a){"use strict";a.r(e);var i=a("cLjf"),n=a.n(i),s=a("hDQ3"),l=a.n(s),o=a("YHGi"),r=(a("K3Y6"),a("0Ne/")),c=a("BEHE"),u={components:{examineCommon:r.a,detailsBox:c.a},data:function(){return{list:[],isLoad:!1,isDialog:!1,listLoading:!1,isAdd:!1,req:{Index:1,Size:13,OrderType:!1,LikeCreatorInfo:"",LikeFlowTemplateName:""},total:0,details:{},item:{},pageUrl:"",title:""}},mounted:function(){this.listLoading=!0,this.getList()},methods:{getList:function(){var t=l()(n.a.mark(function t(){var e,a;return n.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myGet(o.g.GET_PAGING_TODO,this.req);case 2:(e=t.sent)&&e.list.length>0?(this.total=e.total,e=e.list,a=(this.req.Index-1)*this.req.Size+1,e.forEach(function(t){t.number=a,a++}),this.list=e):(this.list=[],this.total=0),this.listLoading=!1,this.isLoad=!0;case 6:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),onSearch:function(){this.req.Index=1,this.listLoading=!0,this.list=[],this.getList()},getType:function(t){return-1!=t.indexOf("申请")?"success":-1!=t.indexOf("审核")?"danger":-1!=t.indexOf("提交")?"success":void 0},getStates:function(t){switch(t){case"待完善":return"state-primary";case"待医审核":case"待审核":return"state-warning";case"审核通过":return"state-success";case"审核不通过":case"作废":return"state-error"}},handleSizeChange:function(t){console.log("每页 "+t+" 条")},handleCurrentChange:function(t){this.req.Index=t,this.getList()},btnOperate:function(t){this.item=t,this.title=t.LastStepTemplateName,this.pageUrl=t.LastEditStepComponentName,this.isDialog=!0},btnDetails:function(t){this.item=t,this.title="查看详情",this.pageUrl=c.a,this.isDialog=!0},clickMore:function(){this.$router.push({path:"/todoList"})},myEvent:function(){this.isDialog=!1,this.onSearch()},closeDialog:function(){this.isDialog=!1}}},p=(a("Gf3w"),a("ZrdR")),d=Object(p.a)(u,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"app-container page-common"},[i("div",{staticClass:"btn-back-box"},[i("el-button",{staticClass:"btn-back",attrs:{type:"primary",size:"mini",plain:""},on:{click:function(e){t.$router.go(-1)}}},[i("i",{staticClass:"iconfont iconfanhui"}),t._v(" 返回\n    ")])],1),t._v(" "),i("h4",{staticClass:"page-title",attrs:{align:"center"}},[t._v("我的待办事宜")]),t._v(" "),i("div",{staticClass:"filter-container"},[i("div",{staticClass:"filter-item"},[t._v("\n      创建人姓名\n      "),i("el-input",{staticClass:"filter-item",staticStyle:{width:"180px"},attrs:{placeholder:"请输入创建人姓名","prefix-icon":"el-icon-search"},nativeOn:{keyup:function(e){return"button"in e||!t._k(e.keyCode,"enter",13,e.key,"Enter")?t.onSearch(e):null}},model:{value:t.req.LikeCreatorInfo,callback:function(e){t.$set(t.req,"LikeCreatorInfo",e)},expression:"req.LikeCreatorInfo"}})],1),t._v(" "),i("div",{staticClass:"filter-item"},[t._v("\n      事项类别\n      "),i("el-input",{staticClass:"filter-item",staticStyle:{width:"180px"},attrs:{placeholder:"请输入事项类别","prefix-icon":"el-icon-search"},nativeOn:{keyup:function(e){return"button"in e||!t._k(e.keyCode,"enter",13,e.key,"Enter")?t.onSearch(e):null}},model:{value:t.req.LikeFlowTemplateName,callback:function(e){t.$set(t.req,"LikeFlowTemplateName",e)},expression:"req.LikeFlowTemplateName"}})],1),t._v(" "),i("el-button",{staticClass:"filter-item",attrs:{type:"primary",size:"small",icon:"el-icon-search"},on:{click:t.onSearch}},[t._v("查询")])],1),t._v(" "),t.list&&t.list.length>0?i("div",{staticClass:"content"},[i("el-table",{directives:[{name:"loading",rawName:"v-loading",value:t.listLoading,expression:"listLoading"}],staticClass:"tableone",staticStyle:{width:"100%"},attrs:{data:t.list,"element-loading-text":"Loading",stripe:""}},[i("el-table-column",{attrs:{align:"center",label:"序号",prop:"number",width:"80"}}),t._v(" "),i("el-table-column",{attrs:{label:"事项类别",prop:"FlowTemplateName"}}),t._v(" "),i("el-table-column",{attrs:{label:"创建人",prop:"CreatorInfo",align:"center"}}),t._v(" "),i("el-table-column",{attrs:{label:"创建人类型",prop:"CreatorType",align:"center"}}),t._v(" "),i("el-table-column",{attrs:{label:"建立时间",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v(t._s(t._f("dataFormat")(e.row.CreateDateTime,"yyyy-MM-dd")))]}}])}),t._v(" "),i("el-table-column",{attrs:{label:"审核进度",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("span",{class:t.getStates(e.row.LastStepStateName)},[t._v("\n         "+t._s(e.row.StateName)+"-"+t._s(e.row.LastStepStateName)+"\n        ")])]}}])}),t._v(" "),i("el-table-column",{attrs:{label:"当前步骤",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("span",{class:t.getStates(e.row.LastStepStateName)},[t._v("\n            "+t._s(e.row.LastStepTemplateName)+"-"+t._s(e.row.LastStepStateName)+"\n          ")])]}}])}),t._v(" "),i("el-table-column",{attrs:{label:"操作",align:"center",width:"200"},scopedSlots:t._u([{key:"default",fn:function(e){return[i("el-tooltip",{staticClass:"item",attrs:{effect:"dark",content:e.row.LastStepTemplateName,placement:"top-start"}},[e.row.IsCanOperate?i("el-button",{attrs:{size:"mini",type:t.getType(e.row.LastStepTemplateName),plain:""},on:{click:function(a){t.btnOperate(e.row)}}},[i("i",{class:"iconfont "+e.row.LastStepTemplateStyle})]):t._e()],1),t._v(" "),i("el-button",{attrs:{size:"mini",type:"primary",plain:""},on:{click:function(a){t.btnDetails(e.row)}}},[i("i",{staticClass:"iconfont iconwenjian1"}),t._v(" 详情\n          ")])]}}])})],1),t._v(" "),i("div",{staticClass:"block paging"},[i("el-pagination",{attrs:{"current-page":t.req.Index,"page-size":t.req.Size,background:"",layout:"total, prev, pager, next, jumper",total:t.total},on:{"size-change":t.handleSizeChange,"current-change":t.handleCurrentChange,"update:currentPage":function(e){t.$set(t.req,"Index",e)}}})],1)],1):t._e(),t._v(" "),t.isLoad&&0==t.list.length?i("div",{staticClass:"not-content"},[i("img",{attrs:{src:a("XDBy")}})]):t._e(),t._v(" "),t.isDialog?i("el-dialog",{staticClass:"big-dialog common-dialog",attrs:{title:t.title,visible:t.isDialog,"close-on-click-modal":!1,width:"30%"},on:{"update:visible":function(e){t.isDialog=e}}},[i(t.pageUrl,{ref:"child",tag:"component",attrs:{item:t.item,isAdd:t.isAdd},on:{myEvent:t.myEvent,closeDialog:t.closeDialog}})],1):t._e()],1)},[],!1,null,"309c16cf",null);d.options.__file="todoList.vue";e.default=d.exports},Gf3w:function(t,e,a){"use strict";var i=a("TIrH");a.n(i).a},TIrH:function(t,e,a){}}]);