@echo off
rem Resin �|�[�g�w��N���o�b�` (Java��)
echo Resin Custom Port (Java Standalone)
echo ===================================
set /p PORT="�N���|�[�g�ԍ�����͂��Ă������� (�f�t�H���g:8080): "
if "%PORT%"=="" set PORT=8080
call resin-java-standalone.bat -port %PORT%
pause
