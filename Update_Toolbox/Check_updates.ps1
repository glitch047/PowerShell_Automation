# Script to check for Windows updates
# This script checks for available updates on the system

$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.Search("IsInstalled=0")
if ($SearchResult.Updates.Count -eq 0) {
    Write-Host "No updates available."
} else {
    Write-Host "Updates available:"
    foreach ($update in $SearchResult.Updates) {
        Write-Host $update.Title
    }
}
