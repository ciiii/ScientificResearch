(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-0c587436"],{"0d48":function(t,n,i){"use strict";var e=i("f00d"),s=i.n(e);s.a},1627:function(t,n,i){"use strict";i.r(n);var e=function(){var t=this,n=t.$createElement,i=t._self._c||n;return i("van-list",{attrs:{finished:t.finished,"offset:10":"","finished-text":"没有更多了"},on:{load:t.onLoad},model:{value:t.loading,callback:function(n){t.loading=n},expression:"loading"}},[i("h3",[t._v("新闻")]),t._l(t.list,function(n,e){return i("ul",{key:e,staticClass:"A_News"},[i("li",{on:{click:function(i){t.newsDetails(n)}}},[i("p",[t._v(t._s(n.标题))])]),i("li",[i("i",{staticClass:"icon iconfont icon-tongzhi"}),t._v("\n      "+t._s(t.startTime(n.建立时间))+"\n    ")])])}),i("ReturnBtn")],2)},s=[],o={data:function(){return{loading:!1,finished:!1,index:1,size:1,list:[],total:null}},mounted:function(){this.getPrimaryNews()},methods:{getPrimaryNews:function(){var t=this,n={index:1,size:10};this.$http.getNewsList(n).then(function(n){console.log(n,"res````111111"),t.total=n.data.total,t.list=n.data.list})},onLoad:function(){this.loading=!1},newsDetails:function(t){this.$router.push({path:"/ZKNewsDetails",name:"ZKNewsDetails",params:{item:t}})},startTime:function(t){if(null!=t)return t.slice(0,10)}}},a=o,l=(i("0d48"),i("2877")),c=Object(l["a"])(a,e,s,!1,null,"866d9686",null);c.options.__file="ZKMoreList.vue";n["default"]=c.exports},f00d:function(t,n,i){}}]);