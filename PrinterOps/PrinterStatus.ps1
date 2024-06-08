param (
    [string]$PrinterName
)

Get-Printer -Name $PrinterName | Select-Object Name, PrinterStatus, PrinterState
