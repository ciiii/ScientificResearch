export default {
    /**
     * @description 配置显示在浏览器标签的title
     */
    title: '教学管理系统',
    /**
     * @description token在Cookie中存储的天数，默认1天
     */
    cookieExpires: 1,
    /**
     * @description api请求基础路径
     */
    baseUrl: {
        dev: 'http://www.baidu.com',
        pro: 'http://www.js.com'
    },
    /**
     * @description 默认打开的首页的路由name值，默认为home
     */
    homeName: 'home',
    /**
     * @description 需要加载的插件
     */
    plugin: {
        'error-store': {
            developmentOff: true // 设为true后在开发环境不会收集错误信息，方便开发中排查错误
        }
    }
}
