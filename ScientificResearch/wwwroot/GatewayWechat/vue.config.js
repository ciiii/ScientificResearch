module.exports = {
    // 基本路径
    // publicPath: process.env.NODE_ENV === "production" ? "./" : "/",
    // 输出文件目录
    outputDir: 'dist',
    baseUrl: './',
    // eslint-loader 是否在保存的时候检查
    lintOnSave: false, //在保存时校验格式
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
