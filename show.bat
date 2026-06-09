@echo off
choco install anydesk -y --ignore-checksums --force --no-progress --pre
:START_ANYDESK
anydesk --start
powershell -Command "Start-Sleep -Seconds 5"
for /f "delims=" %%i in ('"C:\ProgramData\chocolatey\lib\anydesk.portable\tools\AnyDesk.exe" --get-id') do (
    set ID=%%i
)
if "%ID%"=="" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)
if "%ID%"=="0" (
    taskkill /f /im anydesk.exe > nul
    goto START_ANYDESK
)
echo iblamematrix | anydesk.exe --set-password _full_access
start "" /MAX "C:\Users\Public\Desktop\VMQuickConfig"
python -c "import pyautogui as pag; pag.click(143, 487, duration=5)"
python -c "import pyautogui as pag; pag.click(155, 554, duration=2)"
python -c "import pyautogui as pag; pag.click(637, 417, duration=2)"
python -c "import pyautogui as pag; pag.click(588, 10, duration=2)"
echo ............................................................
echo ............................................................
echo .................. Brought to you by .......................
echo ............................................................
echo "  _ _     _                                      _        _       "
echo " (_) |__ | | __ _ _ __ ___   ___ _ __ ___   __ _| |_ _ __(_)_  __ "
echo " | | '_ \| |/ _` | '_ ` _ \ / _ \ '_ ` _ \ / _` | __| '__| \ \/ / "
echo " | | |_) | | (_| | | | | | |  __/ | | | | | (_| | |_| |  | |>  <  "
echo " |_|_.__/|_|\__,_|_| |_| |_|\___|_| |_| |_|\__,_|\__|_|  |_/_/\_\ "
echo "............................................................"
echo ....... If You want to run Windows-10 using AnyDesk ........
echo ...... Contact me here @iblamematrix ........
echo ............................................................
echo ............................................................
echo Windows Cloud PC ID is: %ID%
echo Windows Cloud Password: iblamematrix
echo You can login now!