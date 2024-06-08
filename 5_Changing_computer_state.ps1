# Display the menu to the user
Write-Host "Choose an action:"
Write-Host "1. Shut down computer"
Write-Host "2. Restart computer"
Write-Host "3. Log off current user"
Write-Host ""

# Prompt the user to enter their choice
$choice = Read-Host "Enter the number of your choice (1, 2, or 3)"

# Perform the action based on the user's choice
switch ($choice) {
    1 {
        Write-Host "Shutting down the computer..."
        Stop-Computer
    }
    2 {
        Write-Host "Restarting the computer..."
        Restart-Computer
    }
    3 {
        Write-Host "Logging off the current user..."
        Stop-Computer -Logoff
    }
    Default {
        Write-Host "Invalid choice. Please run the script again and enter a valid number (1, 2, or 3)."
    }
}
