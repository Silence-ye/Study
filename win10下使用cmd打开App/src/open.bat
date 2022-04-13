cls
@setlocal enabledelayedexpansion
@echo off
@set var=%1
set /a num=0
if "%var%"=="" (
	AppMenu
) else (
	cd Application
	if exist %var%.lnk (
		start %var%.lnk
		exit
	) else (
		for %%i in (*%var%*.lnk) do set /a num+=1
		if !num!==0 (
			echo 
			echo Don't have the application
		)  else if !num!==1 (
			for %%i in (*%var%*.lnk) do start %%i
			exit
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
