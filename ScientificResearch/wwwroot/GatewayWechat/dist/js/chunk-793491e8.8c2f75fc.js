(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-793491e8"],{"02f9":function(e,t,n){"use strict";var o=n("b3f7"),a=n.n(o);a.a},3374:function(e,t,n){"use strict";n.d(t,"b",function(){return a}),n.d(t,"a",function(){return i}),n.d(t,"c",function(){return u});n("3b2b"),n("a481");var o=n("a026");function a(e,t){var n,o=t||200;return function(){var t=this,a=arguments;n&&clearTimeout(n),n=setTimeout(function(){n=null,e.apply(t,a)},o)}}function i(e){return r(e)}function r(e){var t,n,o="";for(t=0;t<e.length;t++)n=c(e.charCodeAt(t)),"25"==n&&(n=""),o+="%"+n;return o}function c(e){if(e>65535)return"err!";var t=Math.round(e/4096-.5),n=e-4096*t,o=Math.round(n/256-.5),a=n-256*o,i=Math.round(a/16-.5),r=a-16*i;return""+s(i)+s(r)}function s(e){return e<10?e:10==e?"A":11==e?"B":12==e?"C":13==e?"D":14==e?"E":15==e?"F":void 0}function u(e){return e.replace(/^(\s|\u00A0)+/,"").replace(/(\s|\u00A0)+$/,"")}o["a"].filter("dataFormat",function(e,t){var n=new Date(e),o={"M+":n.getMonth()+1,"d+":n.getDate(),"h+":n.getHours(),"m+":n.getMinutes(),"s+":n.getSeconds(),"q+":Math.floor((n.getMonth()+3)/3),S:n.getMilliseconds()};for(var a in/(y+)/.test(t)&&(t=t.replace(RegExp.$1,(n.getFullYear()+"").substr(4-RegExp.$1.length))),o)new RegExp("("+a+")").test(t)&&(t=t.replace(RegExp.$1,1===RegExp.$1.length?o[a]:("00"+o[a]).substr((""+o[a]).length)));return t})},a21f:function(e,t,n){var o=n("584a"),a=o.JSON||(o.JSON={stringify:JSON.stringify});e.exports=function(e){return a.stringify.apply(a,arguments)}},b3f7:function(e,t,n){},c09c:function(e,t,n){},cac4:function(e,t,n){"use strict";var o=n("c09c"),a=n.n(o);a.a},de65:function(e,t,n){e.exports=n.p+"img/logo_zhiwang.20d74fdb.png"},f499:function(e,t,n){e.exports=n("a21f")},fb8f:function(e,t,n){"use strict";n.r(t);var o=function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"ZW-search"},[e._m(0),n("div",{staticClass:"main"},[n("van-cell-group",[n("div",{staticClass:"item"},[n("span",{staticClass:"title",on:{click:function(t){e.clickTitle(0)}}},[e._v(e._s(e.type)+"\n                "),n("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),n("van-field",{attrs:{clearable:"",placeholder:"请输入"},on:{"click-label":function(t){e.clickTitle(0)}},nativeOn:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null}},model:{value:e.req.searchKeyWord,callback:function(t){e.$set(e.req,"searchKeyWord",t)},expression:"req.searchKeyWord"}})],1),n("div",{staticClass:"item"},[n("span",{staticClass:"title",on:{click:function(t){e.clickTitle(1)}}},[e._v(e._s(e.author)+"\n                "),n("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),n("van-field",{attrs:{clearable:"",placeholder:"请输入"},on:{"click-label":function(t){e.clickTitle(1)}},nativeOn:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null}},model:{value:e.req.authorName,callback:function(t){e.$set(e.req,"authorName",t)},expression:"req.authorName"}})],1),n("van-field",{attrs:{clearable:"",label:"作者单位",placeholder:"请输入"},nativeOn:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null}},model:{value:e.req.authorGroup,callback:function(t){e.$set(e.req,"authorGroup",t)},expression:"req.authorGroup"}}),n("div",{staticClass:"item"},[n("span",{staticClass:"title"},[e._v("发表时间")]),n("div",{staticClass:"time-box"},[n("input",{directives:[{name:"model",rawName:"v-model",value:e.req.publicYearFrom,expression:"req.publicYearFrom"}],attrs:{placeholder:"开始年度",type:"number"},domProps:{value:e.req.publicYearFrom},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"publicYearFrom",t.target.value)}}}),n("span",[e._v("至")]),n("input",{directives:[{name:"model",rawName:"v-model",value:e.req.publicYearTo,expression:"req.publicYearTo"}],attrs:{placeholder:"结束年度",type:"number"},domProps:{value:e.req.publicYearTo},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"publicYearTo",t.target.value)}}})])]),n("van-field",{attrs:{clearable:"",label:"更新时间",placeholder:"请选择",readonly:""},on:{click:function(t){e.clickTitle(2)}},model:{value:e.time,callback:function(t){e.time=t},expression:"time"}}),n("div",{staticClass:"item new-item"},[n("span",{staticClass:"title"},[e._v("来源期刊")]),n("div",{staticClass:"time-box"},[n("input",{directives:[{name:"model",rawName:"v-model",value:e.req.sourceName,expression:"req.sourceName"}],attrs:{placeholder:"请输入"},domProps:{value:e.req.sourceName},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"sourceName",t.target.value)}}}),n("span",{staticClass:"title title-right",on:{click:function(t){e.clickTitle(3)}}},[e._v(e._s(e.sourceRearchType)+"\n                    "),n("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),n("div",{staticClass:"item new-item"},[n("span",{staticClass:"title"},[e._v("支持基金")]),n("div",{staticClass:"time-box"},[n("input",{directives:[{name:"model",rawName:"v-model",value:e.req.supportFundName,expression:"req.supportFundName"}],attrs:{placeholder:"请输入"},domProps:{value:e.req.supportFundName},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"supportFundName",t.target.value)}}}),n("span",{staticClass:"title title-right",on:{click:function(t){e.clickTitle(4)}}},[e._v(e._s(e.supportFundType)+"\n                    "),n("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),n("van-field",{attrs:{clearable:"",label:"来源类别",placeholder:"请选择",readonly:""},on:{click:function(t){e.clickTitle(5)}},model:{value:e.sourceType,callback:function(t){e.sourceType=t},expression:"sourceType"}}),n("p",{staticClass:"explain"},[e._v("说明：发表时间只能输入数字，例如 "+e._s(e.date))])],1),n("van-popup",{attrs:{position:"bottom"},model:{value:e.showType,callback:function(t){e.showType=t},expression:"showType"}},[n("div",{staticClass:"tab-con"},[n("h2",{staticClass:"van-doc-demo-block__title"},[e._v("检索类型")]),n("van-radio-group",{model:{value:e.req.searchType,callback:function(t){e.$set(e.req,"searchType",t)},expression:"req.searchType"}},[n("van-cell-group",e._l(e.configs.检索类型,function(t){return n("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(n){e.clickType(t)}}},[n("van-radio",{attrs:{name:t.value},on:{click:function(n){n.stopPropagation(),e.clickType(t)}}})],1)}),1)],1)],1)]),n("van-popup",{attrs:{position:"bottom"},model:{value:e.showAuthor,callback:function(t){e.showAuthor=t},expression:"showAuthor"}},[n("div",{staticClass:"tab-con"},[n("h2",{staticClass:"van-doc-demo-block__title"},[e._v("作者类型")]),n("van-radio-group",{model:{value:e.req.authorType,callback:function(t){e.$set(e.req,"authorType",t)},expression:"req.authorType"}},[n("van-cell-group",e._l(e.configs.作者类型,function(t){return n("van-cell",{key:t.value,attrs:{title:t.key,clickable:""},on:{click:function(n){e.clickAuthor(t)}}},[n("van-radio",{attrs:{name:t.value},on:{click:function(n){n.stopPropagation(),e.clickAuthor(t)}}})],1)}),1)],1)],1)]),n("van-popup",{attrs:{position:"bottom"},model:{value:e.showTime,callback:function(t){e.showTime=t},expression:"showTime"}},[n("div",{staticClass:"tab-con"},[n("h2",{staticClass:"van-doc-demo-block__title"},[e._v("更新时间")]),n("van-radio-group",{model:{value:e.newTime,callback:function(t){e.newTime=t},expression:"newTime"}},[n("van-cell-group",e._l(e.configs.更新时间,function(t){return n("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(n){e.clickTime(t)}}},[n("van-radio",{attrs:{name:t.value},on:{click:function(n){n.stopPropagation(),e.clickTime(t)}}})],1)}),1)],1),n("div",{staticClass:"btn-box"},[n("van-button",{attrs:{type:"warning",size:"large"},on:{click:e.resetTime}},[e._v("不限条件")]),n("van-button",{attrs:{type:"primary",size:"large"},on:{click:e.confirmTime}},[e._v("确定")])],1)],1)]),n("van-popup",{attrs:{position:"bottom"},model:{value:e.showSourceRearchType,callback:function(t){e.showSourceRearchType=t},expression:"showSourceRearchType"}},[n("div",{staticClass:"tab-con"},[n("h2",{staticClass:"van-doc-demo-block__title"},[e._v("来源期刊检索类型")]),n("van-radio-group",{model:{value:e.req.sourceRearchType,callback:function(t){e.$set(e.req,"sourceRearchType",t)},expression:"req.sourceRearchType"}},[n("van-cell-group",e._l(e.searchLiset,function(t){return n("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(n){e.clickSourceRearchType(t)}}},[n("van-radio",{attrs:{name:t.value},on:{click:function(n){n.stopPropagation(),e.clickSourceRearchType(t)}}})],1)}),1)],1)],1)]),n("van-popup",{attrs:{position:"bottom"},model:{value:e.showSupportFundType,callback:function(t){e.showSupportFundType=t},expression:"showSupportFundType"}},[n("div",{staticClass:"tab-con"},[n("h2",{staticClass:"van-doc-demo-block__title"},[e._v("支持基金检索类型")]),n("van-radio-group",{model:{value:e.req.supportFundType,callback:function(t){e.$set(e.req,"supportFundType",t)},expression:"req.supportFundType"}},[n("van-cell-group",e._l(e.searchLiset,function(t){return n("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(n){e.clickSupportFundType(t)}}},[n("van-radio",{attrs:{name:t.value},on:{click:function(n){n.stopPropagation(),e.clickSupportFundType(t)}}})],1)}),1)],1)],1)]),n("van-popup",{attrs:{position:"bottom"},model:{value:e.showSourceType,callback:function(t){e.showSourceType=t},expression:"showSourceType"}},[n("div",{staticClass:"tab-con"},[n("h2",{staticClass:"van-doc-demo-block__title"},[e._v("来源类别(多选)")]),n("van-checkbox-group",{model:{value:e.newSourceType,callback:function(t){e.newSourceType=t},expression:"newSourceType"}},[n("van-cell-group",e._l(e.configs.来源类别,function(t,o){return n("van-cell",{key:t.key,attrs:{clickable:"",title:t.key},on:{click:function(t){e.toggle(o)}}},[n("van-checkbox",{ref:"checkboxes",refInFor:!0,attrs:{name:t.value},on:{click:function(t){t.stopPropagation(),e.toggle(o)}}})],1)}),1)],1),n("div",{staticClass:"btn-box"},[n("van-button",{attrs:{type:"warning",size:"large"},on:{click:e.resetSourceType}},[e._v("不限条件")]),n("van-button",{attrs:{type:"primary",size:"large"},on:{click:e.confirmSourceType}},[e._v("确定")])],1)],1)])],1),n("div",{staticClass:"retrieval-box"},[n("van-button",{staticClass:"btn-retrieval",attrs:{type:"primary",size:"large"},on:{click:e.retrieval}},[e._v("检索")])],1)])},a=[function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{staticClass:"logo"},[o("img",{attrs:{src:n("de65"),alt:""}})])}],i=n("f499"),r=n.n(i),c=(n("96cf"),n("3b8d")),s=(n("ac6a"),n("cadf"),n("551c"),n("097d"),n("517f")),u=n("3374"),l={name:"home",data:function(){return{req:{searchType:"SU$%=|",searchKeyWord:"",authorType:"AU",authorName:"",authorGroup:"",publicYearFrom:"",publicYearTo:"",updateTimeTag:"",sourceName:"",sourceRearchType:"%",sourceType:"",supportFundName:"",supportFundType:"%",accountId:2019},reqConfigs:{isReload:!0,sourceType:"zwSelectData"},configs:{},showType:!1,showAuthor:!1,showTime:!1,showSourceRearchType:!1,showSupportFundType:!1,showSourceType:!1,date:(new Date).getFullYear(),resourceType:"",starTime:"",endTime:"",searchLiset:[{key:"模糊",value:"%"},{key:"精准",value:"="}],type:"主题",author:"作者",time:"",newTime:"",sourceRearchType:"模糊",supportFundType:"模糊",sourceType:"",newSourceType:[],item:{}}},mounted:function(){this.req.accountId=this.$route.query.accountId,this.getDataConfigs()},methods:{onSearch:function(){this.req.Index=1,this.getList()},clickTitle:function(e){switch(e){case 0:this.showType=!0;break;case 1:this.showAuthor=!0;break;case 2:this.showTime=!0;break;case 3:this.showSourceRearchType=!0;break;case 4:this.showSupportFundType=!0;break;case 5:this.showSourceType=!0;break}},clickType:function(e){this.type=e.key,this.req.searchType=e.value,this.showType=!1},clickAuthor:function(e){this.author=e.key,this.req.authorType=e.value,this.showAuthor=!1},clickTime:function(e){this.item=e,this.newTime=e.value},confirmTime:function(){this.time=this.item.key,this.req.updateTimeTag=this.item.value,this.showTime=!1},resetTime:function(){this.time="不限",this.newTime="",this.req.updateTimeTag="",this.showTime=!1},clickSourceRearchType:function(e){this.sourceRearchType=e.key,this.req.sourceRearchType=e.value,this.showSourceRearchType=!1},clickSupportFundType:function(e){this.supportFundType=e.key,this.req.supportFundType=e.value,this.showSupportFundType=!1},confirmSourceType:function(){var e=this;this.req.sourceType="",this.sourceType="";var t=[];this.newSourceType.forEach(function(n,o){e.configs.来源类别.filter(function(e){e.value==n&&t.push(e.key)})}),this.req.sourceType=this.newSourceType.join(" or "),this.sourceType=t.join(),this.showSourceType=!1},resetSourceType:function(){this.sourceType="不限",this.newSourceType=[],this.req.sourceType="",this.showSourceType=!1},toggle:function(e){this.$refs.checkboxes[e].toggle()},getDataConfigs:function(){var e=Object(c["a"])(regeneratorRuntime.mark(function e(){return regeneratorRuntime.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return e.next=2,this.$myHttp.myGet(s["b"].GET_DATA_CONFIGS,this.reqConfigs);case 2:this.configs=e.sent,sessionStorage.setItem("ZWConfigs",r()(this.configs));case 4:case"end":return e.stop()}},e,this)}));function t(){return e.apply(this,arguments)}return t}(),retrieval:Object(u["b"])(function(){sessionStorage.setItem("ZWSearch",r()(this.req)),this.$router.push({path:"/zhiWangList"})},300)}},p=l,h=(n("cac4"),n("02f9"),n("2877")),v=Object(h["a"])(p,o,a,!1,null,"1e76b19a",null);v.options.__file="zhiWangSearch.vue";t["default"]=v.exports}}]);