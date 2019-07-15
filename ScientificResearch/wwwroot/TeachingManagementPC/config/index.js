'use strict'
// Template version: 1.2.6
// see http://vuejs-templates.github.io/webpack for documentation.

const path = require('path')

module.exports = {

  dev: {
    // Paths
    assetsSubDirectory: 'static',
    assetsPublicPath: '/',
    proxyTable: {},
    
    // Various Dev Server settings
    host: 'localhost', // can be overwritten by process.env.HOST
    port: 8080, // can be overwritten by process.env.PORT, if port is in use, a free one will be determined
    autoOpenBrowser: true,
    errorOverlay: true,
    notifyOnErrors: false,
    poll: false, // https://webpack.js.org/configuration/dev-server/#devserver-watchoptions-

    // Use Eslint Loader?
    // If true, your code will be linted during bundling and
    // linting errors and warnings will be shown in the console.
    useEslint: false,
    // If true, eslint errors and warnings will also be shown in the error overlay
    // in the browser.
    showEslintErrorsInOverlay: false,

    /**
     * Source Maps
     */

    // https://webpack.js.org/configuration/devtool/#development
    devtool: 'cheap-source-map',

    // CSS Sourcemaps off by default because relative paths are "buggy"
    // with this option, according to the CSS-Loader README
    // (https://github.com/webpack/css-loader#sourcemaps)
    // In our experience, they generally work as expected,
    // just be aware of this issue when enabling this option.
    cssSourceMap: false
  },

  build: {
    // Paths
    // Template for index.html
    index: path.resolve(__dirname, '../dist/index.html'),
    //打包后文件要存放的路径:在当前目录的上一级 的 dist目录下输出资源文件
    assetsRoot: path.resolve(__dirname, '../dist'),

    //除了 index.html 之外的静态资源要存放的路径:把所有的静态资源打包到 dist下的 assets文件夹下
    assetsSubDirectory: './',
    //assetsSubDirectory: './assets/',
    //代表打包后，index.html里面引用资源的的相对地址
    //代表生成的index.html文件，里面引入资源时，路径前面要加上 ./,也就是assetsPublicPath的值 ``
    //assetsPublicPath: './static/',
    // assetsPublicPath: '../dist/',
    //这地方搞了1小时,一般都用个相对于根的半绝对路径,因为生成的静态文件一般是相对根固定的;不能用相对路径,比如上面的'./static/','../dist/','./'之类的,那样需要引用静态文件的html路径一变,就找不到静态文件了
    assetsPublicPath: '/TeachingManagementPC/dist/',
    /**
     * Source Maps
     */

    productionSourceMap: false,
    // https://webpack.js.org/configuration/devtool/#production
    devtool: 'source-map',

    // Gzip off by default as many popular static hosts such as
    // Surge or Netlify already gzip all static assets for you.
    // Before setting to `true`, make sure to:
    // npm install --save-dev compression-webpack-plugin
    productionGzip: false,
    productionGzipExtensions: ['js', 'css'],

    // Run the build command with an extra argument to
    // View the bundle analyzer report after build finishes:
    // `npm run build --report`
    // Set to `true` or `false` to always turn it on or off
    bundleAnalyzerReport: process.env.npm_config_report || false,

    // `npm run build:prod --generate_report`
    generateAnalyzerReport: process.env.npm_config_generate_report || false
  }
}
