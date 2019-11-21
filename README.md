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
```
yarn run build
```
生成的静态网页在 `/public` 目录下，将该目录下所有文件添加到一个新的 git 仓库，再 force push 到 [wavelet 仓库](https://dev.tencent.com/u/deardrops/p/waveletlab/git) 中即可。

Enjoy~

## 关于build.sh

自动化build工具，在本project中修改完后，在build.sh同级目录下运行
```
./build.sh
```

将自动force push到wavelet仓库并且更新本仓库

**请勿移动build.sh**