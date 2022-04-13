set env=%1
@echo off
if "%env%"=="" (
	vcvarsall x64
	code .
)else （
	if %env%==32 (
		vcvarsall x64_x86
		code .
	) else (
		vcvarsall x64
		code .
	)
)
exit




