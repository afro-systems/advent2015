$strings = Get-Content advent05.txt
$checker = [regex]'^(?=.*?(..).*?\1)(?=.*?(.)(?!\2).\2)[a-z]+$'; $count = 0

ForEach ($_ in $strings)
{
    if ($_ -match $checker)
    {
        $count++
    }
}

Write-Host $count

