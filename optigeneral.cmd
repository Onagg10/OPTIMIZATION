@echo off
:: Verifica se lo script è in esecuzione come amministratore
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo Questo script richiede i privilegi di amministratore.
    pause
    exit /b
)

:: Pulizia dei file temporanei
echo Pulizia dei file temporanei...
del /q /f /s %temp%\*
del /q /f /s C:\Windows\Temp\*
echo File temporanei puliti.

:: Pulizia del disco
echo Pulizia del disco...
cleanmgr /sagerun:1
echo Pulizia del disco completata.

:: Disabilita i programmi di avvio non necessari
echo Disabilitazione programmi di avvio non necessari...
reg add "HKLM\SOFTWARE\Microsoft\Shared Tools\MSConfig\startupreg" /v ProgramName /t REG_SZ /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v ProgramName /t REG_SZ /d "" /f
echo Programmi di avvio disabilitati.

:: Disabilita i processi inutili
echo disattivazione processi (temporaneamente)
taskkill /f /im Skype.exe
taskkill /f /im notepad.exe
taskkill /f /im OneDrive.exe 
taskkill /f /im Spotify.exe 
taskkill /f /im XboxApp.exe 
taskkill /f /im cortana.exe 
taskkill /f /im FeedbackHub.exe 
taskkill /f /im GameBar.exe 
taskkill /f /im OfficeClickToRun.exe 
taskkill /f /im SearchApp.exe 
taskkill /f /im Video.UI.exe 
taskkill /f /im YourPhone.exe 
taskkill /f /im SearchIndexer.exe 
taskkill /f /im chrome.exe
taskkill /f /im SearchApp.exe
taskkill /f /im GameBarPresenceWriter.exe

:: Disabilita gli effetti visivi di Windows
echo Disabilitazione degli effetti visivi di Windows...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Effetti visivi di Windows disabilitati.

echo Ottimizzazione completata.
pause 
