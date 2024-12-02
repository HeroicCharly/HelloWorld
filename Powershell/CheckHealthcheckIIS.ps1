# Description:
# This script uses powershell to call an endpoint in a remote computer
# to get the information of the application in the IIS.

$credentials = Get-Credential domain\username

$computers = @(
    'computername'
)

foreach( $element in $computers){
    Write-Host $element -ForegroundColor Yellow
    $session = New-PSSession -ComputerName $element -Credential $credentials

    Invoke-Command -Session $session -ScriptBlock {
        HOSTNAME.EXE

        Invoke-RestMethod -Uri "http://localhost/healthcheck.json"
    }
}