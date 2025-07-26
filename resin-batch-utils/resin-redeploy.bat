@echo off
setlocal enabledelayedexpansion

rem Resin Web�A�v���P�[�V�����ăf�v���C�o�b�` (Java��)
echo Resin Web Application Redeploy (Java Standalone)
echo =================================================

rem RESIN_HOME �̎����ݒ� (�e�f�B���N�g����resin.exe)
set RESIN_HOME=%~dp0..
if not exist "%RESIN_HOME%\resin.exe" (
    echo �G���[: resin.exe ��������܂���: %RESIN_HOME%
    echo ���̃o�b�`��resin.exe�z���̎q�f�B���N�g��������s���Ă�������
    pause
    exit /b 1
)

echo RESIN_HOME: %RESIN_HOME%
echo.

rem 1. Resin���ғ���Ԃɂ��邩�ǂ������`�F�b�N
echo [1/4] Resin�ғ���ԃ`�F�b�N
echo =============================
echo Resin�v���Z�X���`�F�b�N���Ă��܂�...

rem Java�v���Z�X��resin.jar�����삵�Ă��邩�`�F�b�N
tasklist /fi "imagename eq java.exe" /fo csv | findstr /i "java.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo.
    echo **�x��: Java�v���Z�X�����s���ł�**
    echo Resin���ғ����̉\��������܂��B
    echo �ăf�v���C������ɍs���Ȃ��A�܂��͎��s����\��������܂��B
    echo.
    set /p CONTINUE="���s���܂����H (y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo �ăf�v���C�𒆎~���܂����B
        pause
        exit /b 0
    )
) else (
    echo Resin�͒�~���ł��B
)
echo.

rem 2. �ăf�v���C�Ŏg�p����war�t�@�C���̑��݂��m�F
echo [2/4] WAR�t�@�C���m�F
echo ====================
echo WAR�t�@�C�����`�F�b�N���Ă��܂�: %RESIN_HOME%\webapps\*.war

set WAR_FOUND=false
for %%f in ("%RESIN_HOME%\webapps\*.war") do (
    if exist "%%f" (
        set WAR_FOUND=true
        echo ����: %%~nxf (%%~tf)
    )
)

if "%WAR_FOUND%"=="false" (
    echo.
    echo **�x��: WAR�t�@�C����������܂���**
    echo %RESIN_HOME%\webapps\ ��WAR�t�@�C�������݂��܂���B
    echo �A���f�v���C�݂̂��s���܂��B
    echo.
    set /p CONTINUE="�A���f�v���C�̂ݑ��s���܂����H (y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo �ăf�v���C�𒆎~���܂����B
        pause
        exit /b 0
    )
) else (
    echo.
    echo ��L��WAR�t�@�C�����g�p���čăf�v���C���s���܂��B
    set /p CONTINUE="���s���܂����H (y/n): "
    if /i not "!CONTINUE!"=="y" (
        echo �ăf�v���C�𒆎~���܂����B
        pause
        exit /b 0
    )
)
echo.

rem 3. �A���f�v���C����
echo [3/4] �A���f�v���C
echo ==================

rem RESIN_HOME/webapps/ �z���́A�t�H���_�iROOT�łȂ��j���폜
echo webapps�t�H���_���N���[�j���O��...
for /d %%d in ("%RESIN_HOME%\webapps\*") do (
    if /i not "%%~nxd"=="ROOT" (
        echo �폜: %%d
        rmdir /s /q "%%d" 2>nul
    )
)

rem RESIN_HOME/resin-data/ �z���̑S�Ẵt�H���_���폜
if exist "%RESIN_HOME%\resin-data\" (
    echo resin-data�t�H���_���N���[�j���O��...
    for /d %%d in ("%RESIN_HOME%\resin-data\*") do (
        echo �폜: %%d
        rmdir /s /q "%%d" 2>nul
    )
) else (
    echo resin-data�t�H���_��������܂���i�X�L�b�v�j
)

echo �A���f�v���C���������܂����B
echo.

rem 4. Resin���N�����A�ăf�v���C���s��
echo [4/4] Resin�N���E�ăf�v���C
echo ===========================
echo Resin���N�����Ă��܂�...
echo.

call "%~dp0resin-java-standalone.bat" start

echo.
echo �ăf�v���C�������������܂����B
echo WAR�t�@�C���̃f�v���C��Resin�̋N����Ɏ����I�ɊJ�n����܂��B
echo.
pause