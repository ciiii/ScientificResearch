(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-042f56cf"],{1914:function(e,t,a){"use strict";a.r(t);var n=function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"WF-search"},[e._m(0),a("div",{staticClass:"main"},[a("van-cell-group",[a("div",{staticClass:"item new-item"},[a("span",{staticClass:"title",on:{click:function(t){e.clickTitle(0)}}},[e._v(e._s(e.keyType.keyTypeOne)+"\n                "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),a("div",{staticClass:"time-box"},[a("input",{directives:[{name:"model",rawName:"v-model",value:e.searchParamters.keyContent,expression:"searchParamters.keyContent"}],attrs:{placeholder:"请输入"},domProps:{value:e.searchParamters.keyContent},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.searchParamters,"keyContent",t.target.value)}}}),a("span",{staticClass:"title title-right",on:{click:function(t){e.clickMate(0)}}},[e._v(e._s(e.searchType.searchTypeOne)+"\n                    "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),a("div",{staticClass:"item new-item"},[a("span",{staticClass:"title",on:{click:function(t){e.clickTitle(1)}}},[e._v(e._s(e.keyType.keyTypeTwo)+"\n                "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),a("div",{staticClass:"time-box"},[a("input",{directives:[{name:"model",rawName:"v-model",value:e.search1.keyContent,expression:"search1.keyContent"}],attrs:{placeholder:"请输入"},domProps:{value:e.search1.keyContent},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.search1,"keyContent",t.target.value)}}}),a("span",{staticClass:"title title-right",on:{click:function(t){e.clickMate(1)}}},[e._v(e._s(e.searchType.searchTypeTwo)+"\n                    "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),a("div",{staticClass:"item new-item"},[a("span",{staticClass:"title",on:{click:function(t){e.clickTitle(2)}}},[e._v(e._s(e.keyType.keyTypeThree)+"\n                "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),a("div",{staticClass:"time-box"},[a("input",{directives:[{name:"model",rawName:"v-model",value:e.search2.keyContent,expression:"search2.keyContent"}],attrs:{placeholder:"请输入"},domProps:{value:e.search2.keyContent},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.search2,"keyContent",t.target.value)}}}),a("span",{staticClass:"title title-right",on:{click:function(t){e.clickMate(2)}}},[e._v(e._s(e.searchType.searchTypeThree)+"\n                    "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),a("div",{staticClass:"item new-item"},[a("span",{staticClass:"title",on:{click:function(t){e.clickTitle(3)}}},[e._v(e._s(e.keyType.keyTypeFour)+"\n                "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),a("div",{staticClass:"time-box"},[a("input",{directives:[{name:"model",rawName:"v-model",value:e.search3.keyContent,expression:"search3.keyContent"}],attrs:{placeholder:"请输入"},domProps:{value:e.search3.keyContent},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.search3,"keyContent",t.target.value)}}}),a("span",{staticClass:"title title-right",on:{click:function(t){e.clickMate(3)}}},[e._v(e._s(e.searchType.searchTypeFour)+"\n                    "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),a("div",{staticClass:"item new-item"},[a("span",{staticClass:"title",on:{click:function(t){e.clickTitle(4)}}},[e._v(e._s(e.keyType.keyTypeFive)+"\n                "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1),a("div",{staticClass:"time-box"},[a("input",{directives:[{name:"model",rawName:"v-model",value:e.search4.keyContent,expression:"search4.keyContent"}],attrs:{placeholder:"请输入"},domProps:{value:e.search4.keyContent},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||e.$set(e.search4,"keyContent",t.target.value)}}}),a("span",{staticClass:"title title-right",on:{click:function(t){e.clickMate(4)}}},[e._v(e._s(e.searchType.searchTypeFive)+"\n                    "),a("van-icon",{attrs:{name:"icon iconfont icon-tabxiala"}})],1)])]),a("div",{staticClass:"item"},[a("van-field",{attrs:{clearable:"",label:"中图分类",placeholder:"请选择",readonly:""},on:{click:function(t){e.clickTitle(5)}},model:{value:e.req.chineseLibType,callback:function(t){e.$set(e.req,"chineseLibType",t)},expression:"req.chineseLibType"}})],1),a("van-field",{attrs:{clearable:"",label:"资源类型",placeholder:"请选择",readonly:""},on:{click:function(t){e.clickTitle(6)}},model:{value:e.req.sourceType,callback:function(t){e.$set(e.req,"sourceType",t)},expression:"req.sourceType"}}),a("div",{staticClass:"item"},[a("span",{staticClass:"title"},[e._v("出版时间")]),a("div",{staticClass:"time-box"},[a("input",{directives:[{name:"model",rawName:"v-model",value:e.starTime,expression:"starTime"}],attrs:{placeholder:"开始年度",type:"number"},domProps:{value:e.starTime},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||(e.starTime=t.target.value)}}}),a("span",[e._v("至")]),a("input",{directives:[{name:"model",rawName:"v-model",value:e.endTime,expression:"endTime"}],attrs:{placeholder:"结束年度",type:"number"},domProps:{value:e.endTime},on:{keyup:function(t){return"button"in t||!e._k(t.keyCode,"enter",13,t.key,"Enter")?e.retrieval(t):null},input:function(t){t.target.composing||(e.endTime=t.target.value)}}})])]),a("div",{staticClass:"tab-con fullContent"},[a("van-checkbox-group",{model:{value:e.isFullContent,callback:function(t){e.isFullContent=t},expression:"isFullContent"}},[a("van-cell-group",e._l(e.FullContent,function(t,n){return a("van-cell",{key:t,attrs:{title:"是否全文",clickable:""},on:{click:function(t){e.toggle(n)}}},[a("van-checkbox",{ref:"checkboxes",refInFor:!0,attrs:{name:t},on:{click:function(t){t.stopPropagation(),e.toggle(n)}}})],1)}),1)],1)],1),a("p",{staticClass:"explain"},[e._v("说明：出版时间只能输入数字，例如 "+e._s(e.date))])],1),a("van-popup",{attrs:{position:"bottom"},model:{value:e.showSearchType,callback:function(t){e.showSearchType=t},expression:"showSearchType"}},[a("div",{staticClass:"tab-con"},[a("h2",{staticClass:"van-doc-demo-block__title"},[e._v("检索类型")]),a("van-radio-group",{model:{value:e.type,callback:function(t){e.type=t},expression:"type"}},[a("van-cell-group",e._l(e.configs.searchType,function(t){return a("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(a){e.changeType(t)}}},[a("van-radio",{attrs:{name:t.value},on:{click:function(a){a.stopPropagation(),e.changeType(t)}}})],1)}),1)],1)],1)]),a("van-popup",{attrs:{position:"bottom"},model:{value:e.showMateType,callback:function(t){e.showMateType=t},expression:"showMateType"}},[a("div",{staticClass:"tab-con"},[a("h2",{staticClass:"van-doc-demo-block__title"},[e._v("匹配类型")]),a("van-radio-group",{model:{value:e.mate,callback:function(t){e.mate=t},expression:"mate"}},[a("van-cell-group",e._l(e.searchLiset,function(t){return a("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(a){e.changekMateType(t)}}},[a("van-radio",{attrs:{name:t.value},on:{click:function(a){a.stopPropagation(),e.changekMateType(t)}}})],1)}),1)],1)],1)]),a("van-popup",{attrs:{position:"bottom"},model:{value:e.showClassify,callback:function(t){e.showClassify=t},expression:"showClassify"}},[a("div",{staticClass:"tab-con"},[a("h2",{staticClass:"van-doc-demo-block__title"},[e._v("中图分类")]),a("van-radio-group",{model:{value:e.req.chineseLibType,callback:function(t){e.$set(e.req,"chineseLibType",t)},expression:"req.chineseLibType"}},[a("van-cell-group",e._l(e.configs.chineseLibType,function(t){return a("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(a){e.changeClassify(t)}}},[a("van-radio",{attrs:{name:t.value},on:{click:function(a){a.stopPropagation(),e.changeClassify(t)}}})],1)}),1)],1)],1)]),a("van-popup",{attrs:{position:"bottom"},model:{value:e.showType,callback:function(t){e.showType=t},expression:"showType"}},[a("div",{staticClass:"tab-con"},[a("h2",{staticClass:"van-doc-demo-block__title"},[e._v("资源类型")]),a("van-radio-group",{model:{value:e.req.sourceType,callback:function(t){e.$set(e.req,"sourceType",t)},expression:"req.sourceType"}},[a("van-cell-group",e._l(e.configs.sourceType,function(t){return a("van-cell",{key:t.key,attrs:{title:t.key,clickable:""},on:{click:function(a){e.changeResourceType(t)}}},[a("van-radio",{attrs:{name:t.value},on:{click:function(a){a.stopPropagation(),e.changeResourceType(t)}}})],1)}),1)],1)],1)])],1),a("div",{staticClass:"retrieval-box"},[a("van-button",{staticClass:"btn-retrieval",attrs:{type:"primary",size:"large"},on:{click:e.retrieval}},[e._v("检索")])],1)])},s=[function(){var e=this,t=e.$createElement,n=e._self._c||t;return n("div",{staticClass:"logo"},[n("img",{attrs:{src:a("b779"),alt:""}})])}],i=(a("f559"),a("f499")),c=a.n(i),r=(a("96cf"),a("3b8d")),o=a("517f"),l=a("3374"),h={name:"home",data:function(){return{req:{keyWord:"",sourceType:"",chineseLibType:"",releaseDate:"",sort:"",pageIndex:1,pageSize:20,isFullContent:"",accountId:2007},reqConfigs:{isReload:!0,sourceType:"wfSelectData"},configs:{},showType:!1,showClassify:!1,showSearchType:!1,showMateType:!1,date:(new Date).getFullYear(),starTime:"",endTime:"",searchType:{searchTypeOne:"模糊",searchTypeTwo:"模糊",searchTypeThree:"模糊",searchTypeFour:"模糊",searchTypeFive:"模糊"},keyType:{keyTypeOne:"全部字段",keyTypeTwo:"关键词",keyTypeThree:"题名",keyTypeFour:"作者",keyTypeFive:"作者单位"},searchLiset:[{key:"模糊",value:1},{key:"精准",value:2}],searchParamters:{keyType:"全部字段",keyContent:"",matchType:1,paramters:[]},search1:{relationType:"AND",keyType:"关键词",keyContent:"",matchType:1},search2:{relationType:"AND",keyType:"题名",keyContent:"",matchType:1},search3:{relationType:"AND",keyType:"作者",keyContent:"",matchType:1},search4:{relationType:"AND",keyType:"作者单位",keyContent:"",matchType:1},index:"",searchTypeIndex:"",isFullContent:[],FullContent:["有"],type:"",mate:""}},mounted:function(){this.req.accountId=this.$route.query.accountId,this.getDataConfigs()},methods:{clickTitle:function(e){switch(this.index=e,e){case 0:this.showSearchType=!0,this.type=this.searchParamters.keyType;break;case 1:this.showSearchType=!0,this.type=this.search1.keyType;break;case 2:this.showSearchType=!0,this.type=this.search2.keyType;break;case 3:this.showSearchType=!0,this.type=this.search3.keyType;break;case 4:this.showSearchType=!0,this.type=this.search4.keyType;break;case 5:this.showClassify=!0;break;case 6:this.showType=!0;break}},clickMate:function(e){switch(this.searchTypeIndex=e,e){case 0:this.mate=this.searchParamters.matchType;break;case 1:this.mate=this.search1.matchType;break;case 2:this.mate=this.search2.matchType;break;case 3:this.mate=this.search3.matchType;break;case 4:this.mate=this.search4.matchType;break}this.showMateType=!0},changeType:function(e){switch(this.index){case 0:this.keyType.keyTypeOne=e.key,this.searchParamters.keyType=e.value;break;case 1:this.keyType.keyTypeTwo=e.key,this.search1.keyType=e.value;break;case 2:this.keyType.keyTypeThree=e.key,this.search2.keyType=e.value;break;case 3:this.keyType.keyTypeFour=e.key,this.search3.keyType=e.value;break;case 4:this.keyType.keyTypeFive=e.key,this.search4.keyType=e.value;break}this.type=e.key,this.showSearchType=!1},changeIndex:function(e,t,a){switch(e){case 0:this.searchParamters.matchType=t,this.searchType.searchTypeOne=a;break;case 1:this.search1.matchType=t,this.searchType.searchTypeTwo=a;break;case 2:this.search2.matchType=t,this.searchType.searchTypeThree=a;break;case 3:this.search3.matchType=t,this.searchType.searchTypeFour=a;break;case 4:this.search4.matchType=t,this.searchType.searchTypeFive=a;break}},changekMateType:function(e){1==e.value?this.changeIndex(this.searchTypeIndex,e.value,"模糊"):this.changeIndex(this.searchTypeIndex,e.value,"精确"),this.mate=e.key,this.showMateType=!1},changeClassify:function(e){this.req.chineseLibType=e.key,this.showClassify=!1},changeResourceType:function(e){this.req.sourceType=e.key,this.showType=!1},getDataConfigs:function(){var e=Object(r["a"])(regeneratorRuntime.mark(function e(){return regeneratorRuntime.wrap(function(e){while(1)switch(e.prev=e.next){case 0:return e.next=2,this.$myHttp.myGet(o["d"].GET_DATA_CONFIGS,this.reqConfigs);case 2:this.configs=e.sent,sessionStorage.setItem("WFConfigs",c()(this.configs));case 4:case"end":return e.stop()}},e,this)}));function t(){return e.apply(this,arguments)}return t}(),getSearchParameters:function(e){var t=this.getSearchTypeWord(e.keyType,this.getMatchTypeWord(e.matchType,e.keyContent)),a=e.paramters;if(null!=a&&a.length>0)for(var n=0;n<a.length;n++){var s=a[n];t&&""!=t&&(t="("+t+") "),t=t+s.relationType+" "+this.getSearchTypeWord(s.keyType,this.getMatchTypeWord(s.matchType,s.keyContent))}return t&&t.startsWith("AND")&&(t="\\"+t),t},getSearchTypeWord:function(e,t){return"全部字段"!=e&&""!=t&&(t=e+"="+t),t},getMatchTypeWord:function(e,t){return 2==e&&""!=t&&(t='"'+t+'"'),t},toggle:function(e){this.$refs.checkboxes[e].toggle()},retrieval:Object(l["b"])(function(){this.isFullContent.length>0?this.req.isFullContent=this.isFullContent[0]:this.req.isFullContent="",this.searchParamters.keyContent=Object(l["c"])(this.searchParamters.keyContent),this.search1.keyContent=Object(l["c"])(this.search1.keyContent),this.search2.keyContent=Object(l["c"])(this.search2.keyContent),this.search3.keyContent=Object(l["c"])(this.search3.keyContent),this.search4.keyContent=Object(l["c"])(this.search4.keyContent),this.search1.keyContent&&""!=this.search1.keyContent&&this.searchParamters.paramters.push(this.search1),this.search2.keyContent&&""!=this.search2.keyContent&&this.searchParamters.paramters.push(this.search2),this.search3.keyContent&&""!=this.search3.keyContent&&this.searchParamters.paramters.push(this.search3),this.search4.keyContent&&""!=this.search4.keyContent&&this.searchParamters.paramters.push(this.search4),this.req.keyWord=this.getSearchParameters(this.searchParamters),this.req.keyWord&&""!=this.req.keyWord?(this.starTime&&this.endTime&&(this.req.releaseDate=this.starTime+"-"+this.endTime),sessionStorage.setItem("WFSearch",c()(this.req)),this.searchParamters.paramters=[],this.$router.push({path:"/wanFangList"})):this.$toast({message:"前5个条件至少输入1个才能检索！",duration:4e3})},300)}},p=h,y=(a("5ad1"),a("66f3"),a("2877")),u=Object(y["a"])(p,n,s,!1,null,"0d587e38",null);u.options.__file="wanFangSearch.vue";t["default"]=u.exports},3374:function(e,t,a){"use strict";a.d(t,"b",function(){return s}),a.d(t,"a",function(){return i}),a.d(t,"c",function(){return l});a("3b2b"),a("a481");var n=a("a026");function s(e,t){var a,n=t||200;return function(){var t=this,s=arguments;a&&clearTimeout(a),a=setTimeout(function(){a=null,e.apply(t,s)},n)}}function i(e){return c(e)}function c(e){var t,a,n="";for(t=0;t<e.length;t++)a=r(e.charCodeAt(t)),"25"==a&&(a=""),n+="%"+a;return n}function r(e){if(e>65535)return"err!";var t=Math.round(e/4096-.5),a=e-4096*t,n=Math.round(a/256-.5),s=a-256*n,i=Math.round(s/16-.5),c=s-16*i;return""+o(i)+o(c)}function o(e){return e<10?e:10==e?"A":11==e?"B":12==e?"C":13==e?"D":14==e?"E":15==e?"F":void 0}function l(e){return e.replace(/^(\s|\u00A0)+/,"").replace(/(\s|\u00A0)+$/,"")}n["a"].filter("dataFormat",function(e,t){var a=new Date(e),n={"M+":a.getMonth()+1,"d+":a.getDate(),"h+":a.getHours(),"m+":a.getMinutes(),"s+":a.getSeconds(),"q+":Math.floor((a.getMonth()+3)/3),S:a.getMilliseconds()};for(var s in/(y+)/.test(t)&&(t=t.replace(RegExp.$1,(a.getFullYear()+"").substr(4-RegExp.$1.length))),n)new RegExp("("+s+")").test(t)&&(t=t.replace(RegExp.$1,1===RegExp.$1.length?n[s]:("00"+n[s]).substr((""+n[s]).length)));return t})},"5ad1":function(e,t,a){"use strict";var n=a("e8a2"),s=a.n(n);s.a},"66f3":function(e,t,a){"use strict";var n=a("c201"),s=a.n(n);s.a},a21f:function(e,t,a){var n=a("584a"),s=n.JSON||(n.JSON={stringify:JSON.stringify});e.exports=function(e){return s.stringify.apply(s,arguments)}},b779:function(e,t,a){e.exports=a.p+"img/logo_wanfang.bebb9c42.png"},c201:function(e,t,a){},e8a2:function(e,t,a){},f499:function(e,t,a){e.exports=a("a21f")}}]);