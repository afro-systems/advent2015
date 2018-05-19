$check = [regex]'^(?=.*?([a-z])\1)(?=(?:[^aeiou]*[aeiou]){3})(?!.*?(ab|cd|pq|xy)).+$'
$strings = Get-Content advent05.txt; $count = 0

ForEach ($_ in $strings)
{
    if ($_ -match $check)
    {
        $count++
    }
}

Write-Host $count