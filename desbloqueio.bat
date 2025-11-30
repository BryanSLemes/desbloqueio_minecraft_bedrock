@echo off
setlocal enabledelayedexpansion
title Minecraft Bedrock - Desbloqueio

echo INICIANDO SCRIPT
echo ----------------------------------------------
echo.

:: ==========================================
:: VARIAVEIS INICIAIS
:: ==========================================
set "pastaJuanse=C:\Users\%USERNAME%\AppData\Roaming\Minecraft Bedrock\Juansekill"
set "pastaMC=C:\Users\%USERNAME%\AppData\Roaming\Minecraft Bedrock"
set "origemJuanse=%~dp0arquivo_desbloqueio\Juansekill"
set "origemDLL=%~dp0arquivo_desbloqueio\Juego\vcruntime140_1.dll"
:: set "destinoDLL=C:\XboxGames\Minecraft for Windows\Content"

set processo1_ok=1
set processo2_ok=1
set motivo1=
set motivo2=

:: ==========================================
:: DETECTAR INSTALAÇÃO DO MINECRAFT
:: ==========================================
set "XG_PATH=C:\XboxGames"
set "MC_PATH="

if not exist "%XG_PATH%" (
    :: echo ----------------------------------------------
    :: echo A pasta "%XG_PATH%" nao existe.
    :: echo Minecraft NAO esta instalado via Xbox App.
    goto END
)

:: Tentativa 1: pastas comuns
for %%A in (
    "Minecraft for Windows"
    "Microsoft.MinecraftUWP"
    "Minecraft"
) do (
    if exist "%XG_PATH%\%%~A" (
        set "MC_PATH=%XG_PATH%\%%~A"
        goto FOUND_MC
    )
)

:: Tentativa 2: pastas com "minecraft" usando PowerShell
for /f "delims=" %%B in ('powershell -NoProfile -Command ^
    "Get-ChildItem '%XG_PATH%' -Directory -ErrorAction SilentlyContinue | Where-Object { $_.Name -match 'minecraft' } | Select-Object -ExpandProperty FullName"') do (
    set "MC_PATH=%%B"
    goto FOUND_MC
)

:: Tentativa 3: localizar executável
for /f "delims=" %%C in ('powershell -NoProfile -Command ^
    "Get-ChildItem '%XG_PATH%' -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -match 'Minecraft.Windows.exe' } | Select-Object -ExpandProperty DirectoryName"') do (
    set "MC_PATH=%%C"
    goto FOUND_MC
)

:NOT_FOUND
:: echo ----------------------------------------------
echo Minecraft NAO encontrado no sistema.
echo.
:: echo Ele pode estar instalado em outro usuario ou o Xbox App nao concluiu a instalacao.
echo Abra o Minecraft pelo menos uma vez antes de rodar este script.
echo.
goto END

:FOUND_MC
:: echo ----------------------------------------------
:: echo Minecraft Bedrock encontrado!
:: echo Caminho: "%MC_PATH%"
set "destinoDLL=%MC_PATH%"

:: ==========================================
:: PROCESSO 1 - COPIAR PASTA JUANSEKILL
:: ==========================================
if not exist "%pastaMC%" (
    set processo1_ok=0
    set motivo1=Pasta "%pastaMC%" nao existe.
) else (
    if exist "%origemJuanse%" (
        if exist "%pastaJuanse%" (
            rmdir /s /q "%pastaJuanse%" 2>nul
            if errorlevel 1 (
                set processo1_ok=0
                set motivo1=Falha ao remover pasta antiga Juansekill.
            )
        )
        xcopy "%origemJuanse%" "%pastaJuanse%\" /E /I /Y >nul
        if errorlevel 1 (
            set processo1_ok=0
            set motivo1=Falha ao copiar a pasta Juansekill.
        )
    ) else (
        set processo1_ok=0
        set motivo1=Origem "%origemJuanse%" nao encontrada.
    )
)

:: ==========================================
:: PROCESSO 2 - COPIAR DLL
:: ==========================================
if not exist "%destinoDLL%" (
    set processo2_ok=0
    set motivo2=Pasta "%destinoDLL%" nao existe.
) else (
    if exist "%origemDLL%" (
        if exist "%destinoDLL%\vcruntime140_1.dll" (
            del /f /q "%destinoDLL%\vcruntime140_1.dll" 2>nul
            if errorlevel 1 (
                set processo2_ok=0
                set motivo2=Falha ao remover DLL antiga.
            )
        )
        copy /Y "%origemDLL%" "%destinoDLL%" >nul
        if errorlevel 1 (
            set processo2_ok=0
            set motivo2=Falha ao copiar vcruntime140_1.dll.
        )
    ) else (
        set processo2_ok=0
        set motivo2=Origem "%origemDLL%" nao encontrada.
    )
)

:: ==========================================
:: RESULTADO FINAL
:: ==========================================
echo ----------------------------------------------
if "!processo1_ok!"=="1" if "!processo2_ok!"=="1" (
    echo MINECRAFT DESBLOQUEADO COM SUCESSO!
    echo ----------------------------------------------
    echo.
    pause
    exit /b
)

echo Minecraft NAO Desbloqueado
echo.
echo Motivo(s):
if defined motivo1 echo - !motivo1!
if defined motivo2 echo - !motivo2!
echo ----------------------------------------------
echo Para corrigir: abra o Minecraft Bedrock pelo menos uma vez antes de rodar este script.
echo.
pause
exit /b

:END
pause
exit /b
