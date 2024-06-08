param (
    [string]$PrinterName
)

Get-Printer -Name $PrinterName | Get-PrintConfiguration
