@echo off
setlocal

:: Définition des variables
set "imageUrl=https://raw.githubusercontent.com/pankoza2-pl/HorrorTubbies/main/source/1.0/teletubbies-black-and-white-horror-show-fb.jpg"
set "imagePath=%USERPROFILE%\wallpaper.jpg"

:: Téléchargement de l'image avec PowerShell
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%imageUrl%', '%imagePath%')"

:: Appliquer le fond d'écran sans admin
powershell -Command "& {Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Wallpaper { [DllImport(\"user32.dll\", CharSet = CharSet.Auto)] public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }'; [Wallpaper]::SystemParametersInfo(20, 0, '%imagePath%', 3)}"

echo Le fond d'écran a été changé avec succès !
exit
