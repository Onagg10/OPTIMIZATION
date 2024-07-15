@echo off

Title NOG'S ACTIVATOR

cls
color 4f

:menu
Date /t 
Time /t
echo ******************************************
echo *                                        *
echo *           NOG'S ACTIVATOR              *
echo *                                        *
echo *     (1) Attivare Servizi               *
echo *     (2) Disattivare Servizi            *
echo *     (3) Uscire                         *
echo *                                        *
echo *                                        *
echo ******************************************
echo.

set /p op= Digita la tua opzione:
if %op% equ 1 goto 1
if %op% equ 2 goto 2
if %op% equ 3 goto 3

:1
start /min cmd.exe
sc config diagtrack start=auto
net start "DiagTrack"
sc config pcasvc start=auto
net start "PcaSvc"

cls
goto menu

:2
start /min cmd.exe
sc stop DPS
sc config DPS start= disabled
sc stop SysMain
sc config SysMain start= disabled
sc stop diagsvc
sc config diagsvc start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop PcaSvc
sc config PcaSvc start= disabled
sc stop DusmSvc
sc config DusmSvc start= disabled

cls
goto menu

:3
taskkill /f /t /im cmd.exe
exit
