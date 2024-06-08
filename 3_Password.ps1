# Step 1: Ask for username
$username = Read-Host "Enter your username"
Write-Host "Hello, $username! Welcome to PowerShell."

# Step 2: Prompt for password
$password = Read-Host "Please enter a password" -AsSecureString
Write-Host "Password received. Thank you, $username!"

# Step 3: Retrieve and display password
$retrievePassword = Read-Host "Do you want to retrieve and display the password? (yes/no)"

if ($retrievePassword -eq "yes") {
    $plainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))
    Write-Host "Your password is: $plainPassword"
} else {
    Write-Host "Okay, $username. Your password is stored securely."
}
