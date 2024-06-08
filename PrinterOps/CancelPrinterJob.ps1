param (
    [int]$JobId
)

Get-PrintJob -Id $JobId | Remove-PrintJob
