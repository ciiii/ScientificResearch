(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-f3310208"],{"40f6":function(t,s,a){"use strict";var i=a("6bc9"),n=a.n(i);n.a},"6bc9":function(t,s,a){},8169:function(t,s,a){"use strict";a.d(s,"b",function(){return i}),a.d(s,"a",function(){return n});a("28a5"),a("6b54"),a("a481"),a("c5f6");function i(t){if(!t)return"￥0.00";var s=0|Number(t),a=s.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),i=".00";t=String(t);var n=t.split(".");return 2==n.length?(i=n[1].toString(),1==i.length?"￥"+a+"."+i+"0 元":"￥"+a+"."+i+" 元"):"￥"+a+i+" 元"}function n(t){if(null!=t){var s=String(t);return s.split("\\")[1]}}},"85e4":function(t,s,a){"use strict";a.r(s);var i=function(){var t=this,s=t.$createElement,a=t._self._c||s;return a("section",[a("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:t.active,callback:function(s){t.active=s},expression:"active"}},[a("van-tab",{attrs:{title:"到账信息"}},[a("ul",{staticClass:"servicel"},[a("h4",[t._v("到账信息")]),a("li",[a("span",[t._v("拨款单位")]),a("span",[t._v(t._s(this.detailslList.拨款单位))])]),a("li",[a("span",[t._v("到账金额")]),a("span",[t._v(t._s(t.NumFormat(this.detailslList.到账金额)))])]),a("li",[a("span",[t._v("到账日期")]),a("span",[t._v(t._s(t.startTime(this.detailslList.到账日期)))])]),a("li",[a("span",[t._v("管理费用")]),a("span",[t._v(t._s(t.NumFormat(this.detailslList.管理费用)))])]),a("li",[a("span",[t._v("到账单位")]),a("span",[t._v(t._s(this.detailslList.到账单位))])]),a("li",[a("span",[t._v("技术合同认定服务费")]),a("span",[t._v(t._s(t.NumFormat(this.detailslList.技术合同认定服务费)))])]),a("li",[a("span",[t._v("技术交易额")]),a("span",[t._v(t._s(t.NumFormat(this.detailslList.技术交易额)))])]),a("li",[a("span",[t._v("增值税")]),a("span",[t._v(t._s(t.NumFormat(this.detailslList.增值税)))])]),a("li",[a("span",[t._v("到账单位")]),a("span",[t._v(t._s(this.detailslList.到账单位))])]),a("li",[a("span",[t._v("备注")]),a("span",[t._v(t._s(this.detailslList.备注))])]),a("h4",[t._v("到账凭证")]),a("li",[t._v("附件：")]),a("li",[a("a",{attrs:{href:this.detailslList.到账凭证路径,download:""}},[t._v(t._s(t.Interception(this.detailslList.到账凭证路径)))])])])]),a("van-tab",{attrs:{title:"基本信息"}},[a("ul",{staticClass:"servicel"},[a("h4",[t._v("项目基本信息")]),a("li",[a("span",[t._v("合同名称")]),a("p",[t._v(t._s(this.relatedProjects.合同名称))])]),a("li",[a("span",[t._v("合同编号")]),a("span",[t._v(t._s(this.relatedProjects.合同编号))])]),a("li",[a("span",[t._v("项目负责人")]),a("span",[t._v(t._s(this.relatedProjects.项目负责人姓名))])]),a("li",[a("span",[t._v("负责人部门")]),a("span",[t._v(t._s(this.relatedProjects.项目负责人部门名称))])]),a("li",[a("span",[t._v("归属部门")]),a("span",[t._v(t._s(this.relatedProjects.项目归属部门))])]),a("li",[a("span",[t._v("合同金额")]),a("span",[t._v(t._s(t.NumFormat(this.relatedProjects.合同金额)))])]),a("li",[a("span",[t._v("合同总经费")]),a("span",[t._v(t._s(t.NumFormat(this.relatedProjects.经费)))])]),a("li",[a("span",[t._v("未到账经费")]),a("span",[t._v(t._s(t.NumFormat(this.relatedProjects.未到经费)))])]),a("li",[a("span",[t._v("待审核到账")]),a("span",[t._v(t._s(t.NumFormat(this.relatedProjects.待审核到账)))])]),a("li",[a("span",[t._v("已审核到账")]),a("span",[t._v(t._s(t.NumFormat(this.relatedProjects.已审核到账)))])]),a("li",[a("span",[t._v("签订时间")]),a("span",[t._v(t._s(t.startTime(this.relatedProjects.签订时间)))])])])]),a("van-tab",{attrs:{title:"审核记录"}},[a("h3",[t._v("审核记录")]),t._l(t.auditRecords,function(s,i){return a("ul",{key:i,staticClass:"audit"},[a("li",[a("span",[t._v("步骤名称")]),a("span",[t._v(t._s(s.名称))])]),a("li",[a("span",[t._v("处理人")]),a("span",[t._v(t._s(s.姓名))])]),a("li",[a("span",[t._v("处理人部门")]),a("span",[t._v(t._s(s.部门名称))])]),a("li",[a("span",[t._v("状态")]),a("span",{style:{color:s.状态说明==t.flag?"#FF976A":"#31BD5D"}},[t._v(t._s(s.状态说明))])]),a("li",[a("span",[t._v("执行时间")]),a("span",[a("i",{staticClass:"icon iconfont icon-shijian1"}),t._v("\n            "+t._s(t.startTimeB(s.执行时间))+"\n          ")])]),a("li",[a("span",[t._v("备注")]),a("span",[t._v(t._s(s.备注))])])])})],2),a("ReturnBtn")],1)],1)},n=[],e=a("8169"),l={data:function(){return{active:0,detailslList:[],relatedProjects:[],auditRecords:[],flag:"待审核"}},mounted:function(){this.goDetails()},methods:{goDetails:function(){var t=this,s={"横向项目到账编号":this.$route.params.item};this.$http.getXFundsToTheAccountDetails(s).then(function(s){console.log(s,">>>>>"),t.detailslList=s.data.横向项目到账详情,t.relatedProjects=s.data.横向项目立项详情,t.auditRecords=s.data.横向项目到账审核记录})},startTime:function(t){return null!=t?t.slice(0,10):"待定"},startTimeB:function(t){return null===t?"待定":t},NumFormat:function(t){return Object(e["b"])(t)},Interception:function(t){return Object(e["a"])(t)}}},r=l,_=(a("40f6"),a("2877")),o=Object(_["a"])(r,i,n,!1,null,"a54b2c24",null);o.options.__file="XFundsToTheAccount.vue";s["default"]=o.exports}}]);