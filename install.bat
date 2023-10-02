@ECHO off
CLS
TITLE 15 seconds ADB Installer v1.4.3
COLOR 09
ECHO ###############################################################################
ECHO #                                                                             #
ECHO #                          15 seconds ADB Installer                           #
ECHO #                                                                             #
ECHO #                                version 2.1.0                                #
ECHO #                                                                             #
ECHO #                             Original by Snoop05                             #
ECHO #                          Modified by HyperNotZyper                          #
ECHO #                                                                             #
ECHO #                    Android Debug Bridge version r34.0.4                     #
ECHO #                        Google USB Driver version R13                        #
ECHO #                                                                             # 
ECHO #                                                                             #
ECHO ###############################################################################
:Q1
ECHO(
SET /P ANSWER=Do you want to install ADB and Fastboot? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO Q2)
 IF /i {%ANSWER%}=={yes} (GOTO Q2)
 IF /i {%ANSWER%}=={n} (GOTO DRV)
 IF /i {%ANSWER%}=={no} (GOTO DRV)
ECHO(
ECHO Bad answer! Use only Y/N or Yes/No
GOTO Q1
:Q2
ECHO(
SET /P ANSWER=Install ADB system-wide? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO ADB_S)
 IF /i {%ANSWER%}=={yes} (GOTO ADB_S)
 IF /i {%ANSWER%}=={n} (GOTO ADB_U)
 IF /i {%ANSWER%}=={no} (GOTO ADB_U)
ECHO(
ECHO Bad answer! Use only Y/N or Yes/No
GOTO Q2
:ADB_U
ECHO(
ECHO Installing ADB and Fastboot ... (current user only)
ECHO(
ADB kill-server > NUL 2>&1
SET /a COUNT=0
IF EXIST %WINDIR%\adb.exe DEL %WINDIR%\adb.exe /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\AdbWinApi.dll DEL %WINDIR%\AdbWinApi.dll /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\AdbWinUsbApi.dll DEL %WINDIR%\AdbWinUsbApi.dll /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\fastboot.exe DEL %WINDIR%\fastboot.exe /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
XCOPY adb\adb.exe %USERPROFILE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
XCOPY adb\AdbWinApi.dll %USERPROFILE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
XCOPY adb\AdbWinUsbApi.dll %USERPROFILE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
XCOPY adb\fastboot.exe %USERPROFILE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
ECHO %COUNT% file(s) copied.
:PATH_U
ECHO %PATH% > PATH.TMP
ver > nul
FIND "%USERPROFILE%\adb" PATH.TMP > nul 2>&1
IF %ERRORLEVEL% LSS 1 GOTO DRV
VER | FIND "5.1" > NUL 2>&1
IF %ERRORLEVEL% LSS 1 xp\SETX.exe PATH "%PATH%;%USERPROFILE%\adb" 2>>%USERPROFILE%\Desktop\adb-installer.log && GOTO DRV
SETX PATH "%PATH%;%USERPROFILE%\adb" 2>>%USERPROFILE%\Desktop\adb-installer.log
GOTO DRV
:ADB_S
ECHO(
ECHO Installing ADB and Fastboot ... (system-wide)
ECHO(
ADB kill-server > NUL 2>&1
SET /a COUNT=0
IF EXIST %WINDIR%\adb.exe DEL %WINDIR%\adb.exe /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\AdbWinApi.dll DEL %WINDIR%\AdbWinApi.dll /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\AdbWinUsbApi.dll DEL %WINDIR%\AdbWinUsbApi.dll /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
IF EXIST %WINDIR%\fastboot.exe DEL %WINDIR%\fastboot.exe /f /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log
XCOPY adb\adb.exe %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
XCOPY adb\AdbWinApi.dll %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
XCOPY adb\AdbWinUsbApi.dll %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
XCOPY adb\fastboot.exe %SYSTEMDRIVE%\adb\ /y /q 1>nul 2>>%USERPROFILE%\Desktop\adb-installer.log && SET /a COUNT=%COUNT%+1
ECHO %COUNT% file(s) copied.
:PATH_S
ECHO %PATH% > PATH.TMP
ver > nul
FIND "%SYSTEMDRIVE%\adb" PATH.TMP > nul 2>&1
IF %ERRORLEVEL% LSS 1 GOTO DRV
VER | FIND "5.1" > NUL 2>&1
IF %ERRORLEVEL% LSS 1 xp\SETX.exe PATH "%PATH%;%SYSTEMDRIVE%\adb" /m 2>>%USERPROFILE%\Desktop\adb-installer.log && GOTO DRV
SETX PATH "%PATH%;%SYSTEMDRIVE%\adb" /m 2>>%USERPROFILE%\Desktop\adb-installer.log
:DRV
DEL PATH.TMP
ECHO(
SET /P ANSWER=Do you want to install device drivers? (Y/N)
 IF /i {%ANSWER%}=={y} (GOTO DRIVER)
 IF /i {%ANSWER%}=={yes} (GOTO DRIVER)
 IF /i {%ANSWER%}=={n} (GOTO FINISH)
 IF /i {%ANSWER%}=={no} (GOTO FINISH)
ECHO Bad answer! Use only Y/N or Yes/No
GOTO DRV
:DRIVER
IF DEFINED programfiles(x86) GOTO x64
:x86
ECHO(
ECHO Installing 32-bit driver ...
ECHO Please continue driver installation ...
PING localhost -n 1 >NUL
START /wait driver\pnputil /add-driver android_winusb.inf /install /subdirs > %USERPROFILE%\Desktop\adb-installer.log
GOTO FINISH
:x64
ECHO(
ECHO Installing 64-bit driver ...
ECHO Please continue driver installation ...
PING localhost -n 1 >NUL
START /wait driver\pnputil /add-driver android_winusb.inf /install /subdirs > %USERPROFILE%\Desktop\adb-installer.log
:FINISH
ECHO(
ECHO All done!
CALL :LOG %USERPROFILE%\Desktop\adb-installer.log
:LOG
PING localhost -n 2 >NUL
EXIT
