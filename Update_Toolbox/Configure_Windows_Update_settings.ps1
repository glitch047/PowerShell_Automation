# Script to configure Windows Update settings
# This script sets Windows Update configuration options

# Example: Set automatic updates
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 0
