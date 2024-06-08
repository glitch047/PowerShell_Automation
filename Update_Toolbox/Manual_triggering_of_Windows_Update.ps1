# Script to manually trigger Windows Update
# This script initiates a manual Windows Update check

$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.Search("IsInstalled=0")
if ($SearchResult.Updates.Count -eq 0) {
    Write-Host "No updates available."
} else {
    $Installer = New-Object -ComObject Microsoft.Update.Installer
    $Installer.Install()
}
