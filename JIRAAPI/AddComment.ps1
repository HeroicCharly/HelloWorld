# Description:
# This script helps you add a comment to a jira ticket.
# Some parameters depend on your project.

function AddCommentToJiraRequest {
    param (
        $JiraRequestId,
        $JiraComment,
        $JiraAuthHeaderToken
    )
    
    $Body =@{
        body = "$($JiraComment)"
    }

    $Headers = @{
        'Authorization' = "$($JiraAuthHeaderToken)"
    }

    $BodyInJsonFormat = ($Body | ConvertTo-Json)

    # Update this URI with your atlassian workspace
    $UriForComment = "https://<your-workspace>/rest/api/2/issue/$($JiraRequestId)/comment"

    $JiraCommentResponse = Invoke-RestMethod -Uri $UriForComment -Method Post -Headers $Headers -Body $BodyInJsonFormat -ContentType "application/json"
    
    return $JiraCommentResponse
}

$JiraAuthHeaderToken = "Basic <placeholder-for-token>"
$RequestId = "<depends-on-your-project>"
# To add a new line in the comment, you must do double backslash.
$JiraComment = "This is a comment \\ this is the second line of the comment"

AddCommentToJiraRequest -JiraRequestId $RequestId -JiraComment $JiraComment -JiraAuthHeaderToken $JiraAuthHeaderToken