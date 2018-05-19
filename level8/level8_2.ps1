[int]$totalchars = 0; [int]$totalmem = 0

$strings = Get-Content "~/DEV/4. AdventofCode/level8/level8.txt"

foreach ($string in $strings)
{
    $total = $string.length
    $totalchars = $totalchars + $total
}

foreach ($string in $strings)
{
    $_ = $string
    $string = ForEach-Object { $_ -replace "\\","\\" } | ForEach-Object {$_ -replace '"','\"' } | ForEach-Object { "`"$_`"" }
    $totalmem = $string.length + $totalmem
}

Write-Host "There are $($totalmem - $totalchars) total characters."