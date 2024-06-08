# Prompt the user to input the path of the directory to be organized
$directoryPath = Read-Host "Enter the path of the directory to be organized"

# Check if the directory exists
if (-Not (Test-Path $directoryPath)) {
    Write-Host "The specified directory does not exist."
    exit
}

# Retrieve all files in the specified directory
$files = Get-ChildItem -Path $directoryPath -File

# Create a hashtable to keep track of file types and their counts
$fileTypeCounts = @{}

# Iterate over each file to organize them based on their types
foreach ($file in $files) {
    # Get the file extension (without the dot)
    $fileExtension = $file.Extension.TrimStart('.').ToLower()

    # Determine the folder name based on the file extension
    switch ($fileExtension) {
        {$_ -in @("jpg", "jpeg", "png", "gif", "bmp")} { $folderName = "Images" }
        {$_ -in @("doc", "docx", "pdf", "txt")} { $folderName = "Documents" }
        {$_ -in @("ppt", "pptx")} { $folderName = "Presentations" }
        {$_ -in @("xls", "xlsx")} { $folderName = "Spreadsheets" }
        {$_ -in @("mp3", "wav", "flac")} { $folderName = "Audio" }
        {$_ -in @("mp4", "avi", "mkv")} { $folderName = "Videos" }
        default { $folderName = "Others" }
    }

    # Create the folder if it doesn't exist
    $folderPath = Join-Path -Path $directoryPath -ChildPath $folderName
    if (-Not (Test-Path $folderPath)) {
        New-Item -Path $folderPath -ItemType Directory | Out-Null
    }

    # Move the file to the corresponding folder
    Move-Item -Path $file.FullName -Destination $folderPath

    # Update the count of files moved to each folder
    if ($fileTypeCounts.ContainsKey($folderName)) {
        $fileTypeCounts[$folderName]++
    } else {
        $fileTypeCounts[$folderName] = 1
    }
}

# Display a summary of the organization
Write-Host "Summary of the file organization:"
foreach ($folderName in $fileTypeCounts.Keys) {
    Write-Host "$($fileTypeCounts[$folderName]) files moved to the $folderName folder"
}
