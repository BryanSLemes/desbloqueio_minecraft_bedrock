@echo off
setlocal enabledelayedexpansion

:: --- VERIFICAÇÃO DE ADMINISTRADOR ---
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo [INFO] Solicitando privilegios elevados...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

set "ORIGEM=%~dp0arquivo_desbloqueio"
set "DESTINO_APPS=C:\Program Files\WindowsApps"
set "MODS=%APPDATA%\Minecraft Bedrock\mods"

echo [1/2] LOCALIZANDO PASTA DO JOGO...
for /d %%i in ("%DESTINO_APPS%\Microsoft.MinecraftUWP*") do (
    set "PASTA_MINECRAFT=%%i"
)

if not defined PASTA_MINECRAFT (
    echo [ERRO] Pasta do Minecraft nao encontrada.
    pause & exit /b
)

echo [PASTA]: "!PASTA_MINECRAFT!"

echo.
echo [2/2] EXECUTANDO ACOES...

:: ACAO 1: Colar vcruntime na pasta do Minecraft
echo -> Tentando permissao no destino: vcruntime140_1.dll
:: Aqui tentamos dar permissao APENAS para o arquivo que vamos substituir/criar
takeown /f "!PASTA_MINECRAFT!" >nul 2>&1
icacls "!PASTA_MINECRAFT!" /grant Administradores:F >nul 2>&1

copy /y "%ORIGEM%\vcruntime140_1.dll" "!PASTA_MINECRAFT!\"
if %errorlevel% equ 0 (echo [OK] vcruntime copiado.) else (echo [ERRO] Falha ao copiar vcruntime.)

:: ACAO 2: Colar mod na pasta do usuario
echo.
echo -> Verificando pasta de mods...
if not exist "%MODS%" mkdir "%MODS%"
copy /y "%ORIGEM%\MinecraftForFree.dll" "%MODS%\"
if %errorlevel% equ 0 (echo [OK] MinecraftForFree copiado.) else (echo [ERRO] Falha ao copiar mod.)

echo.
echo ======================================================
echo PROCESSO CONCLUIDO.
echo ======================================================
pause