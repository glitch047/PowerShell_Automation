# Open PowerShell as an Administrator

# Retrieve the 10 most recent entries from the Windows System event log
$events = Get-WinEvent -LogName "System" -MaxEvents 10

# Review the output
$events | Format-Table -Property TimeCreated, Id, LevelDisplayName, Message -AutoSize
