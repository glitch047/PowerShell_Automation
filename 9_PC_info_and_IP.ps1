# Get computer information
$computerInfo = Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer, Model, TotalPhysicalMemory, UserName

# Get IP address configuration
$ipConfig = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPAddress -ne $null } | Select-Object IPAddress, DefaultIPGateway, DNSServerSearchOrder

# Create text files and write computer information
$computerInfo | Out-File -FilePath "ComputerInfo.txt"

# Write IP address configuration
$ipConfig | Out-File -FilePath "IPConfig.txt"
