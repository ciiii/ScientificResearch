<template>
    <section>
        <div>考试教育网</div>
        <a class="btn">登录</a>
    </section>
</template>
<script>
// import { getBaseCallback } from '../api/api.js'
export default {
    name:'login',
    data() {
        return {
            
        }
    },
    mounted() {},
    methods: {
        getUrlKey(name){//获取url 参数
            return decodeURIComponent((new RegExp('[?|&]'+name+'='+'([^&;]+?)(&|#|;|$)').exec(location.href)||[,""])[1].replace(/\+/g,'%20'))||null;
        },
        getCodeApi(state){//获取code  
            console.log(state,"state") 
            // 授权后重定向的回调链接地址
            // let urlNow=encodeURIComponent(window.location.href);
            let urlNow = 'https://www.baidu.com'
            console.log(urlNow,"urlNow")
            // if(false){
                let scope='snsapi_base';    //snsapi_userinfo   //静默授权 用户无感知
                let appid='wx5e45aca8fcb270f1';
                let url=`https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
                window.location.replace(url);
            // }
        },
    },
    created(){
        let code = this.getUrlKey("code");
        console.log(code,"code123")
        if(code){
            // console.log(code,"55555")
            //调用接口获取openId   参考文档https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421140842
            getBaseCallback(code).then(res=>{
                console.log(code,"code")
                console.log(res,'res')
                let openId = res.openId;
                // window.location.replace("/#/index");
            }).catch(res=>{
                // window.location.replace("/#/index");
            })
        }else{
            this.getCodeApi("123");
        }
    }
}
</script>
<style scoped>
    .btn{
        color: #41B883;
        font-size: 18px;
    }
</style>
