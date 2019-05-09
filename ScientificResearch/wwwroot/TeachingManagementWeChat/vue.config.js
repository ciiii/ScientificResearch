module.exports = {
    // 基本路径
    // publicPath
    publicPath: process.env.NODE_ENV === 'production' ? './' : '/',
    // 输出文件目录
    outputDir: 'dist',
    // eslint-loader 是否在保存的时候校验格式
    lintOnSave: false,
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
    productionSourceMap: false, // 生产环境是否生成 SourceMap
    // "indent": [1, 4]
    // webpack-dev-server 相关配置
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
}
