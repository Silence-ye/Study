# 项目描述

* 在 win10 系统中，通过在 cmd 中输入命令打开对应的 Application.
* win + R 进入 cmd 后可直接输入命令，无需跳转.
* 脚本命令简单，且无需输入需要打开 Application 的全称，只需能够唯一确定应用即可.
* 无法唯一确定应用时，列举出可匹配的应用列表以供用户参考，同时给出错误提示音 Beep .
* 打开应用后自动关闭 cmd 窗口.

# 功能展示

![image](./image/功能展示.gif)

# 功能设计

* 在 cmd 中通过命令运行应用，可以通过直接输入应用的 ***.exe 名来执行，或者键入其快捷方式名 ***.lnk .
* 将所有应用的 .exe 文件的快捷方式存放在同一个路径中，通过 .bat 脚本实现对应用名的匹配以及其他功能.
* 为实现进入 cmd 后可以直接执行命令，可选择将 open.bat 所在路径加入环境变量，或者放在 cmd 初始路径，即 C:\Users\13677 .
* 具体实现细节查看代码部分.

# 脚本代码

[AppMenu.bat](./src/AppMenu.bat) \
[open.bat](./src/open.bat)

  * **Application 的快捷方式存放在 C:\Users\13677\Application 路径.**
  * **.bat 脚本存放在 C:\Users\13677 路径.**

## AppMenu.bat

```bat
cls
@echo.
@set var=%1 //接收 AppMenu 命令后的第一个参数，可能没有
@echo ------------Menu------------
@echo.
@if "%var%"=="" (dir Application /b) else (dir Application /b | find /i "%var%")    // /b 参数只显示文件名
@echo.
@echo ----------------------------
@echo.
```

## open.bat

***设置延迟扩展的作用与原因***
https://www.jb51.net/article/29323.htm
>批处理读取命令时是按行读取的（另外例如for命令等，其后用一对圆括号闭合的所有语句也当作一行），在处理之前要完成必要的预处理工作，这其中就包括对该行命令中的变量赋值。设置延迟扩展后，在读取了一条完整的语句之后，不立即对该行的变量赋值，而会在某个单条语句执行之前再进行赋值，也就是说“延迟”了对变量的赋值。
```bat
cls
@setlocal enabledelayedexpansion                    //设置本地为延迟扩展
@echo off
@set var=%1                                         //接收 open 命令后的第一个参数，可能没有
set /a num=0                                        //记录匹配的应用数，.bat 中使用 /a 选项定义数值变量
if "%var%"=="" (                                    // '('必须与if在同一行，中间用空格间隔
	AppMenu
) else (
	cd Application
	if exist %var%.lnk (
		start %var%.lnk                             //start 命令开启新进程，不等待脚本继续执行
		exit
	) else (
		for %%i in (*%var%*.lnk) do set /a num+=1   // IN (SET) SET 可使用通配符
                                                    // %%i 遍历SET 中的每个值
		if !num!==0 (                               //此处使用 !num! ,以使用"延迟值"
			echo                                   // Beep 音，实际上是 CTRL + G (^G) ,通过 echo ^G > temp.txt ,之后复制到 .bat 中 
			echo Don't have the application
		)  else if !num!==1 (
			for %%i in (*%var%*.lnk) do start %%i
			exit                                    //及时退出 cmd
		) else (
			echo 
			echo Please enter more accurate app name.
			echo.
			echo ------------Menu------------
			echo.
			for %%i in (*%var%*.lnk) do echo %%i
			echo ----------------------------
			echo.
		)
	)
	cd ..
)
pause
```