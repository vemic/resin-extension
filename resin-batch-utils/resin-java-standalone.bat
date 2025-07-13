@echo off
setlocal enabledelayedexpansion

rem Resin Java�N���o�b�` (.NET Framework�s�v)
echo Resin Java Launcher
echo ===================

rem RESIN_HOME�̎������o (�e�f�B���N�g����resin.exe)
set RESIN_HOME=%~dp0..
if not exist "%RESIN_HOME%\resin.exe" (
    echo �G���[: resin.exe ��������܂���: %RESIN_HOME%
    echo ���̃o�b�`��resin.exe������e�f�B���N�g��������s���Ă�������
    pause
    exit /b 1
)

rem Java���s�t�@�C���m�F
if "%JAVA_HOME%"=="" (
    set JAVA_EXE=java
) else (
    set JAVA_EXE="%JAVA_HOME%\bin\java"
)

rem resin.jar�m�F
if not exist "%RESIN_HOME%\lib\resin.jar" (
    echo �G���[: resin.jar ��������܂���: %RESIN_HOME%\lib\resin.jar
    pause
    exit /b 1
)

rem Resin�f�B���N�g���Ɉړ�
cd /d "%RESIN_HOME%"

rem �p�����[�^����
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
    echo �f�o�b�O���[�h�L��: localhost:8000 ��Eclipse�ڑ��\
)

echo Resin�N����... �|�[�g:%PORT% (Java��)

rem �|�[�g�ݒ��Java�V�X�e���v���p�e�B�œn��
set JAVA_OPTS=!JAVA_OPTS! -Dresin.http=%PORT%

if "%START_MODE%"=="bg" (
    start "Resin Java" %JAVA_EXE% %JAVA_OPTS% -jar lib\resin.jar start !RESIN_OPTS!
    echo �o�b�N�O���E���h�ŋN�����܂���
) else (
    %JAVA_EXE% %JAVA_OPTS% -jar lib\resin.jar console !RESIN_OPTS!
)
goto end

:stop
echo Resin��~��...
%JAVA_EXE% -jar lib\resin.jar stop
goto end

:end
pause
