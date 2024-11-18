# Description:
# This script helps you get those snapshots that comply with the next rules.
# - Progress should be 100%
# - In "Completed" state
# - Keep only 5 years back.

# Prerequisites:
# - You should already have the AWS account to use configured.
# - You can specify the profile to be used in the AWS call.

$Stopwatch = New-Object System.Diagnostics.Stopwatch
$Stopwatch.Start()

$YearsToKeep = 5

$AwsCLIResponse = aws ec2 describe-snapshots # --max-items 1000 # --profile <aws-profile>

$AwsResponse = $AwsCLIResponse | ConvertFrom-Json

$FilteredList = $AwsResponse.Snapshots | Where-Object {$_.State -eq "completed" -and $_.StartTime -lt ((Get-Date).AddYears($YearsToKeep * -1)) }

# Comment and uncomment this line to print the whole list of snapshots.
Write-Output $FilteredList

Write-Host "Date to compare: $((((Get-Date).AddYears($YearsToKeep * -1))))" -ForegroundColor Red
Write-Host "Total snapshots returned: $($AwsResponse.Snapshots.Length)" -ForegroundColor Green
Write-Host "Snapshots that can be deleted: $($FilteredList.Length)" -ForegroundColor Green

# End time measurement
$Stopwatch.Stop()
$ElapsedTime = $Stopwatch.Elapsed

# Calculate execution time
Write-Host "Script ran in: $ElapsedTime" -ForegroundColor Yellow