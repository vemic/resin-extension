@echo off
setlocal enabledelayedexpansion

rem Resin Webアプリケーション再デプロイバッチ (Java版)
echo Resin Web Application Redeploy (Java Standalone)
echo =================================================

rem RESIN_HOME の自動設定 (親ディレクトリがresin.exe)
set RESIN_HOME=%~dp0..
if not exist "%RESIN_HOME%\resin.exe" (
    echo エラー: resin.exe が見つかりません: %RESIN_HOME%
    echo このバッチをresin.exe配下の子ディレクトリから実行してください
    pause
    exit /b 1
)

echo RESIN_HOME: %RESIN_HOME%
echo.

rem 1. Resinが稼働状態にあるかどうかをチェック
echo [1/4] Resin稼働状態チェック
echo =============================
echo Resinプロセスをチェックしています...

rem Javaプロセスでresin.jarが動作しているかチェック
tasklist /fi "imagename eq java.exe" /fo csv | findstr /i "java.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo.
    echo **警告: Javaプロセスが実行中です**
    echo Resinが稼働中の可能性があります。
    echo 再デプロイが正常に行われない、または失敗する可能性があります。
    echo.
    set /p CONTINUE="続行しますか？ (y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo 再デプロイを中止しました。
        pause
        exit /b 0
    )
) else (
    echo Resinは停止中です。
)
echo.

rem 2. 再デプロイで使用するwarファイルの存在を確認
echo [2/4] WARファイル確認
echo ====================
echo WARファイルをチェックしています: %RESIN_HOME%\webapps\*.war

set WAR_FOUND=false
for %%f in ("%RESIN_HOME%\webapps\*.war") do (
    if exist "%%f" (
        set WAR_FOUND=true
        echo 発見: %%~nxf (%%~tf)
    )
)

if "%WAR_FOUND%"=="false" (
    echo.
    echo **警告: WARファイルが見つかりません**
    echo %RESIN_HOME%\webapps\ にWARファイルが存在しません。
    echo アンデプロイのみが行われます。
    echo.
    set /p CONTINUE="アンデプロイのみ続行しますか？ (y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo 再デプロイを中止しました。
        pause
        exit /b 0
    )
) else (
    echo.
    echo 上記のWARファイルを使用して再デプロイを行います。
    set /p CONTINUE="続行しますか？ (y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo 再デプロイを中止しました。
        pause
        exit /b 0
    )
)
echo.

rem 3. アンデプロイ操作
echo [3/4] アンデプロイ
echo ==================

rem RESIN_HOME/webapps/ 配下の、フォルダ（ROOTでない）を削除
echo webappsフォルダをクリーニング中...
for /d %%d in ("%RESIN_HOME%\webapps\*") do (
    if /i not "%%~nxd"=="ROOT" (
        echo 削除: %%d
        rmdir /s /q "%%d" 2>nul
    )
)

rem RESIN_HOME/resin-data/ 配下の全てのフォルダを削除
if exist "%RESIN_HOME%\resin-data\" (
    echo resin-dataフォルダをクリーニング中...
    for /d %%d in ("%RESIN_HOME%\resin-data\*") do (
        echo 削除: %%d
        rmdir /s /q "%%d" 2>nul
    )
) else (
    echo resin-dataフォルダが見つかりません（スキップ）
)

echo アンデプロイが完了しました。
echo.

rem 4. Resinを起動し、再デプロイを行う
echo [4/4] Resin起動・再デプロイ
echo ===========================
echo Resinを起動しています...
echo.

call "%~dp0resin-java-standalone.bat" start

echo.
echo 再デプロイ処理が完了しました。
echo WARファイルのデプロイはResinの起動後に自動的に開始されます。
echo.
pause