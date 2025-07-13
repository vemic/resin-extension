@echo off
rem Resin バックグラウンド起動バッチ (Java版)
echo Resin Background Start (Java Standalone)
echo ========================================
call resin-java-standalone.bat start
echo.
echo 停止するには resin-stop.bat を実行してください
pause
