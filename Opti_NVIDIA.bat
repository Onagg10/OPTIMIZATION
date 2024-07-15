@echo off
:: Disattivazione del risparmio energetico durante i giochi della NVIDIA
:: Di Araujo

for /f %%a in ('wmic path Win32_VideoController get PNPDeviceID^| findstr /L "PCI\VEN_"') do (
    for /f "tokens=3" %%b in ('reg query "HKLM\SYSTEM\ControlSet001\Enum\%%a" /v "Driver"') do (
        for /f %%c in ('echo %%b ^| findstr "{"') do (
            Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%c" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
        )
    )
)

:: Utilizzo del metodo antico per la nitidezza, senza upscaling
:: Di Araujo

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\FTS" /v "EnableGR535" /t REG_DWORD /d "0" /f

pause & exit /b
