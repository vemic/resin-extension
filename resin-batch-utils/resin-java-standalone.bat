@echo off
setlocal enabledelayedexpansion

rem Resin Java起動バッチ (.NET Framework不要)
echo Resin Java Launcher
echo ===================

rem RESIN_HOMEの自動検出 (親ディレクトリのresin.exe)
set RESIN_HOME=%~dp0..
if not exist "%RESIN_HOME%\resin.exe" (
    echo エラー: resin.exe が見つかりません: %RESIN_HOME%
    echo このバッチはresin.exeがある親ディレクトリから実行してください
    pause
    exit /b 1
)

rem Java実行ファイル確認
if "%JAVA_HOME%"=="" (
    set JAVA_EXE=java
) else (
    set JAVA_EXE="%JAVA_HOME%\bin\java"
)

rem resin.jar確認
if not exist "%RESIN_HOME%\lib\resin.jar" (
    echo エラー: resin.jar が見つかりません: %RESIN_HOME%\lib\resin.jar
    pause
    exit /b 1
)

rem Resinディレクトリに移動
cd /d "%RESIN_HOME%"

rem パラメータ処理
set DEBUG_MODE=false
set PORT=8080
set START_MODE=fg

:parse
if "%1"=="" goto start
if /i "%1"=="debug" set DEBUG_MODE=true
if /i "%1"=="start" set START_MODE=bg
if /i "%1"=="stop" goto stop
if /i "%1"=="-port" (
    shift
    set PORT=%1
)
shift
goto parse

:start
set JAVA_OPTS=-Xmx512m -server
set RESIN_OPTS=

if "%DEBUG_MODE%"=="true" (
    set RESIN_OPTS=!RESIN_OPTS! --debug-port 8000
    echo デバッグモード有効: localhost:8000 でEclipse接続可能
)

echo Resin起動中... ポート:%PORT% (Java版)

rem ポート設定をJavaシステムプロパティで渡す
set JAVA_OPTS=!JAVA_OPTS! -Dresin.http=%PORT%

if "%START_MODE%"=="bg" (
    start "Resin Java" %JAVA_EXE% %JAVA_OPTS% -jar lib\resin.jar start !RESIN_OPTS!
    echo バックグラウンドで起動しました
) else (
    %JAVA_EXE% %JAVA_OPTS% -jar lib\resin.jar console !RESIN_OPTS!
)
goto end

:stop
echo Resin停止中...
%JAVA_EXE% -jar lib\resin.jar stop
goto end

:end
pause
