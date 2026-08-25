@echo off
chcp 65001 >nul
title risk-place.ru — локальный просмотр
cd /d "%~dp0"

echo.
echo   Запускаю локальный сервер для просмотра сайта.
echo   Меню и внутренние ссылки будут работать так же, как на боевом сервере.
echo.
echo   Чтобы закрыть просмотр — закройте это окно.
echo.

set PY=
where py >nul 2>&1 && set PY=py -3
if "%PY%"=="" ( where python >nul 2>&1 && set PY=python )
if "%PY%"=="" ( where python3 >nul 2>&1 && set PY=python3 )

if "%PY%"=="" (
  echo   Python на компьютере не найден.
  echo   Без него локальный сервер не поднять. Варианты:
  echo     1^) установить Python с python.org, галочка "Add to PATH"
  echo     2^) открыть index.html двойным щелчком — страницы откроются,
  echo        но пункты меню будут показывать список файлов вместо страницы
  echo.
  pause
  exit /b 1
)

start "" http://localhost:8765/
%PY% -m http.server 8765
