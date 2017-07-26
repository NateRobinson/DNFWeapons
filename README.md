# DNFWeapons
一个完整的项目，包含server，admin，client，server使用express搭建，admin和client基于vue开发。


## 1.数据库为根目录下的dnf_sql.sql,我本地的数据库账号是root，密码为空，这个可以在server项目中index.js文件中配置；

## 2.server：我本地使用的XAMPP。基于express。
  ```groovy
  http://localhost:3000
  ```
  启动mysql服务器之后，首先启动server，server目录下依次执行：
  npm install;
  node index.js
  即可。

## 3.admin: 基于vue。
  ```groovy
  http://localhost:8886
  ```
  启动server之后，再启动admin端，为pc端，admin目录下依次执行:
  npm install
  npm run dev
  即可。
  【账号： admin ，密码： 123456】

## 4.client：基于vue。
  ```groovy
  http://localhost:8080
  ```
  启动server之后，再启动client端，为移动端，可以在浏览器开发模式下用手机模式查看，client目录下依次执行:
  npm install
  npm run dev
  即可。
  【账号： test，密码： 123456】

## 5.DWeapons 为Android客户端，
  需要到DWeapons\app\src\main\java\com\gu\dw\MainActivity.java 类的oncreate方法
  
  ```groovy
  mWebView.loadUrl("http://xxxx:8080");
  ```
  
  将xxxx改成client的ip地址再打包即可安装到安卓手机上体验。
