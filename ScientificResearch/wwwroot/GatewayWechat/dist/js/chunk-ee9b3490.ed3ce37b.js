(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-ee9b3490"],{"19f8":function(t,s,e){"use strict";var a=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("van-panel",{staticClass:"box",attrs:{title:"审核"}},[e("i",{staticClass:"icon iconfont icon-guanbi",on:{click:t.back}}),e("van-cell-group",[e("van-field",{attrs:{label:"审核说明：",type:"textarea",placeholder:"请输入审核说明···",rows:"5",autosize:t.maxHeight},model:{value:t.value,callback:function(s){t.value=s},expression:"value"}}),e("div",{staticClass:"btn"},[e("van-button",{attrs:{type:"primary",size:"small"},on:{click:t.pass}},[t._v("通过")]),e("van-button",{attrs:{type:"warning",size:"small"},on:{click:t.fail}},[t._v("不通过")]),e("van-button",{attrs:{type:"danger",size:"small"},on:{click:t.termination}},[t._v("终止")])],1)],1)],1)},n=[],i=(e("cadf"),e("551c"),e("097d"),{props:["message","getBacklog"],data:function(){return{value:"",maxHeight:{maxHeight:90},state:{pass:1,fail:-1,termination:-2},falg:!0}},mounted:function(){},methods:{back:function(){this.$emit("getMessage"),this.value=""},pass:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.pass,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()},fail:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.fail,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()},termination:function(){var t=this,s={"步骤编号":this.message.步骤编号,"状态值":this.state.termination,"备注":this.value};this.$http.auditStep(s).then(function(s){s.error?t.$toast({duration:1500,message:s.error}):(t.$toast.success({duration:1500,message:"操作成功！"}),t.$emit("getBacklog",t.falg))}),this.back()}}}),o=i,l=(e("c4e2"),e("2877")),c=Object(l["a"])(o,a,n,!1,null,"3f17f889",null);c.options.__file="audit.vue";s["a"]=c.exports},3418:function(t,s,e){"use strict";e.r(s);var a=function(){var t=this,s=t.$createElement,e=t._self._c||s;return e("div",[e("van-pull-refresh",{on:{refresh:t.onDownRefresh},model:{value:t.isDownLoading,callback:function(s){t.isDownLoading=s},expression:"isDownLoading"}},[e("van-list",{staticClass:"box",attrs:{finished:t.finished,"finished-text":"没有更多了"},on:{load:t.onLoad},model:{value:t.loading,callback:function(s){t.loading=s},expression:"loading"}},[e("div",{staticClass:"title"},[e("i",{staticClass:"icon iconfont icon-gerenhuojiang"}),t._v("获奖管理\n      ")]),t._l(t.lectureList,function(s,a){return e("div",{key:a,staticClass:"backContentBox"},[e("ul",{staticClass:"backContentTop",on:{click:function(e){t.goDetails(s.编号)}}},[e("li",[t._v(t._s(s.获奖名称))]),e("li",[e("span",[t._v("获奖级别：")]),e("span",[t._v(t._s(s.获奖级别))])]),e("li",[e("span",[t._v("获奖类别：")]),e("span",[t._v(t._s(s.获奖类别))])]),e("li",[e("span",[t._v("获奖等级：")]),e("span",[t._v(t._s(s.获奖等级))])]),e("li",[e("span",[t._v("颁奖单位：")]),e("span",[t._v(t._s(s.颁奖单位))])]),e("li",[e("span",[t._v("第一发明人：")]),e("span",[t._v(t._s(s.第一发明人))])]),e("li",[e("span",[t._v("第一完成人：")]),e("span",[t._v(t._s(s.第一完成人))])]),e("li",[e("span",[t._v("获奖日期：")]),e("span",[t._v(t._s(t.startTime(s.获奖日期)))])]),e("li",[e("span",[t._v("年度：")]),e("span",[t._v(t._s(s.年度))])]),e("li",[e("span",[t._v("当前步骤：")]),e("span",{attrs:{id:"contentSpan"}},[t._v(t._s(s.步骤名称)+" - "+t._s(s.步骤状态说明))])]),e("li",[e("span",[t._v("审核进度：")]),e("span",{style:{color:s.审核进度==t.flag?"#31BD5D":"#FF976A"}},[t._v(t._s(s.审核进度))])])]),e("span",{directives:[{name:"show",rawName:"v-show",value:"待审核"===s.步骤状态说明,expression:"item.步骤状态说明 === '待审核'"}],staticClass:"audit",on:{click:function(e){t.audit(s,a)}}},[t._v("审核")])])}),e("van-popup",{staticClass:"popup",model:{value:t.show,callback:function(s){t.show=s},expression:"show"}},[e("Audit",{attrs:{message:t.message},on:{getMessage:t.getMessage}})],1)],2)],1),e("ReturnTop"),e("ReturnBtn")],1)},n=[],i=e("19f8"),o={inject:["reload"],components:{Audit:i["a"]},data:function(){return{lectureList:[],index:1,size:15,total:0,indexKey:null,loading:!1,finished:!1,isDownLoading:!1,flag:"已完成-审核通过",show:!1,message:""}},methods:{getMessage:function(){this.show=!1},onLoad:function(t){var s=this;this.$http.getResultsAllList(this.index,this.size).then(function(e){s.total=e.data.total;var a=s.lectureList;t?a.splice(s.indexKey,1):s.lectureList=a.concat(e.data.list),s.loading=!1,s.index++,s.lectureList.length>=s.total&&(s.finished=!0)})},onDownRefresh:function(){var t=this;setTimeout(function(){t.reload(),t.isDownLoading=!1},1e3)},goDetails:function(t){this.$router.push({path:"/resultsDetails",name:"resultsDetails",params:{item:t}})},audit:function(t,s){this.message=t,this.show=!0,this.indexKey=s},startTime:function(t){return null!=t?t.slice(0,10):void 0}}},l=o,c=(e("3ee7"),e("2877")),u=Object(c["a"])(l,a,n,!1,null,"76b41fd8",null);u.options.__file="resultsManagement.vue";s["default"]=u.exports},"3ee7":function(t,s,e){"use strict";var a=e("cc31"),n=e.n(a);n.a},b9d0:function(t,s,e){},c4e2:function(t,s,e){"use strict";var a=e("b9d0"),n=e.n(a);n.a},cc31:function(t,s,e){}}]);
//# sourceMappingURL=chunk-ee9b3490.ed3ce37b.js.map