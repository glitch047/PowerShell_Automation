# Script to search for specific updates (e.g., Security updates)
# This script searches for updates with specific keywords in the title

$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.Search("Type='Software' AND IsInstalled=0 AND CategoryIDs contains 'e.g., Security'")
if ($SearchResult.Updates.Count -eq 0) {
    Write-Host "No updates found matching the search criteria."
} else {
    Write-Host "Updates found:"
    foreach ($update in $SearchResult.Updates) {
        Write-Host $update.Title
    }
}
