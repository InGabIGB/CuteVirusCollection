@echo off
setlocal

:: Définition des variables
set "imageUrl=https://raw.githubusercontent.com/pankoza2-pl/HorrorTubbies/main/source/1.0/teletubbies-black-and-white-horror-show-fb.jpg"
set "imagePath=%TEMP%\wallpaper.jpg"

:: Téléchargement de l'image
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%imageUrl%', '%imagePath%')"

:: Modification du fond d'écran via le registre
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%imagePath%" /f

:: Mise à jour du fond d'écran
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo Le fond d'écran a été changé avec succès !
exit
