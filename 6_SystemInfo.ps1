<#
.SYNOPSIS
    Retrieves various system information from the local computer and organizes the data into a readable format.

.DESCRIPTION
    This PowerShell script gathers system information such as system name, OS version, free disk space, memory information,
    processor information, network configuration, last reboot time, and list of installed software. The gathered information
    is organized into a clear and readable format, either as a CSV file or formatted console output.

.NOTES
    Author: [Your Name]
    Date: [Date]

.PARAMETER OutputFilePath
    Specifies the path to save the output CSV file. If not provided, the script will display the information in the console.

.EXAMPLE
    .\SystemInfo.ps1 -OutputFilePath "C:\SystemInfo.csv"
#>

param (
    [string]$OutputFilePath
)

# Function to log errors
function LogError {
    param (
        [string]$ErrorMessage
    )

    Add-Content -Path "ErrorLog.txt" -Value "$(Get-Date) - $ErrorMessage"
}

# Function to retrieve installed software
function Get-InstalledSoftware {
    try {
        Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | 
        Select-Object DisplayName, Publisher, InstallDate
    } catch {
        LogError "Failed to retrieve installed software: $_"
    }
}

# Function to retrieve network configuration
function Get-NetworkConfig {
    try {
        $ipConfig = Get-NetIPAddress | Where-Object { $_.InterfaceAlias -eq 'Ethernet' -and $_.AddressFamily -eq 'IPv4' }
        $gateway = Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' }

        [PSCustomObject]@{
            IPAddress = $ipConfig.IPAddress
            SubnetMask = $ipConfig.SubnetMask
            DefaultGateway = $gateway.NextHop
        }
    } catch {
        LogError "Failed to retrieve network configuration: $_"
    }
}

# Main script

# Retrieve system information
$systemInfo = @{
    SystemName = $env:COMPUTERNAME
    OSVersion = (Get-CimInstance Win32_OperatingSystem).Caption
    FreeDiskSpace = (Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -eq "C:\" }).Free
    MemoryInformation = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum).Sum / 1GB
    ProcessorInformation = (Get-CimInstance Win32_Processor).Name
    LastRebootTime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
    InstalledSoftware = Get-InstalledSoftware
    NetworkConfiguration = Get-NetworkConfig
}

# Output
if ($OutputFilePath) {
    try {
        $systemInfo | Export-Csv -Path $OutputFilePath -NoTypeInformation
        Write-Host "System information exported to $OutputFilePath"
    } catch {
        LogError "Failed to export system information to CSV file: $_"
    }
} else {
    $systemInfo | Format-Table -AutoSize
}
