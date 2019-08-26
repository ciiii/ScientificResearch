const autoprefixer = require('autoprefixer');
const pxtoviewport = require('postcss-px-to-viewport');
const pxtorem = require('postcss-pxtorem');
const VantCss = require('./src/libs/van-custom-theme');


module.exports = {
    outputDir: 'dist',
    lintOnSave: true,
    productionSourceMap: false,
    publicPath: process.env.NODE_ENV === 'production' ? '/TeachingManagementWeChat/dist/' : '/',
    pages: {
        index: {
            // entry for the pages
            entry: 'src/main.js',
            // the source template
            template: 'src/index.html',
            // output as dist/index.html
            filename: 'index.html',
            // when using title option,
            // template title tag needs to be <title><%= htmlWebpackPlugin.options.title %></title>
            title: '首页',
            // chunks to include on this pages, by default includes
            // extracted common chunks and vendor chunks.
            chunks: ['chunk-vendors', 'chunk-common', 'index']
        }
    },
    css: {
        loaderOptions: {
            less: {
                modifyVars: VantCss
            },
            postcss: {
                plugins: [
                    autoprefixer(),
                    pxtoviewport({
                        viewportWidth: 375,
                        // 该项仅在使用 Circle 组件时需要
                        // 原因参见 https://github.com/youzan/vant/issues/1948
                        selectorBlackList: ['van-circle__layer']
                    }),
                    pxtorem({
                        rootValue: 37.5,
                        propList: ['*'],
                        // 该项仅在使用 Circle 组件时需要
                        // 原因参见 https://github.com/youzan/vant/issues/1948
                        selectorBlackList: ['van-circle__layer']
                    })
                ]
            }
        }
    }
};