(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["chunk-2a467a5f"],{2794:function(t,i,e){"use strict";var n=e("f9c5"),s=e("0afd"),a=e("0252"),o=e("0a24");function r(t){return Array.isArray(t)?t:[t]}function c(t,i){return new Promise(function(e){var n=new FileReader;n.onload=function(t){e(t.target.result)},"dataUrl"===i?n.readAsDataURL(t):"text"===i&&n.readAsText(t)})}function h(t,i){return r(t).some(function(t){return t.size>i})}var u=/\.(jpeg|jpg|gif|png|svg|webp|jfif|bmp|dpg)/i;function l(t){return u.test(t)}function f(t){return!!t.isImage||(t.file&&t.file.type?0===t.file.type.indexOf("image"):t.url?l(t.url):!!t.content&&0===t.content.indexOf("data:image"))}var d=e("182e"),v=e("bddb"),m=e("6e6d"),p=e("23c4"),g=e.n(p),w=e("ad16"),b=e("92ea"),y=e("d45f"),S=e("4b63"),T=e("6ea2"),x=e("a94f"),z=e("535c"),C=Object(s["a"])("image-preview"),O=C[0],M=C[1];function I(t){return Math.sqrt(Math.abs((t[0].clientX-t[1].clientX)*(t[0].clientY-t[1].clientY)))}var $,X=O({mixins:[y["a"],S["a"],T["a"]],props:{className:null,lazyLoad:Boolean,asyncClose:Boolean,showIndicators:Boolean,images:{type:Array,default:function(){return[]}},loop:{type:Boolean,default:!0},swipeDuration:{type:Number,default:500},overlay:{type:Boolean,default:!0},showIndex:{type:Boolean,default:!0},startPosition:{type:Number,default:0},minZoom:{type:Number,default:1/3},maxZoom:{type:Number,default:3},overlayClass:{type:String,default:M("overlay")},closeOnClickOverlay:{type:Boolean,default:!0}},data:function(){return this.bindStatus=!1,{scale:1,moveX:0,moveY:0,moving:!1,zooming:!1,active:0,doubleClickTimer:null}},computed:{imageStyle:function(){var t=this.scale,i={transition:this.zooming||this.moving?"":".3s all"};return 1!==t&&(i.transform="scale3d("+t+", "+t+", 1) translate("+this.moveX/t+"px, "+this.moveY/t+"px)"),i}},watch:{value:function(){this.active=this.startPosition},startPosition:function(t){this.active=t}},methods:{onWrapperTouchStart:function(){this.touchStartTime=new Date},onWrapperTouchEnd:function(t){var i=this;Object(b["c"])(t);var e=new Date-this.touchStartTime,n=this.$refs.swipe||{},s=n.offsetX,a=void 0===s?0:s,o=n.offsetY,r=void 0===o?0:o;e<300&&a<10&&r<10&&(this.doubleClickTimer?(clearTimeout(this.doubleClickTimer),this.doubleClickTimer=null,this.toggleScale()):this.doubleClickTimer=setTimeout(function(){var t=i.active;i.resetScale(),i.$emit("close",{index:t,url:i.images[t]}),i.asyncClose||i.$emit("input",!1),i.doubleClickTimer=null},300))},startMove:function(t){var i=t.currentTarget,e=i.getBoundingClientRect(),n=window.innerWidth,s=window.innerHeight;this.touchStart(t),this.moving=!0,this.startMoveX=this.moveX,this.startMoveY=this.moveY,this.maxMoveX=Math.max(0,(e.width-n)/2),this.maxMoveY=Math.max(0,(e.height-s)/2)},startZoom:function(t){this.moving=!1,this.zooming=!0,this.startScale=this.scale,this.startDistance=I(t.touches)},onImageTouchStart:function(t){var i=t.touches,e=this.$refs.swipe||{},n=e.offsetX,s=void 0===n?0:n;1===i.length&&1!==this.scale?this.startMove(t):2!==i.length||s||this.startZoom(t)},onImageTouchMove:function(t){var i=t.touches;if((this.moving||this.zooming)&&Object(b["c"])(t,!0),this.moving){this.touchMove(t);var e=this.deltaX+this.startMoveX,n=this.deltaY+this.startMoveY;this.moveX=Object(w["a"])(e,-this.maxMoveX,this.maxMoveX),this.moveY=Object(w["a"])(n,-this.maxMoveY,this.maxMoveY)}if(this.zooming&&2===i.length){var s=I(i),a=this.startScale*s/this.startDistance;this.scale=Object(w["a"])(a,this.minZoom,this.maxZoom)}},onImageTouchEnd:function(t){if(this.moving||this.zooming){var i=!0;this.moving&&this.startMoveX===this.moveX&&this.startMoveY===this.moveY&&(i=!1),t.touches.length||(this.moving=!1,this.zooming=!1,this.startMoveX=0,this.startMoveY=0,this.startScale=1,this.scale<1&&this.resetScale()),i&&Object(b["c"])(t,!0)}},onSwipeChange:function(t){this.resetScale(),this.active=t,this.$emit("change",t)},resetScale:function(){this.scale=1,this.moveX=0,this.moveY=0},toggleScale:function(){var t=this.scale>1?1:2;this.scale=t,this.moveX=0,this.moveY=0}},render:function(){var t=this,i=arguments[0];if(this.value){var e=this.active,n=this.images,s=this.showIndex&&i("div",{class:M("index")},[this.slots("index")||e+1+"/"+n.length]),a=i(x["a"],{ref:"swipe",attrs:{loop:this.loop,duration:this.swipeDuration,indicatorColor:"white",initialSwipe:this.startPosition,showIndicators:this.showIndicators},on:{change:this.onSwipeChange}},[n.map(function(n,s){var a={class:M("image"),style:s===e?t.imageStyle:null,on:{touchstart:t.onImageTouchStart,touchmove:t.onImageTouchMove,touchend:t.onImageTouchEnd,touchcancel:t.onImageTouchEnd}};return i(z["a"],[t.lazyLoad?i("img",g()([{directives:[{name:"lazy",value:n}]},a])):i("img",g()([{attrs:{src:n}},a]))])})]);return i("transition",{attrs:{name:"van-fade"}},[i("div",{class:[M(),this.className],on:{touchstart:this.onWrapperTouchStart,touchMove:b["c"],touchend:this.onWrapperTouchEnd,touchcancel:this.onWrapperTouchEnd}},[a,s])])}}}),j={images:[],loop:!0,swipeDuration:500,value:!0,minZoom:1/3,maxZoom:3,className:"",onClose:null,onChange:null,lazyLoad:!1,showIndex:!0,asyncClose:!1,startPosition:0,showIndicators:!1,closeOnPopstate:!1},A=function(){$=new(m["a"].extend(X))({el:document.createElement("div")}),document.body.appendChild($.$el),$.$on("change",function(t){$.onChange&&$.onChange(t)})},P=function(t,i){if(void 0===i&&(i=0),!o["d"]){$||A();var e=Array.isArray(t)?{images:t,startPosition:i}:t;return Object(n["a"])($,j,e),$.$once("input",function(t){$.value=t}),e.onClose&&$.$once("close",e.onClose),$}};P.install=function(){m["a"].use(X)};var Y=P,k=Object(s["a"])("uploader"),D=k[0],N=k[1];i["a"]=D({inheritAttrs:!1,model:{prop:"fileList"},props:{disabled:Boolean,uploadText:String,afterRead:Function,beforeRead:Function,beforeDelete:Function,previewSize:[Number,String],name:{type:[Number,String],default:""},accept:{type:String,default:"image/*"},fileList:{type:Array,default:function(){return[]}},maxSize:{type:Number,default:Number.MAX_VALUE},maxCount:{type:Number,default:Number.MAX_VALUE},previewImage:{type:Boolean,default:!0},resultType:{type:String,default:"dataUrl"}},computed:{detail:function(){return{name:this.name}},previewSizeWithUnit:function(){return Object(a["a"])(this.previewSize)}},methods:{onChange:function(t){var i=this,e=t.target.files;if(!this.disabled&&e.length){if(e=1===e.length?e[0]:[].slice.call(e),this.beforeRead){var n=this.beforeRead(e,this.detail);if(!n)return void this.resetInput();if(n.then)return void n.then(function(){i.readFile(e)}).catch(this.resetInput)}this.readFile(e)}},readFile:function(t){var i=this,e=h(t,this.maxSize);if(Array.isArray(t)){var n=this.maxCount-this.fileList.length;t.length>n&&(t=t.slice(0,n)),Promise.all(t.map(function(t){return c(t,i.resultType)})).then(function(n){var s=t.map(function(t,i){return{file:t,content:n[i]}});i.onAfterRead(s,e)})}else c(t,this.resultType).then(function(n){i.onAfterRead({file:t,content:n},e)})},onAfterRead:function(t,i){i?this.$emit("oversize",t,this.detail):(this.resetInput(),this.$emit("input",[].concat(this.fileList,r(t))),this.afterRead&&this.afterRead(t,this.detail))},onDelete:function(t,i){var e=this;if(this.beforeDelete){var n=this.beforeDelete(t,this.detail);if(!n)return;if(n.then)return void n.then(function(){e.deleteFile(t,i)}).catch(o["e"])}this.deleteFile(t,i)},deleteFile:function(t,i){var e=this.fileList.slice(0);e.splice(i,1),this.$emit("input",e),this.$emit("delete",t)},resetInput:function(){this.$refs.input&&(this.$refs.input.value="")},onPreviewImage:function(t){var i=this.fileList.filter(function(t){return f(t)}).map(function(t){return t.content||t.url});Y({images:i,closeOnPopstate:!0,startPosition:i.indexOf(t.content||t.url)})},renderPreview:function(){var t=this,i=this.$createElement;if(this.previewImage)return this.fileList.map(function(e,n){return i("div",{class:N("preview")},[f(e)?i(v["a"],{attrs:{fit:"cover",src:e.content||e.url,width:t.previewSize,height:t.previewSize},class:N("preview-image"),on:{click:function(){t.onPreviewImage(e)}}}):i("div",{class:N("file"),style:{width:t.previewSizeWithUnit,height:t.previewSizeWithUnit}},[i(d["a"],{class:N("file-icon"),attrs:{name:"description"}}),i("div",{class:[N("file-name"),"van-ellipsis"]},[e.file?e.file.name:e.url])]),i(d["a"],{attrs:{name:"delete"},class:N("preview-delete"),on:{click:function(){t.onDelete(e,n)}}})])})},renderUpload:function(){var t=this.$createElement;if(!(this.fileList.length>=this.maxCount)){var i,e=this.slots(),s=t("input",{attrs:Object(n["a"])({},this.$attrs,{type:"file",accept:this.accept,disabled:this.disabled}),ref:"input",class:N("input"),on:{change:this.onChange}});if(e)return t("div",{class:N("input-wrapper")},[e,s]);if(this.previewSize){var a=this.previewSizeWithUnit;i={width:a,height:a}}return t("div",{class:N("upload"),style:i},[t(d["a"],{attrs:{name:"plus"},class:N("upload-icon")}),this.uploadText&&t("span",{class:N("upload-text")},[this.uploadText]),s])}}},render:function(){var t=arguments[0];return t("div",{class:N()},[t("div",{class:N("wrapper")},[this.renderPreview(),this.renderUpload()])])}})},"535c":function(t,i,e){"use strict";var n=e("f9c5"),s=e("0afd"),a=Object(s["a"])("swipe-item"),o=a[0],r=a[1];i["a"]=o({data:function(){return{offset:0}},beforeCreate:function(){this.$parent.swipes.push(this)},destroyed:function(){this.$parent.swipes.splice(this.$parent.swipes.indexOf(this),1)},render:function(){var t=arguments[0],i=this.$parent,e=i.vertical,s=i.computedWidth,a=i.computedHeight,o={width:s+"px",height:e?a+"px":"100%",transform:"translate"+(e?"Y":"X")+"("+this.offset+"px)"};return t("div",{class:r(),style:o,on:Object(n["a"])({},this.$listeners)},[this.slots()])}})},7860:function(t,i,e){},"9ed6":function(t,i,e){"use strict";e("44c0"),e("22b4"),e("b9eb"),e("fdb2"),e("d0b3"),e("7860"),e("e1a4")},a94f:function(t,i,e){"use strict";var n=e("0afd"),s=e("92ea"),a=e("4b63"),o=e("60d6"),r=e("af1d"),c=e("ad16"),h=Object(n["a"])("swipe"),u=h[0],l=h[1];i["a"]=u({mixins:[a["a"],Object(o["a"])(function(t,i){t(window,"resize",this.onResize,!0),i?this.initialize():this.clear()})],props:{width:Number,height:Number,autoplay:Number,vertical:Boolean,indicatorColor:String,loop:{type:Boolean,default:!0},duration:{type:Number,default:500},touchable:{type:Boolean,default:!0},initialSwipe:{type:Number,default:0},showIndicators:{type:Boolean,default:!0}},data:function(){return{computedWidth:0,computedHeight:0,offset:0,active:0,deltaX:0,deltaY:0,swipes:[],swiping:!1}},watch:{swipes:function(){this.initialize()},initialSwipe:function(){this.initialize()},autoplay:function(t){t?this.autoPlay():this.clear()}},computed:{count:function(){return this.swipes.length},delta:function(){return this.vertical?this.deltaY:this.deltaX},size:function(){return this[this.vertical?"computedHeight":"computedWidth"]},trackSize:function(){return this.count*this.size},activeIndicator:function(){return(this.active+this.count)%this.count},isCorrectDirection:function(){var t=this.vertical?"vertical":"horizontal";return this.direction===t},trackStyle:function(){var t,i=this.vertical?"height":"width",e=this.vertical?"width":"height";return t={},t[i]=this.trackSize+"px",t[e]=this[e]?this[e]+"px":"",t.transitionDuration=(this.swiping?0:this.duration)+"ms",t.transform="translate"+(this.vertical?"Y":"X")+"("+this.offset+"px)",t},indicatorStyle:function(){return{backgroundColor:this.indicatorColor}},minOffset:function(){var t=this.$el.getBoundingClientRect();return(this.vertical?t.height:t.width)-this.size*this.count}},methods:{initialize:function(t){if(void 0===t&&(t=this.initialSwipe),clearTimeout(this.timer),this.$el){var i=this.$el.getBoundingClientRect();this.computedWidth=this.width||i.width,this.computedHeight=this.height||i.height}this.swiping=!0,this.active=t,this.offset=this.count>1?-this.size*this.active:0,this.swipes.forEach(function(t){t.offset=0}),this.autoPlay()},onResize:function(){this.initialize(this.activeIndicator)},onTouchStart:function(t){this.touchable&&(this.clear(),this.swiping=!0,this.touchStart(t),this.correctPosition())},onTouchMove:function(t){this.touchable&&this.swiping&&(this.touchMove(t),this.isCorrectDirection&&(Object(s["c"])(t,!0),this.move({offset:this.delta})))},onTouchEnd:function(){if(this.touchable&&this.swiping){if(this.delta&&this.isCorrectDirection){var t=this.vertical?this.offsetY:this.offsetX;this.move({pace:t>0?this.delta>0?-1:1:0,emitChange:!0})}this.swiping=!1,this.autoPlay()}},getTargetActive:function(t){var i=this.active,e=this.count;return t?this.loop?Object(c["a"])(i+t,-1,e):Object(c["a"])(i+t,0,e-1):i},getTargetOffset:function(t,i){var e=t*this.size;this.loop||(e=Math.min(e,-this.minOffset));var n=Math.round(i-e);return this.loop||(n=Object(c["a"])(n,this.minOffset,0)),n},move:function(t){var i=t.pace,e=void 0===i?0:i,n=t.offset,s=void 0===n?0:n,a=t.emitChange,o=this.loop,r=this.count,c=this.active,h=this.swipes,u=this.trackSize,l=this.minOffset;if(!(r<=1)){var f=this.getTargetActive(e),d=this.getTargetOffset(f,s);if(o){if(h[0]){var v=d<l;h[0].offset=v?u:0}if(h[r-1]){var m=d>0;h[r-1].offset=m?-u:0}}this.active=f,this.offset=d,a&&f!==c&&this.$emit("change",this.activeIndicator)}},swipeTo:function(t,i){var e=this;void 0===i&&(i={}),this.swiping=!0,this.resetTouchStatus(),this.correctPosition(),Object(r["b"])(function(){e.move({pace:t%e.count-e.active,emitChange:!0}),i.immediate?Object(r["b"])(function(){e.swiping=!1}):e.swiping=!1})},correctPosition:function(){this.active<=-1&&this.move({pace:this.count}),this.active>=this.count&&this.move({pace:-this.count})},clear:function(){clearTimeout(this.timer)},autoPlay:function(){var t=this,i=this.autoplay;i&&this.count>1&&(this.clear(),this.timer=setTimeout(function(){t.swiping=!0,t.resetTouchStatus(),t.correctPosition(),Object(r["b"])(function(){t.swiping=!1,t.move({pace:1,emitChange:!0}),t.autoPlay()})},i))},renderIndicator:function(){var t=this,i=this.$createElement,e=this.count,n=this.activeIndicator,s=this.slots("indicator");return s||(this.showIndicators&&e>1?i("div",{class:l("indicators",{vertical:this.vertical})},[Array.apply(void 0,Array(e)).map(function(e,s){return i("i",{class:l("indicator",{active:s===n}),style:s===n?t.indicatorStyle:null})})]):void 0)}},render:function(){var t=arguments[0];return t("div",{class:l()},[t("div",{ref:"track",style:this.trackStyle,class:l("track"),on:{touchstart:this.onTouchStart,touchmove:this.onTouchMove,touchend:this.onTouchEnd,touchcancel:this.onTouchEnd}},[this.slots()]),this.renderIndicator()])}})},af1d:function(t,i,e){"use strict";(function(t){e.d(i,"c",function(){return h}),e.d(i,"b",function(){return u}),e.d(i,"a",function(){return l});var n=e("0a24"),s=Date.now();function a(t){var i=Date.now(),e=Math.max(0,16-(i-s)),n=setTimeout(t,e);return s=i+e,n}var o=n["d"]?t:window,r=o.requestAnimationFrame||a,c=o.cancelAnimationFrame||o.clearTimeout;function h(t){return r.call(o,t)}function u(t){h(function(){h(t)})}function l(t){c.call(o,t)}}).call(this,e("66fa"))},d0b3:function(t,i,e){},e1a4:function(t,i,e){},fdb2:function(t,i,e){}}]);