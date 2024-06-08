param (
    [string]$PrinterName
)

$defaultPrinter = Get-WmiObject -Query "SELECT * FROM Win32_Printer WHERE Default=$true"
$defaultPrinter.SetDefaultPrinter($PrinterName)
