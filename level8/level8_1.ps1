[int]$totalchars = 0; [int]$totalmem = 0

$strings = Get-Content "~/DEV/4. AdventofCode/level8/level8.txt"

foreach ($string in $strings)
{
    $total = $string.length
    $totalchars = $totalchars + $total
}

foreach ($memchars in $strings)
{
    $_ = $memchars
    $memchars = ForEach-Object {$_ -replace "\\x[0-9a-f][0-9a-f]","a"} | ForEach-Object {$_ -replace "\\","``"} | Invoke-Expression
    $totalmem = $memchars.length + $totalmem
}

Write-Host "There are $($totalchars - $totalmem) number of total characters."