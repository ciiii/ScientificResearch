(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-5436"],{"0c4z":function(t,s,e){"use strict";var i=e("uYCM");e.n(i).a},"49BN":function(t,s,e){},"649X":function(t,s,e){"use strict";e.r(s);var i=e("cLjf"),a=e.n(i),n=e("hDQ3"),o=e.n(n),_=e("YHGi"),r=e("K3Y6"),v={name:"NoticeDetails",data:function(){return{item:{},isLoad:!1,peopleType:"",form:{},List:[],files:[],peoples:""}},mounted:function(){sessionStorage.getItem("item")&&(this.item=JSON.parse(sessionStorage.getItem("item")),this.getDetails(this.item.编号))},methods:{getUrl:function(t){return Object(r.m)(_.a+t)},getName:function(t){return Object(r.i)(t)},getDetails:function(){var t=o()(a.a.mark(function t(s){var e,i,n;return a.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return e={"编号":s},t.next=3,this.$http.myGet(_.h.GET_NOTICE_DETAILS,e);case 3:(i=t.sent)&&i.通知公告&&(this.form=i.通知公告,this.List=i.接收条件,this.form&&""!=this.form.相关文件路径&&(this.files=this.form.相关文件路径.split(",")),this.List&&this.List.length>0&&(this.peopleType=this.List[0].接收者类型,n=[],this.List.forEach(function(t){n.push(t.接收者名称)}),this.peoples=n.join()),this.isLoad=!0);case 5:case"end":return t.stop()}},t,this)}));return function(s){return t.apply(this,arguments)}}()}},l=(e("Evox"),e("0c4z"),e("ZrdR")),c=Object(l.a)(v,function(){var t=this,s=t.$createElement,e=t._self._c||s;return t.isLoad?e("div",{staticClass:"app-container page-common page-addStudent"},[e("div",{staticClass:"btn-back-box"},[e("el-button",{staticClass:"btn-back",attrs:{type:"primary",size:"mini",plain:""},on:{click:function(s){t.$router.go(-1)}}},[e("i",{staticClass:"iconfont iconfanhui"}),t._v(" 返回\n    ")])],1),t._v(" "),e("p",{staticClass:"item-title"},[e("span",{staticClass:"title"},[e("span",{staticClass:"type"},[t._v(t._s(t.form.通知类型))]),t._v(t._s(t.form.通知名称))])]),t._v(" "),e("h5",{staticClass:"title"},[t._v("基本信息：")]),t._v(" "),e("table",{staticClass:"mailTable"},[e("tr",[e("th",[t._v("通知名称")]),t._v(" "),e("td",{attrs:{colspan:"5"}},[t._v(t._s(t.form.通知名称))])]),t._v(" "),e("tr",[e("th",[t._v("通知类型")]),t._v(" "),e("td",[t._v(t._s(t.form.通知类型))]),t._v(" "),e("th",[t._v("发布人")]),t._v(" "),e("td",[t._v(t._s(t.form.发送人姓名))]),t._v(" "),e("th",[t._v("发布人部门")]),t._v(" "),e("td",[t._v(t._s(t.form.发送人部门名称))])]),t._v(" "),e("tr",[e("th",[t._v("是否启用")]),t._v(" "),e("td",[t._v(t._s(t.form.是否启用?"启用":"禁用"))]),t._v(" "),e("th",[t._v("发布时间")]),t._v(" "),e("td",[t._v(t._s(t._f("dataFormat")(t.form.建立时间,"yyyy-MM-dd")))]),t._v(" "),e("th",[t._v("关闭时间")]),t._v(" "),e("td",[t._v(t._s(t._f("dataFormat")(t.form.关闭时间,"yyyy-MM-dd")))])]),t._v(" "),e("tr",[e("th",[t._v("是否必读")]),t._v(" "),e("td",[t._v(t._s(t.form.是否必读?"是":"否"))]),t._v(" "),e("th",[t._v("接收类型")]),t._v(" "),e("td",[t._v(t._s(t.peopleType))]),t._v(" "),e("th",[t._v("已接收人数")]),t._v(" "),e("td",[t._v(t._s(t.form.已接收人数)+" 人")])]),t._v(" "),e("tr",[e("th",[t._v("接收者")]),t._v(" "),e("td",{attrs:{colspan:"5"}},[t._v(t._s(t.peoples))])])]),t._v(" "),e("h5",{staticClass:"title"},[t._v("相关文件：")]),t._v(" "),e("div",{staticClass:"files-list"},[e("ul",[t._l(t.files,function(s){return t.files.length>0?e("li",{key:s},[e("a",{attrs:{href:t.getUrl(s),download:"",target:"_blank"}},[e("i",{staticClass:"el-icon-document"}),t._v(" "+t._s(t.getName(s)))])]):t._e()}),t._v(" "),(t.files.length=0)?e("li",[t._v("无")]):t._e()],2)]),t._v(" "),e("h5",{staticClass:"title"},[t._v("通知内容：")]),t._v(" "),e("div",{staticClass:"tinymce-content",domProps:{innerHTML:t._s(t.form.通知内容?t.form.通知内容:"暂无")}}),t._v(" "),e("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[e("el-button",{on:{click:function(s){t.$router.go(-1)}}},[t._v("返回")])],1)]):t._e()},[],!1,null,"934dfaa6",null);c.options.__file="noticeDetails.vue";s.default=c.exports},Evox:function(t,s,e){"use strict";var i=e("49BN");e.n(i).a},uYCM:function(t,s,e){}}]);