@echo off
:: Verificar se o Python está instalado
python --version
if %errorlevel% neq 0 (
    echo Python não está instalado ou não está no PATH.
    exit /b 1
)

:: Obter o diretório atual
set "current_dir=%~dp0"

:: Criar o ambiente virtual, se ainda não estiver criado
if not exist "%current_dir%venv\" (
    python -m venv "%current_dir%venv"
    echo Ambiente virtual criado.
) else (
    echo Ambiente virtual já existe.
)

:: Ativar o ambiente virtual (Windows)
call "%current_dir%venv\Scripts\activate"

:: Instalar as bibliotecas do arquivo requirements.txt
if exist "%current_dir%requirements.txt" (
    call pip install -r "%current_dir%requirements.txt"
) else (
    echo Arquivo requirements.txt não encontrado.
)

:: Confirmar que as bibliotecas foram instaladas
echo Bibliotecas instaladas com sucesso do arquivo requirements.txt.

:: Manter a janela aberta para ver a saída
pause
