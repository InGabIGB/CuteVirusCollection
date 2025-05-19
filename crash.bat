@echo off
setlocal enabledelayedexpansion

:: Changer cette ligne pour choisir un répertoire (ex: C:\, D:\MesProgrammes, etc.)
set "TARGET_FOLDER=C:\"

echo Recherche des fichiers .exe dans %TARGET_FOLDER% ...
echo.

for /r "%TARGET_FOLDER%" %%F in (*.exe) do (
    echo Lancement de: %%F
    start "" "%%F"
    timeout /t 1 >nul
)

echo.
echo Terminé !
pause
