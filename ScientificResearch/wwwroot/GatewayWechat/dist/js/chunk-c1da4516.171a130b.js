(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-c1da4516"],{"3cbb":function(s,t,i){},8169:function(s,t,i){"use strict";i.d(t,"b",function(){return a}),i.d(t,"a",function(){return n});i("28a5"),i("6b54"),i("a481"),i("c5f6"),i("cadf"),i("551c"),i("097d");function a(s){if(!s)return"￥0.00";var t=0|Number(s),i=t.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),a=".00";s=String(s);var n=s.split(".");return 2==n.length?(a=n[1].toString(),1==a.length?"￥"+i+"."+a+"0 元":"￥"+i+"."+a+" 元"):"￥"+i+a+" 元"}function n(s){if(null!=s){var t=String(s);return t.split("\\")[1]}}},a7e1:function(s,t,i){"use strict";i.r(t);var a=function(){var s=this,t=s.$createElement,a=s._self._c||t;return a("section",[a("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:s.active,callback:function(t){s.active=t},expression:"active"}},[a("van-tab",{attrs:{title:"基本资料"}},[a("ul",{staticClass:"servicel"},[a("h4",[s._v("立项基本信息")]),a("li",[a("span",[s._v("项目中文名称")]),a("p",[s._v(s._s(this.detailslList.项目中文名称))])]),a("li",[a("span",[s._v("项目英文名称")]),a("span",[s._v(s._s(this.detailslList.项目英文名称))])]),a("li",[a("span",[s._v("项目编号")]),a("span",[s._v(s._s(this.detailslList.项目编号))])]),a("li",[a("span",[s._v("项目分类")]),a("span",[s._v(s._s(this.detailslList.项目分类))])]),a("li",[a("span",[s._v("成果归属部门")]),a("span",[s._v(s._s(this.detailslList.成果归属部门))])]),a("li",[a("span",[s._v("负责人")]),a("span",[s._v(s._s(this.detailslList.负责人姓名))])]),a("li",[a("span",[s._v("立项年度")]),a("span",[s._v(s._s(this.detailslList.立项年度))])]),a("li",[a("span",[s._v("登记日期")]),a("span",[s._v(s._s(s.startTime(this.detailslList.登记日期)))])]),a("li",[a("span",[s._v("批准日期")]),a("span",[s._v(s._s(s.startTime(this.detailslList.批准日期)))])]),a("li",[a("span",[s._v("登记人")]),a("span",[s._v(s._s(this.detailslList.登记人姓名))])]),a("li",[a("span",[s._v("经费卡号")]),a("span",[s._v(s._s(this.detailslList.经费卡号))])]),a("li",[a("span",[s._v("项目等级")]),a("span",[s._v(s._s(this.detailslList.项目等级))])]),a("li",[a("span",[s._v("计划完成日期")]),a("span",[s._v(s._s(s.startTime(this.detailslList.计划完成日期)))])]),a("li",[a("span",[s._v("学科门类")]),a("span",[s._v(s._s(this.detailslList.学科门类))])]),a("li",[a("span",[s._v("学科类型")]),a("span",[s._v(s._s(this.detailslList.学科类型))])]),a("li",[a("span",[s._v("研究类型")]),a("span",[s._v(s._s(this.detailslList.研究类型))])]),a("li",[a("span",[s._v("项目类型")]),a("span",[s._v(s._s(this.detailslList.项目类型))])]),a("li",[a("span",[s._v("项目级别")]),a("span",[s._v(s._s(this.detailslList.项目级别))])]),a("li",[a("span",[s._v("档案编号")]),a("span",[s._v(s._s(this.detailslList.档案编号))])]),a("li",[a("span",[s._v("财务简称")]),a("span",[s._v(s._s(this.detailslList.财务简称))])]),a("li",[a("span",[s._v("亚类说明")]),a("span",[s._v(s._s(this.detailslList.亚类说明))])]),a("li",[a("span",[s._v("附注说明")]),a("span",[s._v(s._s(this.detailslList.附注说明))])]),a("li",[a("span",[s._v("纵向项目合同类型")]),a("span",[s._v(s._s(this.detailslList.纵向项目合同类型))])]),a("li",[a("span",[s._v("国民经济行业")]),a("span",[s._v(s._s(this.detailslList.国民经济行业))])]),a("li",[a("span",[s._v("合作方式")]),a("span",[s._v(s._s(this.detailslList.合作形式))])]),a("li",[a("span",[s._v("社会经济目标")]),a("span",[s._v(s._s(this.detailslList.社会经济目标))])]),a("li",[a("span",[s._v("伦理批文编号")]),a("span",[s._v(s._s(this.detailslList.伦理批文编号))])]),a("li",[a("span",[s._v("伦理批文时间")]),a("span",[s._v(s._s(s.startTime(this.detailslList.伦理批文时间)))])]),a("li",[a("span",[s._v("备注")]),a("span",[s._v(s._s(this.detailslList.备注))])]),a("h4",[s._v("相关文件")]),a("li",[s._v("伦理批文附件：")]),a("li",[a("a",{attrs:{href:this.detailslList.伦理批文路径,download:""}},[s._v(s._s(s.Interception(this.detailslList.伦理批文路径)))])]),a("li",[s._v("立项文件：")]),a("li",[a("a",{attrs:{href:this.detailslList.立项文件路径,download:""}},[s._v(s._s(s.Interception(this.detailslList.立项文件路径)))])])])]),a("van-tab",{attrs:{title:"参与人信息"}},[a("h3",[s._v("参与人信息")]),s._l(s.relatedProjects,function(t,i){return a("ul",{key:i,staticClass:"servicel"},[a("li",[a("span",[s._v("参与人姓名")]),a("span",[s._v(s._s(t.姓名))])]),a("li",[a("span",[s._v("部门名称")]),a("span",[s._v(s._s(t.部门名称))])]),a("li",[a("span",[s._v("工作量占比(%)")]),a("span",[s._v(s._s(t.工作量占比))])]),a("li",[a("span",[s._v("建立时间")]),a("span",[s._v(s._s(s.startTime(t.建立时间)))])]),a("li",[a("span",[s._v("备注")]),a("span",[s._v(s._s(t.备注))])])])})],2),a("van-tab",{attrs:{title:"项目预算"}},[a("h3",[s._v("项目预算")]),a("div",{staticClass:"total"},[a("li",[a("span",[s._v("批准经费(元)")]),a("span",[s._v(s._s(s.NumFormat(this.detailslList.批准经费)))])]),a("li",[a("span",[s._v("配套经费(元)")]),a("span",[s._v(s._s(s.NumFormat(this.detailslList.配套经费)))])])]),s._l(s.authorInformation,function(t,i){return a("ul",{key:i,staticClass:"servicel"},[a("li",[a("span",[s._v("项目支出类型")]),a("span",[s._v(s._s(t.项目支出类型))])]),a("li",[a("span",[s._v("预算科目")]),a("span",[s._v(s._s(t.财务科目))])]),a("li",[a("span",[s._v("预算金额（批准经费：元）")]),a("span",[s._v(s._s(s.NumFormat(t.批准经费)))])]),a("li",[a("span",[s._v("预算金额（配套经费：元）")]),a("span",[s._v(s._s(s.NumFormat(t.配套经费)))])]),a("li",[a("span",[s._v("编制依据")]),a("span",[s._v(s._s(t.编制依据))])])])})],2),a("van-tab",{attrs:{title:"计划与目标"}},[0===s.PlansandObjectives.length?a("div",{staticClass:"zanwu"},[a("img",{attrs:{src:i("cecd"),alt:""}})]):s._l(s.PlansandObjectives,function(t,i){return a("ul",{key:i,staticClass:"servicel"},[a("li",[a("span",[s._v("计划开始时间")]),a("span",[s._v(s._s(t.计划开始时间))])]),a("li",[a("span",[s._v("计划结束时间")]),a("span",[s._v(s._s(t.计划结束时间))])]),a("li",[a("span",[s._v("计划内容")]),a("span",[s._v(s._s(t.计划内容))])])])})],2),a("van-tab",{attrs:{title:"专家评审"}},[a("h3",[s._v("专家评审")]),s._l(s.expertReview,function(t,i){return a("ul",{key:i,staticClass:"servicel"},[a("li",[a("span",[s._v("专家姓名")]),a("span",[s._v(s._s(t.专家姓名))])]),a("li",[a("span",[s._v("部门")]),a("span",[s._v(s._s(t.专家部门名称))])]),a("li",[a("span",[s._v("评分类型")]),a("span",[s._v(s._s(t.评分项))])]),a("li",[a("span",[s._v("评分")]),a("span",[s._v(s._s(t.评分))])]),a("li",[a("span",[s._v("评审时间")]),a("span",[s._v(s._s(s.startTime(t.建立时间)))])]),a("li",[a("span",[s._v("专家推荐意见")]),a("span",[s._v(s._s(t.备注))])])])})],2),a("van-tab",{attrs:{title:"审核记录"}},[a("h3",[s._v("审核记录")]),s._l(s.auditRecords,function(t,i){return a("ul",{key:i,staticClass:"audit"},[a("li",[a("span",[s._v("步骤名称")]),a("span",[s._v(s._s(t.名称))])]),a("li",[a("span",[s._v("处理人")]),a("span",[s._v(s._s(t.姓名))])]),a("li",[a("span",[s._v("处理人部门")]),a("span",[s._v(s._s(t.部门名称))])]),a("li",{staticClass:"state"},[a("span",[s._v("状态")]),a("span",{style:{color:t.状态说明==s.flag?"#FF976A":"#31BD5D"}},[s._v(s._s(t.状态说明))])]),a("li",[a("span",[s._v("执行时间")]),a("span",[a("i",{staticClass:"icon iconfont icon-shijian1"}),s._v("\n            "+s._s(s.startTimeB(t.执行时间))+"\n          ")])]),a("li",[a("span",[s._v("备注")]),a("span",[s._v(s._s(t.备注))])])])})],2),a("ReturnBtn")],1)],1)},n=[],l=(i("cadf"),i("551c"),i("097d"),i("8169")),e={data:function(){return{active:0,detailslList:[],relatedProjects:[],authorInformation:[],auditRecords:[],PlansandObjectives:[],expertReview:[],flag:"待审核"}},mounted:function(){this.goDetails()},methods:{goDetails:function(){var s=this,t={"纵向项目中检编号":this.$route.params.item};this.$http.getYProcessInspectionDetails(t).then(function(t){s.detailslList=t.data.立项基本信息,s.relatedProjects=t.data.参与人信息,s.authorInformation=t.data.财务信息,s.PlansandObjectives=t.data.项目计划与目标,s.expertReview=t.data.中检专家评审,s.auditRecords=t.data.中检审核记录})},startTime:function(s){return null!=s?s.slice(0,10):"待定"},startTimeB:function(s){return null===s?"待定":s},NumFormat:function(s){return Object(l["b"])(s)},Interception:function(s){return Object(l["a"])(s)},conversionState:function(s){return 1==s?"是":0==s?"否":" "}}},v=e,_=(i("e8e3"),i("2877")),p=Object(_["a"])(v,a,n,!1,null,"7fe11236",null);p.options.__file="YProcessInspectionDetails.vue";t["default"]=p.exports},cecd:function(s,t){s.exports="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAALsAAAA8CAYAAAA+JcsKAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA4RpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMDY3IDc5LjE1Nzc0NywgMjAxNS8wMy8zMC0yMzo0MDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDoyNTk2ZjZlMC0xNjRiLTQ0NGQtYTE3NS03NTVjNGQ5OTk5ZGMiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6RTIyMTcyNDU0MTdGMTFFODlDRUNEODA0N0Q1RjY4M0EiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6RTIyMTcyNDQ0MTdGMTFFODlDRUNEODA0N0Q1RjY4M0EiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTUgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6ZjNmZjcyZTctMTBiMy04ZDQ3LWJkZDctNTU5ZGU2NzY0MGIyIiBzdFJlZjpkb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6Y2ZlYzg3NGEtMzdkMS0xMWU4LWI5ZGMt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"},e8e3:function(s,t,i){"use strict";var a=i("3cbb"),n=i.n(a);n.a}}]);