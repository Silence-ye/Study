# 项目描述
* 进行 Qt 开发时，官方编辑器 Qt Creator 不太友好，使用 VSCode 进行开发.
* 因为 Qt6 支持使用 CMake 进行构建，而 VSCode 也可以支持 CMake 构建系统，因此是完全可以的.
* 前提：windows 下，需要 VS2019 环境.参考我的另外一篇文档 

   ***[VSCode + MSVC 2019](../VSCode%20%2B%20MSVC%202019/VSCode%20%2B%20MSVC%202019.md)***

# 参考博客

https://blog.csdn.net/weixin_43669941/article/details/108921714

# 安装 QT

* 下载地址：(开源版)
  
  https://www.qt.io/zh-cn/download

![image](./image/Qt%20安装01.png)

* 安装组件（MSVC 2019 编译器）

选择安装组件后下一步即好.

![image](./image/Qt%20安装02.png)

![image](./image/Qt%20安装03.png)

# 将 Qt 的 bin 目录添加到环境变量

  ***...qt6\6.2.4\msvc2019_64\bin***

# 安装 VSCode 扩展（cmake）

![image](./image/VSCode%20扩展.png)

# 使用 Qt Creator 创建 CMake 项目

***注意：使用 MSVC 2019 x64 编译器***

![image](./image/创建%20CMake%20项目.gif)

# 用 VS Code 打开 CMakeLists.txt 文件所在目录

* 需要选择一个kit，用的是VS 2019的工具包，也可以使用MinGW，具体请参考CMake扩展的官方文档.

![image](./image/选择%20kit%2001.png)

![image](./image/选择%20kit%2002.png)

# 构建并运行项目

* 用 F7 进行构建：

***终端出现下述显示以及生成 build 文件，说明构建成功.***

![image](./image/构建%20CMake%2001.png)

![image](./image/构建%20CMake%2002.png)

* SHIFT + F5 运行：

![image](./image/运行%20Qt%20项目.gif)

# 调试项目(与 C++ 程序一致，省略...)
  



