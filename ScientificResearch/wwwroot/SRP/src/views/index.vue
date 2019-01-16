<template>
    <h3>这是一个悲伤的主页！</h3>
</template>
<script>
export default {
    data() {
        return {
            code:null,
        }
    },
    // mounted() {
        
    // },
     methods: {
        getUrlKey(name){//获取url 参数
            return decodeURIComponent((new RegExp('[?|&]'+name+'='+'([^&;]+?)(&|#|;|$)').exec(location.href)||[,""])[1].replace(/\+/g,'%20'))||null;
        },
        getCodeApi(state){//获取code  
            console.log(state,"state") 
            // 授权后重定向的回调链接地址
            let urlNow=encodeURIComponent(window.location.href);
            // let urlNow = 'https://www.baidu.com'
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

            this.$api.BindOpenId(code).then(res=>{
                console.log(res,'res```````')
                // let openId = res.openId;
                // window.location.replace("/#/index");
            }).catch(res=>{
                console.log(res,'的点点滴滴')
                // window.location.replace("/#/login");
            })
        }else{
            this.getCodeApi("123");
        }
    }
}
</script>
<style scoped>

</style>
