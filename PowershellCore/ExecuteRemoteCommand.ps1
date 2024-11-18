# Description:
# This script uses the credentials given to execute the commands in the ScriptBlock in the
# computers declared in the Computers array.

# Prerequisites:
# - We are assuming the remote computer has the allowed policy to execute the remote command.
# - The credentials are valid to connect to the remote computer.

$Credentials = Get-Credential

$Computers = @(
    '<computername-placeholder>'
)

foreach( $element in $Computers){
    Write-Host $element -ForegroundColor Yellow
    $Session = New-PSSession -ComputerName $element -Credential $Credentials

    Invoke-Command -Session $Session -ScriptBlock { HOSTNAME.EXE }
}