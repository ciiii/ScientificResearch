(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-41fd66fe","chunk-b2c4e9bc"],{"0f1f":function(t,n,e){"use strict";var i=e("ad92"),s=e.n(i);s.a},3374:function(t,n,e){"use strict";e.d(n,"b",function(){return s}),e.d(n,"a",function(){return o});e("3b2b"),e("a481");var i=e("a026");function s(t,n){var e,i=n||200;return function(){var n=this,s=arguments;e&&clearTimeout(e),e=setTimeout(function(){e=null,t.apply(n,s)},i)}}function o(t){return a(t)}function a(t){var n,e,i="";for(0,n=0;n<t.length;n++)e=r(t.charCodeAt(n)),"25"==e&&(e=""),i+="%"+e;return i}function r(t){if(t>65535)return"err!";var n=Math.round(t/4096-.5),e=t-4096*n,i=Math.round(e/256-.5),s=e-256*i,o=Math.round(s/16-.5),a=s-16*o;return""+c(o)+c(a)}function c(t){return t<10?t:10==t?"A":11==t?"B":12==t?"C":13==t?"D":14==t?"E":15==t?"F":void 0}(function(t,n){var e=t.documentElement,i="orientationchange"in window?"orientationchange":"resize",s=function(){var t=e.clientWidth;t&&(e.style.fontSize=t/320*20+"px")};t.addEventListener&&(n.addEventListener(i,s,!1),t.addEventListener("DOMContentLoaded",s,!1))})(document,window),i["a"].filter("dataFormat",function(t,n){var e=new Date(t),i={"M+":e.getMonth()+1,"d+":e.getDate(),"h+":e.getHours(),"m+":e.getMinutes(),"s+":e.getSeconds(),"q+":Math.floor((e.getMonth()+3)/3),S:e.getMilliseconds()};for(var s in/(y+)/.test(n)&&(n=n.replace(RegExp.$1,(e.getFullYear()+"").substr(4-RegExp.$1.length))),i)new RegExp("("+s+")").test(n)&&(n=n.replace(RegExp.$1,1===RegExp.$1.length?i[s]:("00"+i[s]).substr((""+i[s]).length)));return n})},"354b":function(t,n,e){},6973:function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"details"},[e("div",{staticClass:"header"},[e("h4",{staticClass:"title"},[e("van-icon",{attrs:{name:"fire"}}),t._v("\n            "+t._s(t.item.title)+"\n        ")],1),e("p",{staticClass:"name"},[t._v(t._s(t.item.authors))])]),e("div",{staticClass:"centent"},[e("p",[t._v(t._s(t.details.abstracts))])]),e("div",{staticClass:"content-footer"},[t.introdution?e("p",[t._v("【来源】："+t._s(t.introdution[0]+t.introdution[1]))]):t._e(),t.introdution?e("p",[t._v("【被引】："+t._s(t.introdution[2]))]):t._e(),t.keyWord?e("p",[t._v("【关键词】："+t._s(t.keyWord))]):t._e(),t.item.tag?e("p",{staticClass:"keyword"},[t._v("\n            【标签】："),t._l(t.item.tag,function(n){return e("span",{key:n},[t._v(t._s(n))])})],2):t._e(),t.item.full?e("div",{staticClass:"btn-box"},[e("a",{staticClass:"btn-preview",attrs:{href:"javascript:;"},on:{click:t.clickPreview}},[t._v("\n                预览PDF\n                "),e("van-icon",{attrs:{name:"icon iconfont icon-browse"}})],1),e("a",{staticClass:"btn-download",attrs:{href:t.downUrl,id:"btn-download",download:""}},[t._v("\n                下载PDF\n                "),e("van-icon",{attrs:{name:"icon iconfont icon-download"}})],1)]):t._e()])])},s=[],o=(e("96cf"),e("3b8d")),a=(e("cadf"),e("551c"),e("097d"),e("517f")),r=e("3374"),c=(e("8b84"),{name:"wanFangDetails",props:["item"],data:function(){return{req:{url:"",accountId:""},reqUrl:{url:"",accountId:""},details:{},keyWord:"",introdution:"",showPdf:!1,downUrl:"javascript:;"}},mounted:function(){this.req.url=this.item.detailUrl,this.req.accountId=this.item.accountId,this.reqUrl.accountId=this.item.accountId,this.introdution=this.item.introdution,""!=this.item.keyWord&&(this.keyWord=this.item.keyWord.join("，")),this.getDetails()},methods:{getDetails:function(){var t=Object(o["a"])(regeneratorRuntime.mark(function t(){var n;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(a["c"].GET_ARTICLE_DETAILS,this.req);case 2:n=t.sent,this.reqUrl.url=n.downUrl,n.downUrl&&(this.downUrl=a["c"].GET_DOWNURL_FILE+"?fileName="+Object(r["a"])(n.fileName)+"&downUrl="+Object(r["a"])(this.reqUrl.url)+"&accountId="+this.item.accountId),this.details=n;case 6:case"end":return t.stop()}},t,this)}));function n(){return t.apply(this,arguments)}return n}(),clickPreview:function(){window.open("pdf/web/viewer.html?file="+encodeURIComponent(this.downUrl))},getDownloadFile:function(){var t=Object(o["a"])(regeneratorRuntime.mark(function t(){var n,e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(a["c"].GET_ARTICLE_DOWNURL,this.reqUrl);case 2:n=t.sent,n&&(e=a["b"]+"?fileName="+n,console.info(e),window.location.href=e);case 4:case"end":return t.stop()}},t,this)}));function n(){return t.apply(this,arguments)}return n}()}}),l=c,u=(e("b562"),e("2877")),d=Object(u["a"])(l,i,s,!1,null,"5b94e334",null);d.options.__file="wanFangDetails.vue";n["default"]=d.exports},"7bd1":function(t,n,e){"use strict";e.r(n);var i=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"WF-list"},[e("div",{staticClass:"screen-box"},[e("van-tabs",{on:{click:t.clickTab},model:{value:t.active,callback:function(n){t.active=n},expression:"active"}},[e("van-tab",{attrs:{title:"相关度"}}),e("van-tab",{attrs:{title:"时间排序"}}),e("van-tab",{attrs:{title:"被引次数"}})],1)],1),e("van-pull-refresh",{on:{refresh:t.onRefresh},model:{value:t.isLoading,callback:function(n){t.isLoading=n},expression:"isLoading"}},[e("div",{staticClass:"content"},[e("van-list",{staticClass:"list",attrs:{"offset:500":"",finished:t.finished,"finished-text":"没有更多了···","loading-text":"加载中..."},on:{load:t.onLoad},model:{value:t.loading,callback:function(n){t.loading=n},expression:"loading"}},[e("ul",t._l(t.list,function(n){return e("li",{key:n.id,on:{click:function(e){t.clickTitle(n)}}},[e("p",{staticClass:"title"},[t._v(t._s(n.title))]),e("p",{staticClass:"source"},[t._v("【来源】"+t._s(n.introdution[0]+n.introdution[1]))]),n.authors?e("p",{staticClass:"author"},[t._v("【作者】"+t._s(n.authors))]):t._e(),e("p",{staticClass:"author"},[t._v("【引用】"+t._s(n.introdution[2]))]),e("p",{staticClass:"keyword"},t._l(n.keyWord,function(n){return e("span",{key:n},[t._v(t._s(n))])}),0)])}),0)])],1)]),e("van-popup",{attrs:{position:"right"},model:{value:t.showScreen,callback:function(n){t.showScreen=n},expression:"showScreen"}},[e("div",{staticClass:"tab-con"},[e("van-radio-group",{model:{value:t.sort,callback:function(n){t.sort=n},expression:"sort"}},[e("van-cell-group",t._l(t.configs.sort,function(n){return e("van-cell",{key:n.key,attrs:{title:n.value,clickable:""},on:{click:function(e){t.sort=n.key}}},[e("van-radio",{attrs:{name:n.key}})],1)}),1)],1),e("div",{staticClass:"btn-box"},[e("van-button",{attrs:{type:"warning",size:"large"},on:{click:t.resetScreen}},[t._v("重置")]),e("van-button",{attrs:{type:"primary",size:"large"},on:{click:t.confirmScreen}},[t._v("确定")])],1)],1)]),t.isShowDetails?e("van-popup",{staticClass:"details-popup",attrs:{position:"right",overlay:!1},model:{value:t.isShowDetails,callback:function(n){t.isShowDetails=n},expression:"isShowDetails"}},[e("wanFangDetails",{ref:"wanFangDetails",attrs:{item:t.item}}),e("div",{staticClass:"back-btn-box"},[e("span",{on:{click:t.backtrack}},[e("i",{staticClass:"icon iconfont icon-fanhui"})])])],1):t._e(),t.isShowBtn?e("div",{staticClass:"back-btn-box"},[e("span",{on:{click:t.backTop}},[e("i",{staticClass:"icon iconfont icon-i-back-top"})]),e("span",{on:{click:function(n){t.$router.back(-1)}}},[e("i",{staticClass:"icon iconfont icon-fanhui"})])]):t._e()],1)},s=[],o=(e("28a5"),e("ac6a"),e("96cf"),e("3b8d")),a=(e("cadf"),e("551c"),e("097d"),e("517f")),r=e("3374"),c=e("6973"),l={name:"WFList",components:{wanFangDetails:c["default"]},data:function(){return{req:{},list:[],isLoading:!1,loading:!1,finished:!1,configs:{},active:0,showScreen:!1,IconShow:!1,sort:"",isShowDetails:!1,isShowBtn:!1,item:{}}},mounted:function(){this.configs=JSON.parse(sessionStorage.getItem("WFConfigs")),this.req=JSON.parse(sessionStorage.getItem("WFSearch")),this.req.p=1,this.req.n=10,window.addEventListener("scroll",this.scrollToTop)},methods:{onLoad:function(){this.getList()},clickTab:function(t,n){switch(t){case 0:this.req.sort="",this.showScreen=!1,this.IconShow=!1,this.onSearch();break;case 1:this.req.sort="Date desc",this.showScreen=!1,this.IconShow=!1,this.onSearch();break;case 2:this.req.sort="CitedCount desc",this.showScreen=!1,this.IconShow=!1,this.onSearch();break;case 3:this.req.sort="",this.showScreen=!0,this.IconShow=!0,this.onSearch();break}},changeClass:function(){if(this.IconShow)return"active"},confirmScreen:function(){this.req.sort="",this.IconShow=!1,this.showScreen=!1,this.onSearch()},resetScreen:function(){this.req.sort=""},onSearch:Object(r["b"])(function(){this.req.p=1,this.list=[],this.getList()},300),getList:function(){var t=Object(o["a"])(regeneratorRuntime.mark(function t(){var n;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(a["c"].GET_PANGING_LIST,this.req);case 2:n=t.sent,n&&n!=[]?(this.req.p++,n.length<this.req.p&&(this.finished=!0),n.forEach(function(t){t.keyWord&&""!=t.keyWord&&(t.keyWord=t.keyWord.slice(0,t.keyWord.length-1),t.keyWord=t.keyWord.split("；")),""!=t.introdution&&(t.introdution=t.introdution.split(" "))})):this.finished=!0,this.list=this.list.concat(n),this.isLoading=!1,this.loading=!1;case 7:case"end":return t.stop()}},t,this)}));function n(){return t.apply(this,arguments)}return n}(),onRefresh:function(){var t=this;setTimeout(function(){t.list=[],t.req.p=1,t.getList()},500)},onClickLeft:function(){this.$router.go(-1)},clickTitle:function(t){t.accountId=this.req.accountId,this.item=t,this.isShowDetails=!0},scrollToTop:function(){var t=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop,n=window.outerHeight;this.isShowBtn=t>n},backTop:function(){document.documentElement.scrollTop=0,document.body.scrollTop=0},backtrack:function(){this.isShowDetails=!1}},destroyed:function(){window.removeEventListener("scroll",this.scrollToTop)}},u=l,d=(e("0f1f"),e("e82d"),e("2877")),h=Object(d["a"])(u,i,s,!1,null,"588cba58",null);h.options.__file="wanFangList.vue";n["default"]=h.exports},"8b84":function(t,n,e){"use strict";e("795b")},ad92:function(t,n,e){},b313e:function(t,n,e){},b562:function(t,n,e){"use strict";var i=e("354b"),s=e.n(i);s.a},e82d:function(t,n,e){"use strict";var i=e("b313e"),s=e.n(i);s.a}}]);