(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2f19e585"],{4721:function(s,a,i){},"47d3":function(s,a,i){"use strict";var n=i("4721"),t=i.n(n);t.a},8169:function(s,a,i){"use strict";i.d(a,"b",function(){return n}),i.d(a,"a",function(){return t});i("28a5"),i("6b54"),i("a481"),i("c5f6");function n(s){if(!s)return"￥0.00";var a=0|Number(s),i=a.toString().replace(/(\d)(?=(?:\d{3})+$)/g,"$1,"),n=".00";s=String(s);var t=s.split(".");return 2==t.length?(n=t[1].toString(),1==n.length?"￥"+i+"."+n+"0 元":"￥"+i+"."+n+" 元"):"￥"+i+n+" 元"}function t(s){if(null!=s){var a=String(s);return a.split("\\")[1]}}},8410:function(s,a,i){"use strict";i.r(a);var n=function(){var s=this,a=s.$createElement,i=s._self._c||a;return i("div",[i("van-pull-refresh",{on:{refresh:s.onDownRefresh},model:{value:s.isDownLoading,callback:function(a){s.isDownLoading=a},expression:"isDownLoading"}},[i("van-list",{staticClass:"box",attrs:{finished:s.finished,"finished-text":"没有更多了"},on:{load:s.onLoad},model:{value:s.loading,callback:function(a){s.loading=a},expression:"loading"}},[i("div",{staticClass:"title"},[i("i",{staticClass:"icon iconfont icon-fankui"}),s._v("讲座反馈\n      ")]),s._l(s.FeedbackList,function(a,n){return i("div",{key:n,staticClass:"backContentBox"},[i("ul",{staticClass:"backContentTop",on:{click:function(i){s.goFeedbackDetails(a.编号)}}},[i("li",[s._v(s._s(a.活动名称))]),i("li",[i("span",[s._v("会议类型：")]),i("span",[s._v(s._s(a.会议类型))])]),i("li",[i("span",[s._v("所属部门：")]),i("span",[s._v(s._s(a.所属部门名称))])]),i("li",[i("span",[s._v("主办人：")]),i("span",[s._v(s._s(a.主办人姓名))])]),i("li",[i("span",[s._v("专家：")]),i("span",[s._v(s._s(a.专家姓名))])]),i("li",[i("span",[s._v("经费：")]),i("span",[s._v(s._s(s.NumFormat(a.活动经费)))])]),i("li",[i("span",[s._v("结算方式：")]),i("span",[s._v(s._s(a.结算方式))])]),i("li",[i("span",[s._v("当前步骤：")]),i("span",{attrs:{id:"contentSpan"}},[s._v(s._s(a.步骤名称)+" - "+s._s(a.步骤状态说明))])]),i("li",[i("span",[s._v("审核进度：")]),i("span",{style:{color:a.审核进度==s.flag1?"#31BD5D":"#ff976a"}},[s._v(s._s(a.审核进度))])]),i("li",[i("span",[s._v("参会人数：")]),i("span",[s._v(s._s(a.参会人数)+" 人")])]),i("li",[i("span",[s._v("开始时间：")]),i("span",[i("i",{staticClass:"icon iconfont icon-shijian1"}),s._v("\n              "+s._s(s.startTime(a.开始时间))+"\n            ")])])])])})],2)],1),i("van-popup",{staticClass:"popup",model:{value:s.show,callback:function(a){s.show=a},expression:"show"}},[i("van-tabs",{attrs:{swipeable:""},model:{value:s.active,callback:function(a){s.active=a},expression:"active"}},[i("van-tab",{attrs:{title:"讲座反馈详情"}},[i("ul",{staticClass:"servicel"},[i("h4",[s._v("讲座反馈基本信息")]),i("li",[i("span",[s._v("时长")]),i("span",[s._v(s._s(this.FeedbackDetails.活动持续分钟)+" 分钟")])]),i("li",[i("span",[s._v("人数")]),i("span",[s._v(s._s(this.FeedbackDetails.参会人数)+" 人")])]),i("h4",[s._v("讲座基本信息")]),i("li",[i("span",[s._v("活动名称")]),i("span",[s._v(s._s(this.FeedbackDetails.活动名称))])]),i("li",[i("span",[s._v("会议类型")]),i("span",[s._v(s._s(this.FeedbackDetails.会议类型))])]),i("li",[i("span",[s._v("经费")]),i("span",[s._v(s._s(s.NumFormat(this.FeedbackDetails.活动经费)))])]),i("li",[i("span",[s._v("活动对象")]),i("span",[s._v(s._s(this.FeedbackDetails.活动对象))])]),i("li",[i("span",[s._v("主办人部门")]),i("span",[s._v(s._s(this.FeedbackDetails.主办人部门名称))])]),i("li",[i("span",[s._v("主办人")]),i("span",[s._v(s._s(this.FeedbackDetails.主办人姓名))])]),i("li",[i("span",[s._v("内容概述")]),i("span",[s._v(s._s(this.FeedbackDetails.内容概述))])]),i("li",[i("span",[s._v("执行时间")]),i("span",[i("i",{staticClass:"icon iconfont icon-shijian1"}),s._v("\n              "+s._s(s.startTime(this.FeedbackDetails.开始时间))+"\n            ")])]),i("li",[i("span",[s._v("讲座地点")]),i("span",[s._v(s._s(this.FeedbackDetails.讲座地点))])]),i("h4",[s._v("主讲人信息")]),i("li",[i("span",[s._v("姓名")]),i("span",[s._v(s._s(this.FeedbackDetails.主讲人姓名))])]),i("li",[i("span",[s._v("国别")]),i("span",[s._v(s._s(this.FeedbackDetails.主讲人国别))])]),i("li",[i("span",[s._v("单位")]),i("span",[s._v(s._s(this.FeedbackDetails.主讲人单位))])]),i("li",[i("span",[s._v("学位")]),i("span",[s._v(s._s(this.FeedbackDetails.主讲人学位))])]),i("li",[i("span",[s._v("职称")]),i("span",[s._v(s._s(this.FeedbackDetails.主讲人职称))])]),i("h4",[s._v("经费信息")]),i("li",[i("span",[s._v("专家")]),i("span",[s._v(s._s(this.FeedbackDetails.专家姓名))])]),i("li",[i("span",[s._v("身份证")]),i("span",[s._v(s._s(this.FeedbackDetails.专家身份证号码))])]),i("li",[i("span",[s._v("护照")]),i("span",[s._v(s._s(this.FeedbackDetails.专家护照号))])]),i("li",[i("span",[s._v("联系方式")]),i("span",[s._v(s._s(this.FeedbackDetails.专家联系方式))])]),i("li",[i("span",[s._v("费用")]),i("span",[s._v(s._s(s.NumFormat(this.FeedbackDetails.专家讲课费金额)))])]),i("li",[i("span",[s._v("结算方式")]),i("span",[s._v(s._s(this.FeedbackDetails.结算方式))])])])]),i("van-tab",{attrs:{title:"审核情况"}},s._l(s.auditList,function(a,n){return i("ul",{key:n,staticClass:"audit"},[i("li",[i("span",[s._v("步骤名称")]),i("span",[s._v(s._s(a.名称))])]),i("li",[i("span",[s._v("处理人")]),i("span",[s._v(s._s(a.姓名))])]),i("li",[i("span",[s._v("状态")]),i("span",{style:{color:a.状态说明==s.flag?"#31BD5D":"#FF976A"}},[s._v(s._s(a.状态说明))])]),i("li",[i("span",[s._v("执行时间")]),i("span",[i("i",{staticClass:"icon iconfont icon-shijian1"}),s._v("\n              "+s._s(s.startTimeB(a.执行时间))+"\n            ")])]),i("li",[i("span",[s._v("备注")]),i("span",[s._v(s._s(a.备注))])])])}),0)],1),i("div",{staticClass:"backtrack",on:{click:s.backtrack}},[i("i",{staticClass:"icon iconfont icon-fanhui1"}),s._v(" 返回\n    ")])],1),i("ReturnBtn"),i("ReturnTop")],1)},t=[],e=i("8169"),l={inject:["reload"],data:function(){return{index:1,size:15,total:0,isDownLoading:!1,loading:!1,finished:!1,FeedbackList:[],FeedbackDetails:[],auditList:[],show:!1,active:0,flag:"审核通过",flag1:"已完成-审核通过"}},methods:{onLoad:function(){var s=this;this.$http.getFeedbackList(this.index,this.size).then(function(a){s.total=a.data.total;var i=s.FeedbackList;s.FeedbackList=i.concat(a.data.list),s.loading=!1,s.index++,s.FeedbackList.length>=s.total&&(s.finished=!0)})},onDownRefresh:function(){var s=this;setTimeout(function(){s.reload(),s.isDownLoading=!1},1e3)},formatState:function(s){return!0===s?"已反馈":!1===s?"未反馈":"未知"},startTime:function(s){return null!=s?s.slice(0,10):"暂无"},startTimeB:function(s){return null===s?"待定":s},NumFormat:function(s){return Object(e["b"])(s)},goFeedbackDetails:function(s){var a=this,i={"讲座反馈编号":s};this.$http.getFeedbackDetails(i).then(function(s){a.FeedbackDetails=s.data.讲座反馈详情,a.auditList=s.data.审核情况}),this.show=!0},backtrack:function(){this.show=!1}}},c=l,o=(i("47d3"),i("2877")),_=Object(o["a"])(c,n,t,!1,null,"5dfec538",null);a["default"]=_.exports}}]);