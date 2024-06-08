# Step 1: Create an array with the weekdays
$weekdays = @("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Step 2: Sort the array from the last day to the first day of the week
$sortedWeekdays = $weekdays | Sort-Object -Descending

# Display the sorted weekdays array
Write-Output "Sorted Weekdays (Descending):"
$sortedWeekdays

# Step 3: Add the weekend days to the array
$weekendDays = @("Saturday", "Sunday")
$allDays = $sortedWeekdays + $weekendDays

# Define the order of days explicitly
$dayOrder = @("Sunday", "Saturday", "Friday", "Thursday", "Wednesday", "Tuesday", "Monday")

# Step 4: Sort the array from the last day of the week to the first day
$sortedAllDays = $allDays | Sort-Object { $dayOrder.IndexOf($_) }

# Display the final sorted array
Write-Output "Sorted Days (Descending from Sunday to Monday):"
$sortedAllDays
