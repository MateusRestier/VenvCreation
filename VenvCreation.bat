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

:: Verificar se o arquivo .gitignore existe, se não, cria
if not exist "%current_dir%.gitignore" (
    echo venv > "%current_dir%.gitignore"
    echo Arquivo .gitignore criado com "venv" nele.
)

:: Verificar se o arquivo requirements.txt existe, se não, cria
if not exist "%current_dir%requirements.txt" (
    echo openpyxl> "%current_dir%requirements.txt"
    echo python-dotenv>> "%current_dir%requirements.txt"
    echo pandas>> "%current_dir%requirements.txt"
    echo Arquivo requirements.txt criado com bibliotecas padrão.
) else (
    echo Arquivo requirements.txt já existe.
)

:: Instalar as bibliotecas do arquivo requirements.txt
call pip install -r "%current_dir%requirements.txt"

:: Confirmar que as bibliotecas foram instaladas
echo Bibliotecas instaladas com sucesso do arquivo requirements.txt.

:: Manter a janela aberta para ver a saída
pause
