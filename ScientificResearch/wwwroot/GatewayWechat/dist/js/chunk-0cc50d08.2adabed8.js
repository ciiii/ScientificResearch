(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-0cc50d08"],{"3bf2":function(t,n,i){},"454f":function(t,n,i){i("46a7");var e=i("584a").Object;t.exports=function(t,n,i){return e.defineProperty(t,n,i)}},"46a7":function(t,n,i){var e=i("63b6");e(e.S+e.F*!i("8e60"),"Object",{defineProperty:i("d9f6").f})},"85f2":function(t,n,i){t.exports=i("454f")},ccfb:function(t,n,i){"use strict";i.r(n);var e=function(){var t=this,n=t.$createElement,i=t._self._c||n;return i("div",{staticClass:"list"},[i("van-pull-refresh",{on:{refresh:t.onDownRefresh},model:{value:t.isDownLoading,callback:function(n){t.isDownLoading=n},expression:"isDownLoading"}},[i("van-list",{staticClass:"box",attrs:{finished:t.finished,"finished-text":"没有更多了"},on:{load:t.onLoad},model:{value:t.loading,callback:function(n){t.loading=n},expression:"loading"}},t._l(t.list,function(n,e){return t.isShow?i("ul",{key:e,staticClass:"A_News",on:{click:function(i){t.newsDetails(n.编号)}}},[i("li",{staticClass:"time"},[t._v("\n                    "+t._s(t.startTime(n.建立时间))+"\n                    "),i("p",[t._v("("+t._s(n.通知类型)+")")])]),i("li",{staticClass:"title"},[i("i",{staticClass:"icon iconfont icon-tongzhi"}),i("p",[t._v(t._s(n.通知名称))])])]):i("p",[i("van-icon",{attrs:{name:"info-o"}}),t._v("暂无订购服务！")],1)}),0)],1),i("ReturnBtn"),i("ReturnTop")],1)},s=[],o=i("85f2"),a=i.n(o);function l(t,n,i){return n in t?a()(t,n,{value:i,enumerable:!0,configurable:!0,writable:!0}):t[n]=i,t}i("cadf"),i("551c"),i("097d");var c={inject:["reload"],data:function(){return l({loading:!1,finished:!1,index:1,size:15,total:0,isDownLoading:!1,isShow:!1,list:[]},"total",null)},methods:{onLoad:function(){var t=this,n=JSON.parse(localStorage.getItem("personnel")),i={"人员编号":n.编号,index:this.index,size:this.size};this.$http.getToViewNewsList(i).then(function(n){t.total=n.data.total;var i=t.list;console.info(n.data.list),0!=n.data.list.length&&(t.isShow=!0),t.list=i.concat(n.data.list),t.loading=!1,t.index++,t.list.length>=t.total&&(t.finished=!0)})},onDownRefresh:function(){var t=this;setTimeout(function(){t.reload(),t.isDownLoading=!1},1e3)},newsDetails:function(t){this.$router.push({path:"/KYNewsDetails",name:"KYNewsDetails",params:{item:t}})},startTime:function(t){if(null!=t)return t.slice(0,10)}}},r=c,f=(i("d40e"),i("2877")),u=Object(f["a"])(r,e,s,!1,null,"52a88ea8",null);u.options.__file="KYMoreList.vue";n["default"]=u.exports},d40e:function(t,n,i){"use strict";var e=i("3bf2"),s=i.n(e);s.a}}]);
//# sourceMappingURL=chunk-0cc50d08.2adabed8.js.map