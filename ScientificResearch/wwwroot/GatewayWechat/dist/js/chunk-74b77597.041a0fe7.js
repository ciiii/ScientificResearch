(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-74b77597"],{"3f0f":function(e,t,o){},4591:function(e,t,o){"use strict";var n=o("3f0f"),a=o.n(n);a.a},a21f:function(e,t,o){var n=o("584a"),a=n.JSON||(n.JSON={stringify:JSON.stringify});e.exports=function(e){return a.stringify.apply(a,arguments)}},c09c:function(e,t,o){},cac4:function(e,t,o){"use strict";var n=o("c09c"),a=o.n(n);a.a},de65:function(e,t,o){e.exports=o.p+"img/logo_zhiwang.20d74fdb.png"},f499:function(e,t,o){e.exports=o("a21f")},fb8f:function(e,t,o){"use strict";o.r(t);var n=function(){var e=this,t=e.$createElement,o=e._self._c||t;return o("div",{staticClass:"ZW-search"},[e._m(0),o("van-cell-group",[o("div",{staticClass:"item"},[o("span",{staticClass:"title",on:{click:function(t){e.clickTitle(0)}}},[e._v(e._s(e.type)+"\n                "),o("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),o("van-field",{attrs:{clearable:"",placeholder:"请输入"},on:{"click-label":function(t){e.clickTitle(0)}},nativeOn:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null}},model:{value:e.req.searchKeyWord,callback:function(t){e.$set(e.req,"searchKeyWord",t)},expression:"req.searchKeyWord"}})],1),o("div",{staticClass:"item"},[o("span",{staticClass:"title",on:{click:function(t){e.clickTitle(1)}}},[e._v(e._s(e.author)+"\n                "),o("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),o("van-field",{attrs:{clearable:"",placeholder:"请输入"},on:{"click-label":function(t){e.clickTitle(1)}},nativeOn:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null}},model:{value:e.req.authorName,callback:function(t){e.$set(e.req,"authorName",t)},expression:"req.authorName"}})],1),o("van-field",{attrs:{clearable:"",label:"作者单位",placeholder:"请输入"},nativeOn:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null}},model:{value:e.req.authorGroup,callback:function(t){e.$set(e.req,"authorGroup",t)},expression:"req.authorGroup"}}),o("div",{staticClass:"item"},[o("span",{staticClass:"title"},[e._v("发表时间")]),o("div",{staticClass:"time-box"},[o("input",{directives:[{name:"model",rawName:"v-model",value:e.req.publicYearFrom,expression:"req.publicYearFrom"}],attrs:{placeholder:"开始年度",type:"number"},domProps:{value:e.req.publicYearFrom},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"publicYearFrom",t.target.value)}}}),o("span",[e._v("至")]),o("input",{directives:[{name:"model",rawName:"v-model",value:e.req.publicYearTo,expression:"req.publicYearTo"}],attrs:{placeholder:"结束年度",type:"number"},domProps:{value:e.req.publicYearTo},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"publicYearTo",t.target.value)}}})])]),o("van-field",{attrs:{clearable:"",label:"更新时间",placeholder:"请选择",readonly:""},on:{click:function(t){e.clickTitle(2)}},model:{value:e.time,callback:function(t){e.time=t},expression:"time"}}),o("div",{staticClass:"item new-item"},[o("span",{staticClass:"title"},[e._v("来源期刊")]),o("div",{staticClass:"time-box"},[o("input",{directives:[{name:"model",rawName:"v-model",value:e.req.sourceName,expression:"req.sourceName"}],attrs:{placeholder:"请输入"},domProps:{value:e.req.sourceName},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"sourceName",t.target.value)}}}),o("span",{staticClass:"title title-right",on:{click:function(t){e.clickTitle(3)}}},[e._v(e._s(e.sourceRearchType)+"\n                    "),o("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),o("div",{staticClass:"item new-item"},[o("span",{staticClass:"title"},[e._v("支持基金")]),o("div",{staticClass:"time-box"},[o("input",{directives:[{name:"model",rawName:"v-model",value:e.req.supportFundName,expression:"req.supportFundName"}],attrs:{placeholder:"请输入"},domProps:{value:e.req.supportFundName},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.req,"supportFundName",t.target.value)}}}),o("span",{staticClass:"title title-right",on:{click:function(t){e.clickTitle(4)}}},[e._v(e._s(e.supportFundType)+"\n                    "),o("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),o("van-field",{attrs:{clearable:"",label:"来源类别",placeholder:"请选择",readonly:""},on:{click:function(t){e.clickTitle(5)}},model:{value:e.sourceType,callback:function(t){e.sourceType=t},expression:"sourceType"}}),o("p",{staticClass:"explain"},[e._v("说明：发表时间只能输入数字，例如 "+e._s(e.date))])],1),o("van-popup",{attrs:{position:"bottom"},model:{value:e.showType,callback:function(t){e.showType=t},expression:"showType"}},[o("div",{staticClass:"tab-con"},[o("h2",{staticClass:"van-doc-demo-block__title"},[e._v("检索类型")]),o("van-radio-group",{model:{value:e.req.searchType,callback:function(t){e.$set(e.req,"searchType",t)},expression:"req.searchType"}},[o("van-cell-group",e._l(e.configs.检索类型,function(t){return o("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(o){e.clickType(t)}}},[o("van-radio",{attrs:{name:t.value},on:{click:function(o){o.stopPropagation(),e.clickType(t)}}})],1)}),1)],1)],1)]),o("van-popup",{attrs:{position:"bottom"},model:{value:e.showAuthor,callback:function(t){e.showAuthor=t},expression:"showAuthor"}},[o("div",{staticClass:"tab-con"},[o("h2",{staticClass:"van-doc-demo-block__title"},[e._v("作者类型")]),o("van-radio-group",{model:{value:e.req.authorType,callback:function(t){e.$set(e.req,"authorType",t)},expression:"req.authorType"}},[o("van-cell-group",e._l(e.configs.作者类型,function(t){return o("van-cell",{key:t.value,attrs:{title:t.key,clickable:""},on:{click:function(o){e.clickAuthor(t)}}},[o("van-radio",{attrs:{name:t.value},on:{click:function(o){o.stopPropagation(),e.clickAuthor(t)}}})],1)}),1)],1)],1)]),o("van-popup",{attrs:{position:"bottom"},model:{value:e.showTime,callback:function(t){e.showTime=t},expression:"showTime"}},[o("div",{staticClass:"tab-con"},[o("h2",{staticClass:"van-doc-demo-block__title"},[e._v("更新时间")]),o("van-radio-group",{model:{value:e.newTime,callback:function(t){e.newTime=t},expression:"newTime"}},[o("van-cell-group",e._l(e.configs.更新时间,function(t){return o("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(o){e.clickTime(t)}}},[o("van-radio",{attrs:{name:t.value},on:{click:function(o){o.stopPropagation(),e.clickTime(t)}}})],1)}),1)],1),o("div",{staticClass:"btn-box"},[o("van-button",{attrs:{type:"warning",size:"large"},on:{click:e.resetTime}},[e._v("不限条件")]),o("van-button",{attrs:{type:"primary",size:"large"},on:{click:e.confirmTime}},[e._v("确定")])],1)],1)]),o("van-popup",{attrs:{position:"bottom"},model:{value:e.showSourceRearchType,callback:function(t){e.showSourceRearchType=t},expression:"showSourceRearchType"}},[o("div",{staticClass:"tab-con"},[o("h2",{staticClass:"van-doc-demo-block__title"},[e._v("来源期刊检索类型")]),o("van-radio-group",{model:{value:e.req.sourceRearchType,callback:function(t){e.$set(e.req,"sourceRearchType",t)},expression:"req.sourceRearchType"}},[o("van-cell-group",e._l(e.searchLiset,function(t){return o("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(o){e.clickSourceRearchType(t)}}},[o("van-radio",{attrs:{name:t.value},on:{click:function(o){o.stopPropagation(),e.clickSourceRearchType(t)}}})],1)}),1)],1)],1)]),o("van-popup",{attrs:{position:"bottom"},model:{value:e.showSupportFundType,callback:function(t){e.showSupportFundType=t},expression:"showSupportFundType"}},[o("div",{staticClass:"tab-con"},[o("h2",{staticClass:"van-doc-demo-block__title"},[e._v("支持基金检索类型")]),o("van-radio-group",{model:{value:e.req.supportFundType,callback:function(t){e.$set(e.req,"supportFundType",t)},expression:"req.supportFundType"}},[o("van-cell-group",e._l(e.searchLiset,function(t){return o("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(o){e.clickSupportFundType(t)}}},[o("van-radio",{attrs:{name:t.value},on:{click:function(o){o.stopPropagation(),e.clickSupportFundType(t)}}})],1)}),1)],1)],1)]),o("van-popup",{attrs:{position:"bottom"},model:{value:e.showSourceType,callback:function(t){e.showSourceType=t},expression:"showSourceType"}},[o("div",{staticClass:"tab-con"},[o("h2",{staticClass:"van-doc-demo-block__title"},[e._v("来源类别(多选)")]),o("van-checkbox-group",{model:{value:e.newSourceType,callback:function(t){e.newSourceType=t},expression:"newSourceType"}},[o("van-cell-group",e._l(e.configs.来源类别,function(t,n){return o("van-cell",{key:t.key,attrs:{clickable:"",title:t.key},on:{click:function(t){e.toggle(n)}}},[o("van-checkbox",{ref:"checkboxes",refInFor:!0,attrs:{name:t.value},on:{click:function(t){t.stopPropagation(),e.toggle(n)}}})],1)}),1)],1),o("div",{staticClass:"btn-box"},[o("van-button",{attrs:{type:"warning",size:"large"},on:{click:e.resetSourceType}},[e._v("不限条件")]),o("van-button",{attrs:{type:"primary",size:"large"},on:{click:e.confirmSourceType}},[e._v("确定")])],1)],1)]),o("div",{staticClass:"retrieval-box"},[o("van-button",{staticClass:"btn-retrieval",attrs:{type:"primary",size:"large"},on:{click:e.retrieval}},[e._v("检索")])],1)],1)},a=[function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"logo"},[n("img",{attrs:{src:o("de65"),alt:""}})])}],i=o("f499"),c=o.n(i),r=(o("96cf"),o("3b8d")),s=(o("ac6a"),o("517f")),l={name:"home",data:function(){return{req:{searchType:"SU$%=|",searchKeyWord:"",authorType:"AU",authorName:"",authorGroup:"",publicYearFrom:"",publicYearTo:"",updateTimeTag:"",sourceName:"",sourceRearchType:"%",sourceType:"",supportFundName:"",supportFundType:"%",accountId:2006},reqConfigs:{isReload:!0,sourceType:"zwSelectData"},configs:{},showType:!1,showAuthor:!1,showTime:!1,showSourceRearchType:!1,showSupportFundType:!1,showSourceType:!1,date:(new Date).getFullYear(),resourceType:"",starTime:"",endTime:"",searchLiset:[{key:"模糊",value:"%"},{key:"精准",value:"="}],type:"主题",author:"作者",time:"",newTime:"",sourceRearchType:"模糊",supportFundType:"模糊",sourceType:"",newSourceType:[],item:{}}},mounted:function(){this.req.accountId=this.$route.query.accountId,this.getDataConfigs()},methods:{onSearch:function(){this.req.Index=1,this.getList()},clickTitle:function(e){switch(e){case 0:this.showType=!0;break;case 1:this.showAuthor=!0;break;case 2:this.showTime=!0;break;case 3:this.showSourceRearchType=!0;break;case 4:this.showSupportFundType=!0;break;case 5:this.showSourceType=!0;break}},clickType:function(e){this.type=e.key,this.req.searchType=e.value,this.showType=!1},clickAuthor:function(e){this.author=e.key,this.req.authorType=e.value,this.showAuthor=!1},clickTime:function(e){this.item=e,this.newTime=e.value},confirmTime:function(){this.time=this.item.key,this.req.updateTimeTag=this.item.value,this.showTime=!1},resetTime:function(){this.time="不限",this.newTime="",this.req.updateTimeTag="",this.showTime=!1},clickSourceRearchType:function(e){this.sourceRearchType=e.key,this.req.sourceRearchType=e.value,this.showSourceRearchType=!1},clickSupportFundType:function(e){this.supportFundType=e.key,this.req.supportFundType=e.value,this.showSupportFundType=!1},confirmSourceType:function(){var e=this;this.req.sourceType="",this.sourceType="";var t=[];this.newSourceType.forEach(function(o,n){e.configs.来源类别.filter(function(e){e.value==o&&t.push(e.key)})}),this.req.sourceType=this.newSourceType.join(" or "),this.sourceType=t.join(),this.showSourceType=!1},resetSourceType:function(){this.sourceType="不限",this.newSourceType=[],this.req.sourceType="",this.showSourceType=!1},toggle:function(e){this.$refs.checkboxes[e].toggle()},getDataConfigs:function(){var e=Object(r["a"])(regeneratorRuntime.mark(function e(){return regeneratorRuntime.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return e.next=2,this.$myHttp.myGet(s["b"].GET_DATA_CONFIGS,this.reqConfigs);case 2:this.configs=e.sent,sessionStorage.setItem("ZWConfigs",c()(this.configs));case 4:case"end":return e.stop()}},e,this)}));function t(){return e.apply(this,arguments)}return t}(),retrieval:function(){sessionStorage.setItem("ZWSearch",c()(this.req)),this.$router.push({path:"/zhiWangList"})}}},u=l,p=(o("cac4"),o("4591"),o("2877")),h=Object(p["a"])(u,n,a,!1,null,"5faf4295",null);h.options.__file="zhiWangSearch.vue";t["default"]=h.exports}}]);