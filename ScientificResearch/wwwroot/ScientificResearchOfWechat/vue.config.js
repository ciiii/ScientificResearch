module.exports = {
    // 基本路径
    publicPath: process.env.NODE_ENV === 'production' ?
        '/dist/' : '/',
    lintOnSave: false, // 在保存时校验格式
    productionSourceMap: false, // 生产环境是否生成 SourceMap

    // webpack-dev-server 相关配置
    devServer: {
        open: false,
        host: '0.0.0.0',
        port: 8080,
        https: false,
        hotOnly: false,
        proxy: {
            '/api': {
                target: 'http://192.168.0.99:63739',
                ws: true,
                changeOrigin: true,
                pathRewrite: {
                    '^/api': '/'
                }
            }
        }, // 设置代理
        before: app => {}
    },
    // 第三方插件配置
    pluginOptions: {
        // ...
    }
}