(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-1b0caa76"],{"2c76":function(e,t,a){"use strict";a("44c0"),a("4def")},"31b7":function(e,t,a){"use strict";a.r(t);var n,i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("navbar",{attrs:{path:e.path}}),a("div",{staticClass:"detail"},[a("van-cell-group",[a("date-time",{attrs:{min:e.TrainingSituation.实际开始培训日期,max:e.TrainingSituation.计划结束培训日期,required:!0,type:"date",label:"开始时间:"},model:{value:e.form.请假开始日期,callback:function(t){e.$set(e.form,"请假开始日期",t)},expression:"form.请假开始日期"}}),a("date-time",{attrs:{type:"date",min:e.form.请假开始日期,max:e.TrainingSituation.计划结束培训日期,required:!0,label:"结束时间:"},model:{value:e.form.请假结束日期,callback:function(t){e.$set(e.form,"请假结束日期",t)},expression:"form.请假结束日期"}}),a("van-field",{attrs:{label:"请假天数",readonly:""},model:{value:e.days,callback:function(t){e.days=t},expression:"days"}}),a("van-field",{attrs:{label:"请假事由",type:"textarea",placeholder:"请输入请假事由",rows:"1",autosize:"",required:""},model:{value:e.form.请假事由,callback:function(t){e.$set(e.form,"请假事由",t)},expression:"form.请假事由"}}),a("van-field",{attrs:{label:"备注",type:"textarea",placeholder:"请输入备注",rows:"1",autosize:""},model:{value:e.form.备注,callback:function(t){e.$set(e.form,"备注",t)},expression:"form.备注"}})],1)],1),a("div",{staticClass:"btns"},[a("van-button",{attrs:{size:"large",type:"primary"},on:{click:e.submit}},[e._v("提 交")])],1)],1)},r=[],o=(a("2338"),a("f763"),a("fb37"),a("a506")),u=(a("0f0c"),a("3607")),s=a("9d8d"),c=a("5dee"),l=a("591a"),m=a("92d9");function f(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter(function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable})),a.push.apply(a,n)}return a}function h(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?f(a,!0).forEach(function(t){Object(o["a"])(e,t,a[t])}):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):f(a).forEach(function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))})}return e}var d={components:(n={},Object(o["a"])(n,u["a"].name,u["a"]),Object(o["a"])(n,"navbar",s["a"]),Object(o["a"])(n,"DateTime",c["a"]),n),data:function(){return{title:"",form:{"编号":0,"教学轮转编号":0,"请假开始日期":(new Date).format("yyyy-MM-dd"),"请假结束日期":"","请假天数":0,"请假事由":"","建立人":0,"建立时间":(new Date).format("yyyy-MM-dd HH:mm:ss"),"备注":""},TrainingSituation:{},path:"/leave"}},computed:{id:function(){return this.$route.query.id},days:function(){var e="";return this.form.请假结束日期&&this.form.请假开始日期&&(e=this.form.请假开始日期.ToDate().DateDiff(this.form.请假结束日期.ToDate())),e}},mounted:function(){var e="";this.form.编号=this.id,this.form.编号?this.title="修改申请":this.title="发起请假申请",localStorage.getItem("TrainingSituation")&&(this.TrainingSituation=JSON.parse(localStorage.getItem("TrainingSituation")),this.form.教学轮转编号=this.TrainingSituation.当前教学轮转编号),e=this.title,this.setNavTitle({title:e})},methods:h({},Object(l["b"])(["setNavTitle"]),{submit:function(){var e=this,t=this;this.form.请假事由?(this.form.请假天数=this.days,Object(m["f"])({type:1,Data:this.form}).then(function(a){a.error||(e.$toast.success("操作成功"),t.$router.push({path:e.path}))})):this.$toast("请假事由不能为空!")}})},p=d,g=(a("4a82"),a("6691")),b=Object(g["a"])(p,i,r,!1,null,null,null);t["default"]=b.exports},"4a82":function(e,t,a){"use strict";var n=a("c4f3"),i=a.n(n);i.a},"5dee":function(e,t,a){"use strict";var n,i=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",[a("van-field",{attrs:{"label-width":"80",label:e.label,placeholder:e.placeholder,required:e.required,"min-date":e.minDate,readonly:""},on:{click:e.showDialog},model:{value:e.give,callback:function(t){e.give=t},expression:"give"}}),a("van-popup",{style:{height:"50%"},attrs:{round:"",position:"bottom"},model:{value:e.selectDateVisiable,callback:function(t){e.selectDateVisiable=t},expression:"selectDateVisiable"}},[a("van-datetime-picker",{attrs:{"cancel-button-text":"清空",type:e.type,"min-date":e.minDate,"max-date":e.maxDate},on:{confirm:e.confirm,cancel:e.cancel},model:{value:e.selectDate,callback:function(t){e.selectDate=t},expression:"selectDate"}})],1)],1)},r=[],o=(a("34a3"),a("a506")),u=(a("2c76"),a("fff6")),s=(a("0f0c"),a("3607")),c=(a("015a"),a("8799")),l={name:"DateTime",components:(n={},Object(o["a"])(n,c["a"].name,c["a"]),Object(o["a"])(n,s["a"].name,s["a"]),Object(o["a"])(n,u["a"].name,u["a"]),n),props:{give:String,label:String,placeholder:String,required:{type:Boolean,default:!1},type:{type:String,default:"datetime"},min:{type:String,default:null},max:{type:String,default:null}},model:{prop:"give",event:"returnBack"},data:function(){return{selectDateVisiable:!1,selectDate:""}},computed:{minDate:function(){var e=(new Date).DateAdd("y",-10);return this.min&&(e=this.min.ToDate()),e},maxDate:function(){var e=(new Date).DateAdd("y",10);return this.max&&(e=this.max.ToDate()),e}},methods:{showDialog:function(){var e=this.give.replace(/-/g,"/");this.selectDate=""!=e?new Date(e):"",this.selectDateVisiable=!0},confirm:function(){var e="yyyy-MM-dd HH:mm:ss";"date"==this.type&&(e="yyyy-MM-dd"),this.$emit("returnBack",this.selectDate.format(e)),this.selectDateVisiable=!1},cancel:function(){this.selectDate="",this.$emit("returnBack",""),this.selectDateVisiable=!1}}},m=l,f=a("6691"),h=Object(f["a"])(m,i,r,!1,null,"b4f79ad0",null);t["a"]=h.exports},"92d9":function(e,t,a){"use strict";a.d(t,"b",function(){return i}),a.d(t,"a",function(){return r}),a.d(t,"c",function(){return o}),a.d(t,"f",function(){return u}),a.d(t,"g",function(){return s}),a.d(t,"d",function(){return c}),a.d(t,"e",function(){return l});var n=a("66df"),i=function(e){var t=e.index,a=e.size,i=e.name,r=e.StateName,o=e.type,u="";switch(o){case 1:u="/TeachingManagementOfStudent/WorkFlow/学员分页查看请假申请";break;case 2:u="/TeachingManagementOfStudent/WorkFlow/学员分页查看出科申请";break;case 3:u="/TeachingManagementOfStudent/WorkFlow/学员分页查看轮转手册申请";break;case 4:u="/TeachingManagementOfStudent/WorkFlow/学员分页查看结业申请";break;default:u="/TeachingManagementOfStudent/HomePage/分页获取待办事宜";break}var s={Index:t,Size:a,OrderType:!1,"Like姓名":i,StateName:r};return n["a"].request({url:u,params:s,method:"GET"})},r=function(e){var t=e.id,a=e.type,i="",r="";switch(a){case 1:i="/TeachingManagementOfStudent/WorkFlow/获取请假详情",r="请假编号";break;case 2:i="/TeachingManagementOfStudent/WorkFlow/获取出科详情",r="出科编号";break;case 3:i="/TeachingManagementOfStudent/WorkFlow/获取轮转手册详情",r="轮转手册编号";break;case 4:i="/TeachingManagementOfStudent/WorkFlow/获取结业详情",r="结业编号";break;default:i="";break}var o={};return o[r]=t,n["a"].request({url:i,params:o,method:"GET"})},o=function(e){var t=e.id,a="/TeachingManagementOfStudent/WorkFlow/获取某流程审核记录",i={"流程编号":t};return n["a"].request({url:a,params:i,method:"GET"})},u=function(e){var t=e.type,a=e.Data,i="";switch(t){case 1:i="/TeachingManagementOfStudent/WorkFlow/学员发起请假申请";break;case 2:i="/TeachingManagementOfStudent/WorkFlow/学员发起出科申请";break;case 3:i="/TeachingManagementOfStudent/WorkFlow/学员发起轮转手册申请";break;case 4:i="/TeachingManagementOfStudent/WorkFlow/学员发起结业申请";break}var r={IsHold:!1,Data:a};return n["a"].request({url:i,data:r,method:"POST"})},s=function(e){var t=new FormData;t.append("file",e);var a={"Content-Type":"multipart/form-data"};return n["a"].request({url:"/TeachingManagementOfStudent/WorkFlow/上传教学轮转手册附件",data:t,headers:a,method:"POST"})},c=function(e){var t=e.教学轮转编号,a=e.教学轮转手册类型编号,i=e.教学专业科室任务类型编号,r={"教学轮转编号":t,"教学轮转手册类型编号":a,"教学专业科室任务类型编号":i};return n["a"].request({url:"/TeachingManagementOfStudent/WorkFlow/获取某教学轮转手册可选任务",params:r,method:"GET"})},l=function(){return n["a"].request({url:"/TeachingManagementOfStudent/WorkFlow/获取教学轮转手册类型",method:"GET"})}},c4f3:function(e,t,a){},fff6:function(e,t,a){"use strict";var n=a("f9c5"),i=a("0afd"),r=a("d5cf"),o=a("ad16"),u=a("cca1");function s(e,t){var a=-1,n=Array(e);while(++a<e)n[a]=t(a);return n}function c(e){if(e){while(Object(u["a"])(parseInt(e,10)))e=e.slice(1);return parseInt(e,10)}}function l(e,t){return 32-new Date(e,t-1,32).getDate()}var m=a("e74f"),f=a("75f0"),h=Object(n["a"])({},m["a"],{value:null,filter:Function,showToolbar:{type:Boolean,default:!0},formatter:{type:Function,default:function(e,t){return t}}}),d={data:function(){return{innerValue:this.formatValue(this.value)}},computed:{originColumns:function(){var e=this;return this.ranges.map(function(t){var a=t.type,n=t.range,i=s(n[1]-n[0]+1,function(e){var t=Object(r["b"])(n[0]+e);return t});return e.filter&&(i=e.filter(a,i)),{type:a,values:i}})},columns:function(){var e=this;return this.originColumns.map(function(t){return{values:t.values.map(function(a){return e.formatter(t.type,a)})}})}},watch:{innerValue:function(e){this.$emit("input",e)},columns:function(){this.updateColumnValue(this.innerValue)}},mounted:function(){this.updateColumnValue(this.innerValue)},methods:{onConfirm:function(){this.$emit("confirm",this.innerValue)},onCancel:function(){this.$emit("cancel")}},render:function(){var e=this,t=arguments[0],a={};return Object.keys(m["a"]).forEach(function(t){a[t]=e[t]}),t(f["a"],{ref:"picker",attrs:{columns:this.columns},on:{change:this.onChange,confirm:this.onConfirm,cancel:this.onCancel},props:Object(n["a"])({},a)})}},p=Object(i["a"])("time-picker"),g=p[0],b=g({mixins:[d],props:Object(n["a"])({},h,{minHour:{type:Number,default:0},maxHour:{type:Number,default:23},minMinute:{type:Number,default:0},maxMinute:{type:Number,default:59}}),computed:{ranges:function(){return[{type:"hour",range:[this.minHour,this.maxHour]},{type:"minute",range:[this.minMinute,this.maxMinute]}]}},watch:{value:function(e){e=this.formatValue(e),e!==this.innerValue&&(this.innerValue=e,this.updateColumnValue(e))}},methods:{formatValue:function(e){e||(e=Object(r["b"])(this.minHour)+":"+Object(r["b"])(this.minMinute));var t=e.split(":"),a=t[0],n=t[1];return a=Object(r["b"])(Object(o["a"])(a,this.minHour,this.maxHour)),n=Object(r["b"])(Object(o["a"])(n,this.minMinute,this.maxMinute)),a+":"+n},onChange:function(e){var t=this,a=e.getIndexes(),n=this.originColumns[0].values[a[0]],i=this.originColumns[1].values[a[1]],r=n+":"+i;this.innerValue=this.formatValue(r),this.$nextTick(function(){t.$nextTick(function(){t.$emit("change",e)})})},updateColumnValue:function(e){var t=this,a=this.formatter,n=e.split(":"),i=[a("hour",n[0]),a("minute",n[1])];this.$nextTick(function(){t.$refs.picker.setValues(i)})}}});function y(e){return"[object Date]"===Object.prototype.toString.call(e)&&!Object(u["a"])(e.getTime())}var v=(new Date).getFullYear(),O=Object(i["a"])("date-picker"),D=O[0],k=D({mixins:[d],props:Object(n["a"])({},h,{type:{type:String,default:"datetime"},minDate:{type:Date,default:function(){return new Date(v-10,0,1)},validator:y},maxDate:{type:Date,default:function(){return new Date(v+10,11,31)},validator:y}}),watch:{value:function(e){e=this.formatValue(e),e.valueOf()!==this.innerValue.valueOf()&&(this.innerValue=e)}},computed:{ranges:function(){var e=this.getBoundary("max",this.innerValue),t=e.maxYear,a=e.maxDate,n=e.maxMonth,i=e.maxHour,r=e.maxMinute,o=this.getBoundary("min",this.innerValue),u=o.minYear,s=o.minDate,c=o.minMonth,l=o.minHour,m=o.minMinute,f=[{type:"year",range:[u,t]},{type:"month",range:[c,n]},{type:"day",range:[s,a]},{type:"hour",range:[l,i]},{type:"minute",range:[m,r]}];return"date"===this.type&&f.splice(3,2),"year-month"===this.type&&f.splice(2,3),f}},methods:{formatValue:function(e){return y(e)||(e=this.minDate),e=Math.max(e,this.minDate.getTime()),e=Math.min(e,this.maxDate.getTime()),new Date(e)},getBoundary:function(e,t){var a,n=this[e+"Date"],i=n.getFullYear(),r=1,o=1,u=0,s=0;return"max"===e&&(r=12,o=l(t.getFullYear(),t.getMonth()+1),u=23,s=59),t.getFullYear()===i&&(r=n.getMonth()+1,t.getMonth()+1===r&&(o=n.getDate(),t.getDate()===o&&(u=n.getHours(),t.getHours()===u&&(s=n.getMinutes())))),a={},a[e+"Year"]=i,a[e+"Month"]=r,a[e+"Date"]=o,a[e+"Hour"]=u,a[e+"Minute"]=s,a},onChange:function(e){var t=this,a=e.getValues(),n=c(a[0]),i=c(a[1]),r=l(n,i),o=c(a[2]);"year-month"===this.type&&(o=1),o=o>r?r:o;var u=0,s=0;"datetime"===this.type&&(u=c(a[3]),s=c(a[4]));var m=new Date(n,i-1,o,u,s);this.innerValue=this.formatValue(m),this.$nextTick(function(){t.$nextTick(function(){t.$emit("change",e)})})},updateColumnValue:function(e){var t=this,a=this.formatter,n=[a("year",""+e.getFullYear()),a("month",Object(r["b"])(e.getMonth()+1)),a("day",Object(r["b"])(e.getDate()))];"datetime"===this.type&&n.push(a("hour",Object(r["b"])(e.getHours())),a("minute",Object(r["b"])(e.getMinutes()))),"year-month"===this.type&&(n=n.slice(0,2)),this.$nextTick(function(){t.$refs.picker.setValues(n)})}}}),w=Object(i["a"])("datetime-picker"),T=w[0],x=w[1];t["a"]=T({props:Object(n["a"])({},b.props,{},k.props),render:function(){var e=arguments[0],t="time"===this.type?b:k;return e(t,{class:x(),props:Object(n["a"])({},this.$props),on:Object(n["a"])({},this.$listeners)})}})}}]);