(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2486c107"],{4353:function(s,t,e){"use strict";e.r(t);var n=function(){var s=this,t=s.$createElement,n=s._self._c||t;return n("div",[n("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:s.active,callback:function(t){s.active=t},expression:"active"}},[n("van-tab",{attrs:{title:"报销信息"}},[null===s.someExpenseDetails?n("div",{staticClass:"zanwu"},[n("img",{attrs:{src:e("cecd"),alt:""}})]):n("ul",{staticClass:"servicel"},[n("h4",[s._v("基本信息")]),n("li",{staticClass:"title"},[n("span",[s._v("项目名称")]),n("span",[s._v(s._s(this.someExpenseDetails.项目名称))])]),n("li",[n("span",[s._v("项目类型")]),n("span",[s._v(s._s(this.someExpenseDetails.项目类型))])]),n("li",[n("span",[s._v("报销编号")]),n("span",[s._v(s._s(this.someExpenseDetails.报销编号))])]),n("li",[n("span",[s._v("报销金额")]),n("span",[s._v(s._s(this.someExpenseDetails.报销金额))])]),n("li",[n("span",[s._v("报销经费用途")]),n("span",[s._v(s._s(this.someExpenseDetails.报销经费用途))])]),n("li",[n("span",[s._v("报销方式")]),n("span",[s._v(s._s(this.someExpenseDetails.报销方式))])]),n("li",[n("span",[s._v("公务卡号")]),n("span",[s._v(s._s(this.someExpenseDetails.公务卡号))])]),n("li",[n("span",[s._v("公务卡所属人")]),n("span",[s._v(s._s(this.someExpenseDetails.公务卡所属人姓名))])]),n("li",[n("span",[s._v("报销时间")]),n("span",[s._v(s._s(s.startTime(this.someExpenseDetails.报销时间)))])]),n("li",[n("span",[s._v("报销人")]),n("span",[s._v(s._s(this.someExpenseDetails.报销人姓名))])]),n("li",[n("span",[s._v("报销人部门")]),n("span",[s._v(s._s(this.someExpenseDetails.报销人部门名称))])]),n("h4",[s._v("参会相关文件")]),n("li",[s._v("参会相关文件：")]),n("li",[n("a",{attrs:{href:this.someExpenseDetails.参会相关文件路径,download:""}},[s._v(s._s(s.Interception(this.someExpenseDetails.参会相关文件路径)))])])])]),n("van-tab",{attrs:{title:"审核记录"}},[0===s.expenseAudit.length?n("div",{staticClass:"zanwu"},[n("img",{attrs:{src:e("cecd"),alt:""}})]):s._l(s.expenseAudit,function(t,e){return n("ul",{key:e,staticClass:"audit"},[n("li",[n("span",[s._v("步骤名称")]),n("span",[s._v(s._s(t.名称))])]),n("li",[n("span",[s._v("处理人")]),n("span",[s._v(s._s(t.姓名))])]),n("li",[n("span",[s._v("部门")]),n("span",[s._v(s._s(t.部门名称))])]),n("li",[n("span",[s._v("当前状态")]),n("span",{style:{color:t.状态说明==s.state?"#31BD5D":"#FF976A"}},[s._v(s._s(t.状态说明))])]),n("li",[n("span",[s._v("执行时间")]),n("span",[n("i",{staticClass:"icon iconfont icon-shijian1"}),s._v("\n            "+s._s(s.startTimeB(t.执行时间))+"\n          ")])]),n("li",[n("span",[s._v("备注")]),n("span",[s._v(s._s(t.备注))])])])})],2),n("van-tab",{attrs:{title:"报销详情"}},[0===s.expenseList.length?n("div",{staticClass:"zanwu"},[n("img",{attrs:{src:e("cecd"),alt:""}})]):s._l(s.expenseList,function(t,e){return n("ul",{key:e,staticClass:"audit"},[n("li",[n("span",[s._v("报销科目")]),n("span",[s._v(s._s(t.财务科目))])]),n("li",[n("span",[s._v("支出类型")]),n("span",[s._v(s._s(t.项目支出类型))])]),n("li",[n("span",[s._v("支出内容")]),n("span",[s._v(s._s(t.项目支出内容))])]),n("li",[n("span",[s._v("批准经费")]),n("span",[s._v(s._s(s.NumFormat(t.批准经费)))])]),n("li",[n("span",[s._v("配套经费")]),n("span",[s._v(s._s(s.NumFormat(t.配套经费)))])]),n("li",[n("span",[s._v("已报销")]),n("span",[s._v(s._s(s.NumFormat(t.已报销金额)))])]),n("li",[n("span",[s._v("报销金额")]),n("span",[s._v(s._s(s.NumFormat(t.报销金额)))])]),n("li",[n("span",[s._v("备注")]),n("span",[s._v(s._s(t.备注))])])])})],2),n("ReturnTop"),n("ReturnBtn")],1)],1)},i=[],a=e("8169"),l={data:function(){return{someExpenseDetails:[],expenseAudit:[],expenseList:[],active:0,state:"审核通过"}},mounted:function(){this.goDetails()},methods:{goDetails:function(){var s=this,t={"报销编号":this.$route.params.item};this.$http.getSomeExpenseDetails(t).then(function(t){s.someExpenseDetails=t.data.报销基本信息,s.expenseAudit=t.data.报销审核记录,s.expenseList=t.data.本次报销项目列表})},startTime:function(s){return null!=s?s.slice(0,10):"待定"},startTimeB:function(s){return null===s?"待定":s},NumFormat:function(s){return Object(a["b"])(s)},Interception:function(s){return Object(a["a"])(s)}}},c=l,p=(e("8fcf"),e("2877")),u=Object(p["a"])(c,n,i,!1,null,"5b59a129",null);u.options.__file="reimbursementDetails.vue";t["default"]=u.exports},"4a39":function(s,t,e){},8169:function(s,t,e){"use strict";e.d(t,"b",function(){return n}),e.d(t,"a",function(){return i});e("28a5"),e("6b54"),e("a481"),e("c5f6");function n(s){if(!s)return"￥0.00";var t=0|Number(s),e=t.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),n=".00";s=String(s);var i=s.split(".");return 2==i.length?(n=i[1].toString(),1==n.length?"￥"+e+"."+n+"0 元":"￥"+e+"."+n+" 元"):"￥"+e+n+" 元"}function i(s){if(null!=s){var t=String(s);return t.split("\\")[1]}}},"8fcf":function(s,t,e){"use strict";var n=e("4a39"),i=e.n(n);i.a},cecd:function(s,t){s.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALsAAAA8CAYAAAA+JcsKAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyNTk2ZjZlMC0xNjRiLTQ0NGQtYTE3NS03NTVjNGQ5OTk5ZGMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RTIyMTcyNDU0MTdGMTFFODlDRUNEODA0N0Q1RjY4M0EiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RTIyMTcyNDQ0MTdGMTFFODlDRUNEODA0N0Q1RjY4M0EiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZjNmZjcyZTctMTBiMy04ZDQ3LWJkZDctNTU5ZGU2NzY0MGIyIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2ZlYzg3NGEtMzdkMS0xMWU4LWI5ZGMt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"}}]);