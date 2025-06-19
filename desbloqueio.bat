@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permissao de administrador...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

setlocal enabledelayedexpansion

set "arquivo_origem=C:\Windows\System32\Windows.ApplicationModel.Store.dll"
set "pasta_backup=%~dp0Backup"
set "arquivo_backup=%pasta_backup%\Windows.ApplicationModel.Store.dll"
set "pasta_arquivo_desbloqueio=%~dp0arquivo_desbloqueio"
set "arquivo_desbloqueio=%pasta_arquivo_desbloqueio%\Windows.ApplicationModel.Store.dll"
set "pasta_destino_copia=C:\Windows\System32"

if not exist "%pasta_backup%" (
    mkdir "%pasta_backup%"
)

if exist "%arquivo_origem%" (
    if not exist "%arquivo_backup%" (
        copy "%arquivo_origem%" "%arquivo_backup%" >nul
        if errorlevel 1 (
            set "txt_backup=Erro ao copiar arquivo para Backup."
        ) else (
            set "txt_backup=Arquivo copiado com sucesso para a pasta Backup!"
        )
    ) else (
        set "txt_backup=Arquivo ja existe na pasta Backup. Nada foi feito."
    )
) else (
    set "txt_backup=Arquivo de origem nao encontrado."
)

if exist "%arquivo_origem%" (
    del /f "%arquivo_origem%" >nul 2>&1
    if exist "%arquivo_origem%" (
        set "txt_apagar=Arquivo nao foi apagado"
        set "arquivo_existe=1"
    ) else (
        set "txt_apagar=Arquivo removido com sucesso: %arquivo_origem%"
        set "arquivo_existe=0"
    )
) else (
    set "txt_apagar=Arquivo nao encontrado: %arquivo_origem%"
    set "arquivo_existe=0"
)

if "%arquivo_existe%"=="0" (
    if exist "%arquivo_desbloqueio%" (
        copy /y "%arquivo_desbloqueio%" "%pasta_destino_copia%" >nul
        if errorlevel 1 (
            set "txt_copiar=Erro ao copiar arquivo desbloqueado."
        ) else (
            set "txt_copiar=Arquivo copiado para %pasta_destino_copia%"
        )
    ) else (
        set "txt_copiar=Arquivo desbloqueado nao encontrado para copiar."
    )
    set "mensagem_final=Minecraft Desbloqueado com sucesso"
) else (
    set "txt_copiar= "
    set "mensagem_final=Minecraft NAO Desbloqueado."
)

echo.
echo %txt_backup%
echo.
echo %txt_apagar%
echo.
echo %txt_copiar%
echo.
echo %mensagem_final%
echo.

pause
endlocal