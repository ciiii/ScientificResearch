module.exports = {
    // 基本路径
    // publicPath
    publicPath: process.env.NODE_ENV === "production" ? "./" : "/",
    // 输出文件目录
    outputDir: 'dist',
    // eslint-loader 是否在保存的时候检查
    lintOnSave: true,
    runtimeCompiler: true,

    chainWebpack: () => {},
    configureWebpack: (config) => {
        if (process.env.NODE_ENV === 'production') {
            // 为生产环境修改配置...
            config.mode = 'production'
        } else {
            // 为开发环境修改配置...
            config.mode = 'development'
        }
    },

    lintOnSave: false, // 在保存时校验格式
    productionSourceMap: false, // 生产环境是否生成 SourceMap

    // webpack-dev-server 相关配置
    // devServer: {
    //     open: false,
    //     host: "0.0.0.0",
    //     port: 8080,
    //     https: false,
    //     hotOnly: true,
    //     proxy: {
    //         "/api": {
    //             target: "http://192.168.0.99:63739",
    //             ws: true,
    //             changeOrigin: true,
    //             pathRewrite: {
    //                 "^/api": "/"
    //             }
    //         }
    //     }, // 设置代理
    //     before: app => {}
    // },
    devServer: {
        port: 8080
    },
    // 第三方插件配置
    pluginOptions: {
        'style-resources-loader': {
            preProcessor: 'less',
            patterns: []
        }
    }
};