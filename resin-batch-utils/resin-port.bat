@echo off
rem Resin ポート指定起動バッチ (Java版)
echo Resin Custom Port (Java Standalone)
echo ===================================
set /p PORT="起動ポート番号を入力してください (デフォルト:8080): "
if "%PORT%"=="" set PORT=8080
call resin-java-standalone.bat -port %PORT%
pause
