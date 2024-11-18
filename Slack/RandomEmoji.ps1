# Description:
# This scripts helps you get a random emoji from a predefined list.

function GetRandomEmojiFromList {
    $EmojiList = @(":marioluigi:",":meow-popcorn","dab_unicorn",":pop_cat:")
    $RandomNumber = Get-Random -Maximum $EmojiList.Count

    return $EmojiList[$RandomNumber]
}

Write-Host "The emoji is => $(GetRandomEmojiFromList)"