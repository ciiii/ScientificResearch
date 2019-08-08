(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-4a86"],{"/L2C":function(t,e,i){"use strict";var s=i("cLjf"),a=i.n(s),r=i("hDQ3"),o=i.n(r),n=i("YHGi"),l=i("K3Y6"),c=i("mB0Z"),m=i("jThu"),u={name:"addEditRecordForm",props:["item","isAdd"],components:{selectDate:c.a,uploadFileOrImg:m.a},data:function(){return{form:{"编号":0,"教学轮转编号":"","处理日期":Object(l.h)(new Date,"yyyy-MM-dd"),"处理类别":"","处理原因":"","处理意见":"","学员姓名":"","本院科室名称":"","附件":""},rules:{"处理类别":[{required:!0,message:"请输入处理类别！",trigger:"blur"}],"处理日期":[{required:!0,message:"请选择处理日期！",trigger:"blur"}],"处理原因":[{required:!0,message:"请输入处理原因！",trigger:"blur"}],"处理意见":[{required:!0,message:"请输入处理意见！",trigger:"blur"}]},url:Object(l.m)(n.a+n.m.POST_UPLOAD_MEDICAL_ERROR_RECORD),types:[],isLoad:!1,isShow:!1,isDialog:!1,selectStudents:[],files:[],itemData:{}}},mounted:function(){this.isAdd?(this.form.教学轮转编号=this.item.编号,this.form.学员姓名=this.item.学员姓名,this.form.本院科室名称=this.item.本院科室名称):(this.form=Object(l.g)(this.item),""!=this.form.附件&&(this.files=this.form.附件.split(","))),this.getTypes(),this.isLoad=!0},methods:{cancelHandler:function(){this.$emit("myEvent")},getTypes:function(){var t=o()(a.a.mark(function t(){var e,i;return a.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return e={"分类":"教学医疗事故处理类别"},t.next=3,this.$http.myGet(n.f.GET_TYPE_DICTIONARY,e);case 3:(i=t.sent)&&i.length>0&&(this.types=i.reverse());case 5:case"end":return t.stop()}},t,this)}));return function(){return t.apply(this,arguments)}}(),myGetDate:function(t){this.form.处理日期=t},getStates:function(t){switch(t){case"未入科":return"warning";case"在科":return"success";case"已出科":return"primary"}},myEventFiles:function(t){this.files.push(t)},removeFile:function(t){this.files.splice(this.files.findIndex(function(e){return e==t}),1)},confirmHandler:Object(l.a)(function(){var t=this;this.$refs.form.validate(function(e){if(!e)return t.$message.error("信息有误！"),!1;t.files&&t.files.length>0&&(t.form.附件=t.files.join()),t.addEditRecord(t.form)})},300),addEditRecord:function(){var t=o()(a.a.mark(function t(e){return a.a.wrap(function(t){for(;;)switch(t.prev=t.next){case 0:return t.next=2,this.$http.myPost(n.m.POST_ADD_EDIT_MEDICAL_ERROR_RECORD,e);case 2:this.$message.success("提交成功！"),this.isAdd?this.$router.push({path:"/recordList"}):this.$emit("myEvent");case 4:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}()}},d=i("ZrdR"),f=Object(d.a)(u,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"content-box"},[t.isLoad?i("el-form",{ref:"form",staticClass:"demo-ruleForm",attrs:{model:t.form,rules:t.rules,"label-width":"120px",size:"small"}},[i("el-form-item",{attrs:{label:"学员姓名"}},[i("el-input",{attrs:{disabled:""},model:{value:t.form.学员姓名,callback:function(e){t.$set(t.form,"学员姓名",e)},expression:"form.学员姓名"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"本院科室"}},[i("el-input",{attrs:{disabled:""},model:{value:t.form.本院科室名称,callback:function(e){t.$set(t.form,"本院科室名称",e)},expression:"form.本院科室名称"}})],1),t._v(" "),i("el-form-item",{attrs:{label:"处理类别",prop:"处理类别"}},[i("el-select",{attrs:{placeholder:"请选择",width:"80%"},model:{value:t.form.处理类别,callback:function(e){t.$set(t.form,"处理类别",e)},expression:"form.处理类别"}},t._l(t.types,function(t){return i("el-option",{key:t.编号,attrs:{label:t.值,value:t.值}})}))],1),t._v(" "),i("el-form-item",{attrs:{label:"处理日期",prop:"处理日期"}},[i("selectDate",{ref:"date",attrs:{date:t.form.处理日期,type:"date",format:"yyyy-MM-dd",title:"选择日期"},on:{myEvent:t.myGetDate}})],1),t._v(" "),i("el-form-item",{staticClass:"uploadFile-box el-form-item-block",attrs:{label:"附件",prop:"附件"}},[i("uploadFileOrImg",{attrs:{url:t.url,files:t.files},on:{myEvent:t.myEventFiles,removeFile:t.removeFile}})],1),t._v(" "),i("el-form-item",{staticClass:"el-form-item-block",attrs:{label:"处理原因",prop:"处理原因"}},[i("el-input",{attrs:{type:"textarea"},model:{value:t.form.处理原因,callback:function(e){t.$set(t.form,"处理原因",e)},expression:"form.处理原因"}})],1),t._v(" "),i("el-form-item",{staticClass:"el-form-item-block",attrs:{label:"处理意见",prop:"处理意见"}},[i("el-input",{attrs:{type:"textarea"},model:{value:t.form.处理意见,callback:function(e){t.$set(t.form,"处理意见",e)},expression:"form.处理意见"}})],1)],1):t._e(),t._v(" "),i("div",{staticClass:"dialog-footer",attrs:{slot:"footer"},slot:"footer"},[i("el-button",{on:{click:t.cancelHandler}},[t._v("取 消")]),t._v(" "),i("el-button",{attrs:{type:"primary"},on:{click:t.confirmHandler}},[t._v("确 定")])],1)],1)},[],!1,null,null,null);f.options.__file="addEditRecordForm.vue";e.a=f.exports},"8d9P":function(t,e,i){"use strict";var s=i("kqbY");i.n(s).a},jThu:function(t,e,i){"use strict";var s=i("YHGi"),a=i("K3Y6"),r={name:"UploadFile",props:["url","files"],data:function(){return{fileList:[],Authorization:{Authorization:localStorage.getItem("Authorization")}}},mounted:function(){var t=this;this.files.forEach(function(e){var i={name:Object(a.i)(e),url:s.a+e};t.fileList.push(i)})},methods:{handlePreview:function(t){console.log(t)},handleRemove:function(t,e){this.$emit("removeFile",t.name)},handleAvatarSuccess:function(t){t.error?(this.$notify.error({title:"上传失败",message:t.error}),this.fileList=[]):(this.$message.success("上传成功！"),this.$emit("myEvent",t.data[0]))}}},o=i("ZrdR"),n=Object(o.a)(r,function(){var t=this.$createElement,e=this._self._c||t;return e("div",[e("el-upload",{staticClass:"upload-demo",attrs:{action:this.url,"on-preview":this.handlePreview,"show-file-list":"","file-list":this.fileList,"on-remove":this.handleRemove,headers:this.Authorization,"on-success":this.handleAvatarSuccess}},[e("el-button",{attrs:{size:"small",type:"primary"}},[this._v("点击上传")])],1)],1)},[],!1,null,null,null);n.options.__file="uploadFileOrImg.vue";e.a=n.exports},kqbY:function(t,e,i){},mB0Z:function(t,e,i){"use strict";var s={name:"UploadFile",props:["date","type","format","title"],data:function(){return{time:""}},mounted:function(){this.date?"year"==this.type?this.time=this.date.toString():this.time=new Date(this.date):this.time=""},methods:{changeDate:function(t){this.$emit("myEvent",t)}}},a=i("ZrdR"),r=Object(a.a)(s,function(){var t=this,e=t.$createElement;return(t._self._c||e)("el-date-picker",{attrs:{type:t.type,format:t.format,"value-format":t.format,placeholder:t.title},on:{change:t.changeDate},model:{value:t.time,callback:function(e){t.time=e},expression:"time"}})},[],!1,null,null,null);r.options.__file="selectDate.vue";e.a=r.exports},rwlz:function(t,e,i){"use strict";i.r(e);i("YHGi");var s=i("UZgM"),a=i("/L2C"),r={name:"addEditRecord",components:{rotationList:s.a,addEditRecordForm:a.a},data:function(){return{List:[],isAdd:!1,isLoad:!1,isDialog:!1,selectStudents:[],state:"在培",itemState:"",item:{}}},mounted:function(){this.isLoad=!0},methods:{myEvent:function(t,e,i){this.item=i,this.isAdd=!0,this.itemState=e,"未入科"==i.状态?this.$message.error("【未入科】状态不能添加事故记录！"):this.isDialog=!0},myEventDialog:function(){var t=this;this.isDialog=!1,this.isLoad=!1,setTimeout(function(){t.isLoad=!0},50)}}},o=(i("8d9P"),i("ZrdR")),n=Object(o.a)(r,function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"app-container page-common page-addStudent"},[i("div",{staticClass:"btn-back-box"},[i("el-button",{staticClass:"btn-back",attrs:{type:"primary",size:"mini",plain:""},on:{click:function(e){t.$router.go(-1)}}},[i("i",{staticClass:"iconfont iconfanhui"}),t._v(" 返回\n    ")])],1),t._v(" "),t._m(0),t._v(" "),t.isLoad?i("rotationList",{attrs:{state:t.state},on:{myEvent:t.myEvent}}):t._e(),t._v(" "),t.isDialog?i("el-dialog",{staticClass:"common-dialog",attrs:{title:"添加事故记录",visible:t.isDialog,"close-on-click-modal":!1,width:"30%"},on:{"update:visible":function(e){t.isDialog=e}}},[i("addEditRecordForm",{ref:"child",attrs:{item:t.item,isAdd:t.isAdd},on:{myEvent:t.myEventDialog}})],1):t._e()],1)},[function(){var t=this.$createElement,e=this._self._c||t;return e("h5",{staticClass:"personal-title"},[this._v("添加事故记录 "),e("span",{staticClass:"explain"},[this._v("(说明：点击科室可添加事故记录。)")])])}],!1,null,"72d160a4",null);n.options.__file="addEditRecord.vue";e.default=n.exports}}]);