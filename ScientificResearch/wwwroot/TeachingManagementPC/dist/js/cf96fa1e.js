(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-3b85"],{"+yPC":function(t,e,i){"use strict";var n=i("94bN");i.n(n).a},"4bzO":function(t,e,i){},"94bN":function(t,e,i){},EpUG:function(t,e,i){"use strict";var n=i("4bzO");i.n(n).a},ktv3:function(t,e,i){"use strict";function n(t,e,i){""==e||void 0==e||null==e?i():/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(e)||""==e?i():i(new Error("请输入正确的身份证号码！"))}function s(t,e,i){""==e||void 0==e||null==e?i():/^[1][3,4,5,7,8][0-9]{9}$/.test(e)||""==e?i():i(new Error("请输入正确的电话号码！"))}function r(t,e,i){if(!e)return i(new Error("输入不可以为空！"));setTimeout(function(){if(Number(e)){/^[0-9]*[1-9][0-9]*$/.test(e)?i():i(new Error("请输入正整数！"))}else i(new Error("请输入正整数！"))},0)}i.d(e,"b",function(){return n}),i.d(e,"c",function(){return s}),i.d(e,"a",function(){return r})},rHQF:function(t,e,i){"use strict";i.r(e);var n=i("YHGi"),s=i("UZgM"),r=i("cLjf"),a=i.n(r),o=i("hDQ3"),l=i.n(o),c=i("K3Y6"),u=i("ktv3"),m={name:"addStudentEntry",props:["item"],data:function(){return{list:[],form:{"教学轮转编号":0,"带教老师编号":null},rules:{"带教老师编号":[{required:!0,message:"请选择带教老师！",trigger:"blur"},{validator:u.a}]},state:"",isLoad:!1,teachers:[]}},mounted:function(){this.form.教学轮转编号=this.item.编号,this.item.计划入科日期=Object(c.h)(this.item.计划入科日期,"yyyy-MM-dd"),this.item.计划出科日期=Object(c.h)(this.item.计划出科日期,"yyyy-MM-dd"),this.isLoad=!0,this.getTeachers(this.item.本院科室编号)},methods:{cancelHandler:function(){this.$emit("myEvent")},getTeachers:function(){var t=l()(a.a.mark(function t(e){var i,s;return a.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return i={"科室编号":e},t.next=3,this.$http.myGet(n.i.GET_DEPARTMENT_TEACHING_TEACHER,i);case 3:(s=t.sent)&&s.length>0?this.teachers=s:this.teachers=[];case 5:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}(),getStates:function(t){switch(t){case"未入科":return"warning";case"在科":return"success";case"已出科":return"primary"}},confirmHandler:Object(c.a)(function(){var t=this;this.$refs.form.validate(function(e){if(!e)return t.$message.error("信息有误！"),!1;t.addStudentEntry(t.form)})},300),addStudentEntry:function(){var t=l()(a.a.mark(function t(e){return a.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myPost(n.m.POST_STUDENT_ENTRY,e);case 2:this.$message.success("提交成功！"),this.$emit("myEvent",!1);case 4:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}()}},d=(i("EpUG"),i("ZrdR")),f=Object(d.a)(m,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"content-box"},[i("el-form",{ref:"form",attrs:{model:t.form,rules:t.rules,"label-width":"130px",size:"small"}},[i("el-form-item",{attrs:{label:"学员姓名"}},[i("el-input",{attrs:{disabled:""},model:{value:t.item.学员姓名,callback:function(e){t.$set(t.item,"学员姓名",e)},expression:"item.学员姓名"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"本院科室"}},[i("el-input",{attrs:{disabled:""},model:{value:t.item.本院科室名称,callback:function(e){t.$set(t.item,"本院科室名称",e)},expression:"item.本院科室名称"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"计划入科日期"}},[i("el-input",{attrs:{disabled:""},model:{value:t.item.计划入科日期,callback:function(e){t.$set(t.item,"计划入科日期",e)},expression:"item.计划入科日期"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"计划出科日期"}},[i("el-input",{attrs:{disabled:""},model:{value:t.item.计划出科日期,callback:function(e){t.$set(t.item,"计划出科日期",e)},expression:"item.计划出科日期"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"状态"}},[i("el-tag",{attrs:{type:t.getStates(t.item.状态),size:"small"}},[t._v(t._s(t.item.状态))])],1),t._v(" "),i("el-form-item",{attrs:{label:"带教老师",prop:"带教老师编号"}},[i("el-select",{attrs:{placeholder:"请选择"},model:{value:t.form.带教老师编号,callback:function(e){t.$set(t.form,"带教老师编号",e)},expression:"form.带教老师编号"}},t._l(t.teachers,function(t){return i("el-option",{key:t.带教老师编号,attrs:{label:t.姓名,value:t.带教老师编号}})}))],1)],1),t._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:t.cancelHandler}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.confirmHandler}},[t._v("确 定")])],1)],1)},[],!1,null,"2d5525e3",null);f.options.__file="addStudentEntry.vue";var h=f.exports,v={components:{rotationList:s.a,addStudentEntry:h},data:function(){return{item:{},state:"轮转计划已安排",isDialog:!1,isAdd:!1,isLoad:!1}},created:function(){this.$route.query.state&&(this.state=this.$route.query.state)},mounted:function(){this.isLoad=!0},methods:{myEvent:function(t,e,i){new Date(i.计划入科日期).getTime()<=(new Date).getTime()?(this.item=i,this.isAdd=!0,"未入科"==i.状态?this.isDialog=!0:this.$message.error("学员已经是【"+i.状态+"】状态！")):this.$message.error("还未到入科日期！")},myEventDialog:function(){var t=this;this.isDialog=!1,this.isLoad=!1,setTimeout(function(){t.isLoad=!0},50)}}},p=(i("+yPC"),Object(d.a)(v,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"app-container page-common page-rotaion"},[i("h4",{staticClass:"page-title",attrs:{align:"center"}},[t._v("学员入科")]),t._v(" "),t._m(0),t._v(" "),t.isLoad?i("rotationList",{attrs:{state:t.state},on:{myEvent:t.myEvent}}):t._e(),t._v(" "),t.isDialog?i("el-dialog",{staticClass:"common-dialog",attrs:{title:"学员入科",visible:t.isDialog,"close-on-click-modal":!1,width:"30%"},on:{"update:visible":function(e){t.isDialog=e}}},[i("addStudentEntry",{ref:"child",attrs:{item:t.item,isAdd:t.isAdd},on:{myEvent:t.myEventDialog}})],1):t._e()],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("div",{staticClass:"btn-box",attrs:{align:"center"}},[e("span",{staticClass:"explain"},[this._v("(说明：点击科室可添加学员入科操作。)")])])}],!1,null,"4b6ebddf",null));p.options.__file="index.vue";e.default=p.exports}}]);