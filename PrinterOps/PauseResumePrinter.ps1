param (
    [string]$PrinterName,
    [switch]$Pause
)

$printer = Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Name='$PrinterName'"
if ($Pause) {
    $printer.Pause()
    Write-Host "Printer $PrinterName paused."
} else {
    $printer.Resume()
    Write-Host "Printer $PrinterName resumed."
}
