# Downloads and installs JetBrainsMono Nerd Font for the current user.
# No admin rights required — installs to %LOCALAPPDATA%\Microsoft\Windows\Fonts.

$fontName   = "JetBrainsMono"
$url        = "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$fontName.zip"
$zip        = "$env:TEMP\$fontName.zip"
$extractDir = "$env:TEMP\$fontName"
$fontsDir   = "$env:LOCALAPPDATA\Microsoft\Windows\Fonts"
$regPath    = "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"

Write-Host "Downloading $fontName Nerd Font..."
Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing

Write-Host "Extracting..."
Expand-Archive -Path $zip -DestinationPath $extractDir -Force

if (-not (Test-Path $fontsDir)) {
    New-Item -ItemType Directory -Path $fontsDir | Out-Null
}

Write-Host "Installing fonts..."
foreach ($font in (Get-ChildItem -Path $extractDir -Filter "*.ttf" -Recurse)) {
    $dest = Join-Path $fontsDir $font.Name
    Copy-Item -Path $font.FullName -Destination $dest -Force
    Set-ItemProperty -Path $regPath -Name "$($font.BaseName) (TrueType)" -Value $dest
}

Write-Host "Cleaning up..."
Remove-Item -Path $zip -Force
Remove-Item -Path $extractDir -Recurse -Force

Write-Host "Done. Restart WezTerm to pick up the new font."
