(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-27581fa7"],{"525a":function(t,s,i){"use strict";i.r(s);var a=function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("section",[i("van-tabs",{staticClass:"popup",attrs:{swipeable:""},model:{value:t.active,callback:function(s){t.active=s},expression:"active"}},[i("van-tab",{attrs:{title:"通知内容"}},[i("ul",{staticClass:"servicel"},[i("h4",[t._v("通知内容")]),i("div",{class:{active:t.active==this.detailslList.通知内容},domProps:{innerHTML:t._s(this.detailslList.通知内容)}})])]),i("van-tab",{attrs:{title:"相关文件"}},[i("ul",{staticClass:"servicel"},[i("h4",[t._v("相关文件")]),i("li",[t._v("附件：")]),i("li",[i("a",{attrs:{href:this.detailslList.相关文件路径,download:""}},[t._v(t._s(t.Interception(this.detailslList.相关文件路径)))])])])]),i("van-tab",{attrs:{title:"基本信息"}},[i("h3",[t._v("基本信息")]),i("ul",{staticClass:"servicel"},[i("li",{staticClass:"title"},[i("span",[t._v("通知名称")]),i("span",[t._v(t._s(this.detailslList.通知名称))])]),i("li",[i("span",[t._v("通知类型")]),i("span",[t._v(t._s(this.detailslList.通知类型))])]),i("li",[i("span",[t._v("发布人")]),i("span",[t._v(t._s(this.detailslList.发送人姓名))])]),i("li",[i("span",[t._v("部门")]),i("span",[t._v(t._s(this.detailslList.发送人部门名称))])]),i("li",[i("span",[t._v("接收人数")]),i("span",[t._v(t._s(this.detailslList.接收人数))])]),i("li",[i("span",[t._v("已接收人数")]),i("span",[t._v(t._s(this.detailslList.已接收人数))])]),i("li",[i("span",[t._v("是否必读")]),i("span",[t._v(t._s(t.conversionState(this.detailslList.是否必读)))])]),i("li",[i("span",[t._v("发布时间")]),i("span",[t._v(t._s(t.startTime(this.detailslList.建立时间)))])]),i("li",[i("span",[t._v("关闭时间")]),i("span",[t._v(t._s(t.startTime(this.detailslList.关闭时间)))])]),i("li",[i("span",[t._v("状态")]),i("span",[t._v(t._s(t.conversionStateB(this.detailslList.是否启用)))])])]),i("h3",[t._v("接受条件")]),t._l(t.relatedProjects,function(s,a){return i("ul",{key:a,staticClass:"servicel"},[i("li",[i("span",[t._v("接收者类型")]),i("span",[t._v(t._s(s.接收者类型名称))])]),i("li",[i("span",[t._v("接收者")]),i("span",[t._v(t._s(s.接收者名称))])])])})],2),i("ReturnTop"),i("ReturnBtn")],1)],1)},n=[],e=i("8169"),l={data:function(){return{active:0,detailslList:[],relatedProjects:[]}},mounted:function(){this.goDetails()},methods:{goDetails:function(){var t=this,s={"编号":this.$route.params.item};this.$http.getKYNewsDetails(s).then(function(s){t.detailslList=s.data.通知公告,t.relatedProjects=s.data.接收条件})},startTime:function(t){return null!=t?t.slice(0,10):void 0},Interception:function(t){return Object(e["a"])(t)},conversionState:function(t){return 1==t?"是":0==t?"否":" "},conversionStateB:function(t){return 1==t?"正常":0==t?"未启用":" "}}},r=l,c=(i("5f30"),i("2877")),v=Object(c["a"])(r,a,n,!1,null,"e9ced62e",null);s["default"]=v.exports},"5f30":function(t,s,i){"use strict";var a=i("6d04"),n=i.n(a);n.a},"6d04":function(t,s,i){},8169:function(t,s,i){"use strict";i.d(s,"b",function(){return a}),i.d(s,"a",function(){return n});i("28a5"),i("6b54"),i("a481"),i("c5f6");function a(t){if(!t)return"￥0.00";var s=0|Number(t),i=s.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),a=".00";t=String(t);var n=t.split(".");return 2==n.length?(a=n[1].toString(),1==a.length?"￥"+i+"."+a+"0 元":"￥"+i+"."+a+" 元"):"￥"+i+a+" 元"}function n(t){if(null!=t){var s=String(t);return s.split("\\")[1]}}}}]);