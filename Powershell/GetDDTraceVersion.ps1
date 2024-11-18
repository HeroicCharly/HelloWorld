$credentials = Get-Credential

$computers = @(
    'computername'
)

foreach( $element in $computers){
    Write-Host $element -ForegroundColor Yellow
    $session = New-PSSession -ComputerName $element -Credential $credentials

    Invoke-Command -Session $session -ScriptBlock {
        HOSTNAME.EXE

        Get-Package "Datadog .NET Tracer 64-bit" | Select-Object -Property Version,Name
    }
}