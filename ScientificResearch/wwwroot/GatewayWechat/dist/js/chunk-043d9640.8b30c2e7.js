(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-043d9640","chunk-2d23c494"],{3374:function(t,e,i){"use strict";i.d(e,"b",function(){return n}),i.d(e,"a",function(){return a}),i.d(e,"c",function(){return l});i("3b2b"),i("a481");var s=i("a026");function n(t,e){var i,s=e||200;return function(){var e=this,n=arguments;i&&clearTimeout(i),i=setTimeout(function(){i=null,t.apply(e,n)},s)}}function a(t){return r(t)}function r(t){var e,i,s="";for(e=0;e<t.length;e++)i=o(t.charCodeAt(e)),"25"==i&&(i=""),s+="%"+i;return s}function o(t){if(t>65535)return"err!";var e=Math.round(t/4096-.5),i=t-4096*e,s=Math.round(i/256-.5),n=i-256*s,a=Math.round(n/16-.5),r=n-16*a;return""+c(a)+c(r)}function c(t){return t<10?t:10==t?"A":11==t?"B":12==t?"C":13==t?"D":14==t?"E":15==t?"F":void 0}function l(t){return t.replace(/^(\s|\u00A0)+/,"").replace(/(\s|\u00A0)+$/,"")}s["a"].filter("dataFormat",function(t,e){var i=new Date(t),s={"M+":i.getMonth()+1,"d+":i.getDate(),"h+":i.getHours(),"m+":i.getMinutes(),"s+":i.getSeconds(),"q+":Math.floor((i.getMonth()+3)/3),S:i.getMilliseconds()};for(var n in/(y+)/.test(e)&&(e=e.replace(RegExp.$1,(i.getFullYear()+"").substr(4-RegExp.$1.length))),s)new RegExp("("+n+")").test(e)&&(e=e.replace(RegExp.$1,1===RegExp.$1.length?s[n]:("00"+s[n]).substr((""+s[n]).length)));return e})},"33e0":function(t,e,i){"use strict";var s=i("f364"),n=i.n(s);n.a},"48d5":function(t,e,i){},"4a24":function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"WF-list ZW-list"},[i("div",{staticClass:"screen-box"},[i("van-tabs",{on:{click:t.clickTab},model:{value:t.active,callback:function(e){t.active=e},expression:"active"}},[i("van-tab",{attrs:{title:"发表时间"}}),i("van-tab",{attrs:{title:"相关度"}}),i("van-tab",{attrs:{title:"被引次数"}}),i("van-tab",{attrs:{title:"下载次数"}})],1)],1),i("van-pull-refresh",{on:{refresh:t.onRefresh},model:{value:t.isRefreshLoading,callback:function(e){t.isRefreshLoading=e},expression:"isRefreshLoading"}},[i("div",{staticClass:"content"},[i("van-list",{staticClass:"list",attrs:{"offset:500":"",finished:t.finished,"finished-text":"没有更多了···","loading-text":"加载中..."},on:{load:t.onLoad},model:{value:t.loading,callback:function(e){t.loading=e},expression:"loading"}},[i("ul",t._l(t.list,function(e){return i("li",{key:e.id,on:{click:function(i){t.clickTitle(e)}}},[i("p",{staticClass:"title"},[t._v(t._s(e.title))]),i("p",{staticClass:"author"},[t._v("【发表时间】"+t._s(e.publishDate))]),e.source?i("p",{staticClass:"source"},[t._v("【来源】"+t._s(e.source))]):t._e(),i("p",{staticClass:"author"},[t._v("【下载】"+t._s(e.downCount?e.downCount:0))]),i("p",{staticClass:"author"},[t._v("【引用】"+t._s(e.refCount?e.refCount:0))]),i("p",{staticClass:"keyword"},t._l(e.authors,function(e,s){return i("span",{key:s},[t._v(t._s(e))])}),0)])}),0)])],1)]),t.isShowDetails?i("van-popup",{staticClass:"details-popup",attrs:{position:"right",overlay:!1},model:{value:t.isShowDetails,callback:function(e){t.isShowDetails=e},expression:"isShowDetails"}},[i("zhiWangDetails",{ref:"wanFangDetails",attrs:{item:t.item}}),i("div",{staticClass:"backtrack"},[i("span",{on:{click:t.backtrack}},[i("i",{staticClass:"icon iconfont icon-fanhui"}),t._v(" 返回")])])],1):t._e(),t.isShowBtn?i("div",{staticClass:"back-btn-box"},[i("span",{on:{click:t.backTop}},[i("i",{staticClass:"icon iconfont icon-i-back-top"})]),i("span",{on:{click:function(e){t.$router.back(-1)}}},[i("i",{staticClass:"icon iconfont icon-fanhui"})])]):t._e()],1)},n=[],a=(i("28a5"),i("ac6a"),i("96cf"),i("3b8d")),r=i("517f"),o=(i("3374"),i("e23d")),c={name:"zhiWangList",components:{zhiWangDetails:o["default"]},data:function(){return{req:{},reqPanging:{pageUrl:"",accountId:""},reqScreen:{sortUrl:"",accountId:""},list:[],newList:[],existList:[],isRefreshLoading:!1,loading:!1,finished:!1,configs:{},active:0,IconShow:!1,sort:"",isShowDetails:!1,item:{},isShowBtn:!1,searchType:0}},mounted:function(){this.configs=JSON.parse(sessionStorage.getItem("ZWConfigs")),this.req=JSON.parse(sessionStorage.getItem("ZWSearch")),this.reqPanging.accountId=this.req.accountId,this.reqScreen.accountId=this.req.accountId,window.addEventListener("scroll",this.scrollToTop)},methods:{onLoad:function(){switch(this.searchType){case 0:this.getList();break;case 2:this.getPangingList();break}},clickTab:function(t,e){if(this.existList&&this.existList.sortRelateUrl){switch(t){case 0:this.reqScreen.sortUrl=this.newList.sortPublicDateUrl;break;case 1:this.reqScreen.sortUrl=this.newList.sortRelateUrl;break;case 2:this.reqScreen.sortUrl=this.newList.sortByUseTimesUrl;break;case 3:this.reqScreen.sortUrl=this.newList.sortByDownTimesUrl;break}this.onSearch()}},onSearch:function(){this.searchType=1,this.finished=!1,this.loading=!0,this.backTop(),this.list=[],this.getScreenList()},getList:function(){var t=Object(a["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(r["e"].GET_ARTICLE_LIST,this.req);case 2:e=t.sent,this.existList=e,this.newList=e,this.newList&&this.newList.listDatas?this.returnData(this.newList.listDatas):this.finished=!0,this.isRefreshLoading=!1,this.loading=!1,this.searchType=2;case 9:case"end":return t.stop()}},t,this)}));function e(){return t.apply(this,arguments)}return e}(),getScreenList:function(){var t=Object(a["a"])(regeneratorRuntime.mark(function t(){return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(r["e"].GET_SCREEN_LIST,this.reqScreen);case 2:this.newList=t.sent,this.newList&&this.newList.listDatas?this.returnData(this.newList.listDatas):this.finished=!0,this.isRefreshLoading=!1,this.loading=!1,this.searchType=2;case 7:case"end":return t.stop()}},t,this)}));function e(){return t.apply(this,arguments)}return e}(),getPangingList:function(){var t=Object(a["a"])(regeneratorRuntime.mark(function t(){return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(r["e"].GET_PANGING_LIST,this.reqPanging);case 2:this.newList=t.sent,this.newList&&this.newList.listDatas?this.returnData(this.list.concat(this.newList.listDatas)):this.finished=!0,this.isRefreshLoading=!1,this.loading=!1,this.searchType=2;case 7:case"end":return t.stop()}},t,this)}));function e(){return t.apply(this,arguments)}return e}(),returnData:function(t){this.reqPanging.pageUrl=this.newList.nextPageUrl,this.newList.listDatas.forEach(function(t){t.authors&&""!=t.authors&&(t.authors=t.authors.split(";"))}),this.list=t,this.newList.listDatas.length<20&&(this.finished=!0)},onRefresh:function(){this.active=0,this.getList()},onClickLeft:function(){this.$router.go(-1)},clickTitle:function(t){t.accountId=this.req.accountId,this.item=t,this.isShowDetails=!0},scrollToTop:function(){var t=window.pageYOffset||document.documentElement.scrollTop||document.body.scrollTop,e=window.outerHeight;this.isShowBtn=t>e},backTop:function(){document.documentElement.scrollTop=0,document.body.scrollTop=0},backtrack:function(){this.isShowDetails=!1}}},l=c,h=(i("c127"),i("33e0"),i("2877")),u=Object(h["a"])(l,s,n,!1,null,"5d91ea25",null);u.options.__file="zhiWangList.vue";e["default"]=u.exports},6047:function(t,e,i){},8930:function(t,e,i){"use strict";var s=i("6047"),n=i.n(s);n.a},c127:function(t,e,i){"use strict";var s=i("48d5"),n=i.n(s);n.a},e23d:function(t,e,i){"use strict";i.r(e);var s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{staticClass:"details"},[i("div",{staticClass:"header"},[i("h4",{staticClass:"title"},[i("van-icon",{attrs:{name:"fire"}}),t._v("\n            "+t._s(t.item.title)+"\n        ")],1),i("p",{staticClass:"time"},[t._v(t._s(t.item.publishDate))]),i("p",{staticClass:"name"},[t._v(t._s(t.details.authors))])]),i("div",{staticClass:"centent"},[i("p",[t._v(t._s(t.details.brief))])]),i("div",{staticClass:"content-footer"},[t.details.sourceCome?i("p",[t._v("【机构】："+t._s(t.details.sourceCome))]):t._e(),t.details.areaType?i("p",[t._v("【领域】："+t._s(t.details.areaType))]):t._e(),t.details.fund?i("p",[t._v("【基金】："+t._s(t.details.fund))]):t._e(),t.details.keyWord?i("p",{staticClass:"keyword"},t._l(t.details.keyWord,function(e,s){return i("span",{key:s},[t._v(t._s(e))])}),0):t._e(),t.isShowDown&&t.details?i("div",{staticClass:"btn-box"},[i("a",{staticClass:"btn-preview",attrs:{href:"javascript:;"},on:{click:t.getDownloadFile}},[t._v("\n                预览PDF\n                "),i("van-icon",{attrs:{name:"icon iconfont icon-browse"}})],1),i("a",{staticClass:"btn-download",attrs:{href:this.downUrl,id:"btn-download",download:""}},[t._v("\n                下载PDF\n                "),i("van-icon",{attrs:{name:"icon iconfont icon-download"}})],1)]):t._e()])])},n=[],a=(i("28a5"),i("96cf"),i("3b8d")),r=(i("cadf"),i("551c"),i("097d"),i("517f")),o=i("3374"),c={name:"zhiWangDetails",props:["item"],data:function(){return{req:{detailUrl:"",accountId:""},reqUrl:{url:"",fileName:"",accountId:""},details:{},isShowDown:!1,showPdf:!1,downUrl:"javascript:;"}},mounted:function(){this.req.detailUrl=this.item.detailUrl,this.req.accountId=this.item.accountId,this.reqUrl.accountId=this.item.accountId,this.reqUrl.fileName=this.item.fileName,this.getDetails()},methods:{getDetails:function(){var t=Object(a["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$myHttp.myGet(r["e"].GET_ARTICLE_DETAILS,this.req);case 2:e=t.sent,e.pdfDownUrl&&(this.reqUrl.url=e.pdfDownUrl),e.keyWord&&(e.keyWord=e.keyWord.slice(0,e.keyWord.length-1),e.keyWord=e.keyWord.split(";")),this.reqUrl.url&&""!=this.reqUrl.url?(this.isShowDown=!0,this.downUrl=r["e"].GET_DOWNURL_FILE+"?fileName="+Object(o["a"])(this.item.fileName)+"&downUrl="+Object(o["a"])(this.reqUrl.url)+"&accountId="+this.item.accountId):this.isShowDown=!1,this.details=e;case 7:case"end":return t.stop()}},t,this)}));function e(){return t.apply(this,arguments)}return e}(),getLoading:function(){this.toastLoading=this.$toast.loading({mask:!0,message:"加载中...",duration:5e3})},getDownloadFile:Object(o["b"])(Object(a["a"])(regeneratorRuntime.mark(function t(){var e;return regeneratorRuntime.wrap(function(t){while(1)switch(t.prev=t.next){case 0:return this.getLoading(),t.next=3,this.$myHttp.myGet(r["e"].GET_ARTICLE_DOWNURL,this.reqUrl);case 3:e=t.sent,e&&""!=e?this.clickPreview():this.$toast("您无权或余额不足不能查看此文章！");case 5:case"end":return t.stop()}},t,this)})),300),clickPreview:function(){this.$router.push({path:"/pdfPreview",query:{url:this.downUrl}})}}},l=c,h=(i("8930"),i("2877")),u=Object(h["a"])(l,s,n,!1,null,"69484ede",null);u.options.__file="zhiWangDetails.vue";e["default"]=u.exports},f364:function(t,e,i){}}]);