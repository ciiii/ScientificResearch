(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-635e287b"],{"3b7a":function(s,t,i){"use strict";var n=i("8d29"),e=i.n(n);e.a},"429b":function(s,t,i){"use strict";i.r(t);var n=function(){var s=this,t=s.$createElement,i=s._self._c||t;return i("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:s.active,callback:function(t){s.active=t},expression:"active"}},[i("van-tab",{attrs:{title:"参加会议详情"}},[i("ul",{staticClass:"servicel"},[i("h4",[s._v("基本信息")]),i("li",{staticClass:"title"},[i("span",[s._v("会议名称")]),i("span",[s._v(s._s(this.servicelList.会议名称))])]),i("li",[i("span",[s._v("主办单位")]),i("span",[s._v(s._s(this.servicelList.会议主办单位))])]),i("li",[i("span",[s._v("承办单位")]),i("span",[s._v(s._s(this.servicelList.会议承办单位))])]),i("li",[i("span",[s._v("申请人")]),i("span",[s._v(s._s(this.servicelList.申请人姓名))])]),i("li",[i("span",[s._v("申请人部门")]),i("span",[s._v(s._s(this.servicelList.申请人部门名称))])]),i("li",[i("span",[s._v("研讨领域")]),i("span",[s._v(s._s(this.servicelList.研讨领域))])]),i("li",[i("span",[s._v("学科类型")]),i("span",[s._v(s._s(this.servicelList.学科类型))])]),i("li",[i("span",[s._v("开始时间")]),i("span",[s._v(s._s(s.startTime(this.servicelList.会议开始时间)))])]),i("li",[i("span",[s._v("结束时间")]),i("span",[s._v(s._s(s.startTime(this.servicelList.会议结束时间)))])]),i("li",[i("span",[s._v("会议网址")]),i("a",{attrs:{href:this.servicelList.会议网址}},[s._v(s._s(this.servicelList.会议网址))])]),i("li",[i("span",[s._v("会议地址")]),i("span",[s._v(s._s(this.servicelList.会议地址))])]),i("li",[i("span",[s._v("往返时间")]),i("span",[s._v(s._s(this.servicelList.往返时间)+" 天")])]),i("h4",[s._v("会议简介及申请理由")]),i("li",{staticClass:"title"},[i("span",[s._v("会议简介：")]),i("span",[s._v(s._s(this.servicelList.会议简介及申请理由))])]),i("h4",[s._v("参会相关文件")]),i("li",[s._v("参会相关文件：")]),i("li",[i("a",{attrs:{href:this.servicelList.参会相关文件路径,download:""}},[s._v(s._s(s.Interception(this.servicelList.参会相关文件路径)))])])])]),i("van-tab",{attrs:{title:"申请记录"}},s._l(s.auditList,function(t,n){return i("ul",{key:n,staticClass:"audit"},[i("li",[i("span",[s._v("步骤名称")]),i("span",[s._v(s._s(t.名称))])]),i("li",[i("span",[s._v("处理人")]),i("span",[s._v(s._s(t.姓名))])]),i("li",[i("span",[s._v("状态")]),i("span",{style:{color:t.状态说明==s.flag?"#31BD5D":"#FF976A"}},[s._v(s._s(t.状态说明))])]),i("li",[i("span",[s._v("执行时间")]),i("span",[i("i",{staticClass:"icon iconfont icon-shijian1"}),s._v("\n          "+s._s(s.conversionTime(t.执行时间))+"\n        ")])]),i("li",[i("span",[s._v("备注")]),i("span",[s._v(s._s(t.备注))])])])}),0),i("ReturnTop"),i("ReturnBtn")],1)},e=[],a=i("8169"),l={data:function(){return{servicelList:[],auditList:[],active:0,flag:"审核通过"}},created:function(){},mounted:function(){this.getDetails()},methods:{getDetails:function(){var s=this,t={"参加会议编号":this.$route.params.item};this.$http.getMeetingDetails(t).then(function(t){s.servicelList=t.data.参加会议详情,s.auditList=t.data.申请情况})},startTime:function(s){return null!=s?s.slice(0,10):"待定"},conversionTime:function(s){return null!=s?s:"待定"},Interception:function(s){return Object(a["a"])(s)}}},r=l,v=(i("3b7a"),i("2877")),c=Object(v["a"])(r,n,e,!1,null,"2124dab2",null);t["default"]=c.exports},8169:function(s,t,i){"use strict";i.d(t,"b",function(){return n}),i.d(t,"a",function(){return e});i("28a5"),i("6b54"),i("a481"),i("c5f6");function n(s){if(!s)return"￥0.00";var t=0|Number(s),i=t.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),n=".00";s=String(s);var e=s.split(".");return 2==e.length?(n=e[1].toString(),1==n.length?"￥"+i+"."+n+"0 元":"￥"+i+"."+n+" 元"):"￥"+i+n+" 元"}function e(s){if(null!=s){var t=String(s);return t.split("\\")[1]}}},"8d29":function(s,t,i){}}]);