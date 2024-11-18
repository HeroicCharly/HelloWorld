# Description:
# Given the AWS credentials and the Batch job, it will iterate through the
# registered versions and unregister them until 1 is left.

# Prerequisites:
# - The AWS credentials have access to describe the batch job.
# - The AWS credentials have access to deregister versions for the batch job.


###### INITIALIZATION ############################

# Set AWS Environment Variables
$Env:AWS_ACCESS_KEY_ID="<placeholder-for-access-key>"
$Env:AWS_SECRET_ACCESS_KEY="<placeholder-for-secret-key>"
$Env:AWS_SESSION_TOKEN="<placeholder-for-token>"

# Batch Job to review
$BatchJobToCheck = "<name-of-the-batch-job>"

################################################

# Get the information from AWS
$AWSResponse = aws batch describe-job-definitions --job-definition-name $BatchJobToCheck --status ACTIVE | ConvertFrom-Json
$LastRegisteredVersion = $AWSResponse.jobDefinitions[0].jobDefinitionArn

Write-Host "Versions registered: $($AWSResponse.jobDefinitions.Length)" -ForegroundColor Green
Write-Host "Last version registered: $($LastRegisteredVersion)" -ForegroundColor Yellow

foreach ($element in $AWSResponse.jobDefinitions){

    if( $element.jobDefinitionArn -ne $LastRegisteredVersion){
       Write-Host "De-registering version: $($element.jobDefinitionArn)" -ForegroundColor DarkGreen
       aws batch deregister-job-definition --job-definition $element.jobDefinitionArn
    }
}