@echo off

REM Grab current working directory
SET vmupdate_path=%cd%

REM Remove older versions of the lab instructions
rmdir /Q /S %GOPATH%\src\github.com\hubert-heijkers\vision2017\doc

REM Remove the exe's, the build versions of our builder and watcher, from the go workspace bin folder
del %GOPATH%\bin\*.exe

REM Remove the pkg directory from the go workspace folder
rmdir /Q /S %GOPATH%\pkg

REM Stop our TM1 Servers (which we are making updates to)
net stop "IBM Cognos TM1 Server - Planning Sample"
net stop "IBM Cognos TM1 Server - SData"

REM Update the VM
xcopy .\files\* c:\* /s /y

REM Start our TM1 Servers again
net start "IBM Cognos TM1 Server - Planning Sample"
net start "IBM Cognos TM1 Server - SData"

REM Stop NGINX if already exists and running
cd "\Program Files\nginx-1.11.13"
nginx.exe -s quit
REM And start NGINX again so the student doesn't need to do so
start nginx.exe
cd %vmupdate_path%
