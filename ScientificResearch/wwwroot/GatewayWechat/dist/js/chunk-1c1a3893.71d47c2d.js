(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-1c1a3893","chunk-423da74d"],{"0f1f":function(t,e,n){"use strict";var i=n("ad92"),s=n.n(i);s.a},1138:function(t,e,n){},"1af6":function(t,e,n){var i=n("63b6");i(i.S,"Array",{isArray:n("9003")})},3374:function(t,e,n){"use strict";n.d(e,"b",function(){return s}),n.d(e,"a",function(){return o}),n.d(e,"c",function(){return l});n("4917"),n("3b2b"),n("a481"),n("cadf"),n("551c"),n("097d");var i=n("a026");function s(t,e){var n,i=e||200;return function(){var e=this,s=arguments;n&&clearTimeout(n),n=setTimeout(function(){n=null,t.apply(e,s)},i)}}function o(t){return a(t)}function a(t){var e,n,i="";for(e=0;e<t.length;e++)n=r(t.charCodeAt(e)),"25"==n&&(n=""),i+="%"+n;return i}function r(t){if(t>65535)return"err!";var e=Math.round(t/4096-.5),n=t-4096*e,i=Math.round(n/256-.5),s=n-256*i,o=Math.round(s/16-.5),a=s-16*o;return""+c(o)+c(a)}function c(t){return t<10?t:10==t?"A":11==t?"B":12==t?"C":13==t?"D":14==t?"E":15==t?"F":void 0}function l(t){return t.replace(/^(\s|\u00A0)+/,"").replace(/(\s|\u00A0)+$/,"")}i["a"].filter("dataFormat",function(t,e){var n=new Date(t),i={"M+":n.getMonth()+1,"d+":n.getDate(),"h+":n.getHours(),"m+":n.getMinutes(),"s+":n.getSeconds(),"q+":Math.floor((n.getMonth()+3)/3),S:n.getMilliseconds()};for(var s in/(y+)/.test(e)&&(e=e.replace(RegExp.$1,(n.getFullYear()+"").substr(4-RegExp.$1.length))),i)new RegExp("("+s+")").test(e)&&(e=e.replace(RegExp.$1,1===RegExp.$1.length?i[s]:("00"+i[s]).substr((""+i[s]).length)));return e})},6973:function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"details"},[n("div",{staticClass:"header"},[n("h4",{staticClass:"title"},[n("van-icon",{attrs:{name:"fire"}}),t._v("\n            "+t._s(t.item.title)+"\n        ")],1),n("p",{staticClass:"name"},[t._v(t._s(t.item.authors))])]),n("div",{staticClass:"centent"},[n("p",[t._v(t._s(t.details.abstracts))])]),n("div",{staticClass:"content-footer"},[n("p",[t._v("【来源】："+t._s(t.introdution[0]+t.introdution[1]))]),n("p",[t._v("【被引】："+t._s(t.introdution[2]))]),t.keyWord?n("p",[t._v("【关键词】："+t._s(t.keyWord))]):t._e(),t.item.tag?n("p",{staticClass:"keyword"},t._l(t.item.tag,function(e,i){return n("span",{key:i},[t._v(t._s(e))])}),0):t._e(),t.item.full&&t.details?n("div",{staticClass:"btn-box"},[n("van-button",{attrs:{type:"default"},on:{click:function(e){t.getDownloadFile(!0)}}},[n("van-icon",{attrs:{name:"icon iconfont icon-browse"}}),t._v(" 预览PDF\n            ")],1),n("van-button",{attrs:{type:"default"},on:{click:function(e){t.getDownloadFile(!1)}}},[n("van-icon",{attrs:{name:"icon iconfont icon-download"}}),t._v("下载PDF\n            ")],1)],1):t._e()])])},s=[],o=(n("96cf"),n("3b8d")),a=n("517f"),r=n("3374"),c={name:"wanFangDetails",props:["item"],data:function(){return{req:{url:"",accountId:""},reqUrl:{url:"",fileName:"",accountId:""},details:{},keyWord:"",introdution:"",showPdf:!1,downUrl:"javascript:;"}},mounted:function(){this.req.url=this.item.detailUrl,this.req.accountId=this.item.accountId,this.reqUrl.accountId=this.item.accountId,this.introdution=this.item.introdution,""!=this.item.keyWord&&(this.keyWord=this.item.keyWord.join("，")),this.getDetails()},methods:{getDetails:function(){var t=Object(o["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(a["e"].GET_ARTICLE_DETAILS,this.req);case 2:e=t.sent,this.reqUrl.url=e.downUrl,this.reqUrl.fileName=e.fileName,this.details=e;case 6:case"end":return t.stop()}},t,this)}));function e(){return t.apply(this,arguments)}return e}(),getLoading:function(){this.toastLoading=this.$toast.loading({mask:!0,message:"加载中...",duration:5e3})},getDownloadFile:Object(r["b"])(function(){var t=Object(o["a"])(regeneratorRuntime.mark(function t(e){var n;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return this.getLoading(),t.next=3,this.$myHttp.myGet(a["e"].GET_ARTICLE_DOWNURL,this.reqUrl);case 3:n=t.sent,n&&""!=n?(this.toastLoading.clear(),this.downUrl=a["d"]+"?fileName="+Object(r["a"])(n),e?this.$router.push({path:"/pdfPreview",query:{url:this.downUrl}}):window.location.href=this.downUrl):this.$toast("您无权或余额不足不能下载此文章！");case 5:case"end":return t.stop()}},t,this)}));return function(e){return t.apply(this,arguments)}}(),300)}},l=c,u=(n("a1ff"),n("2877")),h=Object(u["a"])(l,i,s,!1,null,"124217a3",null);e["default"]=h.exports},"7bd1":function(t,e,n){"use strict";n.r(e);var i=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{staticClass:"WF-list"},[n("div",{staticClass:"screen-box"},[n("van-tabs",{on:{click:t.clickTab},model:{value:t.active,callback:function(e){t.active=e},expression:"active"}},[n("van-tab",{attrs:{title:"相关度"}}),n("van-tab",{attrs:{title:"时间排序"}}),n("van-tab",{attrs:{title:"被引次数"}})],1)],1),n("van-pull-refresh",{on:{refresh:t.onRefresh},model:{value:t.isRefreshLoading,callback:function(e){t.isRefreshLoading=e},expression:"isRefreshLoading"}},[n("div",{staticClass:"content"},[n("van-list",{staticClass:"list",attrs:{"offset:500":"",finished:t.finished,"finished-text":"没有更多了···","loading-text":"加载中..."},on:{load:t.onLoad},model:{value:t.loading,callback:function(e){t.loading=e},expression:"loading"}},[n("ul",t._l(t.list,function(e){return n("li",{key:e.id,on:{click:function(n){t.clickTitle(e)}}},[n("p",{staticClass:"title"},[t._v(t._s(e.title))]),n("p",{staticClass:"source"},[t._v("【来源】"+t._s(e.introdution[0]+e.introdution[1]))]),e.authors?n("p",{staticClass:"author"},[t._v("【作者】"+t._s(e.authors))]):t._e(),n("p",{staticClass:"author"},[t._v("【引用】"+t._s(e.introdution[2]))]),n("p",{staticClass:"keyword"},t._l(e.keyWord,function(e,i){return n("span",{key:i},[t._v(t._s(e))])}),0)])}),0)])],1)]),n("van-popup",{attrs:{position:"right"},model:{value:t.showScreen,callback:function(e){t.showScreen=e},expression:"showScreen"}},[n("div",{staticClass:"tab-con"},[n("van-radio-group",{model:{value:t.sort,callback:function(e){t.sort=e},expression:"sort"}},[n("van-cell-group",t._l(t.configs.sort,function(e){return n("van-cell",{key:e.key,attrs:{title:e.value,clickable:""},on:{click:function(n){t.sort=e.key}}},[n("van-radio",{attrs:{name:e.key}})],1)}),1)],1),n("div",{staticClass:"btn-box"},[n("van-button",{attrs:{type:"warning",size:"large"},on:{click:t.resetScreen}},[t._v("重置")]),n("van-button",{attrs:{type:"primary",size:"large"},on:{click:t.confirmScreen}},[t._v("确定")])],1)],1)]),t.isShowDetails?n("van-popup",{staticClass:"details-popup",attrs:{position:"right",overlay:!1},model:{value:t.isShowDetails,callback:function(e){t.isShowDetails=e},expression:"isShowDetails"}},[n("wanFangDetails",{ref:"wanFangDetails",attrs:{item:t.item}}),n("div",{staticClass:"backtrack"},[n("span",{on:{click:t.backtrack}},[n("i",{staticClass:"icon iconfont icon-fanhui"}),t._v(" 返回")])])],1):t._e(),t.isShowBtn?n("div",{staticClass:"back-btn-box"},[n("span",{on:{click:t.backTop}},[n("i",{staticClass:"icon iconfont icon-i-back-top"})]),n("span",{on:{click:function(e){t.$router.back(-1)}}},[n("i",{staticClass:"icon iconfont icon-fanhui"})])]):t._e()],1)},s=[],o=(n("28a5"),n("ac6a"),n("a745")),a=n.n(o),r=(n("96cf"),n("3b8d")),c=n("517f"),l=(n("3374"),n("6973")),u={name:"WFList",components:{wanFangDetails:l["default"]},data:function(){return{req:{},list:[],isRefreshLoading:!1,loading:!1,finished:!1,configs:{},active:0,showScreen:!1,IconShow:!1,sort:"",isShowDetails:!1,isShowBtn:!1,item:{}}},mounted:function(){this.configs=JSON.parse(sessionStorage.getItem("WFConfigs")),this.req=JSON.parse(sessionStorage.getItem("WFSearch")),window.addEventListener("scroll",this.scrollToTop)},methods:{onLoad:function(){this.getList()},clickTab:function(t,e){switch(t){case 0:this.req.sort="",this.showScreen=!1,this.IconShow=!1;break;case 1:this.req.sort="Date desc",this.showScreen=!1,this.IconShow=!1;break;case 2:this.req.sort="CitedCount desc",this.showScreen=!1,this.IconShow=!1;break;case 3:this.req.sort="",this.showScreen=!0,this.IconShow=!0;break}this.onSearch()},changeClass:function(){if(this.IconShow)return"active"},confirmScreen:function(){this.req.sort="",this.IconShow=!1,this.showScreen=!1,this.onSearch()},resetScreen:function(){this.req.sort=""},onSearch:function(){this.req.pageIndex=1,this.finished=!1,this.loading=!0,this.backTop(),this.list=[],this.getList()},getList:function(){var t=Object(r["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(c["e"].GET_PANGING_LIST,this.req);case 2:e=t.sent,e&&e!=[]&&a()(e)?(this.req.pageIndex++,e.length<this.req.pageIndex&&(this.finished=!0),e.forEach(function(t){t.keyWord&&""!=t.keyWord&&(t.keyWord=t.keyWord.slice(0,t.keyWord.length-1),t.keyWord=t.keyWord.split("；")),""!=t.introdution&&(t.introdution=t.introdution.split(" "))}),this.list=this.list.concat(e)):(this.finished=!0,this.list=[]),this.isRefreshLoading=!1,this.loading=!1;case 6:case"end":return t.stop()}},t,this)}));function e(){return t.apply(this,arguments)}return e}(),onRefresh:function(){this.finished=!1,this.req.pageIndex=1,this.list=[],this.getList()},onClickLeft:function(){this.$router.go(-1)},clickTitle:function(t){t.accountId=this.req.accountId,this.item=t,this.isShowDetails=!0},scrollToTop:function(){var t=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop,e=window.outerHeight;this.isShowBtn=t>e},backTop:function(){document.documentElement.scrollTop=0,document.body.scrollTop=0},backtrack:function(){this.isShowDetails=!1}},destroyed:function(){window.removeEventListener("scroll",this.scrollToTop)}},h=u,d=(n("0f1f"),n("d030"),n("2877")),f=Object(d["a"])(h,i,s,!1,null,"be1883ce",null);e["default"]=f.exports},9003:function(t,e,n){var i=n("6b4c");t.exports=Array.isArray||function(t){return"Array"==i(t)}},"93fe":function(t,e,n){},a1ff:function(t,e,n){"use strict";var i=n("1138"),s=n.n(i);s.a},a745:function(t,e,n){t.exports=n("f410")},ad92:function(t,e,n){},d030:function(t,e,n){"use strict";var i=n("93fe"),s=n.n(i);s.a},f410:function(t,e,n){n("1af6"),t.exports=n("584a").Array.isArray}}]);