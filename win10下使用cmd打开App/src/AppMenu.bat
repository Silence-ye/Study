cls
@echo.
@set var=%1
@echo ------------Menu------------
@echo.
@if "%var%"=="" (dir Application /b) else (dir Application /b | find /i "%var%")
@echo.
@echo ----------------------------
@echo.
