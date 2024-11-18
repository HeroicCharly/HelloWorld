# Description:
# This script uses Slack API to send a message using Powershell.

# Prerequisites:
# - You already have the Slack token.
# - You have the Id of the channel or user who will receive the message.

function SendSlackMessage {
    param (
        $SlackGroupId,
        $Message,
        $SlackToken
    )
    
    $SlackUri = "https://slack.com/api/chat.postMessage"

    $BodyInJsonFormat = @{
        channel = "$($SlackGroupId)"
        text = "$($Message)"
        mrkdwn = $true
    }

    $Headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $Headers.Add("Authorization", "$($SlackToken)")
    $Headers.Add("Content-Type", "application/json")

    Invoke-RestMethod -Uri $SlackUri -Method Post -Headers $Headers -Body ($BodyInJsonFormat | ConvertTo-Json)
}

$SlackToken = "Bearer <placeholder-for-token>"

SendSlackMessage -SlackGroupId "<placeholder-for-Id>" -Message "Test message from powershell" -SlackToken $SlackToken