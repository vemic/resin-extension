@echo off
rem Resin デバッグ起動バッチ (Java版)
echo Resin Debug Mode (Java Standalone)
echo ==================================
echo Eclipse等から localhost:8000 に接続してください
echo.
call resin-java-standalone.bat debug
pause
