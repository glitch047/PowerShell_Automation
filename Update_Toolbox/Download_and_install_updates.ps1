# Script to download and install Windows updates
# This script downloads and installs available updates on the system

$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateDownloader = $UpdateSession.CreateUpdateDownloader()
$SearchResult = $UpdateDownloader.Download()
$Installer = New-Object -ComObject Microsoft.Update.Installer
$Installer.Install()
