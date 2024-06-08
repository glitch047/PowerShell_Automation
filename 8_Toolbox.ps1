# PowerShell toolbox for Windows Update

# Function to check for updates
function Check-Updates {
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
    $SearchResult = $UpdateSearcher.Search("IsInstalled=0")
    if ($SearchResult.Updates.Count -eq 0) {
        Write-Host "No updates available."
    } else {
        Write-Host "Updates available:"
        foreach ($update in $SearchResult.Updates) {
            Write-Host $update.Title
        }
    }
}

# Function to download and install updates
function Download-Install-Updates {
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateDownloader = $UpdateSession.CreateUpdateDownloader()
    $SearchResult = $UpdateDownloader.Download()
    $Installer = New-Object -ComObject Microsoft.Update.Installer
    $Installer.Install()
}

# Function to search for specific updates
function Search-Updates {
    param (
        [string]$Keyword
    )
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
    $SearchResult = $UpdateSearcher.Search("Type='Software' AND IsInstalled=0 AND Title like '%$Keyword%'")
    if ($SearchResult.Updates.Count -eq 0) {
        Write-Host "No updates found matching the search criteria."
    } else {
        Write-Host "Updates found:"
        foreach ($update in $SearchResult.Updates) {
            Write-Host $update.Title
        }
    }
}

# Function to view update history
function View-UpdateHistory {
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
    $SearchResult = $UpdateSearcher.QueryHistory(0, 20)
    foreach ($update in $SearchResult) {
        Write-Host "Title: $($update.Title)"
        Write-Host "Description: $($update.Description)"
        Write-Host "Date: $($update.Date)"
        Write-Host "---------------------"
    }
}

# Function to configure Windows Update settings
function Configure-UpdateSettings {
    # Example: Set automatic updates
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0
}

# Function to check the status of the Windows Update service
function Check-UpdateServiceStatus {
    $Service = Get-Service -Name wuauserv
    if ($Service.Status -eq "Running") {
        Write-Host "Windows Update service is running."
    } else {
        Write-Host "Windows Update service is not running."
    }
}

# Function to manually trigger Windows Update
function Trigger-WindowsUpdate {
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
    $SearchResult = $UpdateSearcher.Search("IsInstalled=0")
    if ($SearchResult.Updates.Count -eq 0) {
        Write-Host "No updates available."
    } else {
        $Installer = New-Object -ComObject Microsoft.Update.Installer
        $Installer.Install()
    }
}

# Main script
# Uncomment and call functions as needed

# Check-Updates
# Download-Install-Updates
# Search-Updates -Keyword "Security"
# View-UpdateHistory
# Configure-UpdateSettings
# Check-UpdateServiceStatus
# Trigger-WindowsUpdate
