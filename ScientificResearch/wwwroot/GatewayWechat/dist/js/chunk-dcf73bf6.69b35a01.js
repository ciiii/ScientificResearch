(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-dcf73bf6"],{1161:function(t,s,i){"use strict";var a=i("e3b4"),e=i.n(a);e.a},"19f8":function(t,s,i){"use strict";var a=function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("van-panel",{staticClass:"box",attrs:{title:"审核"}},[i("i",{staticClass:"icon iconfont icon-guanbi",on:{click:t.back}}),i("van-cell-group",[i("van-field",{attrs:{label:"审核说明：",type:"textarea",placeholder:"请输入审核说明···",rows:"5",autosize:t.maxHeight},model:{value:t.value,callback:function(s){t.value=s},expression:"value"}}),i("div",{staticClass:"btn"},[i("van-button",{attrs:{type:"primary",size:"small"},on:{click:t.pass}},[t._v("通过")]),i("van-button",{attrs:{type:"warning",size:"small"},on:{click:t.fail}},[t._v("不通过")]),i("van-button",{attrs:{type:"danger",size:"small"},on:{click:t.termination}},[t._v("终止")])],1)],1)],1)},e=[],n={props:["message","getBacklog"],data:function(){return{value:"",maxHeight:{maxHeight:90},state:{pass:1,fail:-1,termination:-2},falg:!0}},mounted:function(){},methods:{back:function(){this.$emit("getMessage"),this.value=""},pass:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.pass,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()},fail:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.fail,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()},termination:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.termination,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()}}},o=n,c=(i("c4e2"),i("2877")),l=Object(c["a"])(o,a,e,!1,null,"3f17f889",null);l.options.__file="audit.vue";s["a"]=l.exports},"1e4b":function(t,s,i){"use strict";i.r(s);var a=function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("div",[i("div",{staticClass:"nav"},[i("img",{attrs:{src:t.url+this.Logo||this.defaultImg}})]),i("section",[i("div",{staticClass:"backlogBox"},[i("div",{staticClass:"backlog"},[t._m(0),i("span",{on:{click:t.more}},[t._v("\n          更多\n          "),i("i",{staticClass:"icon iconfont icon-you"})])]),i("van-swipe",{staticClass:"backlogContent",attrs:{autoplay:3e3,vertical:"","show-indicators":!1}},t._l(t.KYList,function(s,a){return i("van-swipe-item",{key:a},[i("span",{on:{click:function(i){t.newsItem(s.编号)}}},[i("i",{staticClass:"iocn iconfont icon-tongzhi"}),t._v("\n            "+t._s(s.通知名称)+"\n          ")])])}),1)],1),t._m(1),i("div",{staticClass:"backlogBox"},[t._m(2),i("toDoList",{ref:"toDoList"})],1)]),i("navFooter")],1)},e=[function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("span",[i("i",{staticClass:"icon iconfont icon-tongzhi1"}),i("span",[t._v("通知公告")])])},function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("div",{staticClass:"box"},[i("div",[i("div",{staticClass:"boxI"},[i("i",{staticClass:"iocn iconfont icon-diyiming"})]),i("div",{staticClass:"boxContent"},[i("p",[t._v("第一作者")]),i("span",[t._v("10")])])]),i("div",[i("div",{staticClass:"boxI"},[i("i",{staticClass:"iocn iconfont icon-xiangmu1"})]),i("div",{staticClass:"boxContent"},[i("p",[t._v("横项")]),i("span",[t._v("15")])])]),i("div",[i("div",{staticClass:"boxI"},[i("i",{staticClass:"iocn iconfont icon-xiangmu"})]),i("div",{staticClass:"boxContent"},[i("p",[t._v("纵项")]),i("span",[t._v("17")])])]),i("div",[i("div",{staticClass:"boxI"},[i("i",{staticClass:"iocn iconfont icon-feiyong"})]),i("div",{staticClass:"boxContentX"},[i("p",[t._v("费用")]),i("span",[t._v("3728元")])])])])},function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("div",{staticClass:"backlog"},[i("span",[i("i",{staticClass:"icon iconfont icon-liti"}),i("span",[t._v("我的待办")])])])}],n=(i("3b2b"),i("a481"),i("f499")),o=i.n(n),c=(i("cadf"),i("551c"),i("097d"),function(){var t=this,s=t.$createElement,i=t._self._c||s;return i("div",[i("van-list",{attrs:{finished:t.finished,"finished-text":"没有更多了",error:t.error,"error-text":"请求失败，点击重新加载"},on:{"update:error":function(s){t.error=s},load:t.onLoad},model:{value:t.loading,callback:function(s){t.loading=s},expression:"loading"}},t._l(t.list,function(s,a){return i("div",{key:a,staticClass:"backContentBox"},[i("div",{staticClass:"bacnButtom"},[i("ul",{on:{click:function(i){t.goDetails(s,s.项目编号)}}},[i("li",[t._v(t._s(s.流程名称))]),i("li",[i("span",[t._v("项目名称：")]),i("span",[t._v(t._s(s.项目名称))])]),i("li",[i("span",[t._v("步骤名称：")]),i("span",[t._v(t._s(s.步骤名称))])]),i("li",[i("span",[t._v("发起人姓名：")]),i("span",[t._v(t._s(s.发起人姓名))])]),i("li",[i("i",{staticClass:"currentState"},[t._v(t._s(s.状态名称))]),i("i",{staticClass:"stepState"},[t._v(t._s(s.步骤状态说明))])]),i("li",{staticClass:"contentSpan"},[i("span",[t._v("当前步骤：")]),i("span",[t._v(t._s(s.步骤名称)+" - "+t._s(s.步骤状态说明))])]),i("li",[i("span",[t._v("创建时间：")]),i("span",[t._v(t._s(t.startTime(s.流程创建时间)))])])]),i("div",{staticClass:"audit"},[i("span",{directives:[{name:"show",rawName:"v-show",value:"待审核"===s.步骤状态说明,expression:"item.步骤状态说明 === '待审核'"}],on:{click:function(i){t.audit(s,a)}}},[t._v("审核")])])])])}),0),i("van-popup",{staticClass:"popup",model:{value:t.show,callback:function(s){t.show=s},expression:"show"}},[i("Audit",{attrs:{message:t.message},on:{getMessage:t.getMessage,getBacklog:t.getBacklog}})],1)],1)}),l=[],r=i("19f8"),u={components:{Audit:r["a"]},data:function(){return{index:1,size:15,total:0,list:[],loading:!1,finished:!1,error:!1,show:!1,message:"",indexKey:null,typeList:{"论文成果":"paperDetails","著作成果":"workDetails","专利成果":"patentDetails","获奖成果":"resultsDetails","纵向项目申报":"YDeclarationDetails","纵向项目中检":"YProcessInspectionDetails","纵向项目经费到账":"YFundsToTheAccount","主办讲座":"lectureDetails","横向项目":"XDetails","横向项目经费到账":"XFundsToTheAccount","报销":"reimbursementDetails"}}},methods:{getMessage:function(){this.show=!1},getBacklog:function(t){var s=this,i={index:this.index,size:this.size};this.$http.getBacklogProcess(i).then(function(i){s.total=i.data.total;var a=s.list;t?a.splice(s.indexKey,1):s.list=a.concat(i.data.list),s.loading=!1,s.index++,s.list.length>=s.total&&(s.finished=!0)})},onLoad:function(){this.getBacklog()},goDetails:function(t,s){this.$router.push({path:"/".concat(this.typeList[t.流程名称]),name:"".concat(this.typeList[t.流程名称]),params:{item:s}})},audit:function(t,s){this.message=t,this.show=!0,this.indexKey=s},startTime:function(t){if(null!=t)return t.slice(0,10)}}},f=u,p=(i("6ae6"),i("2877")),d=Object(p["a"])(f,c,l,!1,null,"2e6815e7",null);d.options.__file="toDoList.vue";var v=d.exports,h=i("2c4b"),g={components:{toDoList:v,navFooter:h["a"]},data:function(){return{isLoading:!1,index:1,size:15,KYList:[],url:"",Logo:"",HospitalInformation:JSON.parse(localStorage.getItem("HospitalInformation")),defaultImg:i("b263")}},created:function(){var t=this;if(this.Logo=this.HospitalInformation.Logo,!localStorage.token){var s=this.getUrlKey("code");s?this.$http.LoginWithOpenId(s).then(function(s){localStorage.personnel=o()(s.data.人员),localStorage.token="".concat(s.data.token_type," ").concat(s.data.access_token),t.$refs.toDoList.getBacklog()}):(this.$router.push("/login"),this.$notify("没有权限，请绑定！"))}},mounted:function(){var t=this,s=JSON.parse(localStorage.getItem("personnel")),i={"人员编号":s.编号,index:this.index,size:this.size};this.$http.getToViewNewsList(i).then(function(s){t.KYList=s.data.list})},methods:{getUrlKey:function(t){return decodeURIComponent((new RegExp("[?|&]"+t+"=([^&;]+?)(&|#|;|$)").exec(location.href)||[,""])[1].replace(/\+/g,"%20"))||null},more:function(){this.$router.push("/KYMoreList")},newsItem:function(t){this.$router.push({path:"/KYNewsDetails",name:"KYNewsDetails",params:{item:t}})}}},m=g,_=(i("1161"),Object(p["a"])(m,a,e,!1,null,"c4532ee6",null));_.options.__file="index.vue";s["default"]=_.exports},"4b16":function(t,s,i){},"6ae6":function(t,s,i){"use strict";var a=i("4b16"),e=i.n(a);e.a},a21f:function(t,s,i){var a=i("584a"),e=a.JSON||(a.JSON={stringify:JSON.stringify});t.exports=function(t){return e.stringify.apply(e,arguments)}},b263:function(t,s,i){t.exports=i.p+"img/logo.af96feb7.png"},b9d0:function(t,s,i){},c4e2:function(t,s,i){"use strict";var a=i("b9d0"),e=i.n(a);e.a},e3b4:function(t,s,i){},f499:function(t,s,i){t.exports=i("a21f")}}]);