@echo off

REM Grab current working directory
SET vmupdate_path=%cd%

REM Remove older versions of the lab instructions
rmdir /Q /S %GOPATH%\src\github.com\hubert-heijkers\vision2017\doc

REM Remove the exe's, the build versions of our builder and watcher, from the go workspace bin folder
del %GOPATH%\bin\*.exe

REM Remove the pkg directory from the go workspace folder
rmdir /Q /S %GOPATH%\pkg

REM Remove the old TM1Web content
rmdir /Q /S C:\HOL-TM1SDK\TM1Web

REM Make sure all TM1 Servers are stopped to be able to patch the TM1Server installation as well as models
net stop "IBM Cognos TM1 Server - 24retail"
net stop "IBM Cognos TM1 Server - CarSales"
net stop "IBM Cognos TM1 Server - GO_New_Stores"
net stop "IBM Cognos TM1 Server - GO_Scorecards"
net stop "IBM Cognos TM1 Server - Planning Sample"
net stop "IBM Cognos TM1 Server - proven_techniques"
net stop "IBM Cognos TM1 Server - SData"
net stop "IBM Cognos TM1 Server - SData2"
net stop "IBM Cognos TM1 Admin Server x64"
net stop "IBM Cognos TM1"

REM Update the VM
xcopy .\files\* c:\* /s /y

REM Start the TM1 Servers we need for the lab
net start "IBM Cognos TM1"
net start "IBM Cognos TM1 Admin Server x64"
net start "IBM Cognos TM1 Server - Planning Sample"
net start "IBM Cognos TM1 Server - SData"

REM Stop NGINX if already exists and running
cd "\Program Files\nginx-1.11.13"
nginx.exe -s quit
REM And start NGINX again so the student doesn't need to do so
start nginx.exe
cd %vmupdate_path%
