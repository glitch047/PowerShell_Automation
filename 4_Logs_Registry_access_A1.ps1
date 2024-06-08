# Open PowerShell as an Administrator

# Query the registry key
$regKey = Get-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion"

# Retrieve and display the value of the "ProgramFilesDir" registry entry
$programFilesDir = Get-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion" -Name "ProgramFilesDir"
$programFilesDir.ProgramFilesDir
