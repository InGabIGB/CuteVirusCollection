::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdDqDJH2L40w8JxpQXziPOW+zBbQQ1/vw+uaLnUQeW+wAKduMieHWYKhBowvtdplN
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF6JeA==
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdDqDJH2L40w8JxpQXziyHVj6KYAq2sHJoe+fpy0=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
:: Vérifier si AutoHotkey est déjà installé dans le dossier "hotkeys"
if exist "%~dp0hotkeys\AutoHotkeyU64.exe" (
    echo AutoHotkey est déjà installé. Passons à l'exécution du script.
) else (
    :: 1. Créer un répertoire "hotkeys" dans le même dossier que le fichier .bat
    mkdir "%~dp0hotkeys"

    :: 2. Télécharger la version portable d'AutoHotkey
    echo Téléchargement d'AutoHotkey portable...
    powershell -Command "Invoke-WebRequest -Uri https://www.autohotkey.com/download/ahk.zip -OutFile '%~dp0hotkeys\AutoHotkey.zip'"

    :: 3. Décompresser la version portable d'AutoHotkey dans le dossier "hotkeys"
    echo Décompression d'AutoHotkey...
    powershell -Command "Expand-Archive -Path '%~dp0hotkeys\AutoHotkey.zip' -DestinationPath '%~dp0hotkeys'"

    :: Supprimer l'archive ZIP après extraction
    del "%~dp0hotkeys\AutoHotkey.zip"

    echo AutoHotkey portable a été installé avec succès.
)

:: 4. Créer le script AutoHotkey dans le dossier "hotkeys"
echo Création du script AutoHotkey...
(
    echo BlockInput, On
    echo Run, "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://www.google.com/search?hl=fr&tbm=isch&q=bbl"
    echo Sleep, 1000
    echo Send, {F11}
    echo Sleep, 10000
    echo BlockInput, Off
) > "%~dp0hotkeys\ouvrir_chrome_bbl_fullscreen.ahk"

:: 5. Lancer le script AutoHotkey via la version portable
echo Exécution du script AutoHotkey...
start "" "%~dp0hotkeys\AutoHotkeyU64.exe" "%~dp0hotkeys\ouvrir_chrome_bbl_fullscreen.ahk"

:: Terminer
echo Installation et exécution réussies!
pause
