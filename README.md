# Waveletlab-saber

使用静态网站生成工具 [Saber](https://github.com/egoist/saber) 构建的小波国际会议网站。

## 使用指南

1. 安装 [node.js](https://nodejs.org/zh-cn/)
2. 安装 [yarn](https://yarnpkg.com/zh-Hant/)
3. git clone 这个仓库并进入这个目录
4. 安装所有依赖：在仓库目录下执行
```
yarn
```
5. 修改源码
```
yarn run dev
```
进入网址 [http://localhost:3000/](http://localhost:3000/) 可以实时预览修改的页面

Tips: 页面都在 `/pages` 目录下的文件中，支持 markdown 和 html 语法

6. 修改完成后，部署到网站上

部署可以手动部署和脚本部署

- 手动

首先运行`yarn run build`，会生成静态网页文件到./public目录下，你需要做的就是将public下的所有文件部署到生成page的repository中就行。
目前采用的是github pages进行部署。

由于网站最开始是部署在coding上的，最好有个备份。（比如github的pages服务突然挂掉，还可以转到coding上）

coding仓库地址：https://git.dev.tencent.com/deardrops/waveletlab.git
github仓库地址：https://github.com/waveletlab-uestc/waveletlab-uestc.github.io.git
纯静态网站部署在github上需要关闭jekyll

- 脚本

参见下面的build.sh

## 关于build.sh


自动化build工具，在本project中修改完后，在build.sh同级目录下运行
```
./build.sh
```
出于一些效率和安全的考虑，build.sh会首先**强制推送**到coding仓库中（备份），然后再**更新**github仓库。

**请勿移动build.sh**
