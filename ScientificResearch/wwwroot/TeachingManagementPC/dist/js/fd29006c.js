(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-6d5a"],{Bdf2:function(t,e,i){"use strict";var n=i("ZcjR");i.n(n).a},KW3f:function(t,e,i){"use strict";var n=i("dxLj");i.n(n).a},QoDa:function(t,e,i){"use strict";i.r(e);var n=i("cLjf"),s=i.n(n),r=i("hDQ3"),o=i.n(r),c=i("YHGi"),l=i("K3Y6"),a={name:"RoleJurisdiction",props:["item"],data:function(){return{list:[],name:"",defaultProps:{children:"children",label:"名称",isLeaf:"上级编号"},choosedRole:[]}},mounted:function(){this.name=this.item.名称,this.getRoleJurisdiction(this.item.编号)},methods:{cancelHandler:function(){this.$emit("myEvent",!1)},getRoleJurisdiction:function(){var t=o()(s.a.mark(function t(e){var i,n,r;return s.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return i={"教学角色编号":e},t.next=3,this.$http.myGet(c.j.GET_ROLE_JURISDICTION,i);case 3:(n=t.sent)&&n.length>0?(this.list=Object(l.d)(n,"编号","上级编号"),r=[],n.forEach(function(t){t.拥有&&r.push(t.编号)}),this.choosedRole=r):this.list=[];case 5:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}(),handleNodeClick:function(t,e,i){e.checked=!e.checked,this.isChildNodes(e)},isChildNodes:function(t){var e=this;t.childNodes.length>0&&t.childNodes.forEach(function(t){t.checked=!t.checked,e.isChildNodes(t)})},checkChange:function(t,e,i){t.拥有=e},confirmHandler:Object(l.a)(function(){var t=[];this.$refs.tree.getCheckedNodes(!1,!0).forEach(function(e){var i={"教学权限编号":e.编号};t.push(i)});var e={id:this.item.编号,list:t};this.editJurisdiction(e)},300),editJurisdiction:function(){var t=o()(s.a.mark(function t(e){return s.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myPost(c.j.POST_ADD_EDIT_ROLE_JURISDICTION,e);case 2:this.$message.success("提交成功！"),this.$emit("myEvent",!1);case 4:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}()}},u=(i("Bdf2"),i("ZrdR")),d=Object(u.a)(a,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"content-box"},[i("el-form",{ref:"form",attrs:{"label-width":"100px",size:"small"}},[i("el-form-item",{attrs:{label:"角色名称"}},[i("el-input",{attrs:{value:t.name,maxLength:"200",disabled:""}})],1),t._v(" "),i("el-form-item",{attrs:{label:"权限设置"}},[i("el-tree",{ref:"tree",attrs:{data:t.list,"show-checkbox":"","node-key":"编号","default-expand":"","default-expanded-keys":t.choosedRole,"default-checked-keys":t.choosedRole,props:t.defaultProps},on:{"node-click":t.handleNodeClick,"check-change":t.checkChange}})],1)],1),t._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:t.cancelHandler}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.confirmHandler}},[t._v("确 定")])],1)],1)},[],!1,null,"1f3c8a5a",null);d.options.__file="roleJurisdiction.vue";var h=d.exports,f={name:"RoleJurisdiction",props:["item"],data:function(){return{allUser:[],checkUsers:[],reqOne:{OrderType:!1,"是否启用":!0,"部门编号":"",LikeAllName:""},reqTwo:{"教学角色编号":"",OrderType:!1,"是否启用":!0,"部门编号":"",LikeAllName:""},defaultProps:{key:"编号",label:"姓名",department:"部门名称"},filterMethod:function(t,e){return e.AllName.indexOf(t)>-1}}},mounted:function(){this.reqTwo.教学角色编号=this.item.编号,this.getUsers(),this.getCheckUsers()},methods:{cancelHandler:function(){this.$emit("myEvent",!1)},getUsers:function(){var t=o()(s.a.mark(function t(){var e;return s.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myGet(c.n.GET_ALL_USER,this.reqOne);case 2:(e=t.sent)&&e.length>0?this.allUser=e:this.allUser=[];case 4:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),getCheckUsers:function(){var t=o()(s.a.mark(function t(){var e,i;return s.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myGet(c.j.GET_ROLE_USERS,this.reqTwo);case 2:(e=t.sent)&&e.length>0?(i=[],e.forEach(function(t){i.push(t.编号)}),this.checkUsers=i):this.checkUsers=[];case 4:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),confirmHandler:Object(l.a)(function(){var t=[];this.checkUsers.forEach(function(e){var i={"人员编号":e};t.push(i)});var e={id:this.item.编号,list:t};this.editRoleUser(e)},300),editRoleUser:function(){var t=o()(s.a.mark(function t(e){return s.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myPost(c.j.POST_ADD_EDIT_ROLE_USER,e);case 2:this.$message.success("提交成功！"),this.$emit("myEvent",!1);case 4:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}()}},m=(i("KW3f"),Object(u.a)(f,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"content-box"},[[i("div",{staticStyle:{"text-align":"center"}},[i("el-transfer",{staticStyle:{"text-align":"left",display:"inline-block"},attrs:{filterable:"",titles:["所有人员","已选人员"],"button-texts":["移除","添加"],"filter-placeholder":"请输入姓名或部门","filter-method":t.filterMethod,props:t.defaultProps,data:t.allUser},scopedSlots:t._u([{key:"default",fn:function(e){var n=e.option;return i("span",{},[t._v(t._s(n.姓名)+"\n          "),i("span",{staticClass:"department"},[t._v(t._s(n.部门名称))])])}}]),model:{value:t.checkUsers,callback:function(e){t.checkUsers=e},expression:"checkUsers"}})],1)],t._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:t.cancelHandler}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.confirmHandler}},[t._v("确 定")])],1)],2)},[],!1,null,null,null));m.options.__file="roleUser.vue";var p={components:{roleJurisdiction:h,roleUser:m.exports},data:function(){return{list:[],listLoading:!0,isDialog:!1,isAdd:!1,isLoad:!1,isRoleUser:!1,item:{}}},mounted:function(){this.listLoading=!0,this.getList()},methods:{getList:function(){var t=o()(s.a.mark(function t(){var e;return s.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myGet(c.j.GET_ROLE_LIST,"");case 2:(e=t.sent)&&e.length>0?this.list=e:this.list=[],this.listLoading=!1,this.isLoad=!0;case 6:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),btnRoleUser:function(t,e){this.item=t,this.isAdd=!1,this.title="设置角色人员",this.isRoleUser=!0,this.isDialog=!0},btnJurisdiction:function(t){this.item=t,this.title="设置角色权限",this.isRoleUser=!1,this.isDialog=!0,console.info(this.item)},getMyEvent:function(t){this.getList(),this.isDialog=t}}},b=Object(u.a)(p,function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"app-container page-common"},[n("h4",{staticClass:"page-title",attrs:{align:"center"}},[t._v("角色及权限设置")]),t._v(" "),t.list&&t.list.length>0?n("div",{staticClass:"content"},[n("el-table",{directives:[{name:"loading",rawName:"v-loading",value:t.listLoading,expression:"listLoading"}],staticClass:"tableone",attrs:{data:t.list,"element-loading-text":"Loading",border:"",fit:"","highlight-current-row":"",stripe:""}},[n("el-table-column",{attrs:{align:"center",label:"序号",width:"90"},scopedSlots:t._u([{key:"default",fn:function(e){return[t._v("\n          "+t._s(e.$index+1)+"\n        ")]}}])}),t._v(" "),n("el-table-column",{attrs:{label:"角色名称",prop:"名称"}}),t._v(" "),n("el-table-column",{attrs:{label:"用户人数",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-button",{attrs:{type:"success",round:"",size:"mini"},on:{click:function(i){t.btnRoleUser(e.row)}}},[t._v(t._s(e.row.人数))])]}}])}),t._v(" "),n("el-table-column",{attrs:{label:"功能数",align:"center"},scopedSlots:t._u([{key:"default",fn:function(e){return[n("el-button",{attrs:{type:"primary",round:"",size:"mini",plain:""},on:{click:function(i){t.btnJurisdiction(e.row)}}},[t._v(t._s(e.row.功能数))])]}}])}),t._v(" "),n("el-table-column",{attrs:{label:"备注",align:"center",prop:"备注"}}),t._v(" "),n("el-table-column",{attrs:{label:"操作",align:"center",width:"250"},scopedSlots:t._u([{key:"default",fn:function(e){return[e.row.能否直接配置人员?n("el-button",{attrs:{size:"mini",type:"success",icon:"el-icon-setting",plain:""},on:{click:function(i){t.btnRoleUser(e.row)}}},[t._v("角色人员\n          ")]):t._e(),t._v(" "),n("el-button",{attrs:{size:"mini",type:"primary",icon:"el-icon-view"},on:{click:function(i){t.btnJurisdiction(e.row)}}},[t._v("角色权限\n          ")])]}}])})],1)],1):t._e(),t._v(" "),t.isLoad&&0==t.list.length?n("div",{staticClass:"not-content"},[n("img",{attrs:{src:i("XDBy")}})]):t._e(),t._v(" "),t.isDialog?n("el-dialog",{class:{"big-dialog":t.isRoleUser},attrs:{title:t.title,visible:t.isDialog,"close-on-click-modal":!1,width:"30%"},on:{"update:visible":function(e){t.isDialog=e}}},[t.isRoleUser?n("roleUser",{ref:"child",attrs:{item:t.item},on:{myEvent:t.getMyEvent}}):n("roleJurisdiction",{ref:"child",attrs:{item:t.item},on:{myEvent:t.getMyEvent}})],1):t._e()],1)},[],!1,null,null,null);b.options.__file="index.vue";e.default=b.exports},XDBy:function(t,e){t.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALsAAAA8CAYAAAA+JcsKAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyNTk2ZjZlMC0xNjRiLTQ0NGQtYTE3NS03NTVjNGQ5OTk5ZGMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RTIyMTcyNDU0MTdGMTFFODlDRUNEODA0N0Q1RjY4M0EiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RTIyMTcyNDQ0MTdGMTFFODlDRUNEODA0N0Q1RjY4M0EiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZjNmZjcyZTctMTBiMy04ZDQ3LWJkZDctNTU5ZGU2NzY0MGIyIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2ZlYzg3NGEtMzdkMS0xMWU4LWI5ZGMt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"},ZcjR:function(t,e,i){},dxLj:function(t,e,i){}}]);