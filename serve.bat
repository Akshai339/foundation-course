@echo off
REM Foundation — serve the course over http so you can also open it on your phone
REM (same wifi). Not needed for normal desktop use; the desktop shortcut opens
REM the file directly with no server at all.

cd /d "%~dp0"

echo.
echo   Foundation - local server
echo   -------------------------
echo.
echo   On this machine:  http://localhost:8734/
echo.

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
  for /f "tokens=1" %%b in ("%%a") do echo   On your phone:    http://%%b:8734/
)

echo.
echo   Close this window to stop the server.
echo.

start "" "http://localhost:8734/"
python -m http.server 8734
