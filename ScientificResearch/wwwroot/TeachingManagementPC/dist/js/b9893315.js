(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-5642"],{"+FKV":function(t,s,i){"use strict";var e=i("MKWN");i.n(e).a},"4ETA":function(t,s,i){"use strict";i.r(s);var e={name:"MajorDetails",data:function(){return{item:{},isLoad:!1}},mounted:function(){console.info(sessionStorage.getItem("item")),sessionStorage.getItem("item")&&(this.item=JSON.parse(sessionStorage.getItem("item")),this.isLoad=!0)},methods:{}},a=(i("+FKV"),i("ZrdR")),n=Object(a.a)(e,function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("div",{staticClass:"app-container page-common page-addStudent"},[i("div",{staticClass:"btn-back-box"},[i("el-button",{staticClass:"btn-back",attrs:{type:"primary",size:"mini",plain:""},on:{click:function(s){t.$router.go(-1)}}},[i("i",{staticClass:"iconfont iconfanhui"}),t._v(" 返回\n    ")])],1),t._v(" "),i("h5",{staticClass:"title"},[t._v("基本信息：")]),t._v(" "),i("table",{staticClass:"mailTable"},[i("tr",[i("th",[t._v("专业名称")]),t._v(" "),i("td",[t._v(t._s(t.item.名称))]),t._v(" "),i("th",[t._v("专业年份")]),t._v(" "),i("td",[t._v(t._s(t.item.年份)+"年")])]),t._v(" "),i("tr",[i("th",[t._v("最低培训时长")]),t._v(" "),i("td",[t._v(t._s(t.item.最低培训时长))]),t._v(" "),i("th",[t._v("标准代码")]),t._v(" "),i("td",[t._v(t._s(t.item.标准代码))])]),t._v(" "),i("tr",[i("th",[t._v("是否国家标准")]),t._v(" "),i("td",{attrs:{colspan:"3"}},[t._v(t._s(t.item.是否国家标准?"是":"否"))])])]),t._v(" "),i("h5",{staticClass:"title"},[t._v("学习要求及目标：")]),t._v(" "),i("div",{staticClass:"tinymce-content",domProps:{innerHTML:t._s(t.item.学习要求及目标)}}),t._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:function(s){t.$router.go(-1)}}},[t._v("返回")])],1)])},[],!1,null,"699449d8",null);n.options.__file="majorDetails.vue";s.default=n.exports},MKWN:function(t,s,i){}}]);