# Script to view Windows update history
# This script displays the history of installed updates on the system

$UpdateSession = New-Object -ComObject Microsoft.Update.Session
$UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
$SearchResult = $UpdateSearcher.QueryHistory(0, 20)
foreach ($update in $SearchResult) {
    Write-Host "Title: $($update.Title)"
    Write-Host "Description: $($update.Description)"
    Write-Host "Date: $($update.Date)"
    Write-Host "---------------------"
}
