# Foundation — install the local app
#
# Creates a desktop shortcut that opens the course in a chrome-less app window.
# No server, no build, no dependencies beyond a Chromium browser.
#
#   Right-click this file -> "Run with PowerShell"
#   or:  powershell -ExecutionPolicy Bypass -File setup-local-app.ps1

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $MyInvocation.MyCommand.Path

# --- find a Chromium browser ---------------------------------------------
$candidates = @(
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe"
)
$browser = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $browser) {
  Write-Host "No Chrome or Edge found. Open index.html directly instead." -ForegroundColor Yellow
  exit 1
}

# --- icon -----------------------------------------------------------------
$icon = Join-Path $repo "Foundation.ico"
if (-not (Test-Path $icon)) {
  $py = (Get-Command python -ErrorAction SilentlyContinue).Source
  if ($py) { & $py (Join-Path $repo "make-icon.py") | Out-Null }
}

# --- shortcut -------------------------------------------------------------
# A dedicated --user-data-dir keeps the app's saved progress stable and
# separate from normal browsing, so clearing browser data won't wipe it.
$profileDir = Join-Path $repo ".appdata"
New-Item -ItemType Directory -Force $profileDir | Out-Null

$uri  = ([System.Uri](Join-Path $repo "index.html")).AbsoluteUri
$args = '--app="{0}" --user-data-dir="{1}" --no-first-run --no-default-browser-check' -f $uri, $profileDir

$desktop = [Environment]::GetFolderPath("Desktop")
$link    = Join-Path $desktop "Foundation.lnk"

$ws = New-Object -ComObject WScript.Shell
$sc = $ws.CreateShortcut($link)
$sc.TargetPath       = $browser
$sc.Arguments        = $args
$sc.WorkingDirectory = $repo
if (Test-Path $icon) { $sc.IconLocation = "$icon,0" }
$sc.Description      = "Foundation - 12-week product design course"
$sc.Save()

Write-Host ""
Write-Host "  Installed." -ForegroundColor Green
Write-Host "  Shortcut:  $link"
Write-Host "  Browser:   $browser"
Write-Host ""
Write-Host "  Double-click Foundation on your desktop to open the course."
Write-Host "  Progress is saved in $profileDir and survives restarts."
Write-Host ""
