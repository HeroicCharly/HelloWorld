# Description:
# This script is to test, and learn the lenguage basic operations.


$dummy = $true

# Test if true or false
if($dummy){
    Write-Output "Is true"
}else{
    Write-Output "Is False"
}

function test {
    param (
        # Test default parameters
        [string]$name = 'Carlos'
    )

    # Test values provided or empty
    if($name){
        Write-Host "The name $($name)"
    }else{
        Write-Host "No parameter"
    }
    
}

# Array of object declaration
$CustomObject=@(
    @{Email="pepito@gmail.com"; RequestID="TEST-379"}
    @{Email="pedro@gmail.com"; RequestID="TEST-379"}
)

# Test sending number to string parameter
$email=""
test -name 22

# Test replace string with C# syntax.
$dummy = "testEmail@gmail.com"
Write-Host ([String]$dummy).replace('@gmail.com','')

# Test switch
$dummy = "prd"
switch (([string]$dummy).ToUpper()) {
    "INT" { 
        Write-Host "INT environment"
     }
    {"INT" -or "PRD"}{
        Write-Host "switch with multiple matches"
    }

    Default {
        Write-Host "No environment"
    }
}

#string interpolation
$dummy = "interpolated string"
Write-Host "This is a ${dummy}"
Write-Host "This is another $dummy"
Write-Host "This is a second another $($dummy)"

# ternary operator replacement
$dummy = "morningg"
Write-Host "This is a second another $(if($dummy -eq "morning"){ "A"}else{"B"})"
if($element.fields.duedate){ $element.fields.duedate }else{"No duedate set"}

# Secure string
[securestring]$pass = ConvertTo-SecureString "password" -AsPlainText -Force
[string]$plainText = "text"

Write-Output "This ${pass} is not the same as ${plainText}"

# Custom objects
$JsonForReport =@{
    Projects = @()
}

$NewProjectA =@{
    Name="Test Project 001"
    Owner="Fandango"
}

$NewProjectB =@{
    Name="Test Project 002"
    Owner="Carlos"
}

#$JsonForReport.Projects += $NewProjectA
#$JsonForReport.Projects += $NewProjectB

Write-Host $JsonForReport.Projects.Count
Write-Host $JsonForReport.Projects[1].Name
Write-Host $JsonForReport.Projects[1].Owner

if( $JsonForReport.Projects.Count -eq 0){
    Write-Host "Empty array"
}else{
    Write-Host "Array with elements"
}