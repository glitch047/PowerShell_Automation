# Script to check the status of the Windows Update service
# This script retrieves the status of the Windows Update service

$Service = Get-Service -Name wuauserv
if ($Service.Status -eq "Running") {
    Write-Host "Windows Update service is running."
} else {
    Write-Host "Windows Update service is not running."
}
