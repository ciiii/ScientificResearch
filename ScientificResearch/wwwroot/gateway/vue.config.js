module.exports = {
    lintOnSave: false,

    // 基本路径
    baseUrl: './',

    // 输出文件目录
    outputDir: 'dist',

    // webpack-dev-server 相关配置
    devServer: {
        port: 8888,
    },
    pluginOptions: {
      'style-resources-loader': {
        preProcessor: 'less',
        patterns: []
      }
    }
}
