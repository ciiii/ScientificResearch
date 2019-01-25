<template>
    <div class="download-page">
        <div class="browser-tips">
            <p class="tip-text"><i class="icon iconfont icon-weiwancheng1"></i>您的浏览器版本太低了！</p>
            <p>为了给您提供更优质的网页浏览体验，建议使用IE10及以上版本的浏览器。</p>
            <p><strong>解决方法：</strong>请升级IE浏览器版本，或者选择以下浏览器下载并安装。</p>
            <ul class="browser-box">
                <li>
                    <a href="/public/browserDownload/chrome.zip">
                        <img src="../assets/images/Chrome.jpg"/><span>Chrome下载</span>
                    </a>
                </li>
                <li>
                    <a href="/public/browserDownload/360.zip">
                        <img src="../assets/images/360.jpg"/><span>360浏览器下载</span>
                    </a>
                </li>
                <li>
                    <a href="/public/browserDownload/firefox.zip">
                        <img src="../assets/images/firefox.jpg"/><span>Firefox下载</span>
                    </a>
                </li>
                <li>
                    <a href="/public/browserDownload/sogou.zip">
                        <img src="../assets/images/sogou.jpg"/><span>Sogou下载</span>
                    </a>
                </li>
            </ul>
            <div class="explain">
                <h4>安装说明：</h4>
                <div class="item">
                    <p>① 选择下载的文件，点击右键，选择“解压到当前文件夹”。</p>
                    <img src="../assets/images/zip.jpg" height="220"/>
                </div>
                <div class="item">
                    <p>② 解压完成后，会出现一个和已选文件一样的名字的.exe文件，双击打开文件，根据提示进行安装。</p>
                    <img src="../assets/images/exe.jpg" height="220"/>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'DownloadPage'
    }
</script>
<style lang="less" type="text/less" scoped>
    .download-page {
        width: 100%;
        height: 100%;
        background: #fff;
        position: fixed;
        left: 0;
        top: 0;
    }
    .browser-tips {
        width: 1000px;
        margin: 100px auto 0;
        text-align: center;
        .tip-text {
            font-size: 26px;
            color: red;
            margin-bottom: 25px;
            i {
                margin-right: 15px;
                font-size: 28px;
            }
        }
        p {
            font-size: 15px;
            margin-bottom: 10px;
            color: #333;
        }
        .browser-box {
            margin-top: 50px;
            li {
                display: inline-block;
                overflow: hidden;
                a {
                    display: block;
                    text-align: center;
                    padding: 10px 25px;
                }
                &:hover {
                    a {
                        background: #ecf5fd;
                    }
                    span {
                        color: #1976D2;
                    }
                }
            }
            img {
                width: 100px;
                display: block;
                margin-bottom: 20px;
                border: none;
            }
            span {
                color: #666;
                font-size: 14px;

            }
        }
        .explain {
            overflow: hidden;
            text-align: center;
            border-top: 1px dashed #ddd;
            padding-top: 10px;
            margin-top: 10px;
            padding-left: 80px;
            h4 {
                text-align: left;
                font-size: 16px;
                font-weight: bold;
            }
            .item {
                display: inline-block;
                margin: 10px 15px;
                float: left;
            }
            p {
                width: 386px;
                margin: 10px 0 20px;
                text-align: left;
                font-size: 13px;
            }
        }
    }
</style>