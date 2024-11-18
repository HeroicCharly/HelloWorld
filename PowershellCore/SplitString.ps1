# Description:
# This script helps you to split a string, in this case
# just a basic split of an email.

$Dummy="test@gmail.com"
$Value = $Dummy.Split("@")[0]

Write-Host $Value